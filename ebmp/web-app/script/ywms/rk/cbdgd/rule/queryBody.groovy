switch (binding.getVariable('type')){
    case 'default':
        json()
        break
}

def json(){
    def data=binding.getVariable('data')
    def rtdata=[]
    data.each {
        def mp= it.part([defaultPart:true])
             rtdata<<mp
    }

    binding.setVariable('returnValue',rtdata)
}
