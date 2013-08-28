import com.app.exception.BusinessException
import com.app.pub.businesstype.PubBusinessType
import com.app.ywms.rk.cbdgd.Ycbdgd
import com.app.ywms.rk.cbdgd.YcbdgdB
import com.app.ywms.rk.hyjh.YhyjhB

def data=binding.getVariable('data')
def businessKey=binding.getVariable('businessKey')
    if (!data) {
        binding.setVariable('returnValue',null)
        return
    }

//处理表头数据
Ycbdgd head=new Ycbdgd()

PubBusinessType businessType=PubBusinessType.get(businessKey)
head.businessType=businessType
head.businessCode=businessType.code
def hyjhb=YhyjhB.get(data[0])
if (!hyjhb) throw new BusinessException('未找到指定的货源计划')
head.billTypeCode='YCBDGD';
head.billdate=new Date()

head.chuanming=hyjhb.head.chuanming
head.yjdgrq=new Date()


  data.each {
      def jh=YhyjhB.get(it)

      YcbdgdB body=new YcbdgdB()
      body.bdInvmandoc=jh.bdInvmandoc
      body.hzdw=jh.head.bdCumandoc
      body.kzdw=jh.head.kjxyzdw
      body.tdsl=jh.sl-jh.slexec
      body.sourceBid=jh.id
      body.sourceBillCode=jh.head.billTypeCode
      body.sourceHid=jh.head.id
      body.sourceBillType=jh.head.billtype

      body.kzdw=jh.head.kjxyzdw
      body.cddw=jh.head.cddw

      head.addToBodys(body)
  }
    binding.setVariable('returnValue',head)
