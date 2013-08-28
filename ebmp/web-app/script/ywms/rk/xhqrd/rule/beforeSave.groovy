import com.app.exception.BusinessException
import com.app.ywms.rk.xhjhd.YxhjhdB



def data=binding.getVariable('data')
//进行保存前处理

if(data.isAttached()){


        if (data.sourceBillCode=='YXHJHD'){//来源是船舶到港单
            def source= YxhjhdB.get(data.sourceBid)
            if (!source){
                throw new BusinessException('未找到指定卸货计划单!')
            }
//            def oldXHD=Yxhqrd.withNewSession {
//                return Yxhqrd.get(body.id)
//            }
//            // oldXHD.discard()
//            def use=source.slexec-oldXHD.tdsl
//
//            if (use<0){
//                throw new BusinessException('回滚船舶到港单可用量后，执行量出现负值！')
//            }
//
//            source.slexec=source.slexec-oldXHD.tdsl

//            if(source.closed)
//                throw new BusinessException('上游单据已经关闭！')
            source.closed=false
            source.save()

        }
        binding.setVariable('returnValue',data);




}else
    binding.setVariable('returnValue',data);

