package com.app.oldPos;

import java.util.Date;


public class CorpDTO    {
	private String pkCorp;
	private String unitname;
	private String unitcode;
	private String fathercode;
	private String cfatherid;
	private Integer dr;
	private Date ts;
	public String getPkCorp() {
		return pkCorp;
	}
	public void setPkCorp(String pkCorp) {
		this.pkCorp = pkCorp;
	}
	public String getUnitname() {
		return unitname;
	}
	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}
	public String getUnitcode() {
		return unitcode;
	}
	public void setUnitcode(String unitcode) {
		this.unitcode = unitcode;
	}
	public String getFathercode() {
		return fathercode;
	}
	public void setFathercode(String fathercode) {
		this.fathercode = fathercode;
	}
	public String getCfatherid() {
		return cfatherid;
	}
	public void setCfatherid(String cfatherid) {
		this.cfatherid = cfatherid;
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
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.unitcode+"  "+this.unitname;
	}
}
