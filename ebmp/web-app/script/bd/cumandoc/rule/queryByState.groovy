

switch (binding.getVariable('type')){
    case 'default':
        json()
        break
}

def json(){
    def data=binding.getVariable('data')
    def rtdata=[]

    data.each {

        def mp=[
                id:it.id,
                custname:it.pkCubasdoc.custname,
                pkCubasdoc:it.pkCubasdoc.part()
                ]

        rtdata<<mp
    }

    binding.setVariable('returnValue',rtdata)
}
