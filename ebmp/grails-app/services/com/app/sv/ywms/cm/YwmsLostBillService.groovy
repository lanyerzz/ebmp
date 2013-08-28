package com.app.sv.ywms.cm


import com.app.exception.BusinessException
import com.app.ywms.cm.lossbill.YwmsLostBill

class YwmsLostBillService {

    def pubActionscriptService
    def billGenNoService
    def springSecurityService
    static transactional = true
    /**
     *
     * @param head
     * @param bodys
     * @param delKeys 删除的表体信息
     * @return
     */
    def save(def head) {


        if (!head.isAttached()) {//如果是新单据 添加单据号

            def no = billGenNoService.getNo(head.billtype, head.bdCorp);
            head.billno = no


        }

        pubActionscriptService.runScript(head.billtype, 'save', [data: head], 0, null)
        //删除原有的表体


        head.save()
        //回写 数据

//        head.fbillFlag=BillState._FREE           //设置单据为自由态


        def data = pubActionscriptService.runScript(head.billtype, 'save', [data: head], 1, null)
        return data
    }

    def delete(String id) {
        def head = YwmsLostBill.get(id)//TODO
        if (!head) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if (head.checker != null) {
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }


        head.delete()
    }

    def check(YwmsLostBill bill) {


        if (bill.checker)
            throw new BusinessException('单据已经审核！')
        bill.checker = springSecurityService.currentUser
        bill.checkDate = new Date()
        bill.save()
        pubActionscriptService.runScript(bill.billtype,'check',[data:bill],1,null)
    }


    def check(String id) {
        def head = YwmsLostBill.get(id) //TODO

       this.check(head)
    }

    def uncheck(YwmsLostBill bill) {

        if (!bill.checker)
            throw new BusinessException('单据未审核！')
        bill.checkDate = null
        bill.checker = null
        bill.save()
        pubActionscriptService.runScript(bill.billtype,'uncheck',[data:bill],1,null)
    }
    def uncheck(String id) {
        def head = YwmsLostBill.get(id) //TODO
        this.uncheck(head)
    }
}
