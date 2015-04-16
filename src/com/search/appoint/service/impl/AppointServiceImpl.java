package com.search.appoint.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.appoint.bpo.AppointBpo;
import com.core.appoint.domain.AppointDomain;
import com.ldw.frame.base.BaseException;
import com.search.appoint.service.AppointService;
import com.search.base.SearchBaseService;

@Service("com.search.appoint.service.impl.AppointServiceImpl")
public class AppointServiceImpl extends SearchBaseService implements
AppointService {

	@Autowired
	private AppointBpo appointBpo;

	@Override
	public void addAppointBpo(AppointDomain appointDomain) throws BaseException {
		appointBpo.addAppointBpo(appointDomain);
	}

}