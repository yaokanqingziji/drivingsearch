package com.core.convenie.bpo;

import java.util.List;

import com.core.convenie.model.KcInfoQueryModel;
import com.core.convenie.model.KcInfoResultModel;
import com.ldw.frame.base.BaseException;


public interface KcInfoBpo {
	
	public List<KcInfoResultModel> queryKcInfo(KcInfoQueryModel kcInfoQueryModel) throws BaseException;
}
