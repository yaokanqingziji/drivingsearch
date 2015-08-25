package com.external.weixin.savemessage.service;

import com.external.weixin.savemessage.domain.SaveMessageDomain;
import com.ldw.frame.base.BaseException;

public interface SaveMessageService {

 public String saveMessage(SaveMessageDomain savemessageDomain) throws BaseException;
}