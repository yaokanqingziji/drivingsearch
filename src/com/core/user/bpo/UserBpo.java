package com.core.user.bpo;

import java.util.List;

import com.core.user.domain.UserInfoDomain;
import com.core.user.model.UserQueryModel;
import com.core.user.model.UserResultModel;
import com.ldw.frame.base.BaseException;


public interface UserBpo {
	public List<UserResultModel> queryUser(UserQueryModel userQueryModel) throws BaseException;
	
	public String addUser(UserInfoDomain userInfoDomain) throws BaseException;
	
	
}
