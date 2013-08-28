package com.app.ywms.contract

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.pub.billtype.PubBilltype
import com.app.sm.user.SmUser
import com.app.ywms.bd.shipdoc.Yshipdoc
import com.app.ywms.bd.tank.YBdTank

class BaseContract {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期
    BdCorp pkCorp //公司
    String contractType //合同类型
    PubBilltype pubBilltype//单据类型
//基本信息
    String contractNo  //合同号
    String contractNo2 //相关合同号
    Date signDate //签约时间
    Date endDate //有效期
    String signAddress //签约地址
    String contractescribe //合同描述
    boolean dpczx //多批次执行
    boolean gsht //格式合同
    Integer jgfzff //交割费支付方 0:不收取费用 1:转出方承担 2:转入方承担
    Integer zxccbgzff //装卸仓储包干支付方 0:不收取费用 1:转出方承担 2:转入方承担
    boolean hzcdcqf //货主承担超期费
    Date cqrq //超期日期
    BdCumandoc bdCumandoc //货主
    BdCumandoc bdCumandoc1 //转出方
//租罐条款
    BdInvmandoc bdInvmandoc //货物名称
    Integer slysfs //数量验收方式 0:罐检为准 1:船检为准 2:交割为准
    Integer checkType //数量验收方式 0:罐检方式  1:穿检方式
    YBdTank gh //罐号
    Integer myfs //贸易方式 0:内贸 1:外贸 2;内外贸
    Yshipdoc cm //船名
    Date yjdgrq //预计到港日期
    BigDecimal htsl //合同数量
    BigDecimal zgtj //租罐体积
    BigDecimal zgsl //租罐数量
    BigDecimal rksx //入库上限
    BigDecimal zgdj //租罐单价
    Date zgksrq //租罐开始日期
    Date zgjsrq //租罐结束日期
    BigDecimal clhdj //超量后单价
    BigDecimal clhcqdj //超量后超期单价
    BigDecimal lybzj //履约保证金
    BigDecimal fbzjts //付保证金天数
    String zlzb //质量指标
//超量条款(用于结算)
    BigDecimal ccdj //仓储单价
    BigDecimal zxdj //装卸单价
    BigDecimal fkr //付款日
    boolean rkszddrjfcs //入库时自动读入计费参数
    BigDecimal cczq //仓储周期
    BigDecimal cqdj //超期单价
    BigDecimal cqhlj //超期后累加
    boolean azqlj //按周期累加
    BigDecimal zxjl //最小计量
    BigDecimal mcqfsl //免超期费数量
    BigDecimal ccfzq //仓储费周期
    Integer ccfjsfs //仓储费计算方式0:按天计算 1:按周期第一天计费
    BigDecimal zxsh //装卸损耗
    BigDecimal bgsh //保管损耗
    BigDecimal cszq //超损周期
    BigDecimal mcsts //免超损天数
    BigDecimal jgf //交割费
    BigDecimal zdsf //最低收费
    BigDecimal zxccbgfdj //装卸仓储包干费单价
    BigDecimal cqccf //超期仓储费
    Date bgshqsrq //保管损耗起算日期
    String httk //合同条款
    String cqjfcl //超期计费策略
//作业价格条款
    BigDecimal dlgt //定量罐桶
    BigDecimal bdlgt //不定量罐桶
    BigDecimal ssbaf //设施保安费
    BigDecimal mtsyf //码头使用费
    String jjtk //价格条款
    BigDecimal lzfdj //力资费单价
    String jgtk //价格条款
//货物交付条件
    String wflxr //我方联系人
    String dflxr //对方联系人
    String wflxdh //我方联系电话
    String dflxdh //对方联系电话
    String wfjsczh //我方接收传真号
    String dffstdcz //对方发送提单传真
    String wfjsemail //我方接收email
    String dffstdemail //对方发送提单email
//其他信息
    SmUser maker//制单人
    Date makeDate// 制单日期
    SmUser checker// 审核人
    Date checkDate// 审核日期
    String bz //备注
    static constraints = {
        contractNo(nullable: false,blank: false,unique: true)
        signDate(nullable: false,blank:false)

    }
    static  mapping = {
        cache true;
        signDate sqlType:'date'
        makeDate(sqlType:'date')
        checkDate(sqlType:'date')
    }

    def defaultPart(){
        [id:id,contractNo:contractNo,contractNo2:contractNo2,signDate:signDate]
    }

}
