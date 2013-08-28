package com.app.ywms.kc

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.ywms.bd.tank.YBdTank
import com.app.ywms.contract.BaseContract

class Ycrkmx {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    PubBusinessType businessType  //业务类型

    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String sourceBillTypeCode //来源单据类型编码

    String billno

    Date billdate
    BaseContract ht//合同
    String pc //批次
    String hc
    BdCumandoc hz;//货主
    BdCumandoc kh //销售对象
    BdInvmandoc invmandoc;
    YBdTank gh;//罐号
    BigDecimal insl=0;
    BigDecimal fxsl=0//发行数量
    BigDecimal shl=0 //损耗量
    BigDecimal lockNum=0//锁定量
    BigDecimal outsl=0;
    BigDecimal hxsl=0;
    Boolean zgzf=false
    Integer crklx;//出入库类型 0：入库 1：出库
    String note// 备注
    BdCorp bdCorp
    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型
    Ycrkmx sourceMx //来源明细单

    static hasMany = [locks:YcrkmxLock]

    static constraints = {
        ht(nullable: false)
        invmandoc nullable: false
        hz nullable: false
        gh nullable: false
        insl nullable: false
        outsl nullable: false
        crklx nullable: false

    }

    static mapping = {
        billdate sqlType: 'date'
    }
}
