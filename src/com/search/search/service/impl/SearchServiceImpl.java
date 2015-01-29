package com.search.search.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.paging.PagingModel;
import com.search.base.SearchBaseService;
import com.search.search.model.SearchLogResultModel;
import com.search.search.model.SearchOrderResultModel;
import com.search.search.model.SearchPatchResultModel;
import com.search.search.model.SearchQueryModel;
import com.search.search.model.SearchResultModel;
import com.search.search.service.SearchService;
import com.search.user.model.UserForBusinessModel;
@Service("com.search.search.service.impl.SearchServiceImpl")
public class SearchServiceImpl extends SearchBaseService implements SearchService {
 
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
			throws BaseException{
		SearchResultModel searchResultModel = null;
		SearchPatchResultModel searchPatchModel;
		SearchLogResultModel searchLogModel;
		SearchOrderResultModel searchOrderModel;
		List<SearchOrderResultModel> searchOrderModels;
		{//测试用 后续删除。 
			searchResultModel = new SearchResultModel();
			searchPatchModel = new SearchPatchResultModel();
			searchLogModel = new SearchLogResultModel();
			
			searchOrderModels = new ArrayList<SearchOrderResultModel>();
			Date tempDate = dBUtil.getSysDate();
			//初始化搜索批次
			searchPatchModel.setSearchPatchId("searchPatchId");
			searchPatchModel.setYysj(tempDate);
			//初始化搜索记录
			searchLogModel.setSearchPatchId("searchPatchId");
			searchLogModel.setSearchLogId("searchLogId");
			searchLogModel.setYghs(BigDecimal.valueOf(30));
			searchLogModel.setYgjl(BigDecimal.valueOf(20));
			searchLogModel.setDdsj(tempDate);
			//初始化搜索排名
			searchOrderModel = new SearchOrderResultModel();
			searchOrderModel.setSearchPatchId("searchPatchId");
			searchOrderModel.setSearchLogId("searchLogId");
			searchOrderModel.setGsId("A");
			searchOrderModel.setGsmc("WL代驾");
			searchOrderModel.setPjjb("4星");
			searchOrderModel.setJgsx(BigDecimal.valueOf(1));
			searchOrderModel.setGsjg(BigDecimal.valueOf(39.0));
			searchOrderModel.setYydh("18610916585");
			searchOrderModels.add(searchOrderModel);
			
			searchOrderModel = new SearchOrderResultModel();
			searchOrderModel.setSearchPatchId("searchPatchId");
			searchOrderModel.setSearchLogId("searchLogId");
			searchOrderModel.setGsId("B");
			searchOrderModel.setGsmc("W代驾");
			searchOrderModel.setPjjb("3星");
			searchOrderModel.setJgsx(BigDecimal.valueOf(2));
			searchOrderModel.setGsjg(BigDecimal.valueOf(45.0));
			searchOrderModel.setYydh("13953133759");
			searchOrderModels.add(searchOrderModel);
			
			searchOrderModel = new SearchOrderResultModel();
			searchOrderModel.setSearchPatchId("searchPatchId");
			searchOrderModel.setSearchLogId("searchLogId");
			searchOrderModel.setGsId("C");
			searchOrderModel.setGsmc("S代驾");
			searchOrderModel.setPjjb("4星");
			searchOrderModel.setJgsx(BigDecimal.valueOf(3));
			searchOrderModel.setGsjg(BigDecimal.valueOf(50.0));
			searchOrderModel.setYydh("15668494627");
			searchOrderModels.add(searchOrderModel);
			
			searchOrderModel = new SearchOrderResultModel();
			searchOrderModel.setSearchPatchId("searchPatchId");
			searchOrderModel.setSearchLogId("searchLogId");
			searchOrderModel.setGsId("D");
			searchOrderModel.setGsmc("易代驾");
			searchOrderModel.setPjjb("5星");
			searchOrderModel.setJgsx(BigDecimal.valueOf(4));
			searchOrderModel.setGsjg(BigDecimal.valueOf(50.5));
			searchOrderModel.setYydh("15668494627");
			searchOrderModels.add(searchOrderModel);
			
			searchOrderModel = new SearchOrderResultModel();
			searchOrderModel.setSearchPatchId("searchPatchId");
			searchOrderModel.setSearchLogId("searchLogId");
			searchOrderModel.setGsId("E");
			searchOrderModel.setGsmc("来个代驾啦啦啦啦啦啦");
			searchOrderModel.setPjjb("4星");
			searchOrderModel.setJgsx(BigDecimal.valueOf(5));
			searchOrderModel.setGsjg(BigDecimal.valueOf(50.5));
			searchOrderModel.setYydh("18615206630");
			searchOrderModels.add(searchOrderModel);
			
			
			searchResultModel.setSearchLogModel(searchLogModel);
			searchResultModel.setSearchPatchModel(searchPatchModel);
			searchResultModel.setSearchOrderModels(searchOrderModels);
		}
		return searchResultModel;
	}
}