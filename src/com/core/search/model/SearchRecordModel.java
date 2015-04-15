package com.core.search.model;

import java.math.BigDecimal;
import java.util.Date;

public class SearchRecordModel {

	private String sspcid;
	private String ssjlid;

	private BigDecimal yghs;
	private BigDecimal ygjl;

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

	public BigDecimal getYghs() {
		return yghs;
	}

	public void setYghs(BigDecimal yghs) {
		this.yghs = yghs;
	}

	public BigDecimal getYgjl() {
		return ygjl;
	}

	public void setYgjl(BigDecimal ygjl) {
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
