package com.search.search.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseController;
import com.search.search.model.SearchOrderResultModel;
import com.search.search.model.SearchQueryModel;
import com.search.search.model.SearchResultModel;
import com.search.search.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController extends SearchBaseController {

	@Autowired
	private SearchService searchService;

	/**
	 * @Description: 个人代驾搜索（区别于商务代驾）
	 * @param request
	 * @param searchQueryModel
	 * @return
	 * @throws BaseException
	 * @return String
	 * @author ldw
	 * @date 2015年1月27日 下午2:16:33
	 */
	@RequestMapping("/searchForPersonDrive")
	@ResponseBody
	public String searchForPersonDrive(HttpServletRequest request,
			SearchQueryModel searchQueryModel) throws BaseException {
		// TODO 入参校验

		// 查询
		SearchResultModel searchResultModel = searchService
				.searchForPersonDrive(searchQueryModel,
						this.getUserForBusiness(request),
						this.getPagingModel(request));

		// 测试代码，不考虑空指针问题。
		String searchPatchId = searchResultModel.getSearchPatchModel()
				.getSearchPatchId();
		Date yysj = searchResultModel.getSearchPatchModel().getYysj();
		Date ddsj = searchResultModel.getSearchLogModel().getDdsj();
		BigDecimal gsjl = searchResultModel.getSearchLogModel().getYgjl();
		BigDecimal gshs = searchResultModel.getSearchLogModel().getYghs();
		List<SearchOrderResultModel> searchOrderResultModels = searchResultModel
				.getSearchOrderModels();
		
		return "";
	}
}