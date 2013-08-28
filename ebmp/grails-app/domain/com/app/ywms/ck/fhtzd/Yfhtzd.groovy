package com.app.ywms.ck.fhtzd



import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.psndoc.BdPsndoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class Yfhtzd {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
    PubBusinessType businessType  //业务类型
    PubBilltype sourceBillType //来源
    String sourceBillTypeCode
    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String billno //单据号
    Date billdate //单据日期


    String khtdh //客户提单号
    Date yxrq //有效日期飞
    BdCumandoc thdw//提货单位
    BdInvmandoc hw//货物
    BdCumandoc shdw//送货单位

    BigDecimal tzsl//通知数量

    Boolean closed=false//是否关闭closed

    int cfkz //超发控制  0:提单内控制超发  1 通知单内控制超发  2 严禁任何形式的超发

    String zyfs //装运方式 house:管道直放   ship 船运  train 火车  truck 槽车   tz 桶装   tzdl 定量灌装

    String ccm //车船名

    String gch //挂车号

    BigDecimal md //密度

    BigDecimal tj //体积

    String fhzt //发货站台

    Boolean zzjh //正在叫号

    //易制毒备案

    String thtzsjh //提货通知手机号

    boolean  yjys//原件已收
    Date sjrq //收件日期
    BdPsndoc jsr //接收人
    String jsms //接收描述
    String bz// 备注

//
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp


    static hasMany = [bodys:Yfhtzdb]


    static constraints = {
        billdate nullable: false

        yxrq nullable: false
        thdw nullable: false
        hw nullable: false
        shdw nullable: false
        tzsl nullable: false
        cfkz nullable:false
        zyfs nullable: false
    }

    def defaultPart() {
        [id: id]
    }
}
