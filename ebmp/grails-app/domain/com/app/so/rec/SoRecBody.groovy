package com.app.so.rec



import com.app.bd.currtype.BdCurrtype


class SoRecBody {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期


    BdCurrtype currtype  //币种
    BigDecimal hxje=0 //核销金额
    BigDecimal hl=0 //折原币汇率
    BigDecimal ssje=0 //实收金额

    static belongsTo = [head:SoRec]

    static constraints = {
    }

    def defaultPart() {
        [id: id]
    }
}
