package com.core.user.service;

import com.core.user.model.UserForBusinessModel;
import com.ldw.frame.base.BaseException;


public interface UserService {
	
	public UserForBusinessModel getBusinessUser(String uid) throws BaseException;
}