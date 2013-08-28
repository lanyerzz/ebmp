import com.app.pub.actionscript.PubActionscriptService
import com.app.sv.ywms.cm.YwmsLostBillService
import com.app.sv.ywms.kc.YonhandnumService
import com.app.ywms.cm.lossbill.YwmsLostBill
import com.app.ywms.kc.Ycrkmx
import com.app.ywms.rk.xhqrd.Yxhqrd

Yxhqrd qrd=binding.getVariable('data')

YonhandnumService yonhandnumService=binding.getBean('yonhandnumService')
PubActionscriptService pubActionscriptService=binding.getBean('pubActionscriptService')
YwmsLostBillService ywmsLostBillService=binding.getBean('ywmsLostBillService')
qrd.gh.each {

    def mx =new Ycrkmx()
    mx.businessType=qrd.businessType

    mx.bdCorp=qrd.bdCorp
    mx.crklx=0
    mx.invmandoc=qrd.bdInvmandoc
    mx.gh=it.bdTank
    mx.ht=qrd.contract
    mx.hz=qrd.bdCumandoc
    mx.insl=it.sjsl
    mx.fxsl=it.sjsl
    mx.hc=qrd.hc
    mx.note=qrd.note
    mx.pc=qrd.htpch
    mx.sourceBid=qrd.id
    mx.sourceHid=qrd.id
    mx.sourceBillCode=qrd.billno
    mx.sourceBillType=qrd.billtype
    mx.billdate=qrd.billdate


   yonhandnumService.saveYcrkmx(mx);  //保存明细

    //生成合同损耗单
  if(qrd.htsh!=0){
      YwmsLostBill lb= pubActionscriptService.runChangeScript(mx.billtype,'YSHD')
      lb.lostType=0 //合同损耗
      ywmsLostBillService.save(lb)//保存
      ywmsLostBillService.check(lb)//审核
  }



}
