package com.app.bd.invcl

import com.app.bd.corp.BdCorp

//存货分类
class BdInvcl {
    Date dateCreated //创建时间
    Date lastUpdated //最后修改时间

    String id
    String pid ='0'//父类id
    String invclassCode	//分类编码
    String invclassName //类别名称
    String forinvName	//外文名称
    BdCorp pkCorp	//公司主键
    Boolean sealFlag	//封存标志
    String sourceId
    static constraints = {
        invclassCode(nullable:false,blank:false,unique:true)
        invclassName(nullable:false,blank:false)
    }
    static mapping = {
        cache true
    }
}
