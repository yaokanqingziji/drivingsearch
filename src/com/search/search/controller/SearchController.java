package com.search.search.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.base.util.DsDateUtil;
import com.core.search.model.SearchBatchModel;
import com.core.search.model.SearchQueryModel;
import com.core.search.model.SearchRecordModel;
import com.core.search.model.SearchResDetailModel;
import com.core.search.model.SearchResultModel;
import com.core.search.model.SearchResultsModel;
import com.core.user.model.UserForBusinessModel;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.exception.AppException;
import com.ldw.frame.common.exception.BusinessException;
import com.ldw.frame.common.util.DateUtil;
import com.search.base.SearchBaseController;
import com.search.base.SearchSessionNames;
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
	@SuppressWarnings("unchecked")
	@RequestMapping("/searchForPersonDrive")
	// @ResponseBody
	public String searchForPersonDrive(ModelMap map,
			HttpServletRequest request, SearchQueryModel searchQueryModel)
			throws BaseException {
		// TODO 需要删除
		HttpSession session = request.getSession();
		UserForBusinessModel userModel = new UserForBusinessModel();
		userModel.setUserId("ldwtest");
		session.setAttribute(SearchSessionNames.userForBusiness, userModel);

		SearchBatchModel searchBatchModel;
		SearchRecordModel searchRecordModel;
		List<SearchResultModel> searchResultModels;
		Date yysj, ddsj;
		String sspcId;
		String ssjlId;
		// 校验搜索信息项
		String yysjStr = searchQueryModel.getYysjStr();
		String cfdmc = searchQueryModel.getCfdmc();
		String cfdjd = searchQueryModel.getCfdjd();
		String cfdwd = searchQueryModel.getCfdwd();
		String mddmc = searchQueryModel.getMddmc();
		String mddjd = searchQueryModel.getMddjd();
		String mddwd = searchQueryModel.getMddwd();
		Double ygjl = searchQueryModel.getYgjl();
		Integer yghs = searchQueryModel.getYghs();
		if (yysjStr == null || "".equals(yysjStr)) {
			throw new BusinessException("请选择预约时间");
		}
		if (cfdmc == null || "".equals(cfdmc)) {
			throw new BusinessException("请输入出发地点");
		}
		if (mddmc == null || "".equals(mddmc)) {
			throw new BusinessException("请输入目的地");
		}
		if (cfdjd == null || "".equals(cfdjd)) {
			throw new AppException("出发地经度计算错误，请联系客服");
		}
		if (cfdwd == null || "".equals(cfdwd)) {
			throw new AppException("出发地纬度计算错误，请联系客服");
		}
		if (mddjd == null || "".equals(mddjd)) {
			throw new AppException("目的地经度计算错误，请联系客服");
		}
		if (mddwd == null || "".equals(mddwd)) {
			throw new AppException("目的地纬度计算错误，请联系客服");
		}
		if (ygjl == null) {
			throw new AppException("预估距离失败，请联系客服");
		}
		if (yghs == null) {
			throw new AppException("预估耗时失败，请联系客服");
		}
		// 根据预约时间字符串设置预约时间(预约时间需要特殊处理)
		yysj = this.getYysj(yysjStr);
		ddsj = DsDateUtil.addMinute(yysj, yghs.intValue());
		searchQueryModel.setYysj(yysj);
		searchQueryModel.setDdsj(ddsj);
		// 设置节日
		this.setHoliday(searchQueryModel, (HashMap<String, String>) this
				.getObjectFromContext(request, SearchSessionNames.holiday));
		// 查询（估算代驾费用并返回估算结果）
		SearchResultsModel searchResultModel = searchService
				.searchForPersonDrive(searchQueryModel,
						this.getUserForBusiness(request));
		if (searchResultModel == null) {
			throw new BusinessException("没有代驾费用信息");
		}
		searchBatchModel = searchResultModel.getSearchBatchModel();
		searchRecordModel = searchResultModel.getSearchRecordModel();
		searchResultModels = searchResultModel.getSearchResultModels();

		sspcId = searchBatchModel.getSspcid();
		ssjlId = searchRecordModel.getSsjlid();

		map.put("sspcId", sspcId);
		map.put("ssjlId", ssjlId);
		map.put("searchOrderResultModels", searchResultModels);
		map.put("ygms", request.getParameter("ygms"));
		map.put("yysj",
				DsDateUtil.dateToString(searchQueryModel.getYysj(), "HH:mm"));
		map.put("ddsj",
				DsDateUtil.dateToString(searchQueryModel.getDdsj(), "HH:mm"));
		map.put("cfsjms", request.getParameter("cfsjms"));
		return "/searchResult";
	}

	private void setHoliday(SearchQueryModel searchQueryModel,
			HashMap<String, String> holidayMap) throws BaseException {
		if (searchQueryModel == null) {
			return;
		}

		searchQueryModel.setIsHoliday(false);

		if (holidayMap == null || holidayMap.isEmpty()) {
			return;
		}
		Date yysj = searchQueryModel.getYysj();
		Date ddsj = searchQueryModel.getDdsj();
		String yysjStr = DateUtil.dateToString(yysj);
		String ddsjStr = DateUtil.dateToString(ddsj);
		if (holidayMap.containsKey(yysjStr)) {
			searchQueryModel.setIsHoliday(true);
			searchQueryModel.setHolidayName(holidayMap.get(yysjStr));
			return;
		} else if (holidayMap.containsKey(ddsjStr)) {
			searchQueryModel.setIsHoliday(true);
			searchQueryModel.setHolidayName(holidayMap.get(ddsjStr));
			return;
		}
	}

	private Date getYysj(String yysjStr) {
		Date yysj = DsDateUtil.setTime(yysjStr);
		return yysj;
	}

	@RequestMapping("/detailView")
	// @ResponseBody
	public String detailView(ModelMap map, HttpServletRequest request)
			throws BaseException {
		String gsid = request.getParameter("gsid");
		String ssjlid = request.getParameter("ssjlid");
		List<SearchResDetailModel> searchResDetailModels = searchService
				.querySearchResDetailModels(ssjlid, gsid);
		map.put("searchResDetailModels", searchResDetailModels);
		return "/modal/detailModal";
	}
}