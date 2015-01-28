package com.search.logon.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseService;
import com.search.logon.bpo.LogonBpo;
import com.search.logon.model.LogonUser;
import com.search.logon.service.LogonService;
@Service("com.search.logon.service.impl.LogonServiceImpl")
public class LogonServiceImpl extends SearchBaseService implements LogonService {
 
	@Autowired
	private LogonBpo logonBpo;

	/**
	 * 根据用户名和密码获取登录用户信息
	 * @return  LogonUser
	 * @see com.ldw.frame.common.user.LogonUser
	 */
	public LogonUser getUserByNoPwd(String userNo, String pwd)
			throws BaseException {
		return this.logonBpo.getUserByNoPwd(userNo, pwd);
	}

}