package com.app.bd.areacl

import com.app.bd.corp.BdCorp

class BdAreacl {
    Date lastUpdated //最后修改日期
    Date dateCreated //创建日期

    String id
    String areaclcode	//地区分类编号
    String areaclname	//地区分类名称
    String def1			//自定义项1
    String def2			//自定义项2
    String def3			//自定义项3
    String def4			//自定义项4
    String def5			//自定义项5
    String mnecode		//助记码
    BdCorp pkCorp		//公司主键
    String pid='0'	//上级地区分类

    String sourceId
    static constraints = {
        areaclcode(nullable: false, blank: false,unique: true)
        areaclname(nullable: false, blank: false,unique:true)
    }

    static mapping = {
        cache true
    }

    def getName(){
        areaclname
    }

    def getCode(){
        areaclcode
    }

    def defaultPart(){
        [id:id,areaclname:areaclname,name:areaclname,areaclcode:areaclcode,code:areaclcode]
    }
}
