package com.core.company.bpo;

import com.core.company.model.CompanyBillModel;
import com.ldw.frame.base.BaseException;

public interface CompanyBillBpo {

	/**
	 * @Description: 根据代驾类型获取当前所有已注册的有效的代驾公司计费标准，为搜素估算提供费用计算标准
	 * @param djlx 代驾类型
	 * @return
	 * @throws BaseException
	 * @return CompanyBillModel
	 * @author ldw
	 * @date 2015年3月21日 下午11:33:46
	 */
	public CompanyBillModel getAllRegistCompanyBillByDjlx(String djlx)
			throws BaseException;
}
