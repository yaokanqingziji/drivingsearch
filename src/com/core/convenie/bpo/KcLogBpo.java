package com.core.convenie.bpo;

import com.core.convenie.domain.KcLogDomain;
import com.ldw.frame.base.BaseException;

public interface KcLogBpo {

	public void addKcLog(KcLogDomain kcLogDomain) throws BaseException;

}
