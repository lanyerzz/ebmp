import com.app.ic.bill.IcGeneralHead
import com.app.so.order.SoSale
import com.app.so.order.SoSaleOrder

IcGeneralHead  data=binding.getVariable('data')


data.body?.each {
    if(it.sourceBillCode=='S01'){//来源销售订单
        SoSaleOrder order=SoSaleOrder.get(it.sourceBid)
        order.noutnum=order.noutnum-it.noutNum
        order.save()
    }

}