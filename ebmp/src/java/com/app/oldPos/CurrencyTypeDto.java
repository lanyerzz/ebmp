package com.app.oldPos;


public class CurrencyTypeDto {
	private String pk_currencytype;
	private String currCode;
	private String currName;
	private Integer dr;
	private String pk_corp;
	public String getPk_currencytype() {
		return pk_currencytype;
	}
	public void setPk_currencytype(String pk_currencytype) {
		this.pk_currencytype = pk_currencytype;
	}
	public String getCurrCode() {
		return currCode;
	}
	public void setCurrCode(String currCode) {
		this.currCode = currCode;
	}
	public String getCurrName() {
		return currName;
	}
	public void setCurrName(String currName) {
		this.currName = currName;
	}
	public Integer getDr() {
		return dr;
	}
	public void setDr(Integer dr) {
		this.dr = dr;
	}
	public String getPk_corp() {
		return pk_corp;
	}
	public void setPk_corp(String pk_corp) {
		this.pk_corp = pk_corp;
	}
	
	
}
