package com.eGSTbill.util;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class GetAutoDate {

	public static String getDate1() {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		 String regDate = dateFormat.format(cal.getTime());
		return regDate;
	}
}
