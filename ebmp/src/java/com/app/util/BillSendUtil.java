package com.app.util;


import com.app.exception.BusinessException;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.DOMWriter;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;

/**
 * 单据发送工具
 * @author LIN
 *
 */
public class BillSendUtil {

	private String URL = null;
	private final static String sendEncoding = "UTF-8"; 
	
//	public BillSendUtil(){
//		URL = this.getSendURL();
//		System.out.println("初始化url:"+URL);
//	}
	
	
	public BillSendUtil(String urladdress,String account){
		this.URL = urladdress + "?account="+account ;
		System.out.println("初始化url:"+URL);
	}
	
	

	public ReturnResultVO sendDocToUAP(String docid, Document doc) {
		return sendDocument(docid, doc, URL, sendEncoding);
	}
	
	 private ReturnResultVO sendDocument(String docid, Document doc, String url, String outputEncoding) {
		 
		 System.out.println("记录xml文件：");
		 toWrite(doc, "D:\\xd\\sxml\\"+docid+"_"+System.currentTimeMillis()+".xml");
		 
		 ReturnResultVO vo ;
		 HttpURLConnection curconnection = null;
		 try{
			 curconnection = getConnection(url);
			 
			 //-----会出现乱码------
//	         Writer writer = new OutputStreamWriter(curconnection.getOutputStream(),outputEncoding);
//	 		 writer.write(doc.asXML());
//	 		 writer.flush();
//	 		 writer.close();
			 //------end--------
			 
			 
			OutputFormat format = OutputFormat.createPrettyPrint();
	        format.setEncoding(outputEncoding);		// 指定xml编码 
			XMLWriter writer = new XMLWriter(curconnection.getOutputStream(),format);
			writer.write(doc);
			writer.flush();
			writer.close();
			 
			 
	 	 }catch(Exception e){
//	 	 	 Logger.error(e.getMessage(), e);
	 	 	 vo = new ReturnResultVO();
	 	 	 vo.setDocid(docid);
	 	 	 vo.setFlag(ReturnResultVO.FLAG_FAULT);		//1成功，2失败
	 	 	 vo.setRtmessage(e.getMessage());
	 	 	 return vo;
	 	 }
		 
         Document backdoc = receiveResponse(curconnection);
         vo = parseResponseDoc(docid, backdoc);
//	     Logger.info("XDWEB解析返回信息："+vo.getRtmessage());
	     
         if(curconnection != null)
	         curconnection.disconnect();
	     
	     return vo;
	    
	 }

//	 private String getSendURL(){
//		 
//			try{
//				if(ConfigurationUtil.getSendurl()!=null && ConfigurationUtil.getDefaccount()!=null){
////					Logger.info("数据发送地址："+ConfigurationUtil.getSendurl());
//					return ConfigurationUtil.getSendurl()+"?account="+ConfigurationUtil.getDefaccount();
//				}
//			}catch(Exception e){
////				Logger.error(e.getMessage());
//				e.printStackTrace();
//			}
//			
//			return null;
//		}
		
	 public static HttpURLConnection getConnection(String url) throws BusinessException {
	    
		 try{
			 System.out.println("数据发送地址："+url);
	         URL realURL = new URL(url);
	         HttpURLConnection connection = (HttpURLConnection)realURL.openConnection();
	         connection.setDoOutput(true);
	         connection.setRequestProperty("Content-type", "text/xml");
	         connection.setRequestMethod("POST");
	         return connection;
	     }catch(IOException e){
	         throw new BusinessException("获取发送地址连接出错！"+e.getMessage());
	     }
	 }
	 
	 
	 /**
	  * 
	  * @author      LINQI
	  * @createTime  2009-10-14下午01:18:06
	  * @param       @param connection
	  * @param       @return    
	  * @description 获取回执信息Document 
	  *
	  */
	 public static Document receiveResponse(HttpURLConnection connection){
	    	 
    	 SAXReader reader = new SAXReader();
 		 Document doc = null;
		 try {
			doc = reader.read(connection.getInputStream());
		 } catch (Exception e) {
			e.printStackTrace();
//			Logger.error("获取回执文件出错：", e);
		 } 
         return doc;
	 }
	 
