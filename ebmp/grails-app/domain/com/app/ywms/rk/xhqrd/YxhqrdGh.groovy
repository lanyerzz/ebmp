package com.app.ywms.rk.xhqrd



import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.bd.tank.YBdTank

class YxhqrdGh {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    YBdTank bdTank

    BigDecimal sjsl//商检数量
    BigDecimal gjsl //罐检数量
    BigDecimal cjsl//船检数量
    String vnote
    static  belongsTo = [head:Yxhqrd]

    static constraints = {
        bdTank nullable: false
    }

    def defaultPart() {
        [id: id]
    }
}
