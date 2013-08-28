import com.app.exception.BusinessException
import com.app.ywms.rk.cbdgd.YcbdgdB

def data=binding.getVariable('data')
//进行保存后处理

data.bodys.each{
    if (it.sourceBillCode=='YCBDGD'){//来源是货源计划
        def source= YcbdgdB.get(it.sourceBid)
        if (!source){
            throw new BusinessException('未找到指定船舶到港单!')
        }

//        def use=source.slexec-it.tdsl
//
//        if (use<0){
//            throw new BusinessException('回滚货源计划可用量后，执行量出现负值！')
//        }

        source.closed=false
        source.save()

    }
    binding.setVariable('returnValue','');
}