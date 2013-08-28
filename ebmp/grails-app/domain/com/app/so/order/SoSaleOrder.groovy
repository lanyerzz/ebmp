package com.app.so.order


import com.app.bd.currtype.BdCurrtype
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.measdoc.BdMeasdoc
import com.app.bd.pack.BdPack
import com.app.bd.stordoc.BdStordoc
import com.app.pub.billtype.PubBilltype


class SoSaleOrder {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期


    String	 batch	//批次	varchar



    BdInvmandoc	 invmandoc	//存货档案主键	char


    Integer	 rowno	//行号
    SoSale	 head//	销售主表ID	char
    Date	 dconsigndate	//发货日期	char
    Date	 ddeliverdate	//交货日期	char


    String	 frownote	//行备注	varchar
    Integer 	 frowstatus=0	//行状态	smallint

    BigDecimal	 nnumber=0	//数量	decimal
    BigDecimal  noutnum=0 //出库数量
    BigDecimal	 noriginalcurmny=0	//原币无税金额	decimal
    BigDecimal	 noriginalcurnetprice=0	//原币无税净价	decimal
    BigDecimal	 noriginalcurprice=0	//原币无税单价	decimal
    BigDecimal	 noriginalcursummny=0	//原币价税合计	decimal
    BigDecimal	 noriginalcurtaxmny=0	//原币税额	decimal
    BigDecimal	 noriginalcurtaxnetprice=0	//原币含税净价	decimal
    BigDecimal	 noriginalcurtaxprice=0	//原币含税单价	decimal

    BigDecimal	 ntaxrate=0//	税率	decimal
    BdMeasdoc fjl //辅计量单位
    BigDecimal hsl=1 //辅数量
    BdPack bzm //包装码
    BigDecimal fsl//辅数量
    String vfree1
    String vfree2
    String vfree3
    String vfree4
    String vfree5

    String linkTel //联系电话
    String 	 vreceiveaddress//	收货地址	varchar

    BdStordoc stordoc

    //子表字段

    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型


    static belongsTo = [head:SoSale]

    static constraints = {

        invmandoc nullable: false

    }
}
