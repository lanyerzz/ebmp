package com.app.ywms.rk.xhjhd



import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.bd.tank.YBdTank

class YxhjhdbBGh {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    YBdTank gh //计划数量
    BigDecimal jhsl//计划数量

    static belongsTo = [head:YxhjhdB]

    static constraints = {
    }

    def defaultPart() {
        [id: id]
    }
}
