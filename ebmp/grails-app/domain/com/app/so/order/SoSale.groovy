package com.app.so.order

import com.app.bd.balatype.BdBalatype
import com.app.bd.calbody.BdCalbody
import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.currtype.BdCurrtype
import com.app.bd.deptdoc.BdDeptdoc
import com.app.bd.psndoc.BdPsndoc
import com.app.bd.salestru.BdSalestru
import com.app.bd.stordoc.BdStordoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class SoSale {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
    PubBusinessType businessType  //业务类型
    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String sourceBillTypeCode
    PubBilltype sourceBillType
    String billno //单据号
    Date billdate //单据日期

    Boolean bclose //订单关闭

    Boolean bretinvflag//    10	 bretinvflag	退货标记	char
    BdBalatype balatype
    BdCalbody calbody//    15	 ccalbodyid	库存组织	char
    BdStordoc stordoc
    BdSalestru bdSalestru
    BdCumandoc customer//    19	 ccustomerid	客户ID	char
    BdDeptdoc deptdoc//    20	 cdeptid	部门	char
    BdPsndoc psndoc//    21	 cemployeeid	业务员	char
    BdCurrtype	 currencytype//	原币	char
    BigDecimal	 nexchangeotobrate=1	//折本汇率	decimal
BigDecimal npreceivemny//    52	 npreceivemny	预收款金额	decimal
BigDecimal ndiscountrate//整单折扣	decimal
BigDecimal nheadsummny//金额合计	decimal
BigDecimal nratemnny//折扣金额
    BigDecimal nrecmnny //折扣后金额

    BigDecimal hxje=0  //收款金额

String vnote//    99	 vnote	备注	varchar
String    linkTel
String vreceiveaddress//    101	 vreceiveaddress	收货地址	varchar

//
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp

    Boolean upstate=false
    Date up_date
    String upMessage
    static  hasMany = [bodys:SoSaleOrder]

    static constraints = {
        billno unique: 'bdCorp'
        billdate nullable: false
        customer nullable: false
        bdSalestru nullable: false
    }

    static mapping = {
        billdate sqlType: 'date'
    }
}
