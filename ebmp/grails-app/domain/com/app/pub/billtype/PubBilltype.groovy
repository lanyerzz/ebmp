package com.app.pub.billtype
//单据类型
class PubBilltype {
    Date dateCreated //创建日期
    Date lastUpdated //最后修改日期

    String id
    String billtypecode//单据类型编码
    String billtypename//单据类型名称

    static constraints = {
        billtypecode(unique:true,nullable:true)
        billtypename(unique:true,nullable:true)
    }

    static mapping = {
        cache true
    }

    def defaultPart(){
        [id:id,billtypecode:billtypecode,billtypename:billtypename]
    }
}
