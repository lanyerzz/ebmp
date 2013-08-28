import com.app.exception.BusinessException
import com.app.so.order.SoSale
import com.app.so.order.SoSaleOrder

SoSale sale=binding.getVariable('data')

if(sale.hxje!=0)
    throw  new BusinessException('订单已经收款,不允许弃审!')

   def count=SoSaleOrder.countByHeadAndNoutnumNotEqual(sale,0)

if(count){
    throw  new BusinessException('订单已经出库,不允许弃审!')
}