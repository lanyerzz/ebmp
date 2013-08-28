package com.app.ywms.rk

import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.ywms.rk.hyjh.Yhyjh
import com.app.ywms.rk.hyjh.YhyjhB

class YhyjhService {
    static transactional = true
    def springSecurityService
    def billGenNoService
    def save(Yhyjh head,keys){


        if(head.bodys==null || head.bodys.size()==0)
            throw new BusinessException('表体数据不能为空!')

        if(!head.isAttached()){//如果是新单据 添加单据号
           def billtype =PubBilltype.findByBilltypecode(head.billTypeCode)
            def no=billGenNoService.getNo(billtype, head.bdCorp);
            head.billno=no
            head.billtype=billtype
            //设置单据类型
//            head.billType=PubBilltype.findByBilltypecode(head.cbillTypeCode)
        }
//        head.fbillFlag=BillState._FREE           //设置单据为自由态

        head.save(flush: true)


        if(keys)
            YhyjhB.executeUpdate("delete from YhyjhB where id in ?",keys)
    }

}
