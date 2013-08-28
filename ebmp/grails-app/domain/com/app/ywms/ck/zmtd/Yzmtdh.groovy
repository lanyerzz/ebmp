

package com.app.ywms.ck.zmtd

import com.app.bd.balatype.BdBalatype
import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.psndoc.BdPsndoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.contract.BaseContract

class Yzmtdh {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期

//
    PubBusinessType businessType  //业务类型
    String billTypeCode //单据号类型编码
    PubBilltype billtype//单据类型
    String billno //单据号
    Date billdate //单据日期


    //基本信息
   String khtdh//客户提单号
   Integer zmlx//    转卖类型   提货权转卖   货权转卖  不可撤销转卖
    String tzfs//    通知方式  fax 传真件提货   jsx 介绍信原件  sw 商务确认单证 yj 提货单原件
    boolean yjqr//Email 已确认
    Date yxrq//    有效日期
    Date khyxrq//    客户有效日期


//    转出方信息
    BdCumandoc zcdw//    转出单位
//    休眠户
//    进入交易所交易
    BdInvmandoc hw//货物
    BigDecimal tdsl//    提单数量
    BigDecimal szsl//    实转数量
//    保管损耗数量
//    转入方信息
    BdCumandoc zrdw//    转入提货单位
    Boolean sfthffccf//    是否提货方付仓储费

    BaseContract zrht //转入合同
    String zrpc//转入批次

    Boolean zrfcdsh//转入方承担损耗


//    其他信息
    Boolean dshk//    代收货款
    BigDecimal hwdj//    货物单价
    BdBalatype jsfs//    付款方式
    String thtzsj//    提货通知手机
    boolean sfysqyj//    是否已收取原件
    Date sqsj//    收取时间
    BdPsndoc jsr//    接收人
    String jsms//    接收描述





    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    BdCorp bdCorp
    PubBilltype sourceBillType
    String sourceBillTypeCode


    static hasMany = [bodys:Yzmtdb]
    static constraints = {
    }
}
