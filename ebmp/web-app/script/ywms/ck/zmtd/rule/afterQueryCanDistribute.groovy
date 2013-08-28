def data=binding.getVariable('data')

def rt=[]

data?.each {
    def row=it.part([defaultPart:true])
    row.ht=[id:it?.ht?.id,contractNo:it?.ht?.contractNo,contractNo2:it?.ht?.contractNo2]
    row.kysl=it.fxsl-it.hxsl-it.lockNum
    rt<<row
}

binding.setVariable('returnValue',rt)