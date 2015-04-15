package com.search.search.service;

import com.core.search.model.SearchQueryModel;
import com.core.search.model.SearchResultsModel;
import com.core.user.model.UserForBusinessModel;
import com.ldw.frame.base.BaseException;

public interface SearchService {

	/**
	 * @Description: 个人代驾搜索
	 * @param searchQueryModel
	 *            搜索条件
	 * @param userForBusinessModel
	 *            用户信息
	 * @return
	 * @throws BaseException
	 * @return SearchResultModel 搜索结果
	 * @author ldw
	 * @date 2015年1月27日 下午10:08:39
	 */
	public SearchResultsModel searchForPersonDrive(
			SearchQueryModel searchQueryModel,
			UserForBusinessModel userForBusinessModel)
			throws BaseException;
}