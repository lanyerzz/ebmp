package com.app.ywms.ck.fhtzd



import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.ck.zmtd.Yzmtdb

class Yfhtzdb {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    Yzmtdb td//提单
    BigDecimal max=0 //最大可用量
    BigDecimal bcsy=0 //本次使用
    BigDecimal outnum=0 //出库数量
    String bz //备注


    //子表字段

    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型

    static belongsTo = [head:Yfhtzd]

    static constraints = {
        td nullable: false
        bcsy nullable: false
    }

    def defaultPart() {
        [id: id]
    }
}
