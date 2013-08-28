package com.app.bd.banktype

import com.app.sm.user.SmUser

//银行类型
class BdBanktype {
    String id
    String amcode  //助记码 varchar
    String banktypecode //银行类别编码 varchar
    String   banktypename // 银行类别名称 varchar
    String  createtime //创建时间 char
    SmUser creator // 创建人 char

    SmUser  modifier// 修改人 char
    Boolean  sealflag//封存标记
    Date lastUpdated //
    Date dateCreated
    static constraints = {
        banktypecode blank: true,unique: true
        banktypename blank: true,unique: true
    }
    static mapping = {
        cache(true)

    }

}
