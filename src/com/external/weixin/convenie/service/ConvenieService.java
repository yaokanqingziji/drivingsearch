package com.external.weixin.convenie.service;

import java.util.List;

import com.core.convenie.domain.KcLogDomain;
import com.core.convenie.model.KcInfoQueryModel;
import com.core.convenie.model.KcInfoResultModel;
import com.ldw.frame.base.BaseException;

public interface ConvenieService {

	public List<KcInfoResultModel> queryKcInfo(KcInfoQueryModel kcInfoQueryModel)
			throws BaseException;

	public void addKcLog(KcLogDomain kcLogDomain) throws BaseException;
}