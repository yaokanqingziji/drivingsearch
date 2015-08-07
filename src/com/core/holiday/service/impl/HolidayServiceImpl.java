package com.core.holiday.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.holiday.bpo.HolidayBpo;
import com.core.holiday.model.HolidayResultModel;
import com.core.holiday.service.HolidayService;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.exception.AppException;
import com.search.base.SearchBaseService;

@Service("com.core.holiday.service.impl.HolidayServiceImpl")
public class HolidayServiceImpl extends SearchBaseService implements HolidayService {
	@Autowired
	private HolidayBpo holidayBpo;

	@Override
	public HashMap<String, String> loadHoliday() throws AppException {
		List<HolidayResultModel> holidayList = null;
		try {
			 holidayList = holidayBpo.getAllHoliday();
		} catch (BaseException e) {
			// 抛出错误信息，终止服务启动
			System.out.println("【加载节日信息失败。。。】" + e.getMessage());
			throw new AppException(e.getMessage(), e);
		}
		HashMap<String, String> holidayMap = new HashMap<String, String>();
		if (holidayList == null || holidayList.size() <= 0) {
			return holidayMap;
		}
		for(HolidayResultModel tempHoliday : holidayList){
			if(tempHoliday == null){
				continue;
			}
			holidayMap.put(tempHoliday.getRq(), tempHoliday.getJrmc());
		}

		return holidayMap;
	}

}
