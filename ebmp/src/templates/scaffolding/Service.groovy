

<%=packageName ? "package ${packageName}\n\n" : ''%>
import com.app.exception.BusinessException
class ${className}Service {
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
    def save(def head,delKeys){



        if(!head.isAttached()){//如果是新单据 添加单据号
            println head.billTypeCode
            println head.billtype
            def no=billGenNoService.getNo(head.billtype, head.bdCorp);
            head.billno=no


        }

        pubActionscriptService.runScript('单据类型编码','方法名',[data: head],0,null)
        //删除原有的表体

        delKeys?.each{
            def item=表体.get(it)
            head.removeFromBodys(item)
            item.delete()
        }else {
            if(head.checker)
                throw new BusinessException('单据已经审核，不允许修改！')
        }
        if(head.bodys==null || head.bodys.size()==0)
            throw new BusinessException('表体数据不能为空!')
        head.save()
        //回写 数据


//        head.fbillFlag=BillState._FREE           //设置单据为自由态






        def data = pubActionscriptService.runScript('单据类型编码','方法名',[data: head],1,null)
        return data
    }
    def delete(String id){
        def head = xxxxxxxx.get(id)//TODO
        if (!head) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if(head.checker!=null){
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }

        head?.bodys?.each {
            def rk=it.rk
            rk.hxsl=rk.hxsl-it.bcsy
            rk.save()

        }
        head.delete()
        pubActionscriptService.runScript('YXHJHD','delete',[data:yxhjhdInstance],1,null)
    }


    def check(String id){
        def head= XXXXXX.get(id)//TODO

        if(head.checker)
            throw  new BusinessException('单据已经审核！')
        head.checker=springSecurityService.currentUser
        head.checkDate=new Date()
        head.save()
    }

    def uncheck(String id){
        def head=XXXXXX.get(id) //TODO
        if(!head.checker)
            throw new BusinessException('单据未审核！')
        head.checkDate=null
        head.checker=null
        head.save()
    }
}