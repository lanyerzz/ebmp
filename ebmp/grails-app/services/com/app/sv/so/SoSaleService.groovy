package com.app.sv.so

import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.so.order.SoSale
import com.app.so.order.SoSaleOrder

class SoSaleService {

    def pubActionscriptService
    def billGenNoService
    def springSecurityService
    static  transactional = true
    /**
     *
     * @param head
     * @param bodys
     * @param delKeys  删除的表体信息
     * @return
     */
    def save(SoSale head,delKeys){



        if(!head.isAttached()){//如果是新单据 添加单据号

            def no=billGenNoService.getNo(head.billtype, head.bdCorp);
            head.billno=no


        }else{
            if(head.checker!=null)
                throw new BusinessException('单据已经审核，不允许修改！')
        }

        //计算折扣率



        head.ndiscountrate=head.nrecmnny.divide(head.nheadsummny, 8,BigDecimal.ROUND_HALF_UP)

        pubActionscriptService.runScript('S01','save',[data: head],0,null)
        //删除原有的表体

        delKeys?.each{
            def item=SoSaleOrder.get(it)
            head.removeFromBodys(item)
            item.delete()
        }
        if(head.bodys==null || head.bodys.size()==0)
            throw new BusinessException('表体数据不能为空!')
          head.save()
        //回写 数据


//        head.fbillFlag=BillState._FREE           //设置单据为自由态






        def data = pubActionscriptService.runScript('S01','save',[data: head],1,null)
        return data
    }
    def delete(String id){
        def head = SoSale.get(id)
        if (!head) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if(head.checker!=null){
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }

        if(head.hxje!=0){
            throw  new BusinessException('订单已经收款，不能删除！')
        }

        pubActionscriptService.runScript('S01','delete',[data:head],0,null)

        head.delete()
        pubActionscriptService.runScript('S01','delete',[data:head],1,null)
    }


    def check(String id){
        def head= SoSale.get(id)

        if(head.checker)
            throw  new BusinessException('单据已经审核！')
        head.checker=springSecurityService.currentUser
        head.checkDate=new Date()
        head.save()
    }

    def uncheck(String id){
        def head=SoSale.get(id)
        if(!head.checker)
            throw new BusinessException('单据未审核！')
        head.checkDate=null
        head.checker=null
        head.save()
    }

}
