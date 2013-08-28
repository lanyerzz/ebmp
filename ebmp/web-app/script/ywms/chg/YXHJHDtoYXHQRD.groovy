import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType

import com.app.ywms.rk.cbdgd.YcbdgdB
import com.app.ywms.rk.xhjhd.YxhjhdB
import com.app.ywms.rk.xhqrd.Yxhqrd
import com.app.ywms.rk.xhqrd.YxhqrdGh

def data=binding.getVariable('data')
def businessKey=binding.getVariable('businessKey')
if (!data) {
    binding.setVariable('returnValue',null)
    return
}

//处理表头数据
Yxhqrd xhqrd=new Yxhqrd()

PubBusinessType businessType=PubBusinessType.get(businessKey)

xhqrd.businessType=businessType
xhqrd.businessCode=businessType.code
xhqrd.billdate=new Date()
def xhjhdB=YxhjhdB.get(data)
if (!xhjhdB) throw new BusinessException('未找到指定的卸货计划单！')
xhqrd.billTypeCode='YXHQRD';
xhqrd.billtype=PubBilltype.findByBilltypecode(xhqrd.billTypeCode)
xhqrd.tsjc=xhjhdB.tsjc
xhqrd.zgzf=xhjhdB.zgzf
xhqrd.bs=xhjhdB.bs
xhqrd.ship=xhjhdB.head.shipdoc
xhqrd.hc=xhjhdB.hc
xhqrd.contract=xhjhdB?.xghth
xhqrd.xghth=xhjhdB.xghth?.contractNo2
xhqrd.htpch=xhjhdB.pch
xhqrd.dgsj=xhjhdB.head.yjdgrq
xhqrd.bdCumandoc=xhjhdB.bdCumandoc
xhqrd.bdInvmandoc=xhjhdB.bdInvmandoc
xhqrd.myxz=xhjhdB.head.myxz
xhqrd.cddw=xhjhdB.cddw
xhqrd.tdsl=xhjhdB.tdsl-xhjhdB.slexec

xhqrd.sourceBid=xhjhdB.id
xhqrd.sourceBillCode=xhjhdB.head.billTypeCode
xhqrd.sourceHid=xhjhdB.head.id
xhqrd.sourceBillType=xhjhdB.head.billtype
xhqrd.sjsl=xhjhdB.tdsl
xhqrd.cjsl=xhjhdB.tdsl
xhqrd.gjsl=xhjhdB.tdsl
xhqrd.zcfhl=xhjhdB.tdsl
xhqrd.zdfhl=xhjhdB.tdsl
//BigDecimal zxsh //装卸损耗
//BigDecimal bgsh //保管损耗


xhqrd.bgsh=xhjhdB.xghth.bgsh
if(businessType.code=='01'){
    def sourceb=  YcbdgdB.get(xhjhdB?.sourceBid)
    xhqrd.kzdw=sourceb?.kzdw
}

xhjhdB.gh?.each {
    YxhqrdGh gh =new YxhqrdGh();
    gh.bdTank=it.gh
    gh.cjsl=it.jhsl
    gh.gjsl=it.jhsl
    gh.sjsl=it.jhsl
    xhqrd.addToGh(gh)
}

binding.setVariable('returnValue',xhqrd)
