package com.core.search.model;

import java.math.BigDecimal;

public class SearchResultModel {
	private String sspcid;
	private String ssjlid;
	private String gsid;// 公司ID
	private String gsmc;// 公司名稱
	private String pjjb;// 公司评价级别

	private String yydh;// 预约电话
	private String yylxr; //预约联系人

	private BigDecimal gsjg;// 估算價格
	private BigDecimal sspm;// 價格順序

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

	public String getGsid() {
		return gsid;
	}

	public void setGsid(String gsid) {
		this.gsid = gsid;
	}

	public String getGsmc() {
		return gsmc;
	}

	public void setGsmc(String gsmc) {
		this.gsmc = gsmc;
	}

	public String getPjjb() {
		return pjjb;
	}

	public void setPjjb(String pjjb) {
		this.pjjb = pjjb;
	}

	public String getYydh() {
		return yydh;
	}

	public void setYydh(String yydh) {
		this.yydh = yydh;
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

	public String getYylxr() {
		return yylxr;
	}

	public void setYylxr(String yylxr) {
		this.yylxr = yylxr;
	}

	
	
}
