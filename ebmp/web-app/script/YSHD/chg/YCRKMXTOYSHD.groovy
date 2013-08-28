
import com.app.ywms.cm.lossbill.YwmsLostBill
import com.app.ywms.kc.Ycrkmx

def keys=binding.getVariable('data')
def businessKey=binding.getVariable('businessKey')

Ycrkmx mx=Ycrkmx.get(keys[0])
YwmsLostBill lb=new YwmsLostBill()
lb.businessType=mx.businessType
lb.billdate=new Date()
lb.contract=mx.ht
lb.fxl=mx.fxsl-mx.hxsl
lb.kcl=mx.insl-mx.hxsl-mx.shl
lb.pch=mx.pc
lb.invmandoc=mx.invmandoc
lb.lostDate=new Date()
lb.sourceBillCode=mx.billno
lb.sourceBillTypeCode=mx.billTypeCode
lb.sourceBillType=mx.billtype
lb.sourceBid=mx.id
lb.sourceHid=mx.id

binding.setVariable('returnValue',lb)