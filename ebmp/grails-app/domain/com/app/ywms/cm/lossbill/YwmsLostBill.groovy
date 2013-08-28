package com.app.ywms.cm.lossbill



import com.app.bd.corp.BdCorp
import com.app.bd.invmandoc.BdInvmandoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.contract.BaseContract

class YwmsLostBill {

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
    BaseContract contract
    BdInvmandoc invmandoc
    String pch

    Integer lostType //0:合同损耗  1:保管损耗  2:装卸损耗   3:其他损耗
    BigDecimal kcl=0 //库存量
    BigDecimal fxl=0//放行量
    Date lostDate //结损日期
    BigDecimal shl=0//损耗率
    BigDecimal shsl=0//损耗量

    String vnote







//
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp

    //子表字段

    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号

    static mapping = {
        billdate sqlType: 'date'
        lostDate sqlType: 'date'
    }
    static constraints = {

    }

    def defaultPart() {
        [id: id]
    }
}
