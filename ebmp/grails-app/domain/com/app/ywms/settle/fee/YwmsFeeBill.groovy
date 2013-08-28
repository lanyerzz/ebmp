package com.app.ywms.settle.fee



import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.contract.BaseContract
import com.app.ywms.rk.xhqrd.Yxhqrd
import com.app.ywms.settle.feetype.YwmsFeeType

class YwmsFeeBill {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
    PubBusinessType businessType  //业务类型

    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String billno //单据号
    Date billdate //单据日期

    Boolean bg//包罐费用

    Yxhqrd yxhqrd //卸货确认单

    BaseContract bght//包罐合同

    BdCumandoc hz;
    BdInvmandoc hw
    YwmsFeeType feeType


    //结算信息

    BigDecimal ywsl//业务数量

    String xgywdh // 相关业务单号


    Date jsrq//结算日期
    BigDecimal jssl//结算数量
    BigDecimal dj//单价
    BigDecimal djlj //单价累加

    BigDecimal je//金额
    BigDecimal yfsl//应付数量
    BigDecimal yfje//应付金额
    BdCumandoc fkdw//付款单位


//其他信息
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp

    String vnote

    static constraints = {
        billdate nullable: false
        feeType nullable: false
        jsrq nullable: false
        dj nullable: false
        yfsl nullable: false
        yfje nullable: false
        fkdw nullable: false
    }

    def defaultPart() {
        [id: id]
    }
}
