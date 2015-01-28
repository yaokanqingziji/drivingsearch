package com.search.entity;

// Generated 2012-6-25 19:26:20 by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysOrg generated by hbm2java
 */
@Entity
@Table(name = "SYS_ORG")
public class SysOrg implements java.io.Serializable,Cloneable{

	private static final long serialVersionUID = 8351098855461911485L;
	private String orgid;
	private String orgno;
	private String orgname;
	private String isvalid;
	private String note;

	public SysOrg() {
	}

	public SysOrg(String orgid, String orgno) {
		this.orgid = orgid;
		this.orgno = orgno;
	}

	public SysOrg(String orgid, String orgno, String orgname, String isvalid,
			String note) {
		this.orgid = orgid;
		this.orgno = orgno;
		this.orgname = orgname;
		this.isvalid = isvalid;
		this.note = note;
	}

	@Id
	@Column(name = "ORGID", unique = true, nullable = false, length = 24)
	public String getOrgid() {
		return this.orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	@Column(name = "ORGNO", nullable = false, length = 16)
	public String getOrgno() {
		return this.orgno;
	}

	public void setOrgno(String orgno) {
		this.orgno = orgno;
	}

	@Column(name = "ORGNAME", length = 50)
	public String getOrgname() {
		return this.orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	@Column(name = "ISVALID", length = 1)
	public String getIsvalid() {
		return this.isvalid;
	}

	public void setIsvalid(String isvalid) {
		this.isvalid = isvalid;
	}

	@Column(name = "NOTE", length = 1000)
	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	@Override 
    public Object clone() throws CloneNotSupportedException { 
        return super.clone(); 
    }

}
