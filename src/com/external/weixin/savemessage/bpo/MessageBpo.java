package com.external.weixin.savemessage.bpo;

import com.external.weixin.savemessage.domain.MessageDomain;
import com.ldw.frame.base.BaseException;

public interface MessageBpo {
	public String saveMessage(MessageDomain savemessage) throws BaseException;
}
