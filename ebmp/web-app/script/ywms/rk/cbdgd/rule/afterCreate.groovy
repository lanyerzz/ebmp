
    def data=binding.getVariable('data')
    def rtdata=[]
    data.each {
        def mp= it.part([defaultPart:true])

      //  mp['bdInvmandoc'] = [id:it.bdInvmandoc?.id,pkInvbasdoc:[id: it?.bdInvmandoc?.pkInvbasdoc?.id,invcode:it?.bdInvmandoc?.pkInvbasdoc?.invcode,invname:it?.bdInvmandoc?.pkInvbasdoc?.invname]]
       mp['sourceBillType.id']=it?.sourceBillType?.id

        rtdata<<mp
    }

    binding.setVariable('returnValue',rtdata)

