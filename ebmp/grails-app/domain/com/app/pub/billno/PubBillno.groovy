package com.app.pub.billno

import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype

class PubBillno {

    Date dateCreated //创建日期
    Date lastUpdated //最后修改日期
    String id
    PubBilltype pubbilltype
    String billno
    BdCorp bdCorp
    Date currentNoDate
    static constraints = {
    }
    static mapping = {
        currentNoDate(sqlType:'date')
        sort "billno"
    }
}
