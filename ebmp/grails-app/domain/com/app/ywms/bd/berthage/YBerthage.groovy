package com.app.ywms.bd.berthage

import com.app.bd.corp.BdCorp

class YBerthage {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期
    //基础信息

    Boolean isuse//试用中
    String code// 泊位代码
    String name// 名称
    String describe// 描述
    BdCorp bdCorp
    //技术参数
    BigDecimal kswz//开始位置
    BigDecimal jswz// 技术位置
    BigDecimal zxss// 最小水深
    BigDecimal zdss// 最大水深
    BigDecimal zdtbdw// 最大停泊吨位

    static constraints = {
        code nullable: false,unique: 'bdCorp'
        name nullable: false,unique: 'bdCorp'
    }
}
