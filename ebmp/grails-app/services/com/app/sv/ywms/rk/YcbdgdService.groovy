package com.app.sv.ywms.rk

import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.util.SystemConfig
import com.app.ywms.rk.cbdgd.Ycbdgd
import com.app.ywms.rk.cbdgd.YcbdgdB

import javax.servlet.ServletConfig

class YcbdgdService {

    static transactional = true
    def springSecurityService
    def billGenNoService
    def pubActionscriptService
    def save(Ycbdgd head,keys){

        if(head.bodys==null || head.bodys.size()==0)
            throw new BusinessException('表体数据不能为空!')
        if(!head.isAttached()){//如果是新单据 添加单据号
            def billtype =PubBilltype.findByBilltypecode(head.billTypeCode)
            def no=billGenNoService.getNo(billtype, head.bdCorp);
            head.billno=no
            head.billtype=billtype
            //设置单据类型

        }



//        head.fbillFlag=BillState._FREE           //设置单据为自由态
        head.save()


        if(keys)
            YcbdgdB.executeUpdate("delete from YcbdgdB where id in ?",keys)



        head.bodys.each {
            if(!it.pch)
                it.pch=billGenNoService.getNo('PCH', head.bdCorp);
        }


        def data = pubActionscriptService.runScript(head.billTypeCode,'save',[data: head],1,null)
        return data
    }



    def delete(String id) {
        def ycbdgdInstance = Ycbdgd.get(id)
        if (!ycbdgdInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if(ycbdgdInstance.checker!=null){
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }
        ycbdgdInstance.delete(flush: true)
        pubActionscriptService.runScript('YCBDGD','delete',[data: ycbdgdInstance],1,null)


    }
}
