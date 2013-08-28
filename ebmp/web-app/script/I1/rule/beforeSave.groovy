import com.app.ic.bill.IcGeneralBody
import com.app.ic.bill.IcGeneralHead
import com.app.so.order.SoSaleOrder

IcGeneralHead  head=binding.getVariable('data')

if(head.isAttached()){//修改
    def body=IcGeneralBody.withNewSession {
       return IcGeneralBody.findAllByHead(head)
    }
    body?.each {
        if(it.sourceBillCode=='S01'){//来源销售订单


            SoSaleOrder order=SoSaleOrder.get(it.sourceBid)
            order.noutnum=order.noutnum-it.noutNum
            order.save()
        }

    }
}

