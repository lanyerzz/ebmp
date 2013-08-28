import com.app.exception.BusinessException
import com.app.sv.ywms.kc.YonhandnumService
import com.app.ywms.cm.lossbill.YwmsLostBill
import com.app.ywms.kc.Ycrkmx
import com.app.ywms.rk.xhqrd.Yxhqrd

Yxhqrd data=binding.getVariable('data')
YonhandnumService yonhandnumService=binding.getBean('yonhandnumService')

 def mxs=Ycrkmx.findAllBySourceHid(data.id)

mxs?.each {
    if(YwmsLostBill.countBySourceBid(it.id)>0){
        throw  new BusinessException('存在对应的损耗单,不允许删除!')
    }
    yonhandnumService.deleteYcrkmx(it)
}


