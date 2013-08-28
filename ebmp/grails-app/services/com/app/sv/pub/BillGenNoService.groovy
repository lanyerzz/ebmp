package com.app.sv.pub

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billno.PubBillno
import com.app.pub.billnorule.PubBillnorule
import com.app.pub.billtype.PubBilltype
import org.springframework.transaction.annotation.Propagation
import org.springframework.transaction.annotation.Transactional

import java.text.DecimalFormat

class BillGenNoService {

    //	static transactional = true
    static final int genNoLength=50//一次生成50个流水号待用
    static keys=[:]

    // int _count=0



    /**
     * 生产key 加锁
     * @param key
     */
    def getKey(key){
        if(keys[key]){  //如果已经有此类型的可以 从map 里返回key对象
            keys[key]
        }else{     //如果不存在key对象  创建key对象
            keys[key]=new Object()

        }
        return keys[key]
    }
    String getNo(String billtypecode,BdCorp bdCorp ){
        PubBilltype billtype=PubBilltype.findByBilltypecode(billtypecode)
        getNo(billtype,bdCorp);
    }
    @Transactional(propagation=Propagation.NOT_SUPPORTED)
    String getNo(PubBilltype billtype,BdCorp bdCorp ){
        //	_count++
        //if(_count>2) throw new BusinessException('单据号获取失败！');
        //增加对象锁
        synchronized (getKey(billtype.billtypecode+bdCorp.getUnitCode())){
            def date=new Date()
            //根据单据类型编码获取单类型对象

            //获取编码规则
            PubBillnorule billNoRule =PubBillnorule.findByBdCorpAndPubbilltype(bdCorp,billtype)
            if(!billNoRule) throw new BusinessException("[${billtype.billtypecode}]单据号规则未定义!");
            //尝试获取单据号
            PubBillno billno
            if(billNoRule.bdate){

                billno=   PubBillno.findWhere(pubbilltype:billtype,bdCorp:bdCorp,currentNoDate:date)
            } else
                billno = PubBillno.findByPubbilltypeAndBdCorp(billtype,bdCorp)

            if(billno){ //获取到单据号
                // billno.lock()

            }else{
                billno= genNo(billtype,bdCorp,billNoRule,date)
            }
            //单据缓存表中已经无单据号 ,重新生成单据号
            billno.delete()
            return billno.getBillno()
            //  return getNo( billtypecode, bdCorp);

        }


    }
    /**
     * 往流水号表中生成流水号
     * 使用新事务对数据生成处理
     */

    def  genNo(billtype,bdCorp,PubBillnorule billNoRule,Date date){
        //先清除此类型的所有单据号
        def bns=  PubBillno.where {bdCorp==bdCorp && pubbilltype==billtype}//.findAllByBdCorpAndPubbilltype(bdCorp,billtype)
        if(bns)
            bns.deleteAll()


        String format="00000000000000000000000000000".substring(0, billNoRule.nolength);
        DecimalFormat df=new DecimalFormat(format);
        int curNo=0;
        if(billNoRule.currentNoDate==date){
            curNo=billNoRule.currentNo
            billNoRule.currentNo=billNoRule.currentNo+genNoLength
        }else{
            billNoRule.currentNoDate=date
            billNoRule.currentNo=genNoLength
        }

        def returnNo=null
        genNoLength.times {

            String billno= "${billNoRule.subcode}${billNoRule.bdate ? date.format('yyyyMMdd') :  '' }"+df.format(curNo+it+1)
            def no= new PubBillno(bdCorp: bdCorp,pubbilltype: billtype,billno: billno,currentNoDate: date)
            //  no.save
//            nos << no

            no.save(true);
            if (!returnNo)
                returnNo=no
        }
        //PubBillno.saveAll(nos.toArray())


        billNoRule.save()


        return returnNo

    }

}
