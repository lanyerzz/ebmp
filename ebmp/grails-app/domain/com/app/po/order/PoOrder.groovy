package com.app.po.order



import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.deptdoc.BdDeptdoc
import com.app.bd.psndoc.BdPsndoc
import com.app.bd.purorg.BdPurorg
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
class PoOrder {

    String id
    Date lastUpdated	//最后修改日期
    Date dateCreated	//创建日期



//
    PubBusinessType businessType  //业务类型

    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String sourceBillTypeCode //来源单据类型编码
    PubBilltype sourceBillType //来源单据类型
    String billno //单据号
    Date billdate //单据日期






//    1	 bcooptoso	是否已协同生成销售订单	char
//    2	 bislatest	是否最新版本	char
//    3	 bisreplenish	补货标志	char
//    4	 breturn	是否退货	char
//    5	 bsocooptome	是否由销售订单协同生成	char
//    6	 caccountbankid	开户银行ID	char
//    7	 caccountyear	会计年度	char


//    10	 ccontracttextpath	合同附件	varchar
    String	 cdeliveraddress	//供应商收发货地址	varchar
    BdDeptdoc	 deptdoc //	采购部门ID	char
    BdPsndoc	 psndoc	//采购员ID	char
//    14	 cfreecustid	散户ID	char
//    15	 cgiveinvoicevendor	发票方ID	char

    BdPurorg cpurorganization	//采购组织ID	char
//    19	 creciever	收货方ID	char
//    20	 crevisepsn	修订人	char
//    21	 ctermprotocolid	付款协议ID	char
//    22	 ctransmodeid	运输方式ID	char
//    23	 cunfreeze	解冻人ID	char
    BdCumandoc	 cvendormangid	//供应商管理ID	char


//    29	 drevisiondate	修订日期	char
//    30	 forderstatus	订单状态	smallint
//    31	 iprintcount	打印次数	smallint
//    32	 nprepaymaxmny	本币预付款限额	decimal
//    33	 nprepaymny	本币预付款	decimal
//    34	 nversion	版本信息	smallint



    String	 vcoopordercode	//对方订单号	varchar

    String	 vmemo	//备注	varchar











//
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp



    static constraints = {
    }

    def defaultPart(){
        [id:id]
    }
}
