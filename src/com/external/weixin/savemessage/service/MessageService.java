package com.external.weixin.savemessage.service;

import com.external.weixin.savemessage.domain.MessageDomain;
import com.ldw.frame.base.BaseException;

public interface MessageService {

 public String saveMessage(MessageDomain savemessageDomain) throws BaseException;
}