package com.app.sv.nc.upload

import com.app.bd.corp.BdCorp
import com.app.bd.currtype.BdCurrtype
import com.app.exception.BusinessException
import com.app.nc.NcContrast
import com.app.nc.NcUpConfig
import com.app.nc.upload.BillUpload
import com.app.so.rec.SoRec
import com.app.util.ReturnResultVO
import com.app.util.XMLTemplateLoader
import groovy.text.Template
import org.dom4j.Document
import org.dom4j.DocumentHelper

/**
 * public final static String BILL_ORDER = "30";	//销售订单

 public final static String BILL_SK = "D2";		//收款单

 public final static String BILL_RK = "IC4A";	//其他入库单

 public final static String BILL_CK = "IC4I";	//其他出库单

 public final static String BILL_ZK = "4U";	//转库单

 public final static String BILL_XTZH = "XTZH";	//形态转换

 public final static String BILL_DBDD = "5X";	//调拨订单

 public final static String BILL_SKZK = "D0";		//收款单折扣（红字应收）
 */
class UploadSKZKToNCService extends  BillUpload {



    private String billtype = 'D0';	//单据类型(模板名称)
    def queryNrateFromNCService


    private Map<String, Object[]> ratemap = new HashMap<String, Object[]>();	//汇率<币种编码+单据日期,[操作符,汇率]>



    /**
     * 全部上传
     */
    @Override

    public String doUploads(String pk_corp) {

        //收款数据已上传，有折扣金额 并且 折扣金额未上传
        def ls= SoRec.findAllByUpstateAndCheckerIsNotNullAndZkGreaterThanAndUpstatedisAndBdCorp(true,0,false,BdCorp.get(pk_corp))  //" from SaleRecBill where upstate=1 and pk_enum_billstate='04' and nrebatemoney>0 and (upstatedis<>1 or upstatedis is null) " +
               // " and pk_corp.pkCorp=?", pk_corp);
        if(!ls){
            return "没有需要上传的数据！";
        }

        StringBuffer msg = new StringBuffer();
       ls.each{

            try {
                String str = this.doSend(pk_corp,it);
                msg.append(str).append("\r\n");
            } catch (BusinessException e) {
                msg.append(it.billno+"收款单折扣上传发生异常："+e.getMessage()).append("\r\n");
                e.printStackTrace();
            }
        }
        System.out.println(msg);
        return "数据上传完成，请重新查询数据";
    }

    /**
     * 单条数据上传
     */
    @Override
    public String doUpload(String id) {

        StringBuffer msg = new StringBuffer();

            def recvo = SoRec.get(id);
            if(!recvo.upstate){
                throw new BusinessException('请先上传收款单,然后后在折扣上传!')
            }
            if(recvo!=null){
                try {
                    String str = this.doSend(NcUpConfig.list()[0],recvo);
                    msg.append(str).append("\r\n");
                } catch (BusinessException e) {
                    e.printStackTrace();
                    msg.append(recvo.billno+"收款单折扣上传发生异常："+e.getMessage()).append("\r\n");
                }
            }else{
                return "请刷新界面重新进行上传！";
            }

        System.out.println(msg);
        return "数据上传完成";
    }


    public String doSend(SoRec recvo)throws BusinessException {

        ReturnResultVO rtvo = null;
        String msg = null;
        int rtflag = ReturnResultVO.FLAG_NORMAL;
        try{
            Document doc = this.getDocumnet(recvo);
            rtvo = this.doSend(recvo.bdCorp.id, recvo.id, doc);
            msg = rtvo.getRtmessage();
            rtflag = rtvo.getFlag();

        }catch(Exception e){
            e.printStackTrace();
            msg = e.getMessage();
            rtflag = ReturnResultVO.FLAG_FAULT;
        }
        this.writeFlag(recvo.id, rtflag,msg);
//		String rtmsg = this.saveLog(rtvo);

        return msg;
    }




    private Document getDocumnet(SoRec recvo) throws BusinessException{


        String recid = recvo.id;	//主键
        String vbillno = recvo.billno	//单据号

        String unitcode = recvo.bdCorp.unitCode
        String receiver = NcContrast.findBySourveValue(unitcode);		//从对照中获取发送公司
        String localC = recvo.bdCorp.currencyType.currtypecode	//

//		System.out.println(">>>>>>>>>>>>>>>>>>>>>"+recvo.);




       def blist = []
       def  currMnyMap = [:]	//币种-金额
        recvo.bodys.each{


            String currName = it.currtype.currtypename;
            BigDecimal bigValue = currMnyMap.get(currName);
            if(bigValue==null){
                currMnyMap.put(currName, it.ssje);
            }else{
                bigValue = bigValue.add(it.ssje);
            }
            blist.add(bvo);

            String billdate = recvo.billdate.format('yyyy-MM-dd');
            String exratekey = it.currtype.currtypecode + billdate;
            if(this.ratemap.get(exratekey)==null){
                Object[] rate = this.getChangerate(it.id, localC, recvo.bdCorp.id, billdate);
                ratemap.put(exratekey, rate);
            }
        }

        //--------------设置表头备注信息---------------
        //收款单折扣的摘要，异种币收款时，摘要中应收的币种错误（如下：几个实收款是欧元，应收是福林，摘要需要修改成 实收XXXX实收币种 核销XXXX应收币种 少收XXX应收币种，同币种的直接是 实收XXXX实收币种）
//		StringBuilder sbStr = new StringBuilder();
//		Set<String> set = currMnyMap.keySet();
//		Iterator<String> ite = set.iterator();
//		while(ite.hasNext()){
//			String key = ite.next();
//			BigDecimal value = currMnyMap.get(key);
//			sbStr.append("实收").append(value.toString()).append(key);
//		}


        Map<String, Object> root = new HashMap<String, Object>();
        root.put("docid", recid);
        root.put("vbillno", vbillno);
        root.put("orderno","");
        root.put("receiver", receiver);
        root.put("filename", recid+"_"+vbillno+".xml");

        root.put("busitype",recvo.businessType.code);	//业务类型
        root.put("ratemap", ratemap);	//汇率map
        root.put("jsfs", recvo.sourceBill.balatype.code);	//结算方式
        root.put("deptcode", recvo.sourceBill.deptdoc.code);
        root.put("recMemoMap",currMnyMap);

        root.put("hinfo", recvo);
        root.put("blist", blist);


        try {

            Template tempt = XMLTemplateLoader.getTemplet(billtype);
            StringWriter out = new StringWriter();
            tempt.process(root, out);
            out.flush();

//			System.out.println(out.getBuffer().toString());

            StringBuffer sb = out.getBuffer();
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
    @Override
    public String writeFlag(String pk, int flag,String msg) throws BusinessException {
        System.out.println("PK:"+pk+"  FLAG:"+flag);
//        String sql = "update SaleRecBill set upstatedis=?,msgdis=?,uptsdis=? where crecbillid=?";
        int i = SoRec.executeUpdate('update SoRec set upstatedis=?,upMessageis=?,upis_date=? where id=?',[flag==1,msg,new Date(),pk]);
        System.out.println("收款单折扣折扣数据状态回写影响条数："+i);

        return "收款单折扣数据状态回写影响条数："+i;
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
