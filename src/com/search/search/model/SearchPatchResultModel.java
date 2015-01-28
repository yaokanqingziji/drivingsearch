package com.search.search.model;

import java.util.Date;


public class SearchPatchResultModel {

	private String searchPatchId;
	private Date yysj;//预约时间

	public String getSearchPatchId() {
		return searchPatchId;
	}

	public void setSearchPatchId(String searchPatchId) {
		this.searchPatchId = searchPatchId;
	}

	public Date getYysj() {
		return yysj;
	}

	public void setYysj(Date yysj) {
		this.yysj = yysj;
	}

}
