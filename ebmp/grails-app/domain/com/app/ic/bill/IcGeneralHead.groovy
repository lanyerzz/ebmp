package com.app.ic.bill



import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.deptdoc.BdDeptdoc
import com.app.bd.psndoc.BdPsndoc
import com.app.bd.stordoc.BdStordoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser

class IcGeneralHead {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
    PubBusinessType businessType  //业务类型
    PubBilltype sourceBillType
    String sourceBillTypeCode
    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String billno //单据号
    Date billdate //单据日期







    BdPsndoc cbiz	//业务员ID

    BdCumandoc ccustomer	//客户ID

    BdCumandoc cprovider	//供应商ID
    BdStordoc cwarehouse	//仓库	*
    BdStordoc cwastewarehouse	//废品仓库
    BdPsndoc cwhsmanager	//库管员ID	*
    boolean boutretFlag	//是否退回



    Date dauditDate	//审核日期
    BdPsndoc purchaser //采购人
    BdDeptdoc cdept //采购部门
    //BdJobbasfil jobbasfil //项目档案

   // Integer fbillFlag	//单据状态	smallint * 0）自由  1）审查
    boolean freplenishFlag	//退货标志
    Integer iprintCount	//打印次数	smallint
    BigDecimal ndiscountmny	//折扣额
    BigDecimal nnetmny	//净额







    BdCorp corp	//公司ID

    String vdiliverAddress	//发运地址
    String vnote	//备注


    String process_id
    String process_type
    String sourceSystem





//
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp


    static  hasMany = [body:IcGeneralBody]

    static constraints = {
        billdate nullable: false
        cwarehouse nullable: false
        billtype nullable: false
       // cwhsmanager nullable: false


    }


}
