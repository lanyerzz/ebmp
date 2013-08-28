package com.app.sv.ywms.rk

import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.ywms.rk.xhjhd.Yxhjhd
import com.app.ywms.rk.xhjhd.YxhjhdB

class YxhjhdService {

    static transactional = true
    def springSecurityService
    def billGenNoService
    def pubActionscriptService

    def save(Yxhjhd head,keys){


        if(head.bodys==null || head.bodys.size()==0)
            throw new BusinessException('表体数据不能为空!')
        if(!head.isAttached()){//如果是新单据 添加单据号
            def billtype =PubBilltype.findByBilltypecode(head.billTypeCode)
            def no=billGenNoService.getNo(billtype, head.bdCorp);
            head.billno=no

            //设置单据类型
            head.billtype = billtype
        }

       pubActionscriptService.runScript('YXHJHD','save',[data: head],0,null)
//        head.fbillFlag=BillState._FREE           //设置单据为自由态


        head.save()


        if(keys)
            YxhjhdB.executeUpdate("delete from YxhjhdB where id in ?",keys)
        def data = pubActionscriptService.runScript(head.billTypeCode,'save',[data: head],1,null)
        return data
    }
    def delete(String id){
        def yxhjhdInstance = Yxhjhd.get(id)
        if (!yxhjhdInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if(yxhjhdInstance.checker!=null){
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }
        yxhjhdInstance.delete(flush: true)
        pubActionscriptService.runScript(yxhjhdInstance.billTypeCode,'delete',[data:yxhjhdInstance],1,null)
    }
}
