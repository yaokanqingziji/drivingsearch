package com.core.holiday.bpo.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.core.base.SearchBaseBpo;
import com.core.holiday.bpo.HolidayBpo;
import com.core.holiday.model.HolidayResultModel;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;

@Component("com.core.holiday.bpo.impl.HolidayBpoImpl")
public class HolidayBpoImpl extends SearchBaseBpo implements HolidayBpo {

	@Override
	public List<HolidayResultModel> getAllHoliday() throws BaseException {
		List<HolidayResultModel> holidayList;
		StringBuilder sb = new StringBuilder();
		SQLExecutor sql = this.getSession().getSQLExecutor();

		sb.append(" select rq,jrmc from b_holiday order by rq  ");

		sql.setSQL(sb);
		holidayList = sql.executeQueryBeanList(HolidayResultModel.class);

		return holidayList;
	}

}
