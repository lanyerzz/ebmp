package com.app.oldPos;

/**
 * 订单查询dto
 * @author lxx
 *
 */
public class QuerySaleBillDto {
	/**
	 * 组织机构（公司）ID
	 * 支持查询多个组织
	 */
	private String[] corpID;
	/**
	 * 客商id
	 * 支持查询多个客户
	 */
	private String[] custID;
	/**
	 * 订单单据号
	 * 支持多个订单号查询
	 */
	private String[] billno;
	/**
	 * 订单日期
	 * 查询起始日期
	 */
	private String startDate;
	/**
	 * 订单日期
	 *查询 结束日期
	 */
	private String endDate;
	
	/**
	 * 单据类型
	 */
	private String[] billType;
	
	/**
	 * 单据状态
	 */
	private String[] billState;
	
	private Integer upstate;	//上传状态
	
	

	public Integer getUpstate() {
		return upstate;
	}
	public void setUpstate(Integer upstate) {
		this.upstate = upstate;
	}
	public String[] getBillState() {
		return billState;
	}
	public void setBillState(String[] billState) {
		this.billState = billState;
	}
	public String[] getBillType() {
		return billType;
	}
	public void setBillType(String[] billType) {
		this.billType = billType;
	}
	public String[] getCorpID() {
		return corpID;
	}
	public void setCorpID(String[] corpID) {
		this.corpID = corpID;
	}
	public String[] getCustID() {
		return custID;
	}
	public void setCustID(String[] custID) {
		this.custID = custID;
	}
	public String[] getBillno() {
		return billno;
	}
	public void setBillno(String[] billno) {
		this.billno = billno;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	

}
