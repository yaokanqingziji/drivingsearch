package com.external.weixin.savemessage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.external.weixin.savemessage.bpo.SaveMessageBpo;
import com.external.weixin.savemessage.domain.SaveMessageDomain;
import com.external.weixin.savemessage.service.SaveMessageService;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseService;

@Service("com.external.weixin.scene.service.impl.SceneServiceImpl")
public class SaveMessageServiceImpl extends SearchBaseService implements SaveMessageService {

	@Autowired
	private SaveMessageBpo savemessageBpo;

	@Override
	public String saveMessage(SaveMessageDomain savemessageDomain) throws BaseException {

		return savemessageBpo.saveMessage(savemessageDomain);
	}

}
