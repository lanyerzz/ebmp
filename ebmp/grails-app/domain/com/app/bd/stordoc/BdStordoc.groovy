package com.app.bd.stordoc

import com.app.bd.calbody.BdCalbody
import com.app.bd.corp.BdCorp

import com.app.sm.user.SmUser

class BdStordoc {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期




    String 	 memo//	备注	varchar

    BdCalbody calbody//库存组织主键	char

    Boolean sealflag//27	 sealflag	暂封标志	char
    String storaddr//28	 storaddr	仓库地址	varchar
    String code//29	 storcode	仓库编码	varchar
    String name//30	 storname	仓库名称	varchar

    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp



    static constraints = {
        code nullable: true
        name nullable: true
    }
    def defaultPart(){
        [id:id,name:name,code:code]
    }
}
