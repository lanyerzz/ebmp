package com.app.oldPos;

import java.math.BigDecimal;
import java.util.Date;



public class SaleRecBillDto  {
	private String	crecbillid;// character(32) NOT NULL,
	private String	csourcebillno;
	 private String	 vbillno;// character varying(20),
	 private String		  vbilldate;// character varying(10),
	 private String		  csourcebillid ;//character(32),
	 
	 
	 private String	 currencyid;// character(32),
	 private String currencycode;
	 private String currencyname;
	 private BigDecimal		  nrecmoney;// numeric(20,4),
	 private BigDecimal nrebatemoney;//折扣
	 private BigDecimal nbillbalance;//订单余额
	 private BigDecimal nbalance;//nbalance;//核销余额  收款金额 + 收款折扣额
	 private BigDecimal nnowbalance;//
	 
	 private String		  pk_corp;// character(32),
	 private String unitcode;
	 private String unitname;
	 private Date		  ts ;//timestamp without time zone,
	 private String	dr ;//integer DEFAULT 0,
	 private String	makeman;// character(32),
	 private String makemancode;
	 private String makemanname;
	 private String	checkman;// character(1) DEFAULT 32,
	 private String checkmancode;
	 private String checkmanname;
	 private String	checkdate;// character varying(10),
	 private String	checktime;// character varying(19),
	 private String ccustid;
	
	 private String custcode;
	 private String custname;
	 private String ccustmid;
	 private Integer upstate;//上传标记（0未上传，1上传成功，2上传失败）
	 private String msg;
	 private String pk_enum_billstate;
	 
	 private String memo;
	 
	 private Integer upstatedis;//折扣上传标记（0未上传，1上传成功，2上传失败）
	 private String msgdis;	//折扣上传返回信息
	 private String uptsdis;	//折扣上传时间戳

	 
	public String getUptsdis() {
		return uptsdis;
	}
	public void setUptsdis(String uptsdis) {
		this.uptsdis = uptsdis;
	}
	public Integer getUpstatedis() {
		return upstatedis;
	}
	public void setUpstatedis(Integer upstatedis) {
		this.upstatedis = upstatedis;
	}
	public String getMsgdis() {
		return msgdis;
	}
	public void setMsgdis(String msgdis) {
		this.msgdis = msgdis;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}
	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
	 

	public BigDecimal getNnowbalance() {
		return nnowbalance;
	}
	public void setNnowbalance(BigDecimal nnowbalance) {
		this.nnowbalance = nnowbalance;
	}
	public BigDecimal getNbalance() {
		return nbalance;
	}
	public void setNbalance(BigDecimal nbalance) {
		this.nbalance = nbalance;
	}
	public BigDecimal getNrebatemoney() {
		return nrebatemoney;
	}
	public void setNrebatemoney(BigDecimal nrebatemoney) {
		this.nrebatemoney = nrebatemoney;
	}
	public BigDecimal getNbillbalance() {
		return nbillbalance;
	}
	public void setNbillbalance(BigDecimal nbillbalance) {
		this.nbillbalance = nbillbalance;
	}

	
	public String getUnitcode() {
		return unitcode;
	}
	public void setUnitcode(String unitcode) {
		this.unitcode = unitcode;
	}
	public String getUnitname() {
		return unitname;
	}
	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}
	public String getCrecbillid() {
		return crecbillid;
	}
	public void setCrecbillid(String crecbillid) {
		this.crecbillid = crecbillid;
	}
	public String getVbillno() {
		return vbillno;
	}
	public void setVbillno(String vbillno) {
		this.vbillno = vbillno;
	}
	public String getVbilldate() {
		return vbilldate;
	}
	public void setVbilldate(String vbilldate) {
		this.vbilldate = vbilldate;
	}
	public String getCsourcebillid() {
		return csourcebillid;
	}
	public void setCsourcebillid(String csourcebillid) {
		this.csourcebillid = csourcebillid;
	}
	
	public BigDecimal getNrecmoney() {
		return nrecmoney;
	}
	public void setNrecmoney(BigDecimal nrecmoney) {
		this.nrecmoney = nrecmoney;
	}
	
	public String getPk_corp() {
		return pk_corp;
	}
	public void setPk_corp(String pk_corp) {
		this.pk_corp = pk_corp;
	}
	public Date getTs() {
		return ts;
	}
	public void setTs(Date ts) {
		this.ts = ts;
	}
	public String getDr() {
		return dr;
	}
	public void setDr(String dr) {
		this.dr = dr;
	}
	public String getMakeman() {
		return makeman;
	}
	public void setMakeman(String makeman) {
		this.makeman = makeman;
	}
	public String getMakemancode() {
		return makemancode;
	}
	public void setMakemancode(String makemancode) {
		this.makemancode = makemancode;
	}
	public String getMakemanname() {
		return makemanname;
	}
	public void setMakemanname(String makemanname) {
		this.makemanname = makemanname;
	}
	public String getCheckman() {
		return checkman;
	}
	public void setCheckman(String checkman) {
		this.checkman = checkman;
	}
	public String getCheckmancode() {
		return checkmancode;
	}
	public void setCheckmancode(String checkmancode) {
		this.checkmancode = checkmancode;
	}
	public String getCheckmanname() {
		return checkmanname;
	}
	public void setCheckmanname(String checkmanname) {
		this.checkmanname = checkmanname;
	}
	public String getCheckdate() {
		return checkdate;
	}
	public void setCheckdate(String checkdate) {
		this.checkdate = checkdate;
	}
	public String getChecktime() {
		return checktime;
	}
	public void setChecktime(String checktime) {
		this.checktime = checktime;
	}
	public String getCcustid() {
		return ccustid;
	}
	public void setCcustid(String ccustid) {
		this.ccustid = ccustid;
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
	public String getCcustmid() {
		return ccustmid;
	}
	public void setCcustmid(String ccustmid) {
		this.ccustmid = ccustmid;
	}
	public String getCsourcebillno() {
		return csourcebillno;
	}
	public void setCsourcebillno(String csourcebillno) {
		this.csourcebillno = csourcebillno;
	}
	public String getCurrencyid() {
		return currencyid;
	}
	public void setCurrencyid(String currentcyid) {
		this.currencyid = currentcyid;
	}
	public String getCurrencycode() {
		return currencycode;
	}
	public void setCurrencycode(String currentcycode) {
		this.currencycode = currentcycode;
	}
	public String getCurrencyname() {
		return currencyname;
	}
	public void setCurrencyname(String currentcyname) {
		this.currencyname = currentcyname;
	}
	public Integer getUpstate() {
		return upstate;
	}
	public void setUpstate(Integer upstate) {
		this.upstate = upstate;
	}
	/**
	 * @return the pk_enum_billstate
	 */
	public String getPk_enum_billstate() {
		return pk_enum_billstate;
	}
	/**
	 * @param pk_enum_billstate the pk_enum_billstate to set
	 */
	public void setPk_enum_billstate(String pk_enum_billstate) {
		this.pk_enum_billstate = pk_enum_billstate;
	}
}
