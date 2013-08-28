package com.app.oldPos;

import java.math.BigDecimal;


public class SaleBodyDto   {
	/**
	 * 订单子表id
	 */
	private String csaleorderid;
	/**
	 * 条码id
	 */
	private String cbarcodeid;
	/**
	 * 条码号
	 */
	private String cbarcode;
	/**
	 * 条码编码
	 */
	private String cbar_vcode;
	/**
	 * 货号名称
	 */
	private String cbar_name;
	/**
	 * 数量
	 */
	private BigDecimal nnumber;
	/**
	 * 单价
	 */
	private BigDecimal nprice;
	/**
	 * 税率
	 */
	private BigDecimal nrate;
	/**
	 * 删除标记
	 */
	private Integer dr;
	/**
	 * 时间戳
	 */
	private String ts;
	/**
	 * 公司组织id
	 */
	private String pkCorp;
	/**
	 * 订单表头id
	 * 与主表关联 的外键
	 */
	private String csaleid;
	/**
	 * 条码明细信息
	 */
	private SaleExecuteDto[] execDto;
	/**
	 * 金额
	 */
	private BigDecimal nmoney;
	
	/**
	 * 仓库
	 */
	private String pk_stordoc;
	/**
	 * 仓库编码
	 */
	private String stordoccode;
	/**
	 * 仓库名称
	 */
	private String stordocname;
	
	//装数PK
	private String freeItem1;
	//装数编码
	private String freeItem1code;
	//装数名称
	private String freeItem1name;
	//换算率
	private BigDecimal hsl;
	//辅计量单位PK
	private String fjl;
	//辅计量单位编码
	private String fjlcode;
	//辅计量单位名称
	private String fjlname;
	//计量单位PK
	private String jl;
	//计量单位编码
	private String jlcode;
	//计量单位名称
	private String jlname;
	//辅数量
	private BigDecimal fnumber;
	
	private String freeitem2;
	
	private Integer rownum;
	
	private String vnote;
	
	private  BigDecimal defaultNum;
	
	
	public BigDecimal getDefaultNum() {
		return defaultNum;
	}

	public void setDefaultNum(BigDecimal defaultNum) {
		this.defaultNum = defaultNum;
	}

	public String getVnote() {
		return vnote;
	}

	public void setVnote(String vnote) {
		this.vnote = vnote;
	}

	/**
	 * 取得辅数量
	 * @return the fnumber
	 */
	public BigDecimal getFnumber() {
		return fnumber;
	}

	/**
	 * 设置辅数量
	 * @param fnumber the fnumber to set
	 */
	public void setFnumber(BigDecimal fnumber) {
		
		this.fnumber = fnumber;
	}
	
	/**
	 * 取得辅计量单位编码
	 * @return the fjlcode
	 */
	public String getFjlcode() {
		return fjlcode;
	}

	/**
	 * 设置辅计量单位编码
	 * @param fjlcode the fjlcode to set
	 */
	public void setFjlcode(String fjlcode) {
		this.fjlcode = fjlcode;
	}

	/**
	 * 取得辅计量单位名称
	 * @return the fjlname
	 */
	public String getFjlname() {
		return fjlname;
	}

	/**
	 * 设置辅计量单位名称
	 * @param fjlname the fjlname to set
	 */
	public void setFjlname(String fjlname) {
		this.fjlname = fjlname;
	}

	/**
	 * 取得计量单位编码
	 * @return the jlcode
	 */
	public String getJlcode() {
		return jlcode;
	}

	/**
	 * 设置计量单位编码
	 * @param jlcode the jlcode to set
	 */
	public void setJlcode(String jlcode) {
		this.jlcode = jlcode;
	}

	/**
	 * 取得计量单位名称
	 * @return the jlname
	 */
	public String getJlname() {
		return jlname;
	}

	/**
	 * 设置计量单位名称
	 * @param jlname the jlname to set
	 */
	public void setJlname(String jlname) {
		this.jlname = jlname;
	}

	/**
	 * 取得辅计量单位PK
	 * @return the fjl
	 */
	public String getFjl() {
		return fjl;
	}

	/**
	 * 设置辅计量单位PK
	 * @param fjl the fjl to set
	 */
	public void setFjl(String fjl) {
		this.fjl = fjl;
	}

	/**
	 * 取得计量单位PK
	 * @return the jl
	 */
	public String getJl() {
		return jl;
	}

