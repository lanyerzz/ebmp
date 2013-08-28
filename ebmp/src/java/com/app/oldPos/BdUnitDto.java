package com.app.oldPos;

import java.util.Date;

/**
 * Title:计量单位DTO
 * @author MingYue Development Group
 *
 */
public class BdUnitDto  {

	//default versionID
	private static final long serialVersionUID = 1L;
	// character varying(32) NOT NULL, -- 主键
	private String pk_unit;
	// character varying(32), -- 计量单位编码
	private String unitcode;
	// character varying(32), -- 计量单位名称
	private String unitname;
	// character varying(32), -- 公司主键
	private String pk_corp;
	// 公司编码
	private String corpcode;
	// 公司名称
	private String corpname;
	// integer DEFAULT 0, -- 删除标记
	private Integer dr;
	// timestamp without time zone, -- 时间戳
	private Date ts;
	/**
	 * 取得计量单位PK
	 * @return the pk_unit
	 */
	public String getPk_unit() {
		return pk_unit;
	}
	/**
	 * 设置计量单位PK
	 * @param pk_unit 计量单位PK
	 */
	public void setPk_unit(String pk_unit) {
		this.pk_unit = pk_unit;
	}
	/**
	 * 取得计量单位编码
	 * @return the unitcode
	 */
	public String getUnitcode() {
		return unitcode;
	}
	/**
	 * 设置计量单位编码
	 * @param unitcode 计量单位编码
	 */
	public void setUnitcode(String unitcode) {
		this.unitcode = unitcode;
	}
	/**
	 * 取得计量单位名称
	 * @return the unitname
	 */
	public String getUnitname() {
		return unitname;
	}
	/**
	 * 设置计量单位名称
	 * @param unitname 计量单位名称
	 */
	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}
	/**
	 * 取得公司PK
	 * @return the pk_corp
	 */
	public String getPk_corp() {
		return pk_corp;
	}
	/**
	 * 设置公司PK
	 * @param pk_corp 公司PK
	 */
	public void setPk_corp(String pk_corp) {
		this.pk_corp = pk_corp;
	}
	
	/**
	 * 取得公司编码
	 * @return the corpcode
	 */
	public String getCorpcode() {
		return corpcode;
	}
	/**
	 * 设置公司编码
	 * @param corpcode 公司编码
	 */
	public void setCorpcode(String corpcode) {
		this.corpcode = corpcode;
	}
	/**
	 * 取得公司名称
	 * @return the corpname
	 */
	public String getCorpname() {
		return corpname;
	}
	/**
	 * 设置公司名称
	 * @param corpname 公司名称
	 */
	public void setCorpname(String corpname) {
		this.corpname = corpname;
	}
	/**
	 * 取得删除标记
	 * @return the dr
	 */
	public Integer getDr() {
		return dr;
	}
	/**
	 * 设置删除标记
	 * @param dr 删除标记
	 */
	public void setDr(Integer dr) {
		this.dr = dr;
	}
	/**
	 * 取得时间戳
	 * @return the ts
	 */
	public Date getTs() {
		return ts;
	}
	/**
	 * 设置时间戳
	 * @param ts 时间戳
	 */
	public void setTs(Date ts) {
		this.ts = ts;
	}

	
	
}
