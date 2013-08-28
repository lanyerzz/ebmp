package com.app.bd.qwsz

import com.app.bd.corp.BdCorp
import com.app.bd.invmandoc.BdInvmandoc

/**
 * 鹤位设置
 */
class BdQwsz {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    String code//鹤位编号
    String name //名称
    BdInvmandoc  bdInvmandoc//装卸货物名称
    boolean canUse //是否可用
    String state//当前状态
    String note //备注
    BdCorp bdCorp
    static constraints = {
        code nullable: false,unique: true
        name nullable: false
    }
}
