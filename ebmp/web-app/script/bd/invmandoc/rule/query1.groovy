switch (binding.getVariable('type')){
    case 'default':
        json()
        break
}

def json(){
    def data=binding.getVariable('data')
    def rtdata=[]
    data.each {


        def invbas=it.pkInvbasdoc.part()
        invbas.pkInvcl=[invclassName:it.pkInvbasdoc.pkInvcl.invclassName]
        invbas.bdmeasdoc=it.pkInvbasdoc.bdmeasdoc?.defaultPart()
        invbas.bdmeasdoc1=it.pkInvbasdoc.bdmeasdoc1?.defaultPart()
        invbas.bdmeasdoc2=it.pkInvbasdoc.bdmeasdoc2?.defaultPart()
        invbas.bdmeasdoc3=it.pkInvbasdoc.bdmeasdoc3?.defaultPart()
        invbas.bdmeasdoc4=it.pkInvbasdoc.bdmeasdoc4?.defaultPart()
        invbas.bdmeasdoc5=it.pkInvbasdoc.bdmeasdoc5?.defaultPart()
        def mp=[
                id:it.id,
                invname:it.pkInvbasdoc.invname,
                pkInvbasdoc:invbas
        ]
        rtdata<<mp
    }

    binding.setVariable('returnValue',rtdata)
}
