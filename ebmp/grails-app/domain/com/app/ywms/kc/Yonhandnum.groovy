package com.app.ywms.kc

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc

import com.app.ywms.bd.tank.YBdTank
import com.app.ywms.contract.BaseContract

class Yonhandnum {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期




    BdInvmandoc invmandoc;
    YBdTank gh;//罐号

    BigDecimal kcl=0;
    BigDecimal fxsl=0;
    BigDecimal lockNum=0//锁定量


    BdCorp bdCorp

    static  hasMany = [locks:YonhandnumLock]

    static constraints = {


        invmandoc nullable: false
        gh nullable: false
        fxsl nullable: false
        kcl nullable: false


        bdCorp nullable: false

    }
}
