package com.app.oldPos;

import java.math.BigDecimal;



public class SaleExecuteDto   {

	/**
	 * 订单子表id
	 */
	private String csaleorderbid;
	/**
	 * 明细表id   pk
	 */
	private String csaleorderbBid;
	/**
	 * 存货档案id
	 */
	private String cinvbasdoc;
	/**
	 * 存货编码
	 */
	private String cinvcode;
	/**
	 * 存货名称
	 */
	private String cinvname;
	/**
	 * 时间戳
	 */
	private String ts;
	/**
	 * 删除标记
	 */
	private Integer dr;
	/**
	 * 公司组织id
	 */
	private String pkCorp;
	/**
	 * 单价
	 */
	private BigDecimal nprice;
	/**
	 * 数量
	 */
	private BigDecimal nnumber;
	
	private Integer rownum;
	public BigDecimal getNprice() {
		return nprice;
	}
	public void setNprice(BigDecimal nprice) {
		this.nprice = nprice;
	}
	public BigDecimal getNnumber() {
		return nnumber;
	}
	public void setNnumber(BigDecimal nnumber) {
		this.nnumber = nnumber;
	}
	public String getCsaleorderbBid() {
		return csaleorderbBid;
	}
	public void setCsaleorderbBid(String csaleorderbBid) {
		this.csaleorderbBid = csaleorderbBid;
	}
	public String getCinvbasdoc() {
		return cinvbasdoc;
	}
	public void setCinvbasdoc(String cinvbasdoc) {
		this.cinvbasdoc = cinvbasdoc;
	}
	public String getTs() {
		return ts;
	}
	public void setTs(String ts) {
		this.ts = ts;
	}
	public Integer getDr() {
		return dr;
	}
	public void setDr(Integer dr) {
		this.dr = dr;
	}
	public String getPkCorp() {
		return pkCorp;
	}
	public void setPkCorp(String pkCorp) {
		this.pkCorp = pkCorp;
	}
	public String getCinvcode() {
		return cinvcode;
	}
	public void setCinvcode(String cinvcode) {
		this.cinvcode = cinvcode;
	}
	public String getCinvname() {
		return cinvname;
	}
	public void setCinvname(String cinvname) {
		this.cinvname = cinvname;
	}
	public String getCsaleorderbid() {
		return csaleorderbid;
	}
	public void setCsaleorderbid(String csaleorderbid) {
		this.csaleorderbid = csaleorderbid;
	}
	public Integer getRownum() {
		return rownum;
	}
	public void setRownum(Integer rownum) {
		this.rownum = rownum;
	}

	
}
