package com.external.weixin.scene.bpo.impl;

import org.springframework.stereotype.Component;

import com.core.base.SearchBaseBpo;
import com.external.weixin.scene.bpo.SceneBpo;
import com.external.weixin.scene.domain.SceneDomain;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;

@Component("com.external.weixin.scene.bpo.impl.SceneBpoImpl")
public class SceneBpoImpl extends SearchBaseBpo implements SceneBpo {


	@Override
	public String addScene(SceneDomain sceneDomain) throws BaseException {
		String qdid;
		if(sceneDomain == null){
			return null;
		}
		qdid = dBUtil.generateSysId("SEQ_DS", "WS");
		sceneDomain.setQdid(qdid);
		
		SQLExecutor sql = this.getSession().getSQLExecutor();
		StringBuilder sb = new StringBuilder();
		
		sb.append(" insert into w_scene(qdid,scene,year,month,day)");
		sb.append(" values(:qdid,:scene,:year,:month,:day)");
		
		sql.setSQL(sb);
		sql.setBeans(sceneDomain);
		sql.executeUpdate();
		
		return qdid;
	}

}
