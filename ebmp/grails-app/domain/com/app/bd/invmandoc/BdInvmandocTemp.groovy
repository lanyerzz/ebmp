package com.app.bd.invmandoc

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.invbasdoc.BdInvbasdoc
import com.app.bd.pack.BdPack
import com.app.sm.user.SmUser

class BdInvmandocTemp {
    Date dateCreated //创建时间
    Date lastUpdated //最后修改时间

    String id

    String  cinvmneCode  //助记码
    BigDecimal  keepWasteRate  //保管损耗率
    BigDecimal  lowestPrice //最低售价
    String  mantaxItem  //税目
    BigDecimal  maxPrice //最高限价
    SmUser  modifier //修改人
    String  outPriority  //出库优先级

    String  pkCorp  //公司主键
	String  pkCumandoc //主供应商
    String  pkInvbasdoc //存货档案主键
    String  prodArea //产地
    String  qualityDayNum  //保质期
    String  qualityPeriodUnit  //保质期单位
    String  recurrentchkcyc //定期检验周期
    BigDecimal  refSalePrice  //参考售价
    String  memo  //备注
    boolean  qualityManFlag //是否保质期管理
    boolean  sealFlag  //封存标志
    boolean serialManaFlag  //是否进行序列号管理
    boolean  accFlag //是否辅币核算成本
    boolean  negAllowed //是否允许负库存
    boolean  outTrackIn //是否出库跟踪入库
    boolean  wholemanaflag  //是否批次管理

    BigDecimal defaultNumber //销售默认数量
    String defaultPack
    String sourceId

    boolean  dr=false

}
