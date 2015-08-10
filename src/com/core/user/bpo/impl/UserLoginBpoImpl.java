package com.core.user.bpo.impl;

import org.springframework.stereotype.Component;

import com.core.base.SearchBaseBpo;
import com.core.user.bpo.UserLoginBpo;
import com.core.user.domain.UserLoginDomain;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;
import com.ldw.frame.common.global.CodeNames;

@Component("com.core.user.bpo.impl.UserLoginBpoImpl")
public class UserLoginBpoImpl extends SearchBaseBpo implements UserLoginBpo {

	@Override
	public void addUserLogin(UserLoginDomain userLoginDomain)
			throws BaseException {

		SQLExecutor sql = this.getSession().getSQLExecutor();
		StringBuilder sb = new StringBuilder();
		String dbType = globalName.getDbType();

		sb.append(" insert into u_login(userid,dlsj,dlfs,bz) ");
		if (CodeNames.DBType.oracle.equals(dbType)) {
			sb.append(" values(:userid,sysdate,:dlfs,:bz) ");
		} else if (CodeNames.DBType.mysql.equals(dbType)) {
			sb.append(" values(:userid,now(),:dlfs,:bz) ");
		}

		sql.setSQL(sb);
		sql.setBeans(userLoginDomain);
		sql.executeUpdate();
	}

}
