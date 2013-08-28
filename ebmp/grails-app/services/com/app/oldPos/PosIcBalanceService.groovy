package com.app.oldPos


import com.app.exception.BusinessException
import com.app.ic.handnum.IcOnhandnum
import org.apache.commons.lang.StringUtils

class PosIcBalanceService {

    static expose = ['cxf']

    public BigDecimal queryStorShuLiang(String storId, String invmanid,
                                        String corpId,String zhuangShuId) throws BusinessException {



        if(StringUtils.isEmpty(storId)){
            throw new BusinessException("仓库主键不可以为空");
        }
        if(StringUtils.isEmpty(invmanid)){
            throw new BusinessException("存货主键不可以为空");
        }
        if(StringUtils.isEmpty(corpId)){
            throw new BusinessException("公司主键不可以为空");
        }


        //用于存放查询条件
        // StringBuffer hsql = new StringBuffer("select sum(c.nnum) from IcOnhandnum c where c.pk_stordoc.pk_stordoc=?
        // and c.pk_invbasdoc.pkInvbasdoc=? and c.pk_corp.pkCorp=?");

        def rs
        def num=0

        if(zhuangShuId){
            //hsql.append(" and c.vfree1=? ");
            rs=IcOnhandnum.executeQuery('select sum(c.nonhandnum) as num from IcOnhandnum c where c.warehouse.id=? and c.id=? and c.corp.id=? and c.pack.id=?',
                    [storId,invmanid,corpId,zhuangShuId])
        }else {
            rs=IcOnhandnum.executeQuery('select sum(c.nonhandnum) as num from IcOnhandnum c where c.warehouse.id=? and c.id=? and c.corp.id=? ',
                    [storId,invmanid,corpId])
        }
        println(rs)
        num= rs?.num?:0


         return num;
    }
}
