package com.app.oldPos;



public class BdDefDocDto  {
	private String pk_defdoclist;
	private String docname ;//character varying(50),
	private String  doccode;// character varying(50),
	private String  fathercode;// character varying(50),
	private String  fatherid;// character varying(32),
	private String  pk_defdoc;// character varying(32) NOT NULL,
	private Integer  dr ;
	private String  pk_corp;// character varying(32),
	private String  vdef1;// character varying(50),
	private String  vdef2;// character varying(50),
	private String vdef3;// character varying(50),
	private String memo;
	public String getPk_defdoclist() {
		return pk_defdoclist;
	}
	public void setPk_defdoclist(String pk_defdoclist) {
		this.pk_defdoclist = pk_defdoclist;
	}
	public String getDocname() {
		return docname;
	}
	public void setDocname(String docname) {
		this.docname = docname;
	}
	public String getDoccode() {
		return doccode;
	}
	public void setDoccode(String doccode) {
		this.doccode = doccode;
	}
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
	public String getPk_defdoc() {
		return pk_defdoc;
	}
	public void setPk_defdoc(String pk_defdoc) {
		this.pk_defdoc = pk_defdoc;
	}
	public Integer getDr() {
		return dr;
	}
	public void setDr(Integer dr) {
		this.dr = dr;
	}
	public String getPk_corp() {
		return pk_corp;
	}
	public void setPk_corp(String pk_corp) {
		this.pk_corp = pk_corp;
	}
	public String getVdef1() {
		return vdef1;
	}
	public void setVdef1(String vdef1) {
		this.vdef1 = vdef1;
	}
	public String getVdef2() {
		return vdef2;
	}
	public void setVdef2(String vdef2) {
		this.vdef2 = vdef2;
	}
	public String getVdef3() {
		return vdef3;
	}
	public void setVdef3(String vdef3) {
		this.vdef3 = vdef3;
	}

	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return this.doccode +"  "+this.docname;
	}
	
	
}
