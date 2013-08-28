package com.app.dto

class TDTO {
	public static int STATUS_FAILURE = -1;
//	public static int STATUS_FAILURE = -1;
//	public static int STATUS_FAILURE = -1;
//	public static int STATUS_FAILURE = -1;
	public static int STATUS_LOGIN_INCORRECT = -5;
	public static int STATUS_LOGIN_REQUIRED = -7;
	public static int STATUS_LOGIN_SUCCESS = -8;
	public static int STATUS_MAX_LOGIN_ATTEMPTS_EXCEEDED = -6;
	public static int STATUS_SERVER_TIMEOUT = -100;
	public static int STATUS_SUCCESS = 0;
	public static int STATUS_TRANSPORT_ERROR = -90;
	public static int STATUS_VALIDATION_ERROR = -4;
	
	def sessionid
	def data;
	def errors;
	int status=0;//错误编码
    def response=[status:0,startRow:0,endRow:0,totalRows:0]
}
