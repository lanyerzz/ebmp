package com.app.pub.billnorule

import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
//单据号规则
class PubBillnorule {
    Date dateCreated //创建日期
    Date lastUpdated //最后修改日期
    String id
    BdCorp bdCorp
    PubBilltype pubbilltype //单据类型
    String subcode// 自定义单据号前缀
    Boolean bdate//是否按照日期编制单据号
    Boolean cleanByDay//是否按照日期清零
    int nolength//单据号长度
    int currentNo//流水号记录
    Date currentNoDate//
    static constraints = {
        pubbilltype(nullable:false,blank:false,unique:true)
    }
    static mapping = {
        currentNoDate(sqlType:'date')
    }
}
