package com.app.ywms.rk.xhjhd

import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.psndoc.BdPsndoc
import com.app.pub.billtype.PubBilltype
import com.app.ywms.contract.BaseContract

class YxhjhdB {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    String hc //航次
    BdCumandoc bdCumandoc //货主
    BdInvmandoc bdInvmandoc //存货(存货编码、存货名称、单位)
    Boolean mtfw //码头服务
    Boolean zgzf //专罐专发
    Boolean tsjc //同时进出
    BigDecimal tdsl=0 //提单数量
    BigDecimal slexec=0 //执行量
    Boolean bs //保税
    BdPsndoc ywy //业务员d
    String hytdh //海运提单号
    String pch//批次号
    BaseContract xghth //相关合同号
    String khtdh //客户提单号
    BdCumandoc cddw //船代单位
    String ddtzsj//到达通知手机
    String note //备注

    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype  sourceBillType//来源单据类型

    boolean closed
    static belongsTo = [head:Yxhjhd]
    static hasMany = [gh:YxhjhdbBGh]
    static constraints = {
        bdCumandoc(nullable: false,blank:false)
        bdInvmandoc(nullable: false,blank:false)
        tdsl(nullable: false,blank:false)
    }
}
