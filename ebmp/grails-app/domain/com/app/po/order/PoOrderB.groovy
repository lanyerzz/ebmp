package com.app.po.order



import com.app.bd.corp.BdCorp
import com.app.bd.currtype.BdCurrtype
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.measdoc.BdMeasdoc
import com.app.bd.stordoc.BdStordoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class PoOrderB {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//



//    1	 blargess	是否赠品	char
//    2	 breceiveplan	存在到货计划	char
//    3	 btransclosed	是否运输关闭	char
    BdMeasdoc cassistunit	//辅计量单位	char
//    6	 ccloseuserid	关闭人	char
//    7	 ccontractid	合同头ID	char
//    8	 ccontractrowid	合同行ID	char
//    9	 ccorrectrowid	修正行ID	char
      BdCurrtype currtype	//原币币种ID	char
//    11	 cdevaddrid	收发货地点	char
//    12	 cdevareaid	收发货地区	char
    BdInvmandoc	 invmandoc	//存货管理ID	char
//    14	 coperator	操作员ID	char

//    17	 cpriceaudit_bb1id	价格审批单存货子子表ID	char
//    18	 cpriceaudit_bid	价格审批单存货子表ID	char
//    19	 cpriceauditid	价格审批单ID	char
//    20	 cprojectid	项目ID	char
//    21	 cprojectphaseid	项目阶段ID	char
//    22	 cqpbaseschemeid	优质优价主体方案ID	char
    Integer crowno	//行号

//    30	 cusedeptid	使用部门ID	char
//    31	 cvenddevaddrid	供应商收发货地点	char
//    32	 cvenddevareaid	供应商收发货地区	char
//    33	 cwarehouseid	收货仓库ID	char
//    34	 dclosedate	关闭日期	char
//    35	 dconfirmdate	确认日期	char
//    36	 dcorrectdate	修正日期	char
//    37	 dplanarrvdate	计划到货日期	char

//    39	 forderrowstatus	订单行状态	smallint
//    40	 idiscounttaxtype	扣税类别	smallint
//    41	 iisactive	是否激活	smallint
//    42	 iisreplenish	补货标志	smallint
    BigDecimal	 naccumarrvnum	//累计到货数量	decimal
    BigDecimal	 naccumdevnum	//累计运输数量	decimal
    BigDecimal	 naccuminvoicenum	//累计发票数量	decimal
    BigDecimal	 naccumrpnum	//累计到货计划数量	decimal
    BigDecimal	 naccumstorenum	//累计入库数量	decimal
    BigDecimal	 naccumwastnum	//累计途耗数量	decimal
    BigDecimal	 nassistnum	//辅计量数量	decimal
//    50	 nbackarrvnum	累计退货数量	decimal
//    51	 nbackstorenum	累计退库数量	decimal
    BigDecimal	 nconfirmnum	//确认数量	decimal
//    53	 ndiscountrate	扣率	decimal
//    54	 nexchangeotobrate	折本汇率	decimal
//    55	 nfeemny	费用累计开票金额	decimal
    BigDecimal	 nmoney	//本币金额	decimal
//    57	 nordernum	订货数量	decimal
//    58	 norgnettaxprice	原币净含税单价	decimal
    BigDecimal	 norgtaxprice	//原币含税单价	decimal
//    60	 noriginalcurmny	原币净无税金额	decimal
//    61	 noriginalcurprice	原币无税单价	decimal
//    62	 noriginalnetprice	原币净无税单价	decimal
//    63	 noriginaltaxmny	原币税额	decimal
    BigDecimal	 noriginaltaxpricemny	//原币价税合计	decimal
//    65	 ntaxmny	本币税额	decimal
    BigDecimal	 ntaxpricemny	//本币价税合计	decimal
    BigDecimal	 ntaxrate	//税率	decimal
//    68	 pk_arrvcorp	收货公司	char
    BdStordoc	 creqware	//需求需求仓库	char
//      92	 pk_invoicecorp	收票公司	char
//    93	 pk_reqcorp	需求公司	char


//       123	 vpriceauditcode	价格审批单号	varchar
//    124	 vproducenum	批次号	varchar
//    125	 vreceiveaddress	收发货地址	varchar
//    126	 vvenddevaddr	供应商收发货地址	varchar
//    127	 vvendinventorycode	对应存货编码	varchar
//    128	 vvendinventoryname	对应存货名称	varchar
//    129	 vvendorordercode	对方订单号	varchar
//    130	 vvendororderrow	对方订单行号	varchar

    //子表字段

    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型

    static constraints = {
    }

    def defaultPart() {
        [id: id]
    }
}
