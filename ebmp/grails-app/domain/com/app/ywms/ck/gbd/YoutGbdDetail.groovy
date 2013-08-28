package com.app.ywms.ck.gbd

import com.app.pub.billtype.PubBilltype
import com.app.ywms.bd.tank.YBdTank

class YoutGbdDetail {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    YBdTank gh//
    BigDecimal bcsy=0 //通知单数量
    BigDecimal outnum=0 //出库数量
    String bz //备注


    //子表字段

    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型

    static belongsTo = [head:YoutGbd]

    static constraints = {
    }

    def defaultPart() {
        [id: id]
    }
}
