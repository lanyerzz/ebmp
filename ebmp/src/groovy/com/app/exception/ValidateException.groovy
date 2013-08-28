package com.app.exception

import grails.converters.JSON

/**
 * Created with IntelliJ IDEA.
 * User: lanyer
 * Date: 13-4-24
 * Time: 下午7:00
 * To change this template use File | Settings | File Templates.
 */
class ValidateException  extends Exception{
    def  domain ;




    public ValidateException(){
        super();
    }
    public ValidateException( domain){

        super("数据校验失败！");
        this.domain=domain;
    }
}
