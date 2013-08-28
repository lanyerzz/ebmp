import com.app.exception.BusinessException

import com.app.ywms.rk.hyjh.YhyjhB

def data=binding.getVariable('data')
//进行保存前处理
if(data.isAttached()){


data.bodys.each{body->
    if (body.sourceBillCode=='YHYJH'){//来源是货源计划
        def source= YhyjhB.get(body.sourceBid)
        if (!source){
            throw new BusinessException('未找到指定货源计划!')
        }
//        def old=YcbdgdB.withNewSession {
//            return YcbdgdB.get(body.id)
//        }
//        //old.discard()
//        def use=source.slexec-old.tdsl
//
//        if (use<0){
//            throw new BusinessException('回滚货源计划可用量后，执行量出现负值！')
//        }
//
//        source.slexec=source.slexec-old.tdsl

        source.closed=false
        source.save()

    }
    binding.setVariable('returnValue',data);
    }

}else
    binding.setVariable('returnValue',data);