package com.search.search.service;

import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.paging.PagingModel;
import com.search.search.model.SearchQueryModel;
import com.search.search.model.SearchResultModel;
import com.search.user.model.UserForBusinessModel;

public interface SearchService {

	/**
	 * @Description: 个人代驾搜索
	 * @param searchQueryModel
	 *            搜索条件
	 * @param userForBusinessModel
	 *            用户信息
	 * @param pagingModel
	 *            分页
	 * @return
	 * @throws BaseException
	 * @return SearchResultModel 搜索结果
	 * @author ldw
	 * @date 2015年1月27日 下午10:08:39
	 */
	public SearchResultModel searchForPersonDrive(
			SearchQueryModel searchQueryModel,
			UserForBusinessModel userForBusinessModel, PagingModel pagingModel)
			throws BaseException;
}