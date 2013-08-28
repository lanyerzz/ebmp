import com.app.exception.BusinessException
import com.app.ywms.rk.cbdgd.YcbdgdB
import com.app.ywms.rk.hyjh.YhyjhB

def data=binding.getVariable('data')
//进行保存后处理
//def sourceBill=binding.getVariable('sourceBill')

    data.bodys.each{

        if (it.sourceBillCode=='YHYJH'){//来源是货源计划
            def source= YhyjhB.get(it.sourceBid)
            if (!source){
                throw new BusinessException('未找到指定货源计划!')
            }
//
//                def canUse=source.sl.subtract(source.slexec)
//
//                if (it.tdsl>canUse){
//                    throw new BusinessException('提单数量超出货源计划可用量！')
//                }

            if(source.closed)
                throw new BusinessException('上游单据已经关闭！')
            source.closed=true
            source.save()
        }
    }






    def rtdata=[]

        def mp= data.part()
       // mp['hzdw'] = [id:data.hzdw?.id,pkCubasdoc:[id: data?.hzdw?.pkCubasdoc?.id,custcode:data?.hzdw?.pkCubasdoc?.custcode,custname:data?.hzdw?.pkCubasdoc?.custname]]
        mp['bdCorp'] = [id:data?.bdCorp?.id,unitCode:data?.bdCorp?.unitCode,unitName:data?.bdCorp?.unitName]
        mp.maker=[userRealName:data.maker?.userRealName]
        mp.checker=[userRealName:data.checker?.userRealName]

        rtdata<<mp


    binding.setVariable('returnValue',rtdata)
