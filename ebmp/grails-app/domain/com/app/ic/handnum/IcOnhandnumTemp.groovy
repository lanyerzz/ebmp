package com.app.ic.handnum


class IcOnhandnumTemp {
	String id
	String astunit//辅计量单位
	String invbasdoc//存货基本档案
    String invmandoc//存货管理档案
    String calbody//库存组织
    String warehouse //仓库
    String cubasdoc//供应商
    String corp//公司
	String vlot //批次号
    String pack //包装信息
	String vbarcode//条码
	String vbarcodesub//次条码
	String vboxbarcode//箱条码
	
	BigDecimal nonhandastnum = new BigDecimal(0)//辅数量
	BigDecimal nonhandnum = new BigDecimal(0)//数量
	BigDecimal hsl = new BigDecimal(0)//换算率
    BigDecimal freezenum=0

	Date dvalidate//失效日期


}
