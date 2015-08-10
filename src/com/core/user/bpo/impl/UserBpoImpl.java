package com.core.user.bpo.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.core.base.SearchBaseBpo;
import com.core.user.bpo.UserBpo;
import com.core.user.domain.UserInfoDomain;
import com.core.user.model.UserQueryModel;
import com.core.user.model.UserResultModel;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;

@Component("com.core.user.bpo.impl.UserBpoImpl")
public class UserBpoImpl extends SearchBaseBpo implements UserBpo {

	@Override
	public List<UserResultModel> queryUser(UserQueryModel userQueryModel)
			throws BaseException {
		List<UserResultModel> userList;
		StringBuilder sb = new StringBuilder();
		SQLExecutor sql = this.getSession().getSQLExecutor();

		String uid = null;
		if (userQueryModel != null) {
			uid = userQueryModel.getUid();
		}

		sb.append(" select * from u_info u  ");
		sb.append(" where 1=1 ");
		if (uid != null && !"".equals(uid)) {
			sb.append(" and u.uid = :uid ");
		}

		sql.setSQL(sb);
		if (uid != null && !"".equals(uid)) {
			sql.setString("uid", uid);
		}
		userList = sql.executeQueryBeanList(UserResultModel.class);

		return userList;
	}

	@Override
	public String addUser(UserInfoDomain userInfoDomain) throws BaseException {
		String userid = dBUtil.generateSysId("SEQ_DS", "UI");
		userInfoDomain.setUserid(userid);

		SQLExecutor sql = this.getSession().getSQLExecutor();
		StringBuilder sb = new StringBuilder();

		sb.append(" insert into u_info(userid,uid,xm,dhhm,yhbh,mm,yxbz,email,bz) ");
		sb.append(" values(:userid,:uid,:xm,:dhhm,:yhbh,:mm,'1',:email,:bz) ");

		sql.setSQL(sb);
		sql.setBeans(userInfoDomain);
		sql.executeUpdate();
		return userid;
	}

}
