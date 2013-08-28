package com.app.pub.change

import com.app.pub.billtype.PubBilltype

class PubChangescript {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    PubBilltype changeFrom
    PubBilltype changeTo
    String path//路径
    static constraints = {
    }
}
