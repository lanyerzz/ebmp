import com.app.ic.bill.IcGeneralBody
import com.app.ic.bill.IcGeneralHead
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.so.order.SoSale
import com.app.so.order.SoSaleOrder



def data=binding.getVariable('data')
def businessKey=binding.getVariable('businessKey')
if (!data) {
    binding.setVariable('returnValue',null)
    return
}

IcGeneralHead head=new IcGeneralHead()

SoSale sh=SoSaleOrder.get(data[0])?.head

sh.billdate=new Date()
head.billTypeCode='I1'
head.billtype=PubBilltype.findByBilltypecode('I1')
head.businessType=PubBusinessType.get(businessKey)
head.bdCorp=sh.bdCorp
head.makeDate=new Date()
head.maker=sh.maker
head.sourceBillTypeCode=sh.billTypeCode
head.sourceBillType=sh.billtype
head.cdept=sh.deptdoc
head.cbiz=sh.psndoc
head.ccustomer=sh.customer

data?.each{
    SoSaleOrder order=SoSaleOrder.get(it)
    IcGeneralBody body=new IcGeneralBody()
    body.sourceBillType=order.head.billtype
    body.sourceBillCode=order.head.billTypeCode
    body.astunit=order.fjl
    body.pack=order.bzm
    body.vbatchcode=order.batch
    body.bdInvmandoc=order.invmandoc
    body.nshouldoutNum=order.nnumber
    body.outDate=new Date()
    body.hsl=order.hsl
    body.nshouldoutassistNum=order.fsl
    body.noutNum=order.nnumber
    body.noutassistNum=order.fsl
    body.sourceHid=order.head.id
    body.sourceBid=order.id
    head.addToBody(body)
}

binding.setVariable('returnValue',head)