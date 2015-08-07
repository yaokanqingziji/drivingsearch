package com.core.billversion.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.billversion.bpo.CompanyBillVersionBpo;
import com.core.billversion.model.BillVersionResultModel;
import com.core.billversion.service.CompanyBillVersionService;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseService;

@Service("com.core.billversion.service.impl.CompanyBillVersionServiceImpl")
public class CompanyBillVersionServiceImpl extends SearchBaseService implements
		CompanyBillVersionService {

	@Autowired
	private CompanyBillVersionBpo companyBillVersionBpo;

	@Override
	public HashMap<String, BillVersionResultModel> queryBillVersionMap()
			throws BaseException {
		List<BillVersionResultModel> billVersionResultModels = this
				.queryBillVersionResultModels();
		HashMap<String, BillVersionResultModel> resMap;
		if (billVersionResultModels == null
				|| billVersionResultModels.size() <= 0) {
			return null;
		}
		resMap = new HashMap<String, BillVersionResultModel>();
		for (BillVersionResultModel tempModel : billVersionResultModels) {
			resMap.put(tempModel.getJfbbid(), tempModel);
		}
		return resMap;
	}

	@Override
	public List<BillVersionResultModel> queryBillVersionResultModels()
			throws BaseException {
		return companyBillVersionBpo.queryBillVersionResultModels();
	}
}
