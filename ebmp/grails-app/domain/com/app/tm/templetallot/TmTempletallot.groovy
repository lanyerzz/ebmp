package com.app.tm.templetallot

import com.app.bd.corp.BdCorp
import com.app.sm.function.SmFunction
import com.app.sm.roles.SmRoles
import com.app.sm.user.SmUser
import com.app.tm.templet.TmTemplet

class TmTempletallot {

    Date dateCreated //创建日期
    Date lastUpdated //最后修改日期
    String id
    SmFunction function;
    Integer templetType //模板分类 0)打印模板   1)查询模板	2)单据模板	3)报表模板

    TmTemplet tmTemplet //打印模板id

    boolean isDefault //是否默认
    String code //编码
    SmRoles role //角色
    SmUser user //操作员
    BdCorp corp //公司

    static constraints = {
        function(nullable:false,blank:false)
        templetType(nullable:false,blank:false)
        tmTemplet(nullable:false,blank:false)

    }
}
