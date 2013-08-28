package com.app.bd.exchange



import com.app.bd.corp.BdCorp
import com.app.bd.currtype.BdCurrtype
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class BdExchange {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
    BdCurrtype currtypeOne
    BdCurrtype currtypeTwo
    Integer year
    Integer month

    static hasMany = [body:BdExchangeB]

//
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp



    static constraints = {
        currtypeOne nullable: false
        currtypeTwo nullable: false
        year nullable: false
        month nullable: false,max: 12,min: 1
    }
}
