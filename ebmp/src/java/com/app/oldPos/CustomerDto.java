package com.app.oldPos;


public class CustomerDto {
	
	private String pkCustomerM;
	public String getPkCustomerM() {
		return pkCustomerM;
	}
	public void setPkCustomerM(String pkCustomerM) {
		this.pkCustomerM = pkCustomerM;
	}
	private String pkCustorm;
	private String custcode;
	private String custname;
	private String pk_custcls;// character varying(32) NOT NULL,
	 private String   clsCode; //character varying(50),
	 private String  clsName;// character varying(40),
	 
	 private String currencyType1;
	 private String currencyCode1;
	 private String currencyName1;

	 private String  clsFathercode;// character varying(50),
	 private String  clsFatherid;// character varying(32),
	 
	 private String mnecode;	//助记码
	 
	public String getMnecode() {
		return mnecode;
	}
	public void setMnecode(String mnecode) {
		this.mnecode = mnecode;
	}
	public String getPkCustorm() {
		return pkCustorm;
	}
	public void setPkCustorm(String pkCustorm) {
		this.pkCustorm = pkCustorm;
	}
	public String getCustcode() {
		return custcode;
	}
	public void setCustcode(String custcode) {
		this.custcode = custcode;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getPk_custcls() {
		return pk_custcls;
	}
	public void setPk_custcls(String pk_custcls) {
		this.pk_custcls = pk_custcls;
	}
	public String getClsCode() {
		return clsCode;
	}
	public void setClsCode(String clsCode) {
		this.clsCode = clsCode;
	}
	public String getClsName() {
		return clsName;
	}
	public void setClsName(String clsName) {
		this.clsName = clsName;
	}
	public String getClsFathercode() {
		return clsFathercode;
	}
	public void setClsFathercode(String clsFathercode) {
		this.clsFathercode = clsFathercode;
	}
	public String getClsFatherid() {
		return clsFatherid;
	}
	public void setClsFatherid(String clsFatherid) {
		this.clsFatherid = clsFatherid;
	}
	public String getCurrencyType1() {
		return currencyType1;
	}
	public void setCurrencyType1(String currencyType1) {
		this.currencyType1 = currencyType1;
	}
	public String getCurrencyCode1() {
		return currencyCode1;
	}
	public void setCurrencyCode1(String currencyCode1) {
		this.currencyCode1 = currencyCode1;
	}
	public String getCurrencyName1() {
		return currencyName1;
	}
	public void setCurrencyName1(String currencyName1) {
		this.currencyName1 = currencyName1;
	}
	

}
