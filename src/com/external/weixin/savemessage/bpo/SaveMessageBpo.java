package com.external.weixin.savemessage.bpo;

import com.external.weixin.savemessage.domain.SaveMessageDomain;
import com.ldw.frame.base.BaseException;

public interface SaveMessageBpo {
	public String saveMessage(SaveMessageDomain savemessage) throws BaseException;
}
