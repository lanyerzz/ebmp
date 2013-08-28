package com.app.oldPos;

import java.io.Serializable;

import java.util.Calendar;
import java.util.Date;




public class LoginSession implements Serializable{
	private String sessionID;
	private SmUserDTO userDto;
	private SmFunctionDTO[] funDTO;
	private CorpDTO corp;
	private Date loginDate=Calendar.getInstance().getTime();
	

	public String getLoginDateFormate() {
		
		return com.app.oldPos.Calendar.formatter_f.format(loginDate);
	}
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
	public CorpDTO getCorp() {
		return corp;
	}
	public void setCorp(CorpDTO corp) {
		this.corp = corp;
	}
	public SmFunctionDTO[] getFunDTO() {
		return funDTO;
	}
	public void setFunDTO(SmFunctionDTO[] funDTO) {
		this.funDTO = funDTO;
	}
	public String getSessionID() {
		return sessionID;
	}
	public void setSessionID(String sessionID) {
		this.sessionID = sessionID;
	}
	public SmUserDTO getUserDto() {
		return userDto;
	}
	public void setUserDto(SmUserDTO userDto) {
		this.userDto = userDto;
	}
	
	
}
