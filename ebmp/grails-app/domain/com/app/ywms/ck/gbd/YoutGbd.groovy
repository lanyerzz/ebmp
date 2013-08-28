package com.app.ywms.ck.gbd



import com.app.bd.corp.BdCorp
import com.app.bd.psndoc.BdPsndoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.ck.fhtzd.Yfhtzd

class YoutGbd {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
    PubBusinessType businessType  //业务类型
    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String billno //单据号
    Date billdate //单据日期

    Yfhtzd tzd//发货通知单
    BigDecimal pz=0 //皮重
    BigDecimal mz=0 //毛重
    BigDecimal fysl=0 //发运数量


    BdPsndoc fsr//发货人
    String  fhzt //发货站台


    String bz//备注

//
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp

    //子表字段

    static hasMany = [bodys:YoutGbdDetail]
    static constraints = {
        billdate nullable: false

    }


}
