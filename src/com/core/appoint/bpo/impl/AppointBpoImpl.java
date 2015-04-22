package com.core.appoint.bpo.impl;

import org.springframework.stereotype.Component;

import com.core.appoint.bpo.AppointBpo;
import com.core.appoint.domain.AppointDomain;
import com.core.base.SearchBaseBpo;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;
import com.ldw.frame.common.global.CodeNames;

@Component("com.core.appoint.bpo.impl.AppointBpoImpl")
public class AppointBpoImpl extends SearchBaseBpo implements AppointBpo {

	@Override
	public void addAppointBpo(AppointDomain appointDomain) throws BaseException {
		String yyjlid = dBUtil.generateSysId("SEQ_DS", "YA");
		appointDomain.setYyjlid(yyjlid);

		SQLExecutor sql = this.getSession().getSQLExecutor();
		StringBuilder sb = new StringBuilder();
		String dbType = globalName.getDbType();

		sb.append(" insert into y_appoint(yyjlid,gsid,userid,yyly,yylydx,yylxr,yylxrdh,czsj,djlx,bz)");
		if(CodeNames.DBType.oracle.equals(dbType)){
			sb.append(" values(:yyjlid,:gsid,:userid,:yyly,:yylydx,:yylxr,:yylxrdh,sysdate,:djlx,:bz)");
		}else if(CodeNames.DBType.mysql.equals(dbType)){
			sb.append(" values(:yyjlid,:gsid,:userid,:yyly,:yylydx,:yylxr,:yylxrdh,now(),:djlx,:bz)");
		}else{ //到时候再说。。。
			
		}
		
		sql.setSQL(sb);
		sql.setBeans(appointDomain);
		sql.executeUpdate();
	}

}
