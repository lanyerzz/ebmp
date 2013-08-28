package com.app.sm.roles

import com.app.bd.corp.BdCorp
import com.app.sm.function.SmFunction

class SmRolesCorpFunction {

    String id
    SmRoles smRoles
    SmFunction smFunction
    BdCorp bdCorp
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期
    static constraints = {
    }

}
