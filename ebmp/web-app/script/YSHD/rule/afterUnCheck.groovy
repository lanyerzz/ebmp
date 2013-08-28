import com.app.sv.ywms.kc.YonhandnumService
import com.app.ywms.cm.lossbill.YwmsLostBill
import com.app.ywms.kc.Ycrkmx

YwmsLostBill data=binding.getVariable('data')

YonhandnumService yonhandnumService=binding.getVariable('yonhandnumService')
yonhandnumService.unLostNum(data)