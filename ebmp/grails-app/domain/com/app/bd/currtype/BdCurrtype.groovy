package com.app.bd.currtype

class BdCurrtype {
	Date lastUpdated //
	Date dateCreated
	
	String id
	Integer currbusidigit  //业务系统精度
	Integer currdigit //财务系统精度
	String currtypecode  //币种编码
	String currtypename //币种名称
	String currtypesign  //币种币符

    String sourceId

    static constraints = {
		currtypecode(size:0..10,unique:true)
		currtypename(size:0..40,unique:true)
		currtypesign(size:0..10)
    }
	
	static mapping = {
		cache true
	}

    def getCode(){
        currtypecode
    }
    def getName(){
        currtypename
    }

    def defaultPart(){
        [id:id,code:currtypecode,currtypecode:currtypecode,name:currtypename,currtypename:currtypename]
    }
}
