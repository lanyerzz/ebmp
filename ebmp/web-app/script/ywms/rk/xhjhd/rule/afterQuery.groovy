def data=binding.getVariable('data')
def rows=[]
data?.each {
    Map row = it.part()
    row['businessType.name'] = it?.businessType?.name
    row['shipdoc.shipname'] = it?.shipdoc?.shipname
    row['cddw.pkCubasdoc.custname'] = it?.cddw?.pkCubasdoc?.custname
    row['maker.userRealName'] = it?.maker?.userRealName
    row['checker.userRealName'] = it?.checker?.userRealName
    row['bdCorp.unitName'] = it?.bdCorp?.unitName
    rows << row
}

binding.setVariable('returnValue',rows)