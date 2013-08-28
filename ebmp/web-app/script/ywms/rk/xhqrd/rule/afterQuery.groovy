def data=binding.getVariable('data')
def rtdata=[]

data?.each{

    def mp= it.part([defaultPart:true])
       rtdata<<mp
}

//mp.shipdoc = [id:data?.shipdoc?.id,shipname:data?.shipdoc?.shipname]
//mp.cddw = [id:data?.cddw?.id,pkCubasdoc:[id:data?.cddw?.pkCubasdoc?.id,custcode:data?.cddw?.pkCubasdoc?.custcode,custname:data?.cddw?.pkCubasdoc?.custname]]
//mp.businessType = [id:data?.businessType?.id,name:data?.businessType?.name]
//mp['bdCorp'] = [id:data?.bdCorp?.id,unitCode:data?.bdCorp?.unitCode,unitName:data?.bdCorp?.unitName]
//mp.maker=[userRealName:data.maker?.userRealName]
//mp.checker=[userRealName:data.checker?.userRealName]



binding.setVariable('returnValue',rtdata)