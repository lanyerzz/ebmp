
import com.app.ic.bill.IcGeneralHead
import com.app.ic.special.IcSpecialB

IcGeneralHead  head=binding.getVariable('data')

head.body?.each {
    if(it.sourceBillCode=='I6'){//来源转库单
        IcSpecialB b=IcSpecialB.get(it.sourceBid)
        b.innum=(b.innum?:0) - (it.ninNum?:0)
        b.inastnum=(b.inastnum?:0) - (it.ninassistNum?:0)
        b.save()
    }

}