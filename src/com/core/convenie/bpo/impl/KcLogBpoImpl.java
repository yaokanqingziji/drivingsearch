package com.core.convenie.bpo.impl;

import org.springframework.stereotype.Component;

import com.core.base.SearchBaseBpo;
import com.core.convenie.bpo.KcLogBpo;
import com.core.convenie.domain.KcLogDomain;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;
import com.ldw.frame.common.global.CodeNames;

@Component("com.core.convenie.bpo.impl.KcLogBpoImpl")
public class KcLogBpoImpl extends SearchBaseBpo implements KcLogBpo {

	@Override
	public void addKcLog(KcLogDomain kcLogDomain)
			throws BaseException {

		SQLExecutor sql = this.getSession().getSQLExecutor();
		StringBuilder sb = new StringBuilder();
		String dbType = globalName.getDbType();

		sb.append(" insert into k_c_log(uid,yysj,kcid,gsid) ");
		if (CodeNames.DBType.oracle.equals(dbType)) {
			sb.append(" values(:uid,sysdate,:kcid,:gsid) ");
		} else if (CodeNames.DBType.mysql.equals(dbType)) {
			sb.append(" values(:uid,now(),:kcid,:gsid) ");
		}

		sql.setSQL(sb);
		sql.setBeans(kcLogDomain);
		sql.executeUpdate();
	}

}
