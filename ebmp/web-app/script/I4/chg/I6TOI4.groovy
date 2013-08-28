import com.app.exception.BusinessException
import com.app.ic.bill.IcGeneralBody
import com.app.ic.bill.IcGeneralHead
import com.app.ic.special.IcSpecialB
import com.app.pub.billtype.PubBilltype

def data=binding.getVariable('data')
def businessKey=binding.getVariable('businessKey')
IcGeneralHead head =new IcGeneralHead()

if(data[0]==null)
    throw new BusinessException('未提供有效数据!')

IcSpecialB sb=IcSpecialB.get(data[0].id)

head.bdCorp=sb.head.bdCorp
head.billdate=new Date()
head.billTypeCode='I4'
head.billtype=PubBilltype.findByBilltypecode('I4')
head.cwarehouse=sb.head.outwarehouse
head.cwhsmanager=sb.head.adjuster

data?.each {
    IcSpecialB b=IcSpecialB.get(it.id)

    IcGeneralBody body=new IcGeneralBody()

    body.pack=b.pack
    body.bdInvmandoc=b.bdInvmandoc
    body.astunit=b.castunit
    body.dbizDate=new Date()
    body.hsl=b.hsl
    body.noutNum=it.nowoutnum
    body.noutassistNum=it.nowoutastnum
    body.sourceBid=b.id
    body.sourceHid=b.head.id
    body.sourceBillCode=b.head.billTypeCode
    body.sourceBillType=b.head.billtype
    body.nshouldoutNum=it.nowoutnum
    body.nshouldoutassistNum=it.nowoutastnum
    println it.nowoutnum
    println it.nowoutastnum
    head.addToBody(body)

}

binding.setVariable('returnValue',head)