package com.app.sv.nc.upload

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.ic.special.IcSpecial
import com.app.nc.NcUpConfig
import com.app.util.ReturnResultVO
import com.app.util.XMLTemplateLoader
import freemarker.template.Template
import org.dom4j.Document
import org.dom4j.DocumentHelper

class UploadZKToNCService {

    private String billtype = '4U';	//单据类型(模板名称)


    @Override
    public String doUploads(String pk_corp) {


       def ls = IcSpecial.findAllByUpstateAndCheckerIsNotNullAndBdCorp(false,BdCorp.get(pk_corp));//" from IcZkbill where (upstate<>1 or upstate is null) and pk_enum_billstate='04' and pkCorp.pkCorp=?",pk_corp);
        if(!ls){
            return "没有需要上传的数据！";
        }

        StringBuffer msg = new StringBuffer();
        ls.each{

            try {
                String str = this.doSend(it);
                msg.append(str).append("\r\n");
            } catch (BusinessException e) {
                msg.append(it.billno+"转库单上传发生异常："+e.getMessage()).append("\r\n");
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


            IcSpecial icvo = IcSpecial.get(id)
            StringBuffer msg=new StringBuffer()
            if(!icvo){
                try {
                    String str = this.doSend(icvo);
                    msg.append(str).append("\r\n");
                } catch (BusinessException e) {
                    e.printStackTrace();
                    msg.append(icvo.billno+"转库单上传发生异常："+e.getMessage()).append("\r\n");
                }
            }else{
                return "请刷新界面重新进行上传！";
            }

        System.out.println(msg);
        return "数据上传完成";
    }


    public String doSend(IcSpecial icvo)throws BusinessException {

        ReturnResultVO rtvo = null;
        String msg = null;
        int rtflag = ReturnResultVO.FLAG_NORMAL;
        try{
            Document doc = this.getDocumnet(icvo);
            rtvo = this.doSend(NcUpConfig.list()[0], icvo.id, doc);
            msg = rtvo.getRtmessage();
            rtflag = rtvo.getFlag();
        }catch(Exception e){
            e.printStackTrace();
            msg = e.getMessage();
            rtflag = ReturnResultVO.FLAG_FAULT;
        }
        this.writeFlag(icvo.id, rtflag ,msg);
//		String rtmsg = this.saveLog(rtvo);

        return msg;
    }


    private Document getDocumnet(IcSpecial icvo) throws BusinessException{


        String recid = icvo.id	//主键
        String vbillno = icvo.billno;	//单据号

        String unitcode = icvo.bdCorp.unitCode;
        String receiver = this.getCorpMap().get(unitcode);		//从对照中获取发送公司
//		String localC = this.getCurrencyMap().get(unitcode);	//

//		System.out.println(">>>>>>>>>>>>>>>>>>>>>"+icvo.);


        def blist = [];

        def root = [:];
        root.put("docid", recid);
        root.put("vbillno", vbillno);
        root.put("orderno","");
        root.put("receiver", receiver);
        root.put("filename", recid+"_"+vbillno+".xml");

        root.put("calbodycode", icvo.outwarehouse?.calbody.calbodyCode);	//库存组织
        root.put("rksflb", this.getRksflb());	//入库收发类别
        root.put("cksflb", this.getCksflb());	//出库收发类别

        root.put("hinfo", icvo);
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
        //String sql = "update IcZkbill set upstate=?,msg=?,upts=? where pk_zkbill=?";
        int i = IcSpecial.executeUpdate('update IcSpecial set upstate=?,upMessage=?,up_date=? where id=?',flag,msg,new Date(),pk);
        System.out.println("收款单数据状态回写影响条数："+i);

        return "收款单数据状态回写影响条数："+i;
    }

}
