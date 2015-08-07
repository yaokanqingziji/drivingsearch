package com.core.billversion.service;

import java.util.HashMap;
import java.util.List;

import com.core.billversion.model.BillVersionResultModel;
import com.ldw.frame.base.BaseException;

public interface CompanyBillVersionService {

	public HashMap<String, BillVersionResultModel> queryBillVersionMap() throws BaseException;
	
	public List<BillVersionResultModel> queryBillVersionResultModels() throws BaseException;

}