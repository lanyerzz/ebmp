package com.app.ywms.settle.feetype



import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class YwmsFeeType {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
   String pid
   String code
   String name



    static constraints = {
        code nullable: false ,unique: true
        name nullable: false
    }

    def defaultPart() {
        [id: id]
    }
}
