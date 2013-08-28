package com.app.bd.carsinfo



class BdCarshistory {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    String carNo //车牌号
    BigDecimal max //最大自重

    BigDecimal min //最小自重

    BigDecimal current //本次自重

    static constraints = {
        carNo nullable: false,unique: true
    }

    def defaultPart() {
        [id: id]
    }
}
