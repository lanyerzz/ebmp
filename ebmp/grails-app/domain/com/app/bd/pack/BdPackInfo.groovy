package com.app.bd.pack




import com.app.bd.invbasdoc.BdInvbasdoc
import com.app.bd.invmandoc.BdInvmandoc


class BdPackInfo {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

    BdInvmandoc invmandoc
    BdInvbasdoc invbasdoc
    BigDecimal nnumber
    String vfree1
    String vfree2
    String vfree3
    String vfree4
    String vfree5


    static belongsTo = [head:BdPack]
    static constraints = {

    }
}
