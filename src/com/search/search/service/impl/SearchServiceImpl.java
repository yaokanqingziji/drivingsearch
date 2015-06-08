package com.search.search.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.company.bpo.CompanyBillBpo;
import com.core.company.model.CompanyBillModel;
import com.core.search.bpo.SearchBpo;
import com.core.search.model.SearchBatchModel;
import com.core.search.model.SearchQueryModel;
import com.core.search.model.SearchRecordModel;
import com.core.search.model.SearchResDetailModel;
import com.core.search.model.SearchResultModel;
import com.core.search.model.SearchResultsModel;
import com.core.user.model.UserForBusinessModel;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.exception.BusinessException;
import com.search.base.SearchBaseService;
import com.search.search.service.SearchService;

@Service("com.search.search.service.impl.SearchServiceImpl")
public class SearchServiceImpl extends SearchBaseService implements
		SearchService {

	@Autowired
	private CompanyBillBpo companyBillBpo;

	@Autowired
	private SearchBpo searchBpo;

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
	public SearchResultsModel searchForPersonDrive(
			SearchQueryModel searchQueryModel,
			UserForBusinessModel userForBusinessModel) throws BaseException {
		String djlx = "01";
		SearchResultsModel searchResultsModel = null;
		SearchBatchModel searchBatchModel;
		SearchRecordModel searchRecordModel;
		List<SearchResultModel> searchResultModels;

		CompanyBillModel companyBillModel;
		String sspcId, ssjlId;

		// 1.获取计费标准
		companyBillModel = companyBillBpo.getAllRegistCompanyBillByDjlx(djlx,searchQueryModel.getDjCity());
		if(companyBillModel == null){
			throw new BusinessException("没有代驾信息");
		}
		// 2.计算并保存酒后代驾搜索
		searchRecordModel = searchBpo.CalcAndSavePersonDriveSearch(
				userForBusinessModel, searchQueryModel, companyBillModel);
		
		// 3.获取搜索批次、搜索结果信息
		sspcId = searchRecordModel.getSspcid();
		ssjlId = searchRecordModel.getSsjlid();
		searchBatchModel = searchBpo.querySearchBatchModelBysspcId(sspcId);
		searchResultModels = searchBpo.querySearchResultModels(ssjlId);
		// 4.返回结果
		searchResultsModel = new SearchResultsModel();
		searchResultsModel.setSearchBatchModel(searchBatchModel);
		searchResultsModel.setSearchRecordModel(searchRecordModel);
		searchResultsModel.setSearchResultModels(searchResultModels);
		return searchResultsModel;
	}

	@Override
	public List<SearchResDetailModel> querySearchResDetailModels(String ssjlId,
			String gsid) throws BaseException {
		return searchBpo.querySearchResDetailModels(ssjlId, gsid);
	}
}