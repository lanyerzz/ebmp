package com.app.sv.ywms.ck


import com.app.exception.BusinessException
import com.app.ywms.ck.fhtzd.Yfhtzd
import com.app.ywms.ck.fhtzd.Yfhtzdb
import com.app.ywms.rk.xhqrd.Yxhqrd

class YfhtzdService {

    def pubActionscriptService
    def billGenNoService
    def springSecurityService
    def yonhandnumService
    static  transactional = true
    /**
     *
     * @param head
     * @param bodys
     * @param delKeys  删除的表体信息
     * @return
     */
    def save(Yfhtzd head,mx){



        if(!head.isAttached()){//如果是新单据 添加单据号

            def no=billGenNoService.getNo(head.billtype, head.bdCorp);
            head.billno=no


        }else {
            if(head.checker)
                throw new BusinessException('单据已经审核，不允许修改！')
        }
        pubActionscriptService.runScript(head.billtype,'save',[data: head],0,null)
        deleteMX(head);

       // deleteGH(head);

        //
        def sum=0
        mx.each{
            head.addToBodys(it)
            sum+=it.bcsy
            it.td.hxsl=it.td.hxsl+it.bcsy


            //检查
            if( it.td.hxsl>it.td.bcsy){
                throw new BusinessException('明细超出可分配数量,请重新分配!')
            }
            it.td.save()

        }


        //检查数量
        if(sum!=head.tzsl){
            throw new BusinessException('表体本次使用数量与表头通知数量不一致!')
        }


//        gh.each{
//            head.addToGhs(it)
//        }


        head.save()
        //回写 数据
        //lock(head)

//        head.fbillFlag=BillState._FREE           //设置单据为自由态






        def data = pubActionscriptService.runScript('FY','save',[data: head],1,null)
        return data
    }




//    def lock(Yfhtzd head){
//        head.bodys.each {
//            it.save()
//
//        }
//
//    }

    def deleteMX(head){
        if(head.checker!=null){
            throw new BusinessException('单据已经是审核状态,不允许重新分配明细！')
        }

        //删除原有的表体
        head?.bodys?.each {
            def td=it.td
            td.hxsl=td.hxsl-it.bcsy
            td.save()


            head.removeFromBodys(it)
            it.delete()
        }
    }

    def deleteGH(head){
        head?.ghs?.each {

            it.delete()
        }
    }

    def delete(String id){
        def head = Yfhtzd.get(id)//TODO
        if (!head) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if(head.checker!=null){
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }

        deleteMX(head)
      //  deleteGH(head)
        head.delete()
    }


    def check(String id){
        def head= Yfhtzd.get(id) //TODO

        if(head.checker)
            throw  new BusinessException('单据已经审核！')
        head.checker=springSecurityService.currentUser
        head.checkDate=new Date()
        head.save()
    }

    def uncheck(String id){
        def head=Yfhtzd.get(id) //TODO
        if(!head.checker)
            throw new BusinessException('单据未审核！')
        def count= Yfhtzdb.countByHeadAndOutnumNotEqual(head,0)
        if(count>0){
            throw new BusinessException('单据已经被执行,不允许弃审!')
        }
        if (head.closed)
            throw new BusinessException('单据已经被关闭,不允许弃审!')

        head.checkDate=null
        head.checker=null
        head.save()
    }

    def openBill(String id){
       def ls= Yfhtzd.createCriteria().list {


           eq('id',id)
           createAlias('bodys','bodys')
           eq('bodys.outnum',BigDecimal.ZERO)
       }
        if(!ls)
            throw new BusinessException('单据已经出库,不允许打开')

        def head=ls[0];
        if(head.closed){
            lock(head)
            head.closed=false
            head.save()
        }else{
           return
        }


    }

    def closeBill(String id){
        def head= Yfhtzd.get(id)
        if(head.closed)
            return

        head.closed=true
        head.save()


        head?.bodys?.each {
            it(it.outnum!=0)
                throw new BusinessException('单据已经出库,不允许关闭!')
            def td=it.td
            td.hxsl=td.hxsl-it.bcsy
            td.save()


        }

    }

}
