package com.viva.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String getSqlDate() {
		return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	}

	public static Date getJavaDate(String dateString) {
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	public static void main(String[] args) {
		System.out.println(getJavaDate("2019-05-13"));
	}
}