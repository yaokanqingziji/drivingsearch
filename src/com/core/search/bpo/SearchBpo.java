package com.core.search.bpo;

import java.util.List;

import com.core.company.model.CompanyBillModel;
import com.core.search.model.SearchBatchModel;
import com.core.search.model.SearchQueryModel;
import com.core.search.model.SearchRecordModel;
import com.core.search.model.SearchResDetailModel;
import com.core.search.model.SearchResultModel;
import com.core.user.model.UserForBusinessModel;
import com.ldw.frame.base.BaseException;

public interface SearchBpo {

	/**
	 * @Description: 根据搜索条件与计费标准 估算酒后代驾各个公司的价格
	 * @param searchQueryModel
	 * @param companyBillModel
	 * @return
	 * @throws BaseException
	 * @return SearchRecordModel
	 * @author ldw
	 * @date 2015年3月24日 下午10:50:13
	 */
	public SearchRecordModel CalcAndSavePersonDriveSearch(
			UserForBusinessModel userForBusinessModel,
			SearchQueryModel searchQueryModel, CompanyBillModel companyBillModel)
			throws BaseException;

	/**
	 * @Description: 根据搜素记录ID获取搜索记录信息
	 * @param ssjlId
	 * @return
	 * @throws BaseException
	 * @return SearchRecordModel
	 * @author ldw
	 * @date 2015年3月24日 下午11:03:39
	 */
	public SearchRecordModel querySearchRecordModelByssjiId(String ssjlId)
			throws BaseException;

	/**
	 * @Description: 根据搜索批次ID获取搜素批次信息
	 * @param sspcId
	 * @return
	 * @throws BaseException
	 * @return SearchBatchModel
	 * @author ldw
	 * @date 2015年3月24日 下午11:03:55
	 */
	public SearchBatchModel querySearchBatchModelBysspcId(String sspcId)
			throws BaseException;

	/**
	 * @Description: 根据搜素记录ID获取搜素结果列表
	 * @param ssjlId
	 * @return
	 * @throws BaseException
	 * @return List<SearchResultModel>
	 * @author ldw
	 * @date 2015年3月24日 下午11:04:10
	 */
	public List<SearchResultModel> querySearchResultModels(String ssjlId)
			throws BaseException;

	/** 
	* @Description: 根据搜索记录ID与公司ID,获取搜索结果明细信息
	* @param ssjlId
	* @param gsid
	* @return
	* @throws BaseException
	* @return List<SearchResDetailModel>   
	* @author  ldw
	* @date 2015年4月15日 上午9:19:18
	*/ 
	public List<SearchResDetailModel> querySearchResDetailModels(String ssjlId,
			String gsid) throws BaseException;
}
