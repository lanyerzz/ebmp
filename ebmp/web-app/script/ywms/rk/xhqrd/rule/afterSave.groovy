import com.app.exception.BusinessException

import com.app.ywms.rk.xhjhd.YxhjhdB

def data=binding.getVariable('data')
//进行保存后处理
//def sourceBill=binding.getVariable('sourceBill')

println 'sourceBillCode:--------------------'+data.sourceBillCode

    if (data.sourceBillCode=='YXHJHD'){//来源是货源计划
        def source= YxhjhdB.get(data.sourceBid)
        if (!source){
            throw new BusinessException('未找到指定船舶到港单!')
        }

//        def canUse=source.tdsl.subtract(source.slexec)
//        println 'af new:'+source.slexec
//        println 'af new:'+it.tdsl
//        if (it.tdsl>canUse){
//            throw new BusinessException('提单数量超出货源计划可用量！')
//        }

        if(source.closed)
            throw new BusinessException('上游单据已经关闭！')
        source.closed=true
        source.save()
    }







def rtdata=[]

def mp= data.part()

mp.businessType=data.businessType.part()
//mp.shipdoc = [id:data?.shipdoc?.id,shipname:data?.shipdoc?.shipname]
//mp.cddw = [id:data?.cddw?.id,pkCubasdoc:[id:data?.cddw?.pkCubasdoc?.id,custcode:data?.cddw?.pkCubasdoc?.custcode,custname:data?.cddw?.pkCubasdoc?.custname]]
//mp.businessType = [id:data?.businessType?.id,name:data?.businessType?.name]
//mp['bdCorp'] = [id:data?.bdCorp?.id,unitCode:data?.bdCorp?.unitCode,unitName:data?.bdCorp?.unitName]
//mp.maker=[userRealName:data.maker?.userRealName]
//mp.checker=[userRealName:data.checker?.userRealName]
rtdata<<mp


binding.setVariable('returnValue',rtdata)
