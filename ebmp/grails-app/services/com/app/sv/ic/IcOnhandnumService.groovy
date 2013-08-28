package com.app.sv.ic

import com.app.domain.ic.bill.IcGeneralHead;
import com.app.domain.ic.handnum.IcOnhandnum;
import com.app.exception.BusinessException
import com.app.ic.bill.IcGeneralHead
import com.app.ic.handnum.IcOnhandnum;

class IcOnhandnumService {

    /**
     *
     * @param header
     * @param callback      是否是反操作
     * @return
     * @throws BusinessException
     */
   def updateHandNum(IcGeneralHead header,Boolean callback){
	   if(!header.bdCorp) throw new BusinessException('出入库单据表头公司不能为空!')
	   if(!header.cwarehouse) throw new BusinessException('出入库单据表头仓库不能为空!')
	   if(!header.cwarehouse.calbody) throw new BusinessException('出入库单据仓库未分配库存组织不能为空!')
	   
	   
	   
	   header.body.each {
		   
		   if(!it.bdInvmandoc) throw new BusinessException('出入库单据表体存货管理档案不能为空!');
		   
		  IcOnhandnum num=this.getIcOnhandnum(header.bdCorp, it.bdInvmandoc, it.bdInvmandoc.pkInvbasdoc, it.vbatchcode,header.cwarehouse, header.cwarehouse.calbody, it.astunit, it.hsl, it.dvaliDate,  header.cprovider?.pkCubasdoc,it.pack);
		  
		 if(num.isAttached())
		   	num.lock()
           if(callback)
           {	
	               num.nonhandnum=num.nonhandnum-it.ninNum+it.noutNum
	               num.nonhandastnum=num.nonhandastnum-it.ninassistNum+it.noutassistNum
				   if(num.nonhandnum<0||num.nonhandastnum<0){
				   		throw new BusinessException("现存量为负")
				   }
           }else{
               num.nonhandnum=num.nonhandnum+it.ninNum-it.noutNum
               num.nonhandastnum=num.nonhandastnum+it.ninassistNum-it.noutassistNum
			   
			   if(num.nonhandnum<0||num.nonhandastnum<0){
				   throw new BusinessException("现存量为负")
			   }
           }

		  num.save()
		 
	   }
	   
	  
	   
   }
   
   /**
    * 查询现存量
    * @param corp 公司
    * @param invmandoc  存货管理档案
    * @param invbasdoc	存货基本档案
    * @param vlog	批次号
    * @param warehouse 仓库
    * @param calbody	库存组织
    * @param astunit	辅助计量
    * @param hsl	换算率
    * @param dvalidate	失效日期
    * @param cubasdoc
    * @return
    */
   def queryHandNum(def corp,def invmandoc,def invbasdoc,def vlot,def warehouse,def calbody,def astunit,def hsl,def dvalidate,def cubasdoc,def pack){
	 def hands=  IcOnhandnum.executeQuery(""" select   corp,invmandoc,invbasdoc,vlot,warehouse,calbody,astunit,hsl,dvalidate,cubasdoc, sum(nonhandnum),sum(nonhandastnum) from IcOnhandnum where corp=?
and invmandoc=?
and invbasdoc=?
and vlot=?
and warehouse=?
and calbody=?
and astunit=?
and hsl=?
and dvalidate=?
and cubasdoc=?
and pack=?
group by corp,invmandoc,invbasdoc,vlot,warehouse,calbody,astunit,hsl,dvalidate,cubasdoc,pack
""",
		 [corp,invmandoc,invbasdoc,vlot,warehouse,calbody,astunit,hsl,dvalidate,cubasdoc,pack])
	 if(hands?.size()==0) return null;
	 return hands
	   
   }
   
   
   /**
    * 
    * @param corp 公司
    * @param invmandoc  存货管理档案
    * @param invbasdoc	存货基本档案
    * @param vlog	批次号
    * @param warehouse 仓库
    * @param calbody	库存组织
    * @param astunit	辅助计量
    * @param hsl	换算率
    * @param dvalidate	失效日期
    * @param cubasdoc
    * @return
    */
   private IcOnhandnum getIcOnhandnum (def corp,def invmandoc,def invbasdoc,def vlot,def warehouse,def calbody,def astunit,def hsl,def dvalidate,def cubasdoc,def pack){
	  //根据条件查询现存量
       if(cubasdoc)
	        return IcOnhandnum.findOrCreateWhere(corp:corp,invmandoc:invmandoc,invbasdoc:invbasdoc,vlot:vlot,warehouse:warehouse,calbody:calbody,astunit:astunit,hsl:hsl,dvalidate:dvalidate,cubasdoc:cubasdoc,pack:pack)
        else
            return   IcOnhandnum.findOrCreateWhere(corp:corp,invmandoc:invmandoc,invbasdoc:invbasdoc,vlot:vlot,warehouse:warehouse,calbody:calbody,astunit:astunit,hsl:hsl,dvalidate:dvalidate,pack:pack)

   }
   
}
