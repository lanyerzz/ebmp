

switch (binding.getVariable('type')){
    case 'default':
        json()
        break
}

def json(){
    def data=binding.getVariable('data')
    def rtdata=[]
    data.each {

        def mp=it.part()
        mp['bdInvmandoc.id']=it.bdInvmandoc?.id
        mp['yjkbbw.id']=it.yjkbbw?.id
        mp['bdInvmandoc']=[id:it.bdInvmandoc.id,pkInvbasdoc:[id:it.bdInvmandoc.pkInvbasdoc.id,invcode:it.bdInvmandoc.pkInvbasdoc.invcode,invname:it.bdInvmandoc.pkInvbasdoc.invname,bdmeasdoc:[measname:it.bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname]]]
        mp['yjkbbw']=it.yjkbbw?.part()

        rtdata<<mp
    }

    binding.setVariable('returnValue',rtdata)
}
