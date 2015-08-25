package com.external.weixin.savemessage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.external.weixin.savemessage.domain.SaveMessageDomain;
import com.external.weixin.savemessage.service.SaveMessageService;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseController;

@Controller
@RequestMapping("/savemessage")
public class SaveMessageController extends SearchBaseController {
	@Autowired
	private SaveMessageService savemessageService;

	@RequestMapping("/saveMessage")
	@ResponseBody
	public String saveMessage(SaveMessageDomain savemessageDomain) throws BaseException {
		savemessageService.saveMessage(savemessageDomain);
		return "ok";
	}
}