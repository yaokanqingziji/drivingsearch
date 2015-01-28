package com.search.search.model;

import java.math.BigDecimal;

public class SearchOrderResultModel {
	private String searchPatchId;
	private String searchLogId;
	private String gsId;//公司ID
	private String gsmc;//公司名稱
	private String pjjb;//公司评价级别
	
	private BigDecimal gsjg;//估算價格
	private BigDecimal jgsx;//價格順序
	public String getSearchPatchId() {
		return searchPatchId;
	}
	public void setSearchPatchId(String searchPatchId) {
		this.searchPatchId = searchPatchId;
	}
	public String getSearchLogId() {
		return searchLogId;
	}
	public void setSearchLogId(String searchLogId) {
		this.searchLogId = searchLogId;
	}
	public String getGsId() {
		return gsId;
	}
	public void setGsId(String gsId) {
		this.gsId = gsId;
	}
	public String getGsmc() {
		return gsmc;
	}
	public void setGsmc(String gsmc) {
		this.gsmc = gsmc;
	}
	public BigDecimal getGsjg() {
		return gsjg;
	}
	public void setGsjg(BigDecimal gsjg) {
		this.gsjg = gsjg;
	}
	public BigDecimal getJgsx() {
		return jgsx;
	}
	public void setJgsx(BigDecimal jgsx) {
		this.jgsx = jgsx;
	}
	public String getPjjb() {
		return pjjb;
	}
	public void setPjjb(String pjjb) {
		this.pjjb = pjjb;
	}
	

}
