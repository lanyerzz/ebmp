import com.app.ic.bill.IcGeneralHead
import com.app.so.order.SoSaleOrder

IcGeneralHead  head=binding.getVariable('data')

head.body?.each {
    if(it.sourceBillCode=='S01'){//来源销售订单
        SoSaleOrder order=SoSaleOrder.get(it.sourceBid)
        order.noutnum=(order.noutnum?:0) + (it.noutNum?:0)

        order.save()
    }

}