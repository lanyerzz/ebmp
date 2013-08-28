package com.app.ywms.rk.hyjh

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.bd.shipdoc.Yshipdoc


class Yhyjh {

    //系统字段
    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期



    //功能字段
    String businessCode //业务类型编码
    PubBusinessType businessType  //业务类型
    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String billno //单据号
    Date billdate //单据日期
    BdCumandoc bdCumandoc  //货主
    String kbgk//靠泊港口
    Yshipdoc chuanming //船名
    String hangci //航次
    String  qhgk//起航港口
    Integer myfs//贸易方式 0：内贸  1：外贸  2：内外贸

    Date yjdhrq//预计到货日期
    //仓储签约合同号，合同签订日期，合同仓储类型(根据合同类型档案)
    BdCumandoc kjxyzdw//开具信用证单位(客商档案)
    BdCumandoc cddw// 船代单位(客商档案)
    String note// 备注
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    boolean closed
    BdCorp bdCorp
    static hasMany = [bodys:YhyjhB]
    static constraints = {
        billTypeCode nullable: false,blank: false
        billdate nullable: false
        bdCumandoc nullable: false


    }

    static mapping = {
        billdate sqlType: 'date'
        makeDate sqlType: 'date'
        checkDate sqlType: 'date'
    }
}
