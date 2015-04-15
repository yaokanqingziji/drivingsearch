package com.core.search.model;

import java.util.Date;

public class SearchBatchModel {

	private String sspcid;
	private Date yysj;// 预约时间

	public String getSspcid() {
		return sspcid;
	}

	public void setSspcid(String sspcid) {
		this.sspcid = sspcid;
	}

	public Date getYysj() {
		return yysj;
	}

	public void setYysj(Date yysj) {
		this.yysj = yysj;
	}

}
