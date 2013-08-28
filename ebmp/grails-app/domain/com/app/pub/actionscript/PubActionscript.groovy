package com.app.pub.actionscript

import com.app.pub.billtype.PubBilltype

class PubActionscript {

    String id
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期

    String scriptCode//脚本编码
    String scriptName//名称
    String path//路径
    //业务类型
    Integer actionType//动作类型 0:动作前 1:动作后
    PubBilltype pubBilltype//单据类型

    static constraints = {
        scriptCode(nullable: false,blank: false)
        scriptName(nullable: false,blank: false)
        path(nullable: false,blank:false)
        actionType(nullable: false,blank:false)
        pubBilltype(nullable: false,blank:false)
    }
    static mapping = {
        cache true
    }
}
