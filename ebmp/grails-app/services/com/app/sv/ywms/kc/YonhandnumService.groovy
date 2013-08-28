package com.app.sv.ywms.kc

import com.app.bd.invmandoc.BdInvmandoc
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.ywms.cm.lossbill.YwmsLostBill
import com.app.ywms.kc.Ycrkmx
import com.app.ywms.kc.YcrkmxLock
import com.app.ywms.kc.Yonhandnum
import com.app.ywms.kc.YonhandnumLock
import groovy.transform.Synchronized

class YonhandnumService {
    static transactional = true
    def billGenNoService

    /**
     * 锁定库存量
     */
    def lockNum( Ycrkmx mx,lockNum,String note,sourceBid,sourceHid,sourceBillCode,sourceBillType){


          YcrkmxLock lock=new YcrkmxLock()
          lock.lockNum=lockNum
          lock.head=mx
          lock.vnote=note
          lock.sourceBid=sourceBid
          lock.sourceHid=sourceHid
          lock.sourceBillCode=sourceBillCode
          lock.sourceBillType=sourceBillType
          mx.lockNum=mx.lockNum?:0+lockNum
          if(mx.lockNum>mx.fxsl-mx.hxsl)
                throw new BusinessException('超出可用量,最大锁定量为:'+(mx.fxsl-mx.hxsl))
          mx.save()


          lock.save()

            def hand= getIcOnhandnum(mx.bdCorp,mx.invmandoc,mx.gh)
           if(hand.isAttached()){

            hand.lockNum=hand.lockNum+lockNum
            if(hand.lockNum>hand.fxsl){
                throw new BusinessException('超出最大锁定量,最大锁定量为:'+hand.fxsl)
            }
            hand.save()
        }else{
               throw new BusinessException('库存量信息丢失!')
        }



    }

    /**
     * 解除锁定库存量
     */
    def unLockNum( sourceBid){
       def lock= YcrkmxLock.findBySourceBid(sourceBid)
        if(lock){
            def head=lock.head
            head.lockNum=head.lockNum-lock.lockNum

            head.removeFromLocks(lock)
            lock.delete()
            head.save()

            def hand= getIcOnhandnum(head.bdCorp,head.invmandoc,head.gh)
            if(hand.isAttached()){

                hand.lockNum=hand.lockNum-lock.lockNum
                if(hand.lockNum<0){
                    throw new BusinessException('锁定量出现负值!')
                }
                hand.save()
             }
        }
        else{
            throw  new BusinessException('未找到指定库存信息')
        }

    }

    /**
     * 正数  增加锁定量
     * 负值  减少锁定量
     * @param sourceBid
     * @param dflockNum
     * @return
     */
    def editLockNum( sourceBid,dflockNum){
        def lock= YcrkmxLock.findBySourceBid(sourceBid)
        if(lock){
            def head=lock.head
            head.lockNum=head.lockNum+dflockNum
            lock.lockNum=lock.lockNum+dflockNum
            head.save()

            def hand= getIcOnhandnum(head.bdCorp,head.invmandoc,head.gh)
            if(hand.isAttached()){

                hand.lockNum=hand.lockNum+dflockNum
                if(hand.lockNum<0){
                    throw new BusinessException('锁定量出现负值!')
                }
                hand.save()
            }
        }
        else{
            //throw  new BusinessException('未找到指定库存信息')
        }

    }



    def unLostNum(YwmsLostBill lostBill){
        //回写入库明细数据.
        def mx=Ycrkmx.get(lostBill.sourceBid)

        mx.lock()

        mx.shl=mx.shl- lostBill.shsl
        mx.fxsl=mx.insl-mx.shl

        mx.save()

        def hand= getIcOnhandnum(mx.bdCorp,mx.invmandoc,mx.gh)
        if(hand.isAttached()){


            hand.fxsl=hand.fxsl+lostBill.shsl
            hand.save()
        }

    }


    def lostNum(YwmsLostBill lostBill){
        //回写入库明细数据.
        def mx=Ycrkmx.get(lostBill.sourceBid)

        mx.lock()

        mx.shl=mx.shl+ lostBill.shsl
        mx.fxsl=mx.insl-mx.shl

        mx.save()

        def hand= getIcOnhandnum(mx.bdCorp,mx.invmandoc,mx.gh)
        if(hand.isAttached()){


            hand.fxsl=hand.fxsl-lostBill.shsl
            hand.save()
        }

    }
    def saveYcrkmx(Ycrkmx hand){


        saveYcrkmx(hand,null)

    }

