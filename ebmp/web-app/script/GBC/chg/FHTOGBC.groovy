import com.app.ywms.ck.fhtzd.Yfhtzd
import com.app.ywms.ck.gbd.YoutGbd
import com.app.ywms.ck.gbd.YoutGbdDetail

def keys=binding.getVariable('data')
def businessKey=binding.getVariable('businessKey')

def tzd=Yfhtzd.get(keys)

YoutGbd bgd=new YoutGbd()
bgd.tzd=tzd


tzd?.bodys.each {
    YoutGbdDetail detail=new YoutGbdDetail()
    detail.sourceBid=it.id
    detail.sourceHid=tzd.id
    detail.sourceBillCode=tzd.billTypeCode
    detail.sourceBillType=tzd.billtype
    detail.gh=it.td.rk.gh
    detail.bcsy=it.bcsy
    detail.outnum=0
    bgd.addToBodys(detail)
}

binding.setVariable('returnValue',bgd)
