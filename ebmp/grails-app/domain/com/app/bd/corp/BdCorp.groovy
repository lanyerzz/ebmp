package com.app.bd.corp

import com.app.bd.currtype.BdCurrtype

class BdCorp{
	Date lastUpdated	//最后修改日期
	Date dateCreated	//创建日期
	String id
	String unitCode
	String unitName
	Date begindate//业务开始日期
	String briefintro //简介
	Date enddate //业务终止日期
	String fathercorp ='0' //上级公司主键
	String fax1 //传真1
	String fax2 //传真2
	String foreignname //外文名称
	Boolean ishasaccount=false  //是否已建帐
	Boolean isseal =false//是否封存
	String memo //备注 
	String phone1 //电话1
	String phone2 //电话2
	String phone3 //电话3
	BdCurrtype currencyType  //货币种类主键
	String unitshortname //公司简称 
	String url  //Web网址 
	String zipCode //邮政编码
    static constraints = {
		unitCode(size:0..40,unique:true)
		url(size:0..100,url: true )
		unitName(size:0..50,unique:true)
		url(url: true )
//		begindate(sqlType:'date')
//		enddate(sqlType:'date')
    }
	static mapping = {
		cache true
	}

    def defaultPart(){
        [id:id,code:unitCode,name:unitName,unitCode:unitCode,unitName:unitName]
    }
}
