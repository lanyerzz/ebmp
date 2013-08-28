package com.app.nc.upload;

import com.app.exception.BusinessException;
import com.app.nc.NcUpConfig;
import com.app.util.BillSendUtil;
import com.app.util.ReturnResultVO;
import org.dom4j.Document;

import java.util.Map;

/**
 * 单据上传业务类，统一由
 * doUpload 方法 处理
 * @author LIN
 *
 */
public abstract class BillUpload{
	


	
	/**
	 * 上传所有单据
	 * @param pk_corp
	 * @return
	 * @throws BusinessException
	 */
	public abstract String doUploads(String pk_corp) throws BusinessException;
	
	/**
	 * 上传所选数据

	 * @return
	 * @throws BusinessException
	 */
	public abstract String doUpload(String id) throws BusinessException;
	
	/**
	 * 单据发送
	 * @param
	 * @param docid
	 * @param doc
	 * @return
	 * @throws BusinessException
	 */
	public ReturnResultVO doSend(NcUpConfig upConfig,String docid,Document doc) throws BusinessException{

		return new BillSendUtil(upConfig.getUrladdress(),upConfig.getAccount()).sendDocToUAP(docid, doc);
	}
	
	/**
	 * 回写数据状态
	 * @param pk	主键
	 * @param flag	0成功，1失败
	 * @param msg 返回信息
	 * @return
	 * @throws BusinessException
	 */
	public abstract String writeFlag(String pk,int flag,String msg)throws BusinessException;
	
	/**
	 * 保存单据上传日志
	 * @param rtvo
	 * @return
	 * @throws BusinessException
	 */
	public String saveLog(ReturnResultVO rtvo) throws BusinessException{
		
		
		
		return null;
	}
	
	

	
	
}
