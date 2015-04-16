package com.search.appoint.service;

import com.core.appoint.domain.AppointDomain;
import com.ldw.frame.base.BaseException;


public interface AppointService {
	
	public void addAppointBpo(AppointDomain appointDomain) throws BaseException;

}