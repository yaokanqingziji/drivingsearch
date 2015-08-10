package com.core.user.domain;

import java.util.Date;

public class UserLoginDomain {
	private String userid;
	private String dlfs;
	private Date dlsj;
	private String bz;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getDlfs() {
		return dlfs;
	}

	public void setDlfs(String dlfs) {
		this.dlfs = dlfs;
	}

	public Date getDlsj() {
		return dlsj;
	}

	public void setDlsj(Date dlsj) {
		this.dlsj = dlsj;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

}
