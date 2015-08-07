package com.core.holiday.bpo;

import java.util.List;

import com.core.holiday.model.HolidayResultModel;
import com.ldw.frame.base.BaseException;


public interface HolidayBpo {

	public List<HolidayResultModel> getAllHoliday() throws BaseException;
}
