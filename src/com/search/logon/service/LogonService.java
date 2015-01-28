package com.search.logon.service;

import com.ldw.frame.base.BaseException;
import com.search.logon.model.LogonUser;

public interface LogonService {
	public LogonUser getUserByNoPwd(String userNo, String pwd)
			throws BaseException;
}