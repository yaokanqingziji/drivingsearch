package com.core.search.model;

import java.util.Date;

public class SearchQueryModel {
	private String sspcid;

	private Date yysj;// 预约时间
	private String yysjStr;

	// 出发地
	private String cfdmc;// 出发地名称
	private String cfdjd;// 出发地经度
	private String cfdwd;// 出发地纬度

	// 目的地
	private String mddmc;// 目的地名称
	private String mddjd;// 目的地经度
	private String mddwd;// 目的地纬度

	// 预估距离(公里)
	private Double ygjl;
	// 预估耗时（分钟）
	private Integer yghs;

	private Date ddsj; // 到达时间
	
	private String djCity;//代驾地市
	
	private Boolean isHoliday; //是否节日
	private String holidayName;//节日名称

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

	public String getCfdmc() {
		return cfdmc;
	}

	public void setCfdmc(String cfdmc) {
		this.cfdmc = cfdmc;
	}

	public String getCfdjd() {
		return cfdjd;
	}

	public void setCfdjd(String cfdjd) {
		this.cfdjd = cfdjd;
	}

	public String getCfdwd() {
		return cfdwd;
	}

	public void setCfdwd(String cfdwd) {
		this.cfdwd = cfdwd;
	}

	public String getMddmc() {
		return mddmc;
	}

	public void setMddmc(String mddmc) {
		this.mddmc = mddmc;
	}

	public String getMddjd() {
		return mddjd;
	}

	public void setMddjd(String mddjd) {
		this.mddjd = mddjd;
	}

	public String getMddwd() {
		return mddwd;
	}

	public void setMddwd(String mddwd) {
		this.mddwd = mddwd;
	}

	

	public Double getYgjl() {
		return ygjl;
	}

	public void setYgjl(Double ygjl) {
		this.ygjl = ygjl;
	}

	public Integer getYghs() {
		return yghs;
	}

	public void setYghs(Integer yghs) {
		this.yghs = yghs;
	}

	public String getYysjStr() {
		return yysjStr;
	}

	public void setYysjStr(String yysjStr) {
		this.yysjStr = yysjStr;
	}

	public Date getDdsj() {
		return ddsj;
	}

	public void setDdsj(Date ddsj) {
		this.ddsj = ddsj;
	}

	public String getDjCity() {
		return djCity;
	}

	public void setDjCity(String djCity) {
		this.djCity = djCity;
	}

	public Boolean getIsHoliday() {
		return isHoliday;
	}

	public void setIsHoliday(Boolean isHoliday) {
		this.isHoliday = isHoliday;
	}

	public String getHolidayName() {
		return holidayName;
	}

	public void setHolidayName(String holidayName) {
		this.holidayName = holidayName;
	}

	
	

}
