package com.core.search.domain;

import java.math.BigDecimal;

public class SearchResultDomain {
	private String ssjlid;
	private String gsid;
	private String sspcid;
	private BigDecimal gsjg;
	private BigDecimal sspm;
	private String jfbbid;
	private String bz;

	public String getSsjlid() {
		return ssjlid;
	}

	public void setSsjlid(String ssjlid) {
		this.ssjlid = ssjlid;
	}

	public String getGsid() {
		return gsid;
	}

	public void setGsid(String gsid) {
		this.gsid = gsid;
	}

	public String getSspcid() {
		return sspcid;
	}

	public void setSspcid(String sspcid) {
		this.sspcid = sspcid;
	}

	public BigDecimal getGsjg() {
		return gsjg;
	}

	public void setGsjg(BigDecimal gsjg) {
		this.gsjg = gsjg;
	}

	public BigDecimal getSspm() {
		return sspm;
	}

	public void setSspm(BigDecimal sspm) {
		this.sspm = sspm;
	}

	public String getJfbbid() {
		return jfbbid;
	}

	public void setJfbbid(String jfbbid) {
		this.jfbbid = jfbbid;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

}
