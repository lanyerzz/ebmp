switch (binding.getVariable('type')){
    case 'default':
        json()
        break
}

def json(){
    def data=binding.getVariable('data')
    def rtdata=[]

    data.each {

        def mp = it.part()
        mp['corp.unitName'] = it?.corp?.unitName
        rtdata<<mp
    }

    binding.setVariable('returnValue',rtdata)
}
