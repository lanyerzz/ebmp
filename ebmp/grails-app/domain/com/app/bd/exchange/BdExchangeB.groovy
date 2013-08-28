package com.app.bd.exchange




class BdExchangeB {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
   Integer day
   BigDecimal exchange
    static  belongsTo = [head:BdExchange]



    static constraints = {
        day nullable: false
        exchange nullable:  false
    }
}
