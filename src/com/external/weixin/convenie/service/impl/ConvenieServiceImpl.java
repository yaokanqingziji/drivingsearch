package com.external.weixin.convenie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.convenie.bpo.KcInfoBpo;
import com.core.convenie.bpo.KcLogBpo;
import com.core.convenie.domain.KcLogDomain;
import com.core.convenie.model.KcInfoQueryModel;
import com.core.convenie.model.KcInfoResultModel;
import com.external.weixin.convenie.service.ConvenieService;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseService;

@Service("com.external.weixin.convenie.service.impl.ConvenieServiceImpl")
public class ConvenieServiceImpl extends SearchBaseService implements
		ConvenieService {

	@Autowired
	private KcInfoBpo kcInfoBpo;

	@Autowired
	private KcLogBpo kcLogBpo;

	@Override
	public List<KcInfoResultModel> queryKcInfo(KcInfoQueryModel kcInfoQueryModel)
			throws BaseException {
		return kcInfoBpo.queryKcInfo(kcInfoQueryModel);
	}

	@Override
	public void addKcLog(KcLogDomain kcLogDomain) throws BaseException {
		kcLogBpo.addKcLog(kcLogDomain);
	}

}