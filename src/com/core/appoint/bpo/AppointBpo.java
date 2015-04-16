package com.core.appoint.bpo;

import com.core.appoint.domain.AppointDomain;
import com.ldw.frame.base.BaseException;

public interface AppointBpo {

	public void addAppointBpo(AppointDomain appointDomain) throws BaseException;
}