	/**
	 * 设置计量单位PK
	 * @param jl the jl to set
	 */
	public void setJl(String jl) {
		this.jl = jl;
	}
	/**
	 * 取得换算率
	 * @return the hsl
	 */
	public BigDecimal getHsl() {
		return hsl;
	}

	/**
	 * 设置换算率
	 * @param hsl the hsl to set
	 */
	public void setHsl(BigDecimal hsl) {
		this.hsl = hsl;
	}
	/**
	 * 取得自由项
	 * @return the freeItem1
	 */
	public String getFreeItem1() {
		return freeItem1;
	}

	/**
	 * 设置自由项
	 * @param freeItem1 the freeItem1 to set
	 */
	public void setFreeItem1(String freeItem1) {
		this.freeItem1 = freeItem1;
	}
	
	
	/**
	 * 取得装数编码
	 * @return the freeItem1code
	 */
	public String getFreeItem1code() {
		return freeItem1code;
	}

	/**
	 * 设置装数编码
	 * @param freeItem1code the freeItem1code to set
	 */
	public void setFreeItem1code(String freeItem1code) {
		this.freeItem1code = freeItem1code;
	}

	/**
	 * 取得装数名称
	 * @return the freeItem1name
	 */
	public String getFreeItem1name() {
		return freeItem1name;
	}

	/**
	 * 设置装数名称
	 * @param freeItem1name the freeItem1name to set
	 */
	public void setFreeItem1name(String freeItem1name) {
		this.freeItem1name = freeItem1name;
	}

	public String getPk_stordoc() {
		return pk_stordoc;
	}
	public void setPk_stordoc(String pk_stordoc) {
		this.pk_stordoc = pk_stordoc;
	}
	public String getStordoccode() {
		return stordoccode;
	}
	public void setStordoccode(String stordoccode) {
		this.stordoccode = stordoccode;
	}
	public String getStordocname() {
		return stordocname;
	}
	public void setStordocname(String stordocname) {
		this.stordocname = stordocname;
	}
	public String getCsaleorderid() {
		return csaleorderid;
	}
	public void setCsaleorderid(String csaleorderid) {
		this.csaleorderid = csaleorderid;
	}
	public String getCbarcodeid() {
		return cbarcodeid;
	}
	public void setCbarcodeid(String cbarcodeid) {
		this.cbarcodeid = cbarcodeid;
	}
	public BigDecimal getNnumber() {
		return nnumber;
	}
	public void setNnumber(BigDecimal nnumber) {
		this.nnumber = nnumber;
	}
	
	public BigDecimal getNrate() {
		return nrate;
	}
	public void setNrate(BigDecimal nrate) {
		this.nrate = nrate;
	}
	public Integer getDr() {
		return dr;
	}
	public void setDr(Integer dr) {
		this.dr = dr;
	}
	public String getTs() {
		return ts;
	}
	public void setTs(String ts) {
		this.ts = ts;
	}
	public String getPkCorp() {
		return pkCorp;
	}
	public void setPkCorp(String pkCorp) {
		this.pkCorp = pkCorp;
	}
	public String getCsaleid() {
		return csaleid;
	}
	public void setCsaleid(String csaleid) {
		this.csaleid = csaleid;
	}
	public SaleExecuteDto[] getExecDto() {
		return execDto;
	}
	public void setExecDto(SaleExecuteDto[] execDto) {
		this.execDto = execDto;
	}
	public String getCbarcode() {
		return cbarcode;
	}
	public void setCbarcode(String cbarcode) {
		this.cbarcode = cbarcode;
	}
	public String getCbar_vcode() {
		return cbar_vcode;
	}
	public void setCbar_vcode(String cbar_vcode) {
		this.cbar_vcode = cbar_vcode;
	}
	public String getCbar_name() {
		return cbar_name;
	}
	public void setCbar_name(String cbar_name) {
		this.cbar_name = cbar_name;
	}
	public BigDecimal getNprice() {
		return nprice;
	}
	public void setNprice(BigDecimal nprice) {
		this.nprice = nprice;
	}
	public BigDecimal getNmoney() {
		return nmoney;
	}
	public void setNmoney(BigDecimal nmoney) {
		this.nmoney = nmoney;
	}

	/**
	 * @return the freeitem2
	 */
	public String getFreeitem2() {
		return freeitem2;
	}

	/**
	 * @param freeitem2 the freeitem2 to set
	 */
	public void setFreeitem2(String freeitem2) {
		this.freeitem2 = freeitem2;
	}

	public Integer getRownum() {
		return rownum;
	}

	public void setRownum(Integer rownum) {
		this.rownum = rownum;
	}

	
}
