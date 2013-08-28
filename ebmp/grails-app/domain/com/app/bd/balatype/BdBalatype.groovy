package com.app.bd.balatype

import com.app.bd.corp.BdCorp




class BdBalatype {

    String id
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期


    String code//结算方式编号
    String name//结算方式名称
    //Boolean defaultflag//是否默认
    Boolean sealflag//封存标志
    //Boolean netbankflag//是否网上结算
    BdCorp bdCorp


    static constraints = {
        code nullable: false,unique: true
        name nullable: false,unique: true
    }

    def defaultPart(){
        [id:id,code:code,name:name]
    }
}
