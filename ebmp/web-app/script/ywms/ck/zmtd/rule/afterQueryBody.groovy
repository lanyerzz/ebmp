def data=binding.getVariable('data')

def rt=[]

data?.each {


    def row=it.part([defaultPart:true])
    row['rk']=it?.rk?.part([defaultPart: true])

    row.rk['ht']=[contractNo:it?.rk?.ht?.contractNo,contractNo2:it?.rk?.ht?.contractNo2]
    rt<<row
}

binding.setVariable('returnValue',rt)