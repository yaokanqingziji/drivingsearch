package com.core.billversion.bpo;

import java.util.List;

import com.core.billversion.model.BillVersionResultModel;
import com.ldw.frame.base.BaseException;


public interface CompanyBillVersionBpo {

	public List<BillVersionResultModel> queryBillVersionResultModels() throws BaseException;
}
