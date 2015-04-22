package com.core.search.model;

import java.util.Date;

public class SearchRecordModel {

	private String sspcid;
	private String ssjlid;

	private Integer yghs;
	private Double ygjl;

	private Date yysj;
	private Date ddsj;

	public String getSspcid() {
		return sspcid;
	}

	public void setSspcid(String sspcid) {
		this.sspcid = sspcid;
	}

	public String getSsjlid() {
		return ssjlid;
	}

	public void setSsjlid(String ssjlid) {
		this.ssjlid = ssjlid;
	}


	public Integer getYghs() {
		return yghs;
	}

	public void setYghs(Integer yghs) {
		this.yghs = yghs;
	}


	public Double getYgjl() {
		return ygjl;
	}

	public void setYgjl(Double ygjl) {
		this.ygjl = ygjl;
	}

	public Date getDdsj() {
		return ddsj;
	}

	public void setDdsj(Date ddsj) {
		this.ddsj = ddsj;
	}

	public Date getYysj() {
		return yysj;
	}

	public void setYysj(Date yysj) {
		this.yysj = yysj;
	}

}
