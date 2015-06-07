package com.core.base.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DsDateUtil {

	public static Date getCurrDate() {
		return new Date();
	}

	public static Date addDay(Date date, int days) {
		if (date == null) {
			return null;
		}
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DATE, days);

		return c.getTime();
	}
	
	public static Date addMinute(Date date,int minutes){
		if (date == null) {
			return null;
		}
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MINUTE, minutes);

		return c.getTime();
	}

	public static Date setTime(String timeStr) {
		if (timeStr == null || "".equals(timeStr)) {
			return null;
		}
		String[] tempYysj = timeStr.split(":");
		Calendar c = Calendar.getInstance();

		c.set(Calendar.HOUR_OF_DAY, Integer.valueOf(tempYysj[0]));
		c.set(Calendar.MINUTE, Integer.valueOf(tempYysj[1]));

		return c.getTime();
	}
	
	public static Date setTime(Date date,String timeStr) {
		if (timeStr == null || "".equals(timeStr)) {
			return null;
		}
		if(date == null){
			return null;
		}
		String[] tempYysj = timeStr.split(":");
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, Integer.valueOf(tempYysj[0]));
		c.set(Calendar.MINUTE, Integer.valueOf(tempYysj[1]));

		return c.getTime();
	}

	/**
	 * @Description:
	 * @param firTime
	 * @param secTime
	 * @return
	 * @return int 1 : first>sec 0:first=sec -1:first<sec
	 * @author ldw
	 * @date 2015年4月12日 下午8:40:48
	 */
	public static int compareTime(String firstTime, String secTime) {
		Date firstDate = DsDateUtil.setTime(firstTime);
		Date secDate = DsDateUtil.setTime(secTime);
		return firstDate.compareTo(secDate);
	}

	public static boolean betweenTime(String time, String qssj, String zzsj) {
		if (DsDateUtil.compareTime(time, qssj) < 0) {
			return false;
		}
		if (DsDateUtil.compareTime(time, zzsj) > 0) {
			return false;
		}
		return true;
	}
	
	//format yyyyMMddHHmmss
	public static String dateToString(Date date, String format)
			 {
		if (date == null) {
			return null;
		}
		if (format == null || format.equalsIgnoreCase("")) {
			return null;
		}

		SimpleDateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}

}
