package com.core.convenie.bpo.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.core.base.SearchBaseBpo;
import com.core.convenie.bpo.KcInfoBpo;
import com.core.convenie.model.KcInfoQueryModel;
import com.core.convenie.model.KcInfoResultModel;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;
import com.ldw.frame.common.global.CodeNames;

@Component("com.core.convenie.bpo.impl.KcInfoBpoImpl")
public class KcInfoBpoImpl extends SearchBaseBpo implements KcInfoBpo {

	@Override
	public List<KcInfoResultModel> queryKcInfo(KcInfoQueryModel kcInfoQueryModel)
			throws BaseException {
		List<KcInfoResultModel> infoList;
		StringBuilder sb = new StringBuilder();
		SQLExecutor sql = this.getSession().getSQLExecutor();
		String dbType = globalName.getDbType();

		sb.append(" select * from k_c_info k  ");
		sb.append(" where 1=1 ");
		if (CodeNames.DBType.mysql.equals(dbType)) {
			sb.append("    and IFNULL(k.qsrq, now()) <= now() ");
			sb.append("    and IFNULL(k.zzrq, now()) >= now() ");
		} else if (CodeNames.DBType.oracle.equals(dbType)) {
			sb.append("    and nvl(k.qsrq, sysdate) <= sysdate ");
			sb.append("    and nvl(k.zzrq, sysdate) >= sysdate ");
		}
		sb.append(" order by k.djlx ");

		sql.setSQL(sb);
		infoList = sql.executeQueryBeanList(KcInfoResultModel.class);

		return infoList;
	}

}
