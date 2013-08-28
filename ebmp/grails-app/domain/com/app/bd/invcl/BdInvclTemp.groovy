package com.app.bd.invcl


//存货分类
class BdInvclTemp {
    Date dateCreated //创建时间
    Date lastUpdated //最后修改时间

    String id
    String pid ='0'//父类id
    String invclassCode	//分类编码
    String invclassName //类别名称
    String forinvName	//外文名称
    Boolean sealFlag	//封存标志

    String sourceId

    static constraints = {
        invclassCode(nullable:false,blank:false,unique:true)
        invclassName(nullable:false,blank:false,unique:true)
    }
    static mapping = {
        cache true
    }
}
