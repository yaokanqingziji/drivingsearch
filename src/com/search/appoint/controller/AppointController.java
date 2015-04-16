package com.search.appoint.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.appoint.domain.AppointDomain;
import com.ldw.frame.base.BaseException;
import com.search.appoint.service.AppointService;
import com.search.base.SearchBaseController;

@Controller
@RequestMapping("/appoint")
public class AppointController extends SearchBaseController {

	@Autowired
	private AppointService appointService;

	@RequestMapping("/addAppoint")
	@ResponseBody
	public String addAppoint(ModelMap map, HttpServletRequest request,
			AppointDomain appointDomain) throws BaseException {
		appointDomain.setUserid(this.getUserForBusiness(request).getUserId());
		appointService.addAppointBpo(appointDomain);
		return "";
	}

}