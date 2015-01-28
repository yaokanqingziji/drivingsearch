package com.search.logon.bpo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.exception.BusinessException;
import com.search.base.SearchBaseBpo;
import com.search.entity.SysOrg;
import com.search.entity.SysUser;
import com.search.logon.model.LogonUser;
import com.search.sys.org.dao.SysOrgDao;
import com.search.sys.user.dao.SysUserDao;

@Component("com.search.logon.bpo.LogonBpo")
public class LogonBpo extends SearchBaseBpo {
	@Autowired
	private SysUserDao sysUserDao;

	@Autowired
	private SysOrgDao sysOrgDao;


	/*
	 * 登录检测
	 */
	public LogonUser getUserByNoPwd(String userNo, String pwd)
			throws BaseException {
		LogonUser logonUser;
		List<SysUser> userList;
		SysOrg sysorg;
		SysUser user;

		userList = this.sysUserDao.getUserByNoPwd(userNo, pwd);

		if (userList == null || userList.size() == 0) {
			throw new BusinessException("查询用户信息出错：用户编号[" + userNo + "]或者密码有错！");
		}
		if (userList.size() > 1) {
			throw new BusinessException("查询用户时出错:存在重复的用户编号[" + userNo + "]！");
		}
		user = userList.get(0);

		logonUser = new LogonUser();
		logonUser.setUserId(user.getUserid());
		logonUser.setUserNo(user.getUserno());
		logonUser.setUserName(user.getUsername());
		logonUser.setPassword(user.getPasswd());
		logonUser.setOrgnId(user.getOrgid());

		// 根据登录用户ID获取机构信息
		if (logonUser.getOrgnId() != null) {
		    sysorg = this.sysOrgDao.getSysOrg(logonUser.getOrgnId());
			if (sysorg != null) {
                logonUser.setOrgnNo(sysorg.getOrgno());
                logonUser.setOrgnName(sysorg.getOrgname());
			}
		}
		return logonUser;
	}

}
