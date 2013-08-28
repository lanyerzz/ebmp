
import com.app.exception.BusinessException


def data=binding.getVariable('data')
//进行保存前处理

if(data.isAttached()){


    data.bodys.each{body->

        if (body.sourceBillCode=='xxxxx'){//来源是船舶到港单


        }
        binding.setVariable('returnValue',data);
    }


}else
    binding.setVariable('returnValue',data);
