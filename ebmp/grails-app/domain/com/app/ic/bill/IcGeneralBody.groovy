package com.app.ic.bill



import com.app.bd.corp.BdCorp
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.measdoc.BdMeasdoc
import com.app.bd.pack.BdPack
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class IcGeneralBody {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//


    Date inDate //入库时间
    Date outDate //出库时间
    boolean bbarcodeclose	//单据行是否条码关闭
    boolean bonroadFlag	//是否在途
    Date dbizDate	//业务日期
    Date dstandbyDate	//备用日期
    Date dvaliDate	//失效日期
    boolean fchecked	//待检标志	smallint
    BdPack pack //包装信息
    BigDecimal hsl = 0	//换算率
    BigDecimal ncountNum = 0	//件数
    BigDecimal ninassistNum = 0	//实入辅数量
    BigDecimal ningrossNum = 0	//入库毛重数量
    BigDecimal ninNum = 0	//实入数量
    BigDecimal nkdNum = 0	//扣顿数量
    BigDecimal nneedinassistNum = 0	//应入辅数量
    BigDecimal noutassistNum = 0	//实出辅数量
    BigDecimal noutgrossNum = 0	//出库毛重数量
    BigDecimal noutNum = 0	//实出数量
    BigDecimal nreplenishedastNum = 0	//已退货辅数量
    BigDecimal nreplenishedNum = 0	//已退货数量
    BigDecimal nshouldinNum = 0	//应入数量
    BigDecimal nshouldoutassistNum = 0	//应出辅数量
    BigDecimal nshouldoutNum = 0	//应出数量
    BigDecimal ntareNum = 0	//皮重主数量
    BigDecimal nprice = 0  //单价
    BigDecimal nmny = 0 //金额
    BigDecimal nbarcodenum = 0 //条码数量

    String pkReturnreason	//退货原因
    String vbatchcode	//批次号
    String vnotebody	//行备注
    String vreceiveaddress	//收货地址
    String vtransfercode	//收货车号
    String vvehiclecode	//运输工具号

    BdInvmandoc bdInvmandoc
    BdMeasdoc astunit //辅计量单位






    //子表字段

    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型



    static  belongsTo = [head:IcGeneralHead]

    static constraints = {

        bdInvmandoc nullable: false
        noutNum nullable: false
        bdInvmandoc nullable: false
    }

}
