package com.external.weixin.convenie.controller;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.convenie.domain.KcLogDomain;
import com.core.convenie.model.KcInfoQueryModel;
import com.core.convenie.model.KcInfoResultModel;
import com.external.weixin.convenie.service.ConvenieService;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseController;

@Controller
@RequestMapping("/convenie")
public class ConvenieController extends SearchBaseController {
	@Autowired
	private ConvenieService convenieService;

	@RequestMapping("/queryKcInfo")
	@ResponseBody
	public String queryKcInfo(KcInfoQueryModel kcInfoQueryModel)
			throws BaseException {
		JSONArray jsonArr;
		List<KcInfoResultModel> kcInfoList = convenieService
				.queryKcInfo(kcInfoQueryModel);
		if (kcInfoList == null || kcInfoList.size() <= 0) {
			return "";
		}
		jsonArr = new JSONArray();
		for (KcInfoResultModel kcInfo : kcInfoList) {
			jsonArr.add(JSONObject.fromObject(kcInfo));
		}
		return jsonArr.toString();
	}

	@RequestMapping("/addKcLog")
	@ResponseBody
	public String addKcLog(KcLogDomain kcLogDomain) throws BaseException {
		convenieService.addKcLog(kcLogDomain);
		return "ok";
	}
}