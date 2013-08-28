def data=binding.getVariable('data')

def json=[]

data?.each {

    def row=it.part([defaultPart:true])

    json<<row
}

binding.setVariable('returnValue',json)