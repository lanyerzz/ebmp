def data=binding.getVariable('data')
def rtdata=[]
data.each {

    def mp=it.part()
    def pkCubasdoc=it.bdCumandoc?.pkCubasdoc
    if (pkCubasdoc)
        mp['bdCumandoc']=['pkCubasdoc':[id:pkCubasdoc.id,custname:pkCubasdoc.custname,custcode:pkCubasdoc.custcode,phone:pkCubasdoc.phone,linkman:pkCubasdoc.linkman,email:pkCubasdoc.email]]
    mp.businessType = [name:it?.businessType?.name]
    mp.kjxyzdw=['pkCubasdoc':[custname: it.kjxyzdw?.pkCubasdoc?.custname]]
    mp.maker=[userRealName:it.maker?.userRealName]
    mp.checker=[userRealName:it.checker?.userRealName]
    mp.cddw=['pkCubasdoc':[custname: it.cddw?.pkCubasdoc?.custname]]
    mp.chuanming=it.chuanming?.part()
    rtdata<<mp
}

binding.setVariable('returnValue',rtdata)