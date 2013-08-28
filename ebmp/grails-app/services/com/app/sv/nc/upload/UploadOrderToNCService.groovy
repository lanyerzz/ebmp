package com.app.sv.nc.upload

import com.app.bd.corp.BdCorp
import com.app.bd.currtype.BdCurrtype
import com.app.exception.BusinessException
import com.app.nc.NcContrast
import com.app.nc.NcUpConfig
import com.app.nc.upload.BillUpload
import com.app.so.order.SoSale
import com.app.util.ReturnResultVO
import com.app.util.XMLTemplateLoader
import freemarker.template.Template
import org.dom4j.Document
import org.dom4j.DocumentHelper

class UploadOrderToNCService extends BillUpload{

    def queryNrateFromNCService

    String billtype = '30';	//单据类型（单据模板）




    private Map<String, Object[]> ratemap = new HashMap<String, Object[]>();


    public String doUploads(String pk_corp) {


        def orders=SoSale.findByUpstateAndCheckerIsNotNullAndBdCorp(true,BdCorp.get(pk_corp))
        if(!orders){
            return "没有需要上传的数据！";
        }

        StringBuffer msg = new StringBuffer();
        orders.each {

            try {
                String str = this.doSend(pk_corp,it);
                msg.append(str).append("\r\n");
            } catch (BusinessException e) {
                e.printStackTrace();
                msg.append(it.billno+"订单上传发生异常："+e.getMessage()).append("\r\n");
            }
        }



        return "数据上传完成，请重新查询数据";
    }

    /**
     * 单条数据上传
     */

    public String doUpload(String id) {

        StringBuffer msg = new StringBuffer();

            SoSale salevo = SoSale.get(id);
            if(!salevo.checker){
                throw  new BusinessException('单据未审核')
            }
            if(salevo!=null){
                try {
                    String str = this.doSend(salevo.bdCorp.id,salevo);
                    msg.append(str).append("\r\n");

                } catch (BusinessException e) {
                    e.printStackTrace();
                    msg.append(salevo.billno+"订单上传发生异常："+e.getMessage()).append("\r\n");
                }

        }
        System.out.println(msg);
        return "数据上传完成";
    }


    public String doSend(String pk_corp,SoSale salevo)throws BusinessException {

        String msg = null;
        ReturnResultVO rtvo = null;
        int rtflag = ReturnResultVO.FLAG_NORMAL;
        try{

            Document doc = this.getDocumnet(salevo);
           println  doc.toString()
            rtvo = this.doSend(NcUpConfig.list()[0], salevo.id, doc);
            msg = rtvo.getRtmessage();
            rtflag = rtvo.getFlag();

        }catch(Exception e){
            e.printStackTrace();
            msg = e.getMessage();
            rtflag = ReturnResultVO.FLAG_FAULT;
        }
        this.writeFlag(salevo.id, rtflag, msg);

//		String rtmsg = this.saveLog(rtvo);

        return msg;
    }




    private Document getDocumnet(SoSale salevo) throws BusinessException{

        String saleid = salevo.id	//主键
        String vbillno = salevo.billno	//单据号

        String unitcode = salevo.bdCorp.unitCode
        String receiver =  NcContrast.findBySourveValue(unitcode).targetValue		//从对照中获取发送公司
        String localC = salevo.currencytype.currtypecode	//公司本位币

        //汇率
//        String billno= "${billNoRule.subcode}${billNoRule.bdate ? date.format('yyyyMMdd') :  '' }"+df.format(curNo+it+1)
//
        def changerate = this.getChangerate(salevo.currencytype, localC, salevo.bdCorp.id, salevo.billdate.format('yyyy-MM-dd'));

        //整单折扣率 = 订单折扣后金额/订单金额
//        BigDecimal ndiscountrate = salevo.getNrecmoney().divide(salevo.getNmoney(), 8,BigDecimal.ROUND_HALF_UP);	//
//        BigDecimal ndiscount = ndiscountrate.multiply(new BigDecimal(100));		//整单折扣额

        BigDecimal ndiscountrate = salevo.ndiscountrate
        BigDecimal ndiscount = salevo.nratemnny		//整单折扣额



        Map<String, Object> root = new HashMap<String, Object>();
        root.put("docid", saleid);
        root.put("vbillno", vbillno);
        root.put("receiver", receiver);
        root.put("filename", saleid+"_"+vbillno+".xml");

        root.put("busitype", salevo.businessType.code);	//业务类型
        root.put("deptid", salevo.deptdoc?.code?:'');		//部门
        root.put("csalecorpid", salevo);	//销售组织  TODO
        root.put("ccalbodyid", salevo.calbody?.calbodyCode?:'');	//库存组织

        root.put("operatecode",changerate[0]);	//汇率 操作符（M乘，D除）
        root.put("exrate", changerate[1]);		//汇率

        root.put("ndiscountrate",ndiscountrate);//整单折扣率
        root.put("ndiscount", ndiscount);		//整单折扣

        root.put("hinfo", salevo);
        root.put("blist", salevo.bodys);

        try {

            Template tempt = XMLTemplateLoader.getTemplet(billtype);
            StringWriter out = new StringWriter();
            tempt.process(root, out);
            out.flush();

//			System.out.println(out.getBuffer().toString());


            StringBuffer sb = out.getBuffer();
            println sb.toString()
            Document newdoc = (Document) DocumentHelper.parseText(sb.toString());

            return newdoc;
        }catch(Exception e){
            e.printStackTrace();
            throw new BusinessException(e.getMessage());
        }

    }


    /**
     * 回写数据状态
     */

    public String writeFlag(String pk, int flag,String msg) throws BusinessException {
        System.out.println("PK:"+pk+"  FLAG:"+flag);
//		System.out.println(">>>>>>>>>>>>"+msg);
//        String sql = "update SoSale set upstate=?,up_date=?,upMssage=? where id=?";
        int i = SoSale.executeUpdate('update SoSale set upstate=?,up_date=?,upMessage=? where id=?',[true,new Date(),msg,pk])
        System.out.println("订单数据状态回写影响条数："+i);

        return "订单数据状态回写影响条数："+i;
    }



    /**
     * 取汇率
     * @param srcCurrcode	源币种编码
     * @param destCurrcode	目标币种编码
     * @param pk_corp
     * @param date		日期
     * @return
     * @throws BusinessException
     */
    public Object[] getChangerate(BdCurrtype srcCurrcode,String destCurrcode,String pk_corp,String date) throws BusinessException{

        if(srcCurrcode.currtypecode.equals(destCurrcode)){
            return ["M",1];
        }

        String key = srcCurrcode.currtypecode + date;
        if(ratemap.get(key)==null){
            BdCurrtype destCurrency = BdCurrtype.findByCurrtypecode(destCurrcode);
            try{
                Object[] obj = queryNrateFromNCService.queryRateFromNC(srcCurrcode.sourceId, destCurrency.sourceId, date);
                ratemap.put(key,obj);
                return obj;
            }catch(Exception e){
                e.printStackTrace();
                throw new BusinessException("获取 ["+date+"] "+srcCurrcode.currtypecode+"对"+destCurrency.currtypecode+"的汇率发生异常！"+e.getMessage());
            }

        }

        return (Object[]) ratemap.get(key);

    }

}
