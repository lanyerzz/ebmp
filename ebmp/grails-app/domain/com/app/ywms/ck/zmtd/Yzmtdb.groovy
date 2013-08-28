

package com.app.ywms.ck.zmtd

import com.app.pub.billtype.PubBilltype

import com.app.ywms.kc.Ycrkmx

class Yzmtdb {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期




    Ycrkmx rk

    BigDecimal bcky=0  //本次可用
    BigDecimal bcsy=0 //本次使用
    BigDecimal hxsl=0 //已经出库的数量

    String vnote



    //子表字段

    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型

    static belongsTo = [head:Yzmtdh]
    static constraints = {
        rk nullable: false
    }
}
