package com.app.exception;

import java.util.List;
import java.util.Locale;

public class BusinessException extends Exception{
    private String code;
    private List params;

    public List getParams() {
        return params;
    }

    public void setParams(List params) {
        this.params = params;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDefaultMessage() {
        return defaultMessage;
    }

    public void setDefaultMessage(String defaultMessage) {
        this.defaultMessage = defaultMessage;
    }

    public Locale getLocale() {
        return locale;
    }

    public void setLocale(Locale locale) {
        this.locale = locale;
    }

    private String defaultMessage;
    private Locale locale;
    public BusinessException(String code,List params) {
        super(code);
        this.code=code;

        this.params=params;

    }

    public BusinessException(String code,List params,String defaultMessage) {
        super(defaultMessage);
        this.code=code;
        this.defaultMessage=defaultMessage;
        this.params=params;

    }

    public BusinessException(String code,String defaultMessage) {
        super(defaultMessage);
        this.code=code;
        this.defaultMessage=defaultMessage;

    }

    public BusinessException(String code,String defaultMessage,Locale locale) {
        super(defaultMessage);
        this.code=code;
        this.defaultMessage=defaultMessage;
        this.locale=locale;
    }
	public BusinessException(String defaultMessage){

		super(defaultMessage);
        this.defaultMessage=defaultMessage;
	}



}
