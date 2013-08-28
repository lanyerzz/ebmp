package com.app.ywms.rk.hyjh

import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.measdoc.BdMeasdoc
import com.app.pub.billtype.PubBilltype
import com.app.ywms.bd.berthage.YBerthage

class YhyjhB {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    BdInvmandoc bdInvmandoc//存货编码 存货名称

    BdMeasdoc bdMeasdoc //辅助计量单位
    BigDecimal sl=0// 数量
    BigDecimal slexec=0// 执行数量
    boolean  sfpc// 是否拼仓
    YBerthage yjkbbw// 预计靠泊泊位
    Date yjxhsj// 预计卸货时间
    Boolean sfyh// 是否需要引航(根据船舶档案中最大载荷与码头引航吨位判断)
    String note// 备注


    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型
    boolean closed
    //客商货源计划单保存、审核、修改、弃审等功能
    static belongsTo = [head:Yhyjh]
    static constraints = {
        bdInvmandoc nullable: false
        sl nullable: false

    }
    static mapping = {
        yjxhsj sqlType: 'date'
    }
}
