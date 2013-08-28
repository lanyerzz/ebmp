package com.app.bd.cumandoc

import com.app.bd.corp.BdCorp
import com.app.bd.cubasdoc.BdCubasdoc

class BdCumandocTemp {
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期
    String id
    String  cmneCode //助记码
    String  linkMan //联系人
    String  memo  //备注
    String  mobilePhone //手机
    String  pkCorp  //公司主键
    String  pkCubasdoc //客商档案主键
    boolean  sealFlag //封存标志
    boolean iscustomer=true //客商
    boolean isvender=true	//供应商

    String sourceId
    String defaultCurrtype//默认币种

    static constraints = {
    }

    static mapping = {
        cache true
    }

    def defaultPart(){
        ['id':id,'pkCubasdoc':pkCubasdoc.def,custname:pkCubasdoc.custname]
    }
}
