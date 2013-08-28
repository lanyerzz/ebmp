package com.app.oldPos;



/**
 * 仓库档案
 * @author MingYue Developer Group
 *
 */
public class BDStorDocDto  {
	
	//default versionID
	private static final long serialVersionUID = 1L;
	//仓库PK
	private String pk_stordoc;// character(32) NOT NULL,
	//仓库名称
	private String storname;// character varying(50),
	//仓库编码
	private String storcode;// character varying(50),
	//公司PK
	private String pk_corp;// character(32),
	//公司编码
	private String corpcode;
	//公司名称
	private String corpname;
	//删除标记
	private Integer dr;// integer DEFAULT 0,
	//时间戳
	private String ts;// character varying(19),
	
	/**
	 * 取得公司编码
	 * @return the corpcode
	 */
	public String getCorpcode() {
		return corpcode;
	}
	/**
	 * 设置公司编码
	 * @param corpcode the corpcode to set
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
	 * @param corpname the corpname to set
	 */
	public void setCorpname(String corpname) {
		this.corpname = corpname;
	}
	/**
	 * 取得仓库PK
	 * @return
	 */
	public String getPk_stordoc() {
		return pk_stordoc;
	}
	/**
	 * 设置仓库PK
	 * @param pk_stordoc 仓库PK
	 */
	public void setPk_stordoc(String pk_stordoc) {
		this.pk_stordoc = pk_stordoc;
	}
	/**
	 * 取得仓库名称
	 * @return
	 */
	public String getStorname() {
		return storname;
	}
	/**
	 * 设置仓库名称
	 * @param storname 仓库名称
	 */
	public void setStorname(String storname) {
		this.storname = storname;
	}
	/**
	 * 取得仓库编码
	 * @return
	 */
	public String getStorcode() {
		return storcode;
	}
	/**
	 * 设置仓库编码
	 * @param storcode 仓库编码
	 */
	public void setStorcode(String storcode) {
		this.storcode = storcode;
	}
	/**
	 * 取得公司PK
	 * @return
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
	 * 取得删除标记
	 * @return
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
	 * @return
	 */
	public String getTs() {
		return ts;
	}
	/**
	 * 设置时间戳
	 * @param ts 时间戳
	 */
	public void setTs(String ts) {
		this.ts = ts;
	}
}
