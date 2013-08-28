package com.app.ic.special

import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.measdoc.BdMeasdoc
import com.app.bd.pack.BdPack
import com.app.pub.billtype.PubBilltype

class IcSpecialB {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期




    BdInvmandoc bdInvmandoc //
    BdMeasdoc castunit  //	辅计量单位ID	char
    BdPack pack//包装信息
//    6	 crowno	行号	varchar
//    10	 cspaceid	货位ID	char
    BdCumandoc	 vendor	//供应商	char
//    14	 cwarehouseid	仓库ID	char
    BigDecimal	 dshldtransnum=0	//应转数量	decimal
    Date	 dvalidate	//失效日期	char
//    18	 fbillrowflag	单据行标志	smallint
    BigDecimal hsl=0//	换算率	//decimal
//    20	 naccountastnum	帐面辅数量	decimal
//    21	 naccountgrsnum	帐面毛重数量	decimal
//    22	 naccountnum	帐面数量	decimal
    BigDecimal	 nadjustastnum=0	//调整辅数量	decimal
//    24	 nadjustgrsnum	调整毛重数量	decimal
    BigDecimal	 nadjustnum=0	//调整数量	decimal
//    26	 nbarcodenum	条码数量	decimal
//    27	 ncheckastnum	盘点辅数量	decimal
//    28	 ncheckgrsnum	盘点毛重数量	decimal
//    29	 nchecknum	盘点数量	decimal
//    30	 nmny	金额	decimal
//    31	 nperiodastnum	期间业务辅数量	decimal
//    32	 nperiodnum	期间业务数量	decimal
//    33	 nplannedmny	计划金额	decimal
//    34	 nplannedprice	计划单价	decimal
//    35	 nprice	单价	decimal
    BigDecimal nshldtransastnum=0	//应转辅数量	decimal
    BigDecimal	 nshldtransgrsnum=0	//应转出毛重数量	decimal
    BigDecimal outastnum=0//出库数量
    BigDecimal outnum=0//出库数量
    BigDecimal inastnum=0 //入库数量
    BigDecimal innum=0 //入库数量
//
    String 	 vbatchcode	//批次号	varchar
//
    String	 vnote	//备注	varchar




    //子表字段

    String sourceBid	//来源表体Id
    String sourceHid	//来源表头Id
    String sourceBillCode	//来源单据号
    PubBilltype sourceBillType //来源单据类型

    static belongsTo = [head:IcSpecial]


    static constraints = {
        bdInvmandoc nullable: false
        nadjustnum nullable: false

    }

}
