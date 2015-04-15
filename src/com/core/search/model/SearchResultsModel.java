package com.core.search.model;

import java.util.List;

public class SearchResultsModel {
	private SearchBatchModel searchBatchModel;
	private SearchRecordModel searchRecordModel;
	private List<SearchResultModel> searchResultModels;

	public SearchBatchModel getSearchBatchModel() {
		return searchBatchModel;
	}

	public void setSearchBatchModel(SearchBatchModel searchBatchModel) {
		this.searchBatchModel = searchBatchModel;
	}

	public SearchRecordModel getSearchRecordModel() {
		return searchRecordModel;
	}

	public void setSearchRecordModel(SearchRecordModel searchRecordModel) {
		this.searchRecordModel = searchRecordModel;
	}

	public List<SearchResultModel> getSearchResultModels() {
		return searchResultModels;
	}

	public void setSearchResultModels(List<SearchResultModel> searchResultModels) {
		this.searchResultModels = searchResultModels;
	}

}
