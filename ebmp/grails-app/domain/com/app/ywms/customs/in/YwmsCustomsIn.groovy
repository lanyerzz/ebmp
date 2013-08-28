package com.app.ywms.customs.in



import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.bd.shipdoc.Yshipdoc
import com.app.ywms.contract.BaseContract

class YwmsCustomsIn {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
    PubBusinessType businessType  //业务类型

    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String sourceBillTypeCode //来源单据类型编码
    PubBilltype sourceBillType //来源单据类型
    String billno //单据号
    Date billdate //单据日期




    Yshipdoc yshipdoc

    String hc

    BdCumandoc hz
    BdInvmandoc hw
    BaseContract ht
    String pc





//
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp

    //子表字段

//    String sourceBid	//来源表体Id
//    String sourceHid	//来源表头Id
//    String sourceBillCode	//来源单据号
//    PubBilltype sourceBillType //来源单据类型

    static constraints = {
    }

    def defaultPart() {
        [id: id]
    }
}
