package com.core.user.bpo;

import com.core.user.domain.UserLoginDomain;
import com.ldw.frame.base.BaseException;

public interface UserLoginBpo {

	public void addUserLogin(UserLoginDomain userLoginDomain)
			throws BaseException;

}