    def saveYcrkmx(Ycrkmx hand,String lockSourceBid){

        hand.billTypeCode='YCRKMX'
        hand.billtype=PubBilltype.findByBilltypecode(hand.billTypeCode)

        if(!hand.isAttached()){//如果是新单据 添加单据号

            def no=billGenNoService.getNo(hand.billtype, hand.bdCorp);
            hand.billno=no

            //设置单据类型
//            head.billType=PubBilltype.findByBilltypecode(head.cbillTypeCode)
        }

            if(!hand.validate()){

                log.error(hand.errors)
                 throw  new BusinessException('出入库明细校验错误！')
            }
            hand.save()
           //更新现存量
            updateHandNum([hand],false)


        if(hand.crklx==1){//出库类型 ,需要回写  入库明细

            hand.sourceMx.hxsl=hand.sourceMx.hxsl+hand.outsl
            hand.sourceMx.save()
            if(lockSourceBid){
                editLockNum(lockSourceBid,0-hand.outsl);
            }
        }



    }

    def deleteYcrkmx(String sourcebid,PubBilltype sourceBilltype){
        def mx=  Ycrkmx.findBySourceBidAndSourceBillType(sourcebid,sourceBilltype)


         deleteYcrkmx(mx);
    }

    def deleteYcrkmx(String sourcebid,PubBilltype sourceBilltype,String lockSourceBid){
        def mx=  Ycrkmx.findBySourceBidAndSourceBillType(sourcebid,sourceBilltype)


        deleteYcrkmx(mx,lockSourceBid);
    }
    def deleteYcrkmx(Ycrkmx hand){
        deleteYcrkmx(hand,null)
    }
    def deleteYcrkmx(Ycrkmx hand,String lockSourceBid){
        if(hand.hxsl?:0 !=0) throw new BusinessException('存量已经被使用,无法删除!')
        hand.delete()
        //更新现存量
        updateHandNum([hand],true)

        if(hand.crklx==1){//出库类型 ,需要回写  入库明细

            hand.sourceMx.hxsl=hand.sourceMx.hxsl-hand.outsl
            hand.sourceMx.save()
            if(lockSourceBid){
                editLockNum(lockSourceBid,hand.outsl);
            }
        }
    }


    /**
     * 查询现存量

     * @return
     */
    def queryHandNum(def corp,BdInvmandoc invmandoc, gh){
        def hands=  Yonhandnum.executeQuery(""" select   bdCorp,invmandoc,gh, sum(fxsl) from Yonhandnum where bdCorp=?
and invmandoc=?
and gh=?
group by bdCorp,invmandoc,gh
""",
                [corp,invmandoc,gh])
        if(hands?.size()==0) return null;
        return hands

    }

    /**
     *
     * @param corp
     * @param invmandoc
     * @param invbasdoc
     * @param vlot
     * @param warehouse
     * @param calbody
     * @param astunit
     * @param hsl
     * @param dvalidate
     * @param cubasdoc
     * @return
     */
   private Yonhandnum getIcOnhandnum ( bdCorp, invmandoc,gh){
        //根据条件查询现存量

        return Yonhandnum.findOrCreateWhere(bdCorp: bdCorp,invmandoc:invmandoc,gh: gh)

    }



     Hashtable keys=new Hashtable()

    def getKey(def bdCorp,def invmandoc,def pc,def hz,gh,ht){
        def key=bdCorp.id+'_'+invmandoc.id+'_'+pc+'_'+gh.id+'_'+ht.id
        if(keys.get(key)){
            return keys.get(key)
        }else {
            Object keyObject=new Object();
            keys.put(key,keyObject);
            return keyObject;
        }
    }

    /**
     *
     * @param header
     * @param callback      是否是反操作
     * @return
     * @throws BusinessException
     */

    def  updateHandNum( mxs,Boolean callback){

        Yonhandnum num
            mxs.each {
                Ycrkmx mx=it;


                    num=this.getIcOnhandnum(it.bdCorp, it.invmandoc,it.gh);


                    if(num.isAttached())
                        num.lock()
                    if(callback)
                    {
                        num.kcl=num.kcl-it.insl+it.outsl
                        num.fxsl=num.fxsl-it.insl+it.outsl
                        if(num.fxsl<0){
                            throw new BusinessException("现存量为负")
                        }
                    }else{
                        num.kcl=num.kcl+it.insl-it.outsl
                        num.fxsl=num.fxsl+it.insl-it.outsl
                        if(num.fxsl<0){
                            throw new BusinessException("现存量为负")
                        }
                    }

                    if(!num.validate()){
                        log.error(num.errors)
                        throw new BusinessException('现存量表更新时数据校验错误！');
                    }


                    num.save()


            }

    }

}
