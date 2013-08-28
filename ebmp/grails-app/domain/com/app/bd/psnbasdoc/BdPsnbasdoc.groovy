package com.app.bd.psnbasdoc

import com.app.bd.corp.BdCorp
import com.app.bd.psndoc.BdPsndoc

class BdPsnbasdoc {

    String id
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期

    String addr  //家庭地址
    Date  birthdate //出生日期
    String  email  //电子邮件
    String  homephone //家庭电话
    String  shenfenzhenghao  //身份证号
    Date  joinworkdate //参加工作日期
    String  mobile  //手机
    String  officephone //办公电话
    BdCorp  bdCorp  //归属公司 char
    String  postalcode  //邮政编码
    String  name //姓名
    String  sex  //性别
    String  ssnum //社会保障号
    String  usedname //曾用名

    static belongsTo = [psn:BdPsndoc]
    static constraints = {
        name(nullable: false,blank:false)
        sex(nullable: false,blank:false)
        birthdate(nullable: false,blank:false)
        shenfenzhenghao(nullable: false,blank:false,unique: true)
    }
    static mapping = {
        birthdate(sqlType: 'date')
        joinworkdate(sqlType: 'date')
    }
}
