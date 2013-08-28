package com.app.oldPos;

import java.math.BigDecimal;
import java.util.Date;



public class SaleRecBillbDto  {
	private String	pk_recbill_b ;//character(32) NOT NULL,
	private String	  currencyid ;//character(32),
	private String currencycode;
	private String currencyname;
	private BigDecimal	  nrate;// numeric(20,8),
	private BigDecimal	  nmoney ;//numeric(20,4),
	private BigDecimal	  npmoney;// numeric(20,4),
	private String 	  pk_corp;// character(32),
	private String unticode;
	private String untiname;
	private Integer	  dr;// integer,
	private Date	  ts;// timestamp without time zone,
	private String pk_recbill;
	public String getPk_recbill_b() {
		return pk_recbill_b;
	}
	public void setPk_recbill_b(String pk_recbill_b) {
		this.pk_recbill_b = pk_recbill_b;
	}
	public String getCurrencyid() {
		return currencyid;
	}
	public void setCurrencyid(String currencyid) {
		this.currencyid = currencyid;
	}
	public String getCurrencycode() {
		return currencycode;
	}
	public void setCurrencycode(String currencycode) {
		this.currencycode = currencycode;
	}
	public String getCurrencyname() {
		return currencyname;
	}
	public void setCurrencyname(String currencyname) {
		this.currencyname = currencyname;
	}
	public BigDecimal getNrate() {
		return nrate;
	}
	public void setNrate(BigDecimal nrate) {
		this.nrate = nrate;
	}
	public BigDecimal getNmoney() {
		return nmoney;
	}
	public void setNmoney(BigDecimal nmoney) {
		this.nmoney = nmoney;
	}
	public BigDecimal getNpmoney() {
		return npmoney;
	}
	public void setNpmoney(BigDecimal npmoney) {
		this.npmoney = npmoney;
	}
	public String getPk_corp() {
		return pk_corp;
	}
	public void setPk_corp(String pk_corp) {
		this.pk_corp = pk_corp;
	}
	public String getUnticode() {
		return unticode;
	}
	public void setUnticode(String unticode) {
		this.unticode = unticode;
	}
	public String getUntiname() {
		return untiname;
	}
	public void setUntiname(String untiname) {
		this.untiname = untiname;
	}
	public Integer getDr() {
		return dr;
	}
	public void setDr(Integer dr) {
		this.dr = dr;
	}
	public Date getTs() {
		return ts;
	}
	public void setTs(Date ts) {
		this.ts = ts;
	}
	public String getPk_recbill() {
		return pk_recbill;
	}
	public void setPk_recbill(String pk_recbill) {
		this.pk_recbill = pk_recbill;
	}
	
	
	
}