	 /**
	  * 
	  * @author      LINQI
	  * @createTime  2009-10-14下午01:36:11
	  * @param       @param doc
	  * @param       @return 返回信息
	  * @param       @throws Exception    
	  * @description 解析返回信息Doc 如果一张XML文件中有多张单据信息，则循环处理返回信息。
	  *
	  */
	 public ReturnResultVO parseResponseDoc(String docid, Document doc){
		 
		 this.toWrite(doc, "D:\\xd\\bxml\\"+System.currentTimeMillis()+".xml");
		 Element root = doc.getRootElement();
		 String billType = root.attributeValue("billtype");	//单据类型
		 Iterator it = root.elementIterator("sendresult");
		 int sflag =-1;
		 int fflag =-1;
		 String content = null;
		 StringBuffer msg = new StringBuffer();
		 while(it.hasNext()){
			 
			Element sendresultElm = (Element)it.next();
			
			Element resultcodeElm=sendresultElm.element("resultcode");		//处理结果代码
			Element descriptionElm=sendresultElm.element("resultdescription");	//处理结果描述
			Element contentElm=sendresultElm.element("content");	//处理结果（返回编码）
			
			String rtcode = resultcodeElm.getTextTrim();
			if(rtcode.equals("1") ){	//1:处理成功   
				sflag = 1;
				content = contentElm.getTextTrim();
				System.out.println("处理成功！");
			}else {
				fflag =2;
				msg.append(descriptionElm.getTextTrim());
				System.out.println("处理失败:"+descriptionElm.getTextTrim());
			}
			
		 }
		 ReturnResultVO rtVO = new ReturnResultVO();
		 rtVO.setDocid(docid);
		 if(sflag==1 && fflag==-1){		//处理成功
			 rtVO.setFlag(ReturnResultVO.FLAG_SUCCESS);
			 rtVO.setContent(content);
			 rtVO.setRtmessage("数据处理成功！");
		 }else{
			 rtVO.setFlag(ReturnResultVO.FLAG_FAULT);
			 rtVO.setRtmessage(processRtMsg(billType,docid, msg.toString()));
		 }
		 
		 return rtVO;
		 
	}
	
	 /**
	  * 
	  * @author      LINQI
	  * @param       @param docid
	  * @param       @param msg
	  * @param       @return    
	  * @description 处理返回信息中固定的字符串，将其替换成空串，减小返回信息长度 
	  *
	  */
	 public static String processRtMsg(String billType, String docid, String msg){
		 
		 String target1 ="单据"+docid+"开始处理...";
		 String target2 ="单据"+docid+"处理错误:";
		 String target3 ="单据翻译转换错误:";
		 String target4 ="单据校验转换失败";
		 
		 String target5 ="单据"+docid+"_1开始处理...";
		 String target6 ="单据"+docid+"_1处理错误:";
		 
		 String target51 ="单据"+docid+"_2开始处理...";
		 String target61 ="单据"+docid+"_2处理错误:";
		 
		 String target8 ="业务插件处理错误:插件类=nc.impl.scm.so.pub.XMLSaleOrderProcess,异常信息:";	//销售订单插件类
		 String target9 ="业务插件处理错误:插件类=nc.bs.arap.pfxx.ARAPPlugin,异常信息:";	//收款插件
		 String target10 = "业务插件处理错误:插件类=nc.impl.scm.so.pub.XMLSaleOrderProcess,异常信息:";	//出入库插件
		 String target11 = "业务插件处理错误:插件类=nc.bs.ic.pub.XMLToBillProcess,异常信息:";		////出入库插件
		 
		 msg = msg.replace(target1, "")
		    	  .replace(target2, "")
		 		  .replace(target3, "")
		 		  .replace(target4, "")
		 		  .replace(target5, "")
		 		  .replace(target6, "")
		 		  .replace(target51, "")
		 		  .replace(target61, "");
		 		  
		 msg = msg.replace(target8, "")
		 		  .replace(target9, "")
		 		  .replace(target10, "")
		 		  .replace(target11, "");
			 
		 
		 return msg;
	 }
	 
	 /**
	  * 
	  * @author      LINQI
	  * @createTime  2009-10-13下午02:35:30
	  * @param       @param d4doc
	  * @param       @return    
	  * @description 将dom4j 转为 w3c 
	  *
	  */
	 public  org.w3c.dom.Document dom4jtoW3CDocument(Document d4doc){   
        DOMWriter d4Writer = new DOMWriter();   
        try{   
            return d4Writer.write(d4doc);   
        }catch(DocumentException e) {   
        	e.printStackTrace();
//            Logger.error("SScan't cast dom4jDocument to W3CDocument:", e);   
        }   
        return null;   
	 }
	 
	 /**
	  * 
	  * @author      LINQI
	  * @createTime  2009-10-15下午03:33:13
	  * @param       @param doc
	  * @param       @param path    
	  * @description 调试使用格式化输出Document
	  *
	  */
	 public void toWrite(Document doc, String path){
		try {
			OutputFormat format = OutputFormat.createPrettyPrint();
	        format.setEncoding("gbk");		// 指定xml编码 
			XMLWriter writer = new XMLWriter(new FileWriter(new File(path)),format);
			writer.write(doc);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
