package com.search.search.model;

import java.math.BigDecimal;
import java.util.Date;

public class SearchLogResultModel {

	private String searchPatchId;
	private String searchLogId;
	
	private BigDecimal yghs;
	private BigDecimal ygjl;
	
	private Date ddsj;

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
	
	
}
