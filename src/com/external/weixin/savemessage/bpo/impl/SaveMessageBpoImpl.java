package com.external.weixin.savemessage.bpo.impl;

import org.springframework.stereotype.Component;

import com.core.base.SearchBaseBpo;
import com.external.weixin.savemessage.bpo.SaveMessageBpo;
import com.external.weixin.savemessage.domain.SaveMessageDomain;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;

@Component("com.external.weixin.savemessage.bpo.impl.SaveMessageBpoImpl")
public class SaveMessageBpoImpl extends SearchBaseBpo implements SaveMessageBpo {


	@Override
	public String saveMessage(SaveMessageDomain savemessageDomain) throws BaseException {
		String zjid;
		if(savemessageDomain == null){
			return null;
		}
		zjid = dBUtil.generateSysId("SEQ_MS", "WS");
		savemessageDomain.setZjid(zjid);
		
		SQLExecutor sql = this.getSession().getSQLExecutor();
		StringBuilder sb = new StringBuilder();
		
		sb.append(" insert into w_message(zjid,wxid,message,time)");
		sb.append(" values(:zjid,:wxid,:message,:time)");
		
		sql.setSQL(sb);
		sql.setBeans(savemessageDomain);
		sql.executeUpdate();
		
		return zjid;
	}

}
