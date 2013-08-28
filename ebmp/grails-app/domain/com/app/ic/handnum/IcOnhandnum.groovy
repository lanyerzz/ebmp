package com.app.ic.handnum

import com.app.bd.calbody.BdCalbody
import com.app.bd.corp.BdCorp
import com.app.bd.cubasdoc.BdCubasdoc
import com.app.bd.invbasdoc.BdInvbasdoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.measdoc.BdMeasdoc
import com.app.bd.pack.BdPack
import com.app.bd.stordoc.BdStordoc

class IcOnhandnum{
	String id
	BdMeasdoc astunit//辅计量单位
	BdInvbasdoc invbasdoc//存货基本档案
	BdInvmandoc invmandoc//存货管理档案
	BdCalbody calbody//库存组织
	BdStordoc warehouse //仓库
	BdCubasdoc cubasdoc//供应商
	BdCorp corp//公司
	String vlot //批次号
    BdPack pack //包装信息
	String vbarcode//条码
	String vbarcodesub//次条码
	String vboxbarcode//箱条码
	
	BigDecimal nonhandastnum = new BigDecimal(0)//辅数量
	BigDecimal nonhandnum = new BigDecimal(0)//数量
	BigDecimal hsl = new BigDecimal(0)//换算率
	Date dvalidate//失效日期

    static constraints = {
		dvalidate(sqltype:"date")
    }
}
