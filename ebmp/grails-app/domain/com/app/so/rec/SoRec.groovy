package com.app.so.rec



import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.so.order.SoSale

class SoRec {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
    PubBusinessType businessType  //业务类型
    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String billno //单据号
    Date billdate //单据日期

    BigDecimal zk=0 //收款折扣
    BigDecimal hxje=0 //核销金额
    String vnote

    Boolean upstate=false
    Boolean upstatedis=false
    String upMessageis
    Date up_date
    Date upis_date
    String upMessage


    static  hasMany = [bodys:com.app.so.rec.SoRecBody]

//
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp



    SoSale sourceBill	//来源表体Id


    static constraints = {
    }

    def defaultPart() {
        [id: id]
    }
}
