
    def data=binding.getVariable('data')
    def rtdata=[]
    data.each {

        def mp=it.part([defaultPart:true])

        mp['xghth.id']=it?.xghth?.id
        mp['sourceBillType.id']=it?.sourceBillType?.id
        rtdata<<mp
    }

    binding.setVariable('returnValue',rtdata)
