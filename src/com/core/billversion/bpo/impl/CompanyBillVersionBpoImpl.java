package com.core.billversion.bpo.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.core.base.SearchBaseBpo;
import com.core.billversion.bpo.CompanyBillVersionBpo;
import com.core.billversion.model.BillVersionResultModel;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;
import com.ldw.frame.common.global.CodeNames;

@Component("com.core.billversion.bpo.impl.CompanyBillVersionBpoImpl")
public class CompanyBillVersionBpoImpl extends SearchBaseBpo implements CompanyBillVersionBpo {

	@Override
	public List<BillVersionResultModel> queryBillVersionResultModels()
			throws BaseException {
		List<BillVersionResultModel> billVersionResultModels;
		StringBuilder sb = new StringBuilder();
		SQLExecutor sql = this.getSession().getSQLExecutor();
		String dbType = globalName.getDbType();
		
		sb.append(" select v.*                 ");
		sb.append("   from c_info      c,              ");
		sb.append("        c_regist    r,              ");
		sb.append("        c_b_version v              ");
		sb.append("  where c.gsid = r.gsid                ");
		if(CodeNames.DBType.mysql.equals(dbType)){
			sb.append("    and IFNULL(r.yxq, now()) >= now() ");
		}else if(CodeNames.DBType.oracle.equals(dbType)){
			sb.append("    and nvl(r.yxq, sysdate) >= sysdate ");
		}
		
		sb.append("    and r.zczt = '01'                  ");
		sb.append("    and r.djlx = '01'                  ");
		sb.append("    and r.jfbbid = v.jfbbid            ");
		sb.append(" order by r.gsid,v.jfbbid ");

		sql.setSQL(sb);
		billVersionResultModels = sql.executeQueryBeanList(BillVersionResultModel.class);

		return billVersionResultModels;
	}

}
