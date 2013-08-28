package com.app.oldPos;

import java.math.BigDecimal;
import java.util.Date;



public class SaleHeaderDto  {
	
	private BigDecimal ngetmoney;//已经付款金额
	private String checkdate;
	private String checktime;
	private String checkman;
	private String checkmancode;
	private String checkmanname;
	private String makeman;
	private String makemancode;
	private String makemanname;
	private Integer upstate;
	private String pk_stordoc;
	private String msg;
	
	private String memo;	//备注
	private String vlinktel;
	private String vlinkaddress;
	
	private Integer upstatedis;//折扣上传标记（0未上传，1上传成功，2上传失败）
	 private String msgdis;	//折扣上传返回信息
	 private String uptsdis;	//折扣上传时间戳
	
	 
	
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

	public String getUptsdis() {
		return uptsdis;
	}

	public void setUptsdis(String uptsdis) {
		this.uptsdis = uptsdis;
	}

	public String getVlinktel() {
		return vlinktel;
	}

	public void setVlinktel(String vlinktel) {
		this.vlinktel = vlinktel;
	}

	public String getVlinkaddress() {
		return vlinkaddress;
	}

	public void setVlinkaddress(String vlinkaddress) {
		this.vlinkaddress = vlinkaddress;
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
	/**
	 * 仓库编码
	 */
	private String stordoccode;
	/**
	 * @return the stordoccode
	 */
	public String getStordoccode() {
		return stordoccode;
	}

	/**
	 * @param stordoccode the stordoccode to set
	 */
	public void setStordoccode(String stordoccode) {
		this.stordoccode = stordoccode;
	}

	/**
	 * @return the stordocname
	 */
	public String getStordocname() {
		return stordocname;
	}

	/**
	 * @param stordocname the stordocname to set
	 */
	public void setStordocname(String stordocname) {
		this.stordocname = stordocname;
	}
	/**
	 * 仓库名称
	 */
	private String stordocname;
	
	
	
	/**
	 * @return the pk_stordoc
	 */
	public String getPk_stordoc() {
		return pk_stordoc;
	}

	/**
	 * @param pk_stordoc the pk_stordoc to set
	 */
	public void setPk_stordoc(String pk_stordoc) {
		this.pk_stordoc = pk_stordoc;
	}
	
	
	
	/**
	 * @return the upstate
	 */
	public Integer getUpstate() {
		
		return upstate;
	}

	/**
	 * @param upstate the upstate to set
	 */
	public void setUpstate(Integer upstate) {
		this.upstate = upstate;
	}
	
	
	public BigDecimal getNgetmoney() {
		return ngetmoney;
	}
	public void setNgetmoney(BigDecimal ngetmoney) {
		this.ngetmoney = ngetmoney;
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
	/**
	 * 订单ID
	 */
	private String csaleid;
	/**
	 * 单据号
	 */
	private String vbillno;
	/**
	 * 客户id
	 */
	private String ccustomer;
	/**
	 * 客商编码
	 */
	private String custcode;
	/**
	 * 客商名称
	 */
	private String custname;
	/**
	 * 订单总金额
	 */
	private BigDecimal nmoney;
	private BigDecimal nrebatemoney;
	private BigDecimal nrecmoney;
	
	
	/**
	 * 币种id
	 */
	private String currencytypeid;
	
	private String currencytypecode;
	
	private String currencytypename;
	/**
	 * 组织结构（公司）ID
	 * 
	 */
	private String pkCorp;
	
	private String unitCode;
	
	private String unitName;
	/**
	 * 删除标记
	 */
	private Integer dr;
	/**
	 * 时间戳
	 */
	private Date ts;
	/**
	 * 单据日期
	 */
	private String vbilldate;
	/**
	 * 单据类型
	 */
	private String pkEnumBilltype;
	/**
	 * 单据状态
	 */
	private String pkEnumBillstate;
	public String getCsaleid() {
		return csaleid;
	}
	public void setCsaleid(String csaleid) {
		this.csaleid = csaleid;
	}
	public String getVbillno() {
		return vbillno;
	}
	public void setVbillno(String vbillno) {
		this.vbillno = vbillno;
	}
	public String getCcustomer() {
		return ccustomer;
	}
	public void setCcustomer(String ccustomer) {
		this.ccustomer = ccustomer;
	}

	public BigDecimal getNmoney() {
		return nmoney;
	}
	public void setNmoney(BigDecimal nmoney) {
		this.nmoney = nmoney;
	}
	public String getCurrencytypeid() {
		return currencytypeid;
	}
	public void setCurrencytypeid(String currencytypeid) {
		this.currencytypeid = currencytypeid;
	}
	public String getPkCorp() {
		return pkCorp;
	}
	public void setPkCorp(String pkCorp) {
		this.pkCorp = pkCorp;
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
	public String getVbilldate() {
		return vbilldate;
	}
	public void setVbilldate(String vbilldate) {
		this.vbilldate = vbilldate;
	}
	public String getPkEnumBilltype() {
		return pkEnumBilltype;
	}
	public void setPkEnumBilltype(String pkEnumBilltype) {
		this.pkEnumBilltype = pkEnumBilltype;
	}
	public String getPkEnumBillstate() {
		return pkEnumBillstate;
	}
	public void setPkEnumBillstate(String pkEnumBillstate) {
		this.pkEnumBillstate = pkEnumBillstate;
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
	public String getCurrencytypecode() {
		return currencytypecode;
	}
	public void setCurrencytypecode(String currencytypecode) {
		this.currencytypecode = currencytypecode;
	}
	public String getCurrencytypename() {
		return currencytypename;
	}
	public void setCurrencytypename(String currencytypename) {
		this.currencytypename = currencytypename;
	}
	public String getUnitCode() {
		return unitCode;
	}
	public void setUnitCode(String unitCode) {
		this.unitCode = unitCode;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public BigDecimal getNrebatemoney() {
		return nrebatemoney;
	}
	public void setNrebatemoney(BigDecimal nrebatemoney) {
		this.nrebatemoney = nrebatemoney;
	}
	public BigDecimal getNrecmoney() {
		return nrecmoney;
	}
	public void setNrecmoney(BigDecimal nrecmoney) {
		this.nrecmoney = nrecmoney;
	}
}
