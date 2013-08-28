import com.app.exception.BusinessException
import com.app.pub.businesstype.PubBusinessType
import com.app.ywms.rk.hyjh.Yhyjh
import com.app.ywms.rk.xhjhd.Yxhjhd
import com.app.ywms.rk.xhjhd.YxhjhdB
import com.app.ywms.rk.cbdgd.YcbdgdB

def data=binding.getVariable('data')
def businessKey=binding.getVariable('businessKey')
if (!data) {
    binding.setVariable('returnValue',null)
    return
}

//处理表头数据
Yxhjhd head=new Yxhjhd()
PubBusinessType businessType=PubBusinessType.get(businessKey)
head.businessType=businessType
head.businessCode=businessType.code
def cbdgdb=YcbdgdB.get(data[0])
if (!cbdgdb) throw new BusinessException('未找到指定的船舶到港单')
head.billTypeCode='YXHJHD';

head.shipdoc=cbdgdb.head.chuanming
head.yjdgrq=cbdgdb.head.yjdgrq


data.each {
    def cb=YcbdgdB.get(it)

    YxhjhdB body=new YxhjhdB()
    body.bdInvmandoc=cb?.bdInvmandoc
    body.bdCumandoc=cb?.hzdw
    body.cddw=cb?.cddw
    body.tdsl=cb?.tdsl-cb.slexec
    body.pch=cb?.pch
    body.xghth=cb?.ccqyhth

    body.sourceBid=cb?.id
    body.sourceBillCode=cb?.head?.billTypeCode

    body.sourceHid=cb?.head?.id
    body.sourceBillType=cb?.head?.billtype
    if(cb?.sourceBillCode=='YHYJH'){
      def sourceh=  Yhyjh.get(cb?.sourceHid)
        body.hc=sourceh?.hangci
    }
    head.addToBodys(body)
    head.cddw=cb?.cddw
}
binding.setVariable('returnValue',head)
