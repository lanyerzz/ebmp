package com.app.sv.ywms.ck


import com.app.exception.BusinessException
import com.app.ywms.ck.fhtzd.Yfhtzdb
import com.app.ywms.ck.gbd.YoutGbd
import com.app.ywms.ck.gbd.YoutGbdDetail
import com.app.ywms.kc.Ycrkmx
import org.springframework.transaction.annotation.Transactional

class YoutGbdService {

    def pubActionscriptService
    def billGenNoService
    def springSecurityService
    def yonhandnumService

    def bdCarshistoryService
    static transactional = true
    /**
     *
     * @param head
     * @param bodys
     * @param delKeys 删除的表体信息
     * @return
     */
//    @Transactional(rollbackFor = [Exception])
    def save(YoutGbd head) {


        if (!head.isAttached()) {//如果是新单据 添加单据号
            def no = billGenNoService.getNo(head.billtype, head.bdCorp);
            head.billno = no


        }else {
            if (head.checker != null) {
                throw new BusinessException('单据已经是审核状态,不能修改！')
            }
           clearTzd(head)
           YoutGbdDetail.executeUpdate('delete YoutGbdDetail where head.id=?',[head.id])
        }




        pubActionscriptService.runScript(head.billtype, 'save', [data: head], 0, null)



        head.save()
            //回写 数据
        hxtzd(head)


        //保存车辆历史信息

        bdCarshistoryService.save(head.tzd.ccm,head.pz);


        def data = pubActionscriptService.runScript(head.billtype, 'save', [data: head], 1, null)
        return data
    }

    /**
     * 取消生成的出去信息
     * @param head
     */
    private unOut(YoutGbd head){
        //锁定 通知单 库存量
       // yfhtzdService.lock( head.tzd)
        head.bodys.each {
            //删除出库信息
           def fhtzb= Yfhtzdb.get( it.sourceBid)
            yonhandnumService.deleteYcrkmx(it.id,head.billtype,fhtzb.td.id)
        }
    }

    /**
     * 生成出库信息
     * @param head
     * @return
     */
    private out(YoutGbd head){
        head.bodys.each {
            Yfhtzdb tzb=Yfhtzdb.get(it.sourceBid)
            Ycrkmx mx=new Ycrkmx()
            mx.bdCorp=head.bdCorp
            mx.crklx=1
            mx.billdate=head.billdate
            mx.gh=tzb.td.rk.gh
            mx.ht=tzb.td.rk.ht
            mx.hz=tzb.td.head.zcdw
            mx.invmandoc=it.head.tzd.hw
            mx.outsl=it.outnum
            mx.pc=tzb.td.rk.pc
            mx.sourceBid=it.id
            mx.sourceHid=head.id
            mx.sourceBillCode=head.billTypeCode
            mx.sourceBillType=head.billtype
            mx.sourceMx=tzb.td.rk
            mx.kh=tzb.td.head.zrdw
            //出库
            yonhandnumService.saveYcrkmx(mx,tzb.td.id)
        }

    }


    /**
     * 回写通知单
     */
    private hxtzd(YoutGbd head){
        head.tzd.closed=true
        head.bodys.each {

          def tzdb=  Yfhtzdb.get(it.sourceBid)

            tzdb.outnum=it.outnum


            //回写提单核销数量为真正出库数量
            tzdb.td.hxsl=tzdb.td.hxsl-tzdb.bcsy+tzdb.outnum
          //  tzdb.td.tzsl=tzdb.td.tzsl-tzdb.bcsy+tzdb.outnum


            if(head.tzd.cfkz==0){//提单内控制超发
                if(tzdb.td.bcsy<tzdb.td.hxsl)
                    throw  new BusinessException('超出提单允许发行量')
            }else  if(head.tzd.cfkz==1){
                if(head.fysl>tzdb.bcsy)
                    throw  new BusinessException('超出通知单通知数量')
            }else  if(head.tzd.cfkz==2){
                if(head.fysl>tzdb.bcsy)
                    throw  new BusinessException('超出通知单通知数量')
            }


            tzdb.td.save()
            tzdb.save()



        }

    }

    /**
     * 清除回写信息
     */
    def clearTzd(YoutGbd head){
        head.tzd.closed=false

        head.tzd.bodys.each {




            //回写提单核销数量为通知数量
            it.td.hxsl=it.td.hxsl+it.bcsy-it.outnum

            it.outnum=0
            it.td.save()
            it.save()

        }

    }

    def delete(String id) {
        def head = YoutGbd.get(id)//TODO
        if (!head) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if (head.checker != null) {
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }

        clearTzd(head)

        head.delete()
    }


    def check(String id) {
        def head = YoutGbd.get(id) //TODO

        if (head.checker)
            throw new BusinessException('单据已经审核！')
        head.checker = springSecurityService.currentUser
        head.checkDate = new Date()
        head.save()
        out(head)
    }

    def uncheck(String id) {
        def head = YoutGbd.get(id) //TODO
        if (!head.checker)
            throw new BusinessException('单据未审核！')
        head.checkDate = null
        head.checker = null
        head.save()
        unOut(head)
    }
}
