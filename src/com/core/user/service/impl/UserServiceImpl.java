package com.core.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.user.bpo.UserBpo;
import com.core.user.bpo.UserLoginBpo;
import com.core.user.domain.UserInfoDomain;
import com.core.user.domain.UserLoginDomain;
import com.core.user.model.UserForBusinessModel;
import com.core.user.model.UserQueryModel;
import com.core.user.model.UserResultModel;
import com.core.user.service.UserService;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseService;

@Service("com.core.user.service.impl.UserServiceImpl")
public class UserServiceImpl extends SearchBaseService implements UserService {

	@Autowired
	private UserBpo userBpo;

	@Autowired
	private UserLoginBpo userLoginBpo;

	@Override
	public UserForBusinessModel getBusinessUser(String uid)
			throws BaseException {
		List<UserResultModel> userList;
		UserInfoDomain userInfoDomain;
		String userid;
		UserForBusinessModel userForBusinessModel;
		UserResultModel userResultModel;
		UserLoginDomain userLoginDomain;
		// 根据uid获取用户信息
		UserQueryModel userQueryModel = new UserQueryModel();
		userQueryModel.setUid(uid);
		userList = userBpo.queryUser(userQueryModel);
		// 如果未获取到，那么先进行新增。
		if (userList == null || userList.size() <= 0) {
			userInfoDomain = new UserInfoDomain();
			userInfoDomain.setUid(uid);
			userid = userBpo.addUser(userInfoDomain);
		} else {
			userResultModel = userList.get(0);
			userid = userResultModel.getUserid();
		}

		userForBusinessModel = new UserForBusinessModel();
		userForBusinessModel.setUserId(userid);
		// 保存用户登录信息
		userLoginDomain = new UserLoginDomain();
		userLoginDomain.setUserid(userid);
		userLoginBpo.addUserLogin(userLoginDomain);
		// 返回
		return userForBusinessModel;
	}

}