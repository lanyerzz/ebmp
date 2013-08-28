package com.app.pub.businesstype

import com.app.pub.billtype.PubBilltype

class PubBusinessBill {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期


    PubBilltype billtype
    PubBilltype sourceType
    Boolean canDefine
    Integer flowType//0:拉式  1：推式

    static belongsTo = [head:PubBusinessType]
    static constraints = {
    }


}
