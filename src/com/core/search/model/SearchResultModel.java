package com.core.search.model;


public class SearchResultModel {
	private String sspcid;
	private String ssjlid;
	private String gsid;// 公司ID
	private String gsmc;// 公司名稱
	private String pjjb;// 公司评价级别

	private String yydh;// 预约电话
	private String yylxr; //预约联系人

	private Double gsjg;// 估算價格
	private Integer sspm;// 價格順序
	
	private String jfbbid; //计费版本ID
	private String qtjfms; //其他计费描述，主要是针对无法用算法计费的信息
	private String jfms;

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


	public Double getGsjg() {
		return gsjg;
	}

	public void setGsjg(Double gsjg) {
		this.gsjg = gsjg;
	}

	
	public Integer getSspm() {
		return sspm;
	}

	public void setSspm(Integer sspm) {
		this.sspm = sspm;
	}

	public String getYylxr() {
		return yylxr;
	}

	public void setYylxr(String yylxr) {
		this.yylxr = yylxr;
	}

	public String getJfbbid() {
		return jfbbid;
	}

	public void setJfbbid(String jfbbid) {
		this.jfbbid = jfbbid;
	}

	public String getQtjfms() {
		return qtjfms;
	}

	public void setQtjfms(String qtjfms) {
		this.qtjfms = qtjfms;
	}

	public String getJfms() {
		return jfms;
	}

	public void setJfms(String jfms) {
		this.jfms = jfms;
	}

	
	
}
