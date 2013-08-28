package com.app.ywms.kc



import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class YonhandnumLock {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    BigDecimal lockNum=0
    String vnote

    static belongsTo = [handnum:Yonhandnum]


    //子表字段

    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型

    static constraints = {
    }

    def defaultPart() {
        [id: id]
    }
}
