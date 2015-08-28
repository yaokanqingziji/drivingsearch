package com.external.weixin.savemessage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.external.weixin.savemessage.bpo.MessageBpo;
import com.external.weixin.savemessage.domain.MessageDomain;
import com.external.weixin.savemessage.service.MessageService;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseService;

@Service("com.external.weixin.savemessage.service.impl.MessageServiceImpl")
public class MessageServiceImpl extends SearchBaseService implements MessageService {

	@Autowired
	private MessageBpo savemessageBpo;

	@Override
	public String saveMessage(MessageDomain savemessageDomain) throws BaseException {

		return savemessageBpo.saveMessage(savemessageDomain);
	}

}
