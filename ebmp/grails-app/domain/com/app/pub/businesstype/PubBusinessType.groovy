package com.app.pub.businesstype

import com.app.bd.corp.BdCorp

class PubBusinessType {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    String code
    String name
    BdCorp bdCorp
    static hasMany = [bills:PubBusinessBill]
    static constraints = {

    }

    def defaultPart(){
        [id:id,code:code,name:name]
    }
}
