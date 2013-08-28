package com.app.ic.special



import com.app.bd.corp.BdCorp
import com.app.bd.deptdoc.BdDeptdoc
import com.app.bd.psndoc.BdPsndoc
import com.app.bd.stordoc.BdStordoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class IcSpecial {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
    PubBusinessType businessType  //业务类型

    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String sourceBillTypeCode //来源单据类型编码
    PubBilltype sourceBillType //来源单据类型
    String billno //单据号
    Date billdate //单据日期



    //    1	 bccountflag	是否条码盘点	char
    BdPsndoc	 inbsr	//入库业务员	char
    BdDeptdoc	 indept //入库部门ID	char
    BdStordoc	 inwarehouse	//入库仓库ID	char
    BdPsndoc	 outbsor	//出库业务员	char
    BdDeptdoc	 outdeptid	//出库部门ID	char
    BdStordoc	 outwarehouse	//出库仓库ID	char
    Date	 cshlddiliverdate	//应发货日期	char
//    16	 fassistantflag	是否计算期间业务量	char
//    18	 icheckmode	盘点方式	smallint
//    19	 iprintcount	打印次数	smallint
//    20	 nfixdisassemblymny	组装拆卸费用	decimal
    BdPsndoc	 adjuster	//调整人	char
    String	 vnote	//备注	varchar
    Date shldarrivedate	//应到货日期	char

//


    Boolean upstate
    Date up_date
    String upMessage

    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp

    static hasMany = [bodys:IcSpecialB]

    static constraints = {
        billdate nullable: false

        billTypeCode nullable: false
        billtype nullable: false
        inwarehouse nullable: false
        outwarehouse nullable: false
    }

    def defaultPart() {
        [id: id]
    }
}
