package com.app.oldPos;

import java.util.Date;



public class Calendar  {
private static String dateTimeFormat="yyyy-MM-dd";
private static String dateTimeFormat1="yyyy-MM-dd hh:mm:ss";
/**
 * yyyy-MM-dd
 */
public static java.text.SimpleDateFormat formatter_f = new java.text.SimpleDateFormat(dateTimeFormat);
/**
 * yyyy-MM-dd hh:mm:ss
 */
public static java.text.SimpleDateFormat formatter_f1 = new java.text.SimpleDateFormat(dateTimeFormat1);
//private static String dateTimeFormat="HH:mm:ss";
	public static String getDate(){
	return	formatter_f.format(java.util.Calendar.getInstance().getTime());
	}
	
	public static String getDateTime(){
		return	formatter_f.format(java.util.Calendar.getInstance().getTime());
		}
	
	/**
	 * 
	 * @return yyyy-MM-dd hh:mm:ss
	 */
	public static String getTime(){
		return formatter_f1.format(new Date(System.currentTimeMillis()));
	}
}
