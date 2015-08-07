package com.core.holiday.service;

import java.util.HashMap;

import com.ldw.frame.common.exception.AppException;

public interface HolidayService {

	public HashMap<String, String> loadHoliday() throws AppException;

}