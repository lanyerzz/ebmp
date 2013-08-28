package com.app.sv.ywms.rk

import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.ywms.kc.Ycrkmx
import com.app.ywms.rk.xhqrd.Yxhqrd
import com.app.ywms.rk.xhqrd.YxhqrdGh

class YxhqrdService {

    static transactional = true
    def springSecurityService
    def billGenNoService
    def pubActionscriptService

    def save(Yxhqrd head,keys){
        println 'fdasfdsafdsaf-d=f-=dsa-f=dsa-f=dsa-f=das-'
        println head.bdCorp.unitCode
        println head.billtype.billtypecode
        if(!head.isAttached()){//如果是新单据 添加单据号


            def no=billGenNoService.getNo(head.billtype, head.bdCorp);
            head.billno=no

        }
//        head.fbillFlag=BillState._FREE           //设置单据为自由态
        pubActionscriptService.runScript(head.billTypeCode,'save',[data: head],0,null)



        head.save()

        if(keys)
            YxhqrdGh.executeUpdate("delete from YxhqrdGh where id in ?",keys)
        def data = pubActionscriptService.runScript(head.billTypeCode,'save',[data: head],1,null)
        return data
    }
    def delete(String id){
        def yxhjhdInstance = Yxhqrd.get(id)
        if (!yxhjhdInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if(yxhjhdInstance.checker!=null){
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }
        yxhjhdInstance.delete(flush: true)
        pubActionscriptService.runScript(yxhjhdInstance.billTypeCode,'delete',[data:yxhjhdInstance],1,null)
    }

    def check(Yxhqrd qrd){
        if(qrd.checker!=null){
            throw new BusinessException('单据已经是审核状态！')
        }
        def user = springSecurityService.currentUser
        qrd.checker = user
        qrd.checkDate = new Date()
        qrd.save()



       pubActionscriptService.runScript(qrd.billTypeCode,'check',[data:qrd],1,null)
    }

    def uncheck(Yxhqrd qrd){
        if(qrd.checker==null){
            throw new BusinessException('单据未被审核，弃审动作失败！')
        }

        if(qrd.closed){
            throw new BusinessException('单据已被执行，无法弃审!')
        }
        qrd.checker = null
        qrd.checkDate = null
        qrd.save()
        pubActionscriptService.runScript(qrd.billTypeCode,'uncheck',[data:qrd],1,null)
    }
}
