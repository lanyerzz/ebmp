def data=binding.getVariable('data')


    def rtdata=[]
    data.each {
        def mp= it.part()
        //mp['hzdw'] = [id:it.hzdw?.id,pkCubasdoc:[id: it?.hzdw?.pkCubasdoc?.id,custcode:it?.hzdw?.pkCubasdoc?.custcode,custname:it?.hzdw?.pkCubasdoc?.custname]]
        mp['chuanming'] = [id:it?.chuanming?.id,shipname:it?.chuanming?.shipname]
        mp['bdCorp'] = [id:it?.bdCorp?.id,unitCode:it?.bdCorp?.unitCode,unitName:it?.bdCorp?.unitName]
        mp.businessType = [id:it?.businessType?.id,name:it?.businessType?.name]
        mp.maker=[userRealName:it.maker?.userRealName]
        mp.checker=[userRealName:it.checker?.userRealName]
        rtdata<<mp
    }

    binding.setVariable('returnValue',rtdata)
