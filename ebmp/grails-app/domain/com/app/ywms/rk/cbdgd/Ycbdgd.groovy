package com.app.ywms.rk.cbdgd

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.bd.shipdoc.Yshipdoc

class Ycbdgd {

    String id
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期
    String billTypeCode //单据类型编码
    PubBilltype billtype //单据类型
    String sourceBillTypeCode //来源单据类型
    PubBilltype sourceBillType
    String businessCode //业务类型编码
    PubBusinessType businessType  //业务类型
    BdCorp bdCorp //公司

    String billno //单据号
    Date billdate //单据日期
    Yshipdoc chuanming //船名
    Date yjdgrq //预计到港日期


    String note//备注
    SmUser maker// 制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    boolean closed

    static hasMany = [bodys:YcbdgdB]
    static constraints = {
        billno (unique: 'bdCorp')
        billdate nullable: false,blank:false
    }

    static mapping = {
        billdate(sqlType:'date')
        makeDate sqlType: 'date'
        checkDate sqlType: 'date'
        yjdgrq(sqlType:'date')
    }
}
