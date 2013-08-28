package com.app.ywms.rk.xhjhd

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.bd.cddw.YCddw
import com.app.ywms.bd.shipdoc.Yshipdoc

//卸货计划单
class Yxhjhd {

    String id
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期



    BdCorp bdCorp //公司
    String billTypeCode //单据类型编码
    PubBilltype billtype //单据类型
    String sourceBillTypeCode //来源单据类型编码
    PubBilltype sourceBillType //来源单据类型
    String businessCode //业务类型编码
    PubBusinessType businessType  //业务类型
    //基本信息
    String billno //计划单号
    Date billdate
    Integer zxlx //装卸类型 //0:装货 1;卸货
    Integer myxz //贸易性质 0：内贸 1：外贸
    Boolean yykhqr //已于客户确认

    //船舶基本资料
    Yshipdoc shipdoc //船舶档案
    Date yjdgrq //预计到港日期
    BdCumandoc cddw //船代单位
    String lygk //来源港口
    String ddtzsj //到达通知手机
    Boolean fsdx //发送短信
    //其他信息
    SmUser maker //制单人
    Date makeDate //制单日期
    SmUser checker //签发人
    Date checkDate //签发日期
    String qtms //其他描述
    String note //备注

    boolean closed
    static hasMany = [bodys:YxhjhdB]
    static constraints = {
        billno(unique: true)
        shipdoc(nullable: false,blank:false)
        yjdgrq(nullable: false,blank:false)
    }

    static mapping = {
        billdate sqlType: 'date'
        yjdgrq(sqlType: 'date')
        makeDate(sqlType: 'date')
        checkDate(sqlType: 'date')

    }
}
