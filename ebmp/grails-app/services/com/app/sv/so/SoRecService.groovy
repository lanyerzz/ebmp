package com.app.sv.so

import com.app.exception.BusinessException
import com.app.so.rec.SoRec
import com.app.so.rec.SoRecBody

class SoRecService {

    def pubActionscriptService
    def billGenNoService
    def springSecurityService
    static  transactional = true

    def save(SoRec head,delKeys){



        if(!head.isAttached()){//如果是新单据 添加单据号

            def no=billGenNoService.getNo(head.billtype, head.bdCorp);
            head.billno=no


            //回写 数据
            if(head.sourceBill.hxje==null){
                head.sourceBill.hxje=0;
            }
            println head.zk +'zk'
            println head.hxje +'hxje'
            head.sourceBill.hxje=head.sourceBill.hxje+(head.hxje+head.zk)


        }else {
           def rec= SoRec.withNewTransaction {
                return SoRec.get(head.id)
            }

            if(head.checker!=null)
                throw new BusinessException('单据已经审核，不允许修改')

            head.sourceBill.hxje=(head.sourceBill.hxje-rec.hxje-rec.zk)
            head.sourceBill.hxje+=(head.hxje+head.zk)
        }

        if (head.sourceBill.hxje>head.sourceBill.nrecmnny){
            new BusinessException('订单收款金额+折扣金额不能大于订单折扣后金额！')
        }

        //删除原有的表体

        delKeys?.each{
            def item=SoRecBody.get(it)
            head.removeFromBodys(item)
            item.delete()
        }
        if(head.bodys==null || head.bodys.size()==0)
            throw new BusinessException('表体数据不能为空!')
        head.save()


//        head.fbillFlag=BillState._FREE           //设置单据为自由态

//回写  订单
        head.sourceBill.save()



        def data = head.part([defaultPart:true])
        return data
    }



    def delete(String id){
        def head = SoRec.get(id)
        if (!head) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if(head.checker!=null){
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }


        head.delete()
        head.sourceBill.hxje=head.sourceBill.hxje-(head.hxje+head.zk)
        head.sourceBill.save()
    }


    def check(String id){
        def head= SoRec.get(id)

        if(head.checker)
            throw  new BusinessException('单据已经审核！')
        head.checker=springSecurityService.currentUser
        head.checkDate=new Date()
        head.save()
    }

    def uncheck(String id){
        def head=SoRec.get(id)
        if(!head.checker)
            throw new BusinessException('单据未审核！')
        head.checkDate=null
        head.checker=null
        head.save()
    }
}
