package com.app.ywms.rk.cbdgd

import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.pub.billtype.PubBilltype
import com.app.sm.user.SmUser
import com.app.ywms.bd.tank.YBdTank
import com.app.ywms.contract.BaseContract

class YcbdgdB {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期


    BdInvmandoc bdInvmandoc //存货(存货编码、存货名称、单位)
    BigDecimal tdsl=0// 提单数量
    BigDecimal slexec=0 //执行数量
    String pch// 批次号(批次号匹配合同生成，定义规则需考虑到后面出库及货物转货权后跟踪查询)
    String yjxhgh// 预计卸货罐号
    BdCumandoc cddw// 船代单位
    BdCumandoc kzdw// 开证单位
    BdCumandoc hzdw //货主单位
    BaseContract ccqyhth//仓储签约合同号

    String note// 备注
    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型

    boolean closed

    static belongsTo = [head:Ycbdgd]
    static constraints = {
        slexec nullable: false
        bdInvmandoc(nullable:false,blank:false)
        tdsl(nullable: false,blank:false)

    }
}
