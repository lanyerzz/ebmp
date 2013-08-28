package com.app.sv.ywms.ck

import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.sv.ywms.kc.YonhandnumService
import com.app.ywms.ck.zmtd.Yzmtdb
import com.app.ywms.ck.zmtd.Yzmtdh
import com.app.ywms.kc.Ycrkmx

class YzmtdService {
    def pubActionscriptService
    def billGenNoService
    def springSecurityService
    def yonhandnumService
    static  transactional = true
    def save(Yzmtdh head, bodys){


        if(bodys==null || bodys.size()==0)
            throw new BusinessException('表体数据不能为空!')
        if(!head.isAttached()){//如果是新单据 添加单据号
            def billtype =PubBilltype.findByBilltypecode(head.billTypeCode)
            def no=billGenNoService.getNo(billtype, head.bdCorp);
            head.billno=no

            //设置单据类型
            head.billtype = billtype
        }else{
            if(head.checker)
                throw new BusinessException('单据已经审核，不允许修改！')
        }

        if (head.zmlx==1 && !head.zrpc){
            head.zrpc=billGenNoService.getNo('PCH',head.bdCorp)
        }

        pubActionscriptService.runScript('YZMTD','save',[data: head],0,null)
        deleteMx(head)

        bodys.each{
//            it.head=head
            head.addToBodys(it)
//            it.head=head
//            it.save()
        }
        head.save()
        //回写 数据
        bodys?.each{

            yonhandnumService.lockNum(it.rk,it.bcsy,null,it.id,head.id,head.billTypeCode,head.billtype)

        }

//        head.fbillFlag=BillState._FREE           //设置单据为自由态






        def data = pubActionscriptService.runScript('YZMTD','save',[data: head],1,null)
        return data
    }

    def deleteMx(Yzmtdh head){
        if(head.checker!=null){
            throw new BusinessException('单据已经是审核状态,不允许重新分配明细！')
        }
        //删除原有的表体
        head?.bodys?.each {

            yonhandnumService.unLockNum(it.id)

        }
        if (head.id)
            Yzmtdb.executeUpdate('delete from Yzmtdb where head.id=?',[head.id])
    }

    def delete(String id){
        def head = Yzmtdh.get(id)
        if (!head) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if(head.checker!=null){
            throw new BusinessException('单据已经是审核状态,不能删除！')
        }

        //删除原有的表体
        head?.bodys?.each {

            yonhandnumService.unLockNum(it.id)

        }
        head.delete()
      //  pubActionscriptService.runScript(head.billtype,'delete',[data:head],1,null)
    }


    def check(String id){
       def head= Yzmtdh.get(id)

        if(head.checker)
            throw  new BusinessException('单据已经审核！')
        head.checker=springSecurityService.currentUser
        head.checkDate=new Date()
        head.save()

        if(head.zmlx==1){//货权转卖
            hqzr(head)
        }

    }

    /**
     * 货权转让
     */
    def hqzr(Yzmtdh head){


        head.bodys?.each {

            def mx =new Ycrkmx()
            mx.bdCorp=head.bdCorp
            mx.crklx=1  //出库
            mx.invmandoc=head.hw
            mx.gh=it.rk.gh
            mx.ht=it.rk.ht
            mx.hz=head.zcdw
            mx.outsl=it.bcsy

            mx.pc=it.rk.pc
            mx.sourceBid=it.id
            mx.sourceHid=head.id
            mx.sourceBillCode=head.billTypeCode
            mx.sourceBillType=head.billtype
            mx.billdate=head.billdate
            mx.kh=head.zrdw
            mx.sourceMx=Ycrkmx.get(it.rk.id)

            yonhandnumService.saveYcrkmx(mx,it.id);





            def mxr =new Ycrkmx()
            mxr.bdCorp=mx.bdCorp
            mxr.crklx=0  //入库
            mxr.invmandoc=mx.invmandoc
            mxr.gh=mx.gh
            mxr.ht=head.zrht
            mxr.hz=head.zrdw
            mxr.insl=mx.outsl

            mxr.pc=head.zrpc
            mxr.sourceBid=mx.id
            mxr.sourceHid=mx.id
            mxr.fxsl=mx.outsl

            mxr.billdate=mx.billdate
            mxr.sourceMx=mx
            yonhandnumService.saveYcrkmx(mxr);


        }
    }

    def unHqzr(Yzmtdh head){
        head.bodys?.each {

          def mx= Ycrkmx.findBySourceBid(it.id)

          def mxr=Ycrkmx.findBySourceBid(mx.id)

            if(mxr.hxsl!=0){
                throw new BusinessException('下游入库已经被使用，不允许弃审！')
            }

            yonhandnumService.deleteYcrkmx(mxr);

            yonhandnumService.deleteYcrkmx(mx);


        }
    }

    def uncheck(String id){
        def head=Yzmtdh.get(id)
        if(!head.checker)
            throw new BusinessException('单据未审核！')
       def count= Yzmtdb.countByHeadAndHxslNotEqual(head,0)
        if(count>0){
            throw new BusinessException('提单已经被执行,不允许弃审!')
        }

        head.checkDate=null
        head.checker=null
        head.save()
        if(head.zmlx==1){//货权转卖
            unHqzr(head)
        }

    }

/**
 * 查询提单可用量  用于通知单
 */
    def queryCanUse(String zrdw,String hw,businessType){
      return   Yzmtdb.createCriteria().list {
            createAlias('head','head')
            eq ('head.zmlx',0)
            eq ('head.yjqr',true)
            eq('head.zrdw.id',zrdw)
            isNotNull('head.checker')
            createAlias('head.hw','hw')
            eq('hw.id',hw)
            gt('head.yxrq',new Date())
            gtProperty('bcsy','hxsl')
            eq('head.businessType.id',businessType)
        }
    }



}
