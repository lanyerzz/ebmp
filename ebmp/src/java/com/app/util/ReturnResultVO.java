package com.app.util;

import java.io.Serializable;

/**
 ************************************
 * @author      LIN 
 * @description	VO  
 ************************************
 */
public class ReturnResultVO implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static final int FLAG_NORMAL = 0;
	public static final int FLAG_SUCCESS = 1;
	public static final int FLAG_FAULT = 2;

	private String docid ;		//
	
	private int flag ;			//1成功，2失败
	
	private String rtmessage ;	//
	
	private String content;		//
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	private String free1;
	private String free2;
	private String free3;

	public String getRtmessage() {
		return rtmessage;
	}

	public void setRtmessage(String rtmessage) {
		this.rtmessage = rtmessage;
	}

	public String getDocid() {
		return docid;
	}

	public void setDocid(String docid) {
		this.docid = docid;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getFree1() {
		return free1;
	}

	public void setFree1(String free1) {
		this.free1 = free1;
	}

	public String getFree2() {
		return free2;
	}

	public void setFree2(String free2) {
		this.free2 = free2;
	}

	public String getFree3() {
		return free3;
	}

	public void setFree3(String free3) {
		this.free3 = free3;
	}

}
