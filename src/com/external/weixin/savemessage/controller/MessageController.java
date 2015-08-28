package com.external.weixin.savemessage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.external.weixin.savemessage.domain.MessageDomain;
import com.external.weixin.savemessage.service.MessageService;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseController;

@Controller
@RequestMapping("/message")
public class MessageController extends SearchBaseController {
	@Autowired
	private MessageService savemessageService;

	@RequestMapping("/saveMessage")
	@ResponseBody
	public String saveMessage(MessageDomain savemessageDomain) throws BaseException {
		savemessageService.saveMessage(savemessageDomain);
		return "ok";
	}
}