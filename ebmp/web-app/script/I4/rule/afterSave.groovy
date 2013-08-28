import com.app.ic.bill.IcGeneralHead
import com.app.ic.special.IcSpecialB

IcGeneralHead  head=binding.getVariable('data')

head.body?.each {
    if(it.sourceBillCode=='I6'){//来源转库单
        IcSpecialB b=IcSpecialB.get(it.sourceBid)
        b.outnum=(b.outnum?:0) + (it.noutNum?:0)
        b.outastnum=(b.outastnum?:0) + (it.noutassistNum?:0)
        b.save()
    }

}