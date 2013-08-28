import com.app.sv.ywms.kc.YonhandnumService
import com.app.ywms.cm.lossbill.YwmsLostBill


YwmsLostBill data=binding.getVariable('data')
YonhandnumService yonhandnumService=binding.getVariable('yonhandnumService')
//会写入库明细数据.


yonhandnumService.lostNum(data)
