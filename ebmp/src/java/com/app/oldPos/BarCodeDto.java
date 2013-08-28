package com.app.oldPos;

import java.math.BigDecimal;



public class BarCodeDto {
	
	private String pkBarcode;
	private String vbarcode;
	private String vbarname;
	private String vcode;
	private String fathercode;
	private String fatherid;
	private Integer isboot;
	
	private String pk_measdoc;
	private String pk_measdoc1;
	private String pk_measdoc2;
	private String pk_measdoc3;
	
	private String meascode;
	private String meascode1;
	private String meascode2;
	private String meascode3;
	
	private String measname;
	private String measname1;
	private String measname2;
	private String measname3;
	
	private BigDecimal nprice;
	private BigDecimal defaultNum;//默认数量
	private String pk_defdoc1;//默认装数
	private String defdoccode1;
	private String defdocname1;
	private String defdocmemo1;//备注
	
	public String getFathercode() {
		return fathercode;
	}
	public void setFathercode(String fathercode) {
		this.fathercode = fathercode;
	}
	public String getFatherid() {
		return fatherid;
	}
	public void setFatherid(String fatherid) {
		this.fatherid = fatherid;
	}
	public Integer getIsboot() {
		return isboot;
	}
	public void setIsboot(Integer isboot) {
		this.isboot = isboot;
	}
	public String getVcode() {
		return vcode;
	}
	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
	public String getPkBarcode() {
		return pkBarcode;
	}
	public void setPkBarcode(String pkBarcode) {
		this.pkBarcode = pkBarcode;
	}
	public String getVbarcode() {
		return vbarcode;
	}
	public void setVbarcode(String vbarcode) {
		this.vbarcode = vbarcode;
	}
	public String getVbarname() {
		return vbarname;
	}
	public void setVbarname(String vbarname) {
		this.vbarname = vbarname;
	}

	public String toString() {
		return this.vcode+"  "+this.vbarname;
	}
	public String getPk_measdoc() {
		return pk_measdoc;
	}
	public void setPk_measdoc(String pk_measdoc) {
		this.pk_measdoc = pk_measdoc;
	}
	public String getPk_measdoc1() {
		return pk_measdoc1;
	}
	public void setPk_measdoc1(String pk_measdoc1) {
		this.pk_measdoc1 = pk_measdoc1;
	}
	public String getPk_measdoc2() {
		return pk_measdoc2;
	}
	public void setPk_measdoc2(String pk_measdoc2) {
		this.pk_measdoc2 = pk_measdoc2;
	}
	public String getPk_measdoc3() {
		return pk_measdoc3;
	}
	public void setPk_measdoc3(String pk_measdoc3) {
		this.pk_measdoc3 = pk_measdoc3;
	}
	public String getMeascode() {
		return meascode;
	}
	public void setMeascode(String meascode) {
		this.meascode = meascode;
	}
	public String getMeascode1() {
		return meascode1;
	}
	public void setMeascode1(String meascode1) {
		this.meascode1 = meascode1;
	}
	public String getMeascode2() {
		return meascode2;
	}
	public void setMeascode2(String meascode2) {
		this.meascode2 = meascode2;
	}
	public String getMeascode3() {
		return meascode3;
	}
	public void setMeascode3(String meascode3) {
		this.meascode3 = meascode3;
	}
	public String getMeasname() {
		return measname;
	}
	public void setMeasname(String measname) {
		this.measname = measname;
	}
	public String getMeasname1() {
		return measname1;
	}
	public void setMeasname1(String measname1) {
		this.measname1 = measname1;
	}
	public String getMeasname2() {
		return measname2;
	}
	public void setMeasname2(String measname2) {
		this.measname2 = measname2;
	}
	public String getMeasname3() {
		return measname3;
	}
	public void setMeasname3(String measname3) {
		this.measname3 = measname3;
	}
	public BigDecimal getNprice() {
		return nprice;
	}
	public void setNprice(BigDecimal nprice) {
		this.nprice = nprice;
	}
	public BigDecimal getDefaultNum() {
		return defaultNum;
	}
	public void setDefaultNum(BigDecimal defaultNum) {
		this.defaultNum = defaultNum;
	}
	public String getPk_defdoc1() {
		return pk_defdoc1;
	}
	public void setPk_defdoc1(String pk_defdoc1) {
		this.pk_defdoc1 = pk_defdoc1;
	}
	public String getDefdoccode1() {
		return defdoccode1;
	}
	public void setDefdoccode1(String defdoccode1) {
		this.defdoccode1 = defdoccode1;
	}
	public String getDefdocname1() {
		return defdocname1;
	}
	public void setDefdocname1(String defdocname1) {
		this.defdocname1 = defdocname1;
	}
	public String getDefdocmemo1() {
		return defdocmemo1;
	}
	public void setDefdocmemo1(String defdocmemo1) {
		this.defdocmemo1 = defdocmemo1;
	}
	
	
	
	
}
