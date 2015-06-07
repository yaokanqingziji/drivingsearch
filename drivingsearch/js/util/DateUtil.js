var DateUtil = {
	// 将日期格式转换成字符串 yyyy-mm-dd HH:mi
	toString : function(date) {

		if (date == null) {
			return;
		}
		var dateStr;
		var yearStr = date.getFullYear();
		var monthStr = date.getMonth() + 1;
		var dayStr = date.getDate();
		var hourStr = date.getHours();
		var minuteStr = date.getMinutes();

		yearStr = DateUtil.leftFillZero(yearStr);
		monthStr = DateUtil.leftFillZero(monthStr);
		dayStr = DateUtil.leftFillZero(dayStr);
		hourStr = DateUtil.leftFillZero(hourStr);
		minuteStr = DateUtil.leftFillZero(minuteStr);

		dateStr = yearStr + "-" + monthStr + "-" + dayStr + " " + hourStr
				+ ":" + minuteStr;
		return dateStr;
	},
	// 将yyyy-mm-dd HH：mi格式的日期字符串转换为日期
	toDate : function(dateStr) {
		if (dateStr == null || dateStr == "") {
			return null;
		}
		var date = new Date();
		date.setFullYear(dateStr.substr(0, 4), dateStr.substr(5, 2), dateStr
				.substr(8, 2));
		date.setMonth(date.getMonth() - 1);
		date.setHours(dateStr.substr(11, 2), dateStr.substr(14, 2), 0, 0);
		return date;
	},
	// 暂留此处
	leftFillZero : function(str) {
		if (str == null) {
			return str;
		}
		str = str + "";
		if (str.length < 2) {
			str = "0" + str;
		}
		return str;
	}
};
