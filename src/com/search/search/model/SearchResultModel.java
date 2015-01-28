package com.search.search.model;

import java.util.List;

public class SearchResultModel {
	private SearchPatchResultModel searchPatchModel;
	private SearchLogResultModel searchLogModel;
	private List<SearchOrderResultModel> searchOrderModels;

	public SearchPatchResultModel getSearchPatchModel() {
		return searchPatchModel;
	}

	public void setSearchPatchModel(SearchPatchResultModel searchPatchModel) {
		this.searchPatchModel = searchPatchModel;
	}

	public SearchLogResultModel getSearchLogModel() {
		return searchLogModel;
	}

	public void setSearchLogModel(SearchLogResultModel searchLogModel) {
		this.searchLogModel = searchLogModel;
	}

	public List<SearchOrderResultModel> getSearchOrderModels() {
		return searchOrderModels;
	}

	public void setSearchOrderModels(List<SearchOrderResultModel> searchOrderModels) {
		this.searchOrderModels = searchOrderModels;
	}

}
