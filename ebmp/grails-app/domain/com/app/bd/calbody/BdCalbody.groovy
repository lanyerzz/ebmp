package com.app.bd.calbody

import com.app.bd.areacl.BdAreacl
import com.app.bd.corp.BdCorp

//库存组织
class BdCalbody {
    Date dateCreated //创建日期
    Date lastUpdated //最后修改日期
    String id
    String calbodyCode //库存组织编号
    String calbodyName	//库存组织名称
    BdAreacl areacl	//地区分类
    BdCorp bdCorp	//公司主键
    boolean sealFlag	//封存标志
    String vnote 	//说明
    static constraints = {
        calbodyCode(nullable:false,blank:false,unique:true)
        calbodyName(nullable:false,blank:false,unique:true)
    }
    static mapping = {
        cache true
    }

    def code(){
        calbodyCode
    }
    def name(){
        calbodyName
    }

    def defaultPart(){
        [id:id,calbodyCode:calbodyCode,calbodyName:calbodyName,name:calbodyName,code:calbodyCode]
    }
}
