package com.app.sv.ic


import com.app.exception.BusinessException
import com.app.ic.bill.IcGeneralBody
import com.app.ic.bill.IcGeneralHead

class IcGeneralService {

    def pubActionscriptService
    def billGenNoService
    def springSecurityService
    def icOnhandnumService

    /**
     *
     * @param head
     * @param bodys
     * @param delKeys  删除的表体信息
     * @return
     */
    def save(IcGeneralHead head,delKeys){



        if(!head.isAttached()){//如果是新单据 添加单据号



            def no=billGenNoService.getNo(head.billtype, head.bdCorp);
            head.billno=no


        }else {
            if(head.checker!=null){
                throw new BusinessException('单据已经是审核状态,不允许修改！')
            }
        }

        pubActionscriptService.runScript(head.billtype,'save',[data: head],0,null)
        //删除原有的表体

        delKeys?.each{
            def item=IcGeneralBody.get(it)
            head.removeFromBodys(item)
            item.delete()
        }
        if(head.body==null || head.body.size()==0)
            throw new BusinessException('表体数据不能为空!')



        if (!head.save()) {

                throw new BusinessException(head.billtype.billtypename+':单据保存失败!'+head.errors)
        }

//        head.fbillFlag=BillState._FREE           //设置单据为自由态

        def data = pubActionscriptService.runScript(head.billtype,'save',[data: head],1,null)
        return data
    }



    def delete(String id){
        def head = IcGeneralHead.get(id)//TODO
        if (!head) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if(head.checker!=null){
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }

        head.delete()

        pubActionscriptService.runScript(head.billTypeCode,'delete',[data:head],1,null)
    }


    def check(String id){
        def head= IcGeneralHead.get(id) //TODO

        if(head.checker)
            throw  new BusinessException('单据已经审核！')
        head.checker=springSecurityService.currentUser
        head.checkDate=new Date()
        head.save()



        icOnhandnumService.updateHandNum(head,false)
        pubActionscriptService.runScript(head.billTypeCode,'check',[data:head],1,null)
    }

    def uncheck(String id){
        def head=IcGeneralHead.get(id) //TODO
        if(!head.checker)
            throw new BusinessException('单据未审核！')
        head.checkDate=null
        head.checker=null
        head.save()
        icOnhandnumService.updateHandNum(head,true)
        pubActionscriptService.runScript(head.billTypeCode,'uncheck',[data:head],1,null)
    }
}
