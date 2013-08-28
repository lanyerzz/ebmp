def data=binding.getVariable('data')

def param=[:]
param.icGeneralHeadInstance=data
def bodys=[]
data?.body?.each {
    bodys<< it.part([defaultPart:true])
}
param.bodys=bodys
binding.setVariable('returnValue',param)