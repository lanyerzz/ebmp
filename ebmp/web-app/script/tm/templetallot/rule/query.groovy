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
        mp['tmTemplet.templetName'] = it?.tmTemplet?.templetName
        mp['role.roleName'] = it?.role?.roleName
        mp['user.userRealName'] = it?.user?.userRealName
        mp['corp.unitName'] = it?.corp?.unitName
        rtdata<<mp
    }

    binding.setVariable('returnValue',rtdata)
}
