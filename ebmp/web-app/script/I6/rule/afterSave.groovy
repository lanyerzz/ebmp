
import com.app.exception.BusinessException

def data=binding.getVariable('data')
//进行保存后处理
//def sourceBill=binding.getVariable('sourceBill')

data.bodys.each{

    if (it.sourceBillCode=='xxxx'){//来源是货源计划


        if(source.closed)
            throw new BusinessException('上游单据已经关闭！')

        source.closed=true
        source.save()
    }
}
binding.setVariable('returnValue',data);
