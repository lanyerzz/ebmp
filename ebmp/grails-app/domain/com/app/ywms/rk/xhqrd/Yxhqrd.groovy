package com.app.ywms.rk.xhqrd

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import com.app.ywms.bd.shipdoc.Yshipdoc
import com.app.ywms.bd.tank.YBdTank
import com.app.ywms.contract.BaseContract

class Yxhqrd {

    String id
    Date lastUpdated    //最后修改日期
    Date dateCreated    //创建日期
    BdCorp bdCorp
    String businessCode
    PubBusinessType businessType
    String billTypeCode //单据类型编码
    PubBilltype billtype //单据类型

    String billno
    Date billdate
//客户航次基本信息
    Boolean tsjc //同时进出
    Boolean zgzf //专罐专发
    Boolean bs //保税
    Yshipdoc ship //船舶
    String hc //航次
    Date dgsj //到港时间
    BdCumandoc bdCumandoc //货主
    Date jgrq //进罐日期
    BdInvmandoc bdInvmandoc //货物
    Integer myxz //贸易性质 0:内贸 1:外贸
    BaseContract contract //合同
    String htpch //合同批次号
    BigDecimal cgsl //出关数量
    BdCumandoc cddw //船代单位
    Integer hgfx //海关放行 0:未放行 1:已放行
    BigDecimal fxsl //放行数量
    BdCumandoc kzdw //开证单位
    Integer kzfx //开证放行 0:未放行 1:已放行
    BigDecimal kzfxsl=0 //开证放行数量
//客户数量确认(计量单位:Mt)
    BigDecimal xdtsl=0 //小提单数量
    BigDecimal gjsl=0 //罐检数量
    BigDecimal cjsl=0 //船检数量
    BigDecimal sjsl=0 //商检数量
    BigDecimal htsh=0 //合同损耗
    BigDecimal zcfhl=0 //正常发货量
    BigDecimal bgsh=0 //保管损耗
    BigDecimal zdfhl=0 //最大发货量
    BdCumandoc sjdw //商检单位
    String sjzsh //商检证书号
    Date qrrq //确认日期
    String hytdh //海运提单号
    String xghth //相关合同号
    String xtdh //小提单号
    String khtdh //客户提单号
    BigDecimal tdsl=0 //提单数量
    BigDecimal gj=0 //估价
    BigDecimal gz=0 //估值
    String sdyy //锁定原因
    BigDecimal sdsl=0 //锁定数量
    String note //备注

//结算信息
    Boolean jsfy //计算费用
    BigDecimal ccfdj //储藏费单价
    BigDecimal zxfdj //装卸费单价
    BigDecimal sqts //首期天数
    BigDecimal ccfzq //仓储费周期
    Date cqksrq //超期开始日期
    BigDecimal cqdj //超期单价
    Date csksr //超损开始日
    BigDecimal cszq //超损周期


    String sourceBid
    String sourceBillCode
    String sourceHid
    PubBilltype sourceBillType
    String sourceBillTypeCode

    SmUser maker //制单人
    Date makeDate //制单日期
    SmUser checker //签发人
    Date checkDate //签发日期

    boolean closed

    static hasMany = [gh:YxhqrdGh]
    static constraints = {

    }
    static mapping = {
        billdate sqlType: 'date'
        makeDate sqlType: 'date'
        checker sqlType: 'date'
        dgsj(sqlType: 'date')
        jgrq(sqlType: 'date')
        qrrq(sqlType: 'date')
        cqksrq(sqlType: 'date')
        csksr(sqlType: 'date')

    }
}
