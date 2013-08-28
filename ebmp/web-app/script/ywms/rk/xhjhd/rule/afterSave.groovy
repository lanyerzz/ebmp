import com.app.exception.BusinessException
import com.app.ywms.rk.cbdgd.YcbdgdB

def data=binding.getVariable('data')
//进行保存后处理
//def sourceBill=binding.getVariable('sourceBill')

data.bodys.each{

    if (it.sourceBillCode=='YCBDGD'){//来源是货源计划
        def source= YcbdgdB.get(it.sourceBid)
        if (!source){
            throw new BusinessException('未找到指定船舶到港单!')
        }
//
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
}
binding.setVariable('returnValue',data);






def rtdata=[]

def mp= data.part()
mp.shipdoc = [id:data?.shipdoc?.id,shipname:data?.shipdoc?.shipname]
mp.cddw = [id:data?.cddw?.id,pkCubasdoc:[id:data?.cddw?.pkCubasdoc?.id,custcode:data?.cddw?.pkCubasdoc?.custcode,custname:data?.cddw?.pkCubasdoc?.custname]]
mp.businessType = [id:data?.businessType?.id,name:data?.businessType?.name]
mp['bdCorp'] = [id:data?.bdCorp?.id,unitCode:data?.bdCorp?.unitCode,unitName:data?.bdCorp?.unitName]
mp.maker=[userRealName:data.maker?.userRealName]
mp.checker=[userRealName:data.checker?.userRealName]
rtdata<<mp


binding.setVariable('returnValue',rtdata)
