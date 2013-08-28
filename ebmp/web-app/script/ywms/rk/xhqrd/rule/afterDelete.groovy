import com.app.exception.BusinessException

import com.app.ywms.rk.xhjhd.YxhjhdB

def data=binding.getVariable('data')
//进行保存后处理


    if (data.sourceBillCode=='YXHJHD'){//来源是货源计划
        def source= YxhjhdB.get(data.sourceBid)
        if (!source){
            throw new BusinessException('未找到指定船舶到港单!')
        }
//
//        def use=source.slexec-it.tdsl
//
//        if (use<0){
//            throw new BusinessException('回滚货源计划可用量后，执行量出现负值！')
//        }
//
//        source.slexec=source.slexec-it.tdsl


        source.closed=false
        source.save()

    }


binding.setVariable('returnValue',data);