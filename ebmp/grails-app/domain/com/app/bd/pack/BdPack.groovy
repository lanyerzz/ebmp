package com.app.bd.pack



import com.app.bd.corp.BdCorp
import com.app.bd.measdoc.BdMeasdoc




class BdPack {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    String code
    String name
    String pid
    String note
    BdMeasdoc measdoc//默认单位
    BigDecimal hsl//默认换算率   暂时保存，为了原有业务数据的升级
    String sourceId
    BdCorp bdCorp

    static hasMany = [bodys:BdPackInfo]

    static constraints = {
        code nullable: false
        name nullable: false
    }


    def defaultPart(){
        [id:id,code:code,name:name]
    }

}
