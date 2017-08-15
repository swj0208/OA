package com.yc.utils;

public class DatetimeFormat {
	
	//将08/23/2017 16:28:08格式转化为2017-08-23 16:28:08
	public String datetimeformat(String time) {
		// 08/23/2017 16:28:08
		String[] times = time.split(" ");
		// times[0]=08/23/2017 times[1]=16:28:08
		String date = times[0];
		String[] dates = date.split("/");
		// dates[0]=08 dates[1]=23 dates[2]=2017
		time = dates[2] + "-" + dates[0] + "-" + dates[1] + " " + times[1];
		// 2017-08-23 16:28:08
		return time;
	}
}
