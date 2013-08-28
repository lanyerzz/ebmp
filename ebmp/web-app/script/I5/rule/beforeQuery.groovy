
    import org.hibernate.criterion.Restrictions

def listQuery=binding.getVariable('listQuery')
def countQuery=binding.getVariable('countQuery')
def targetBill=binding.getVariable('targetBill')
def loginCorp=binding.getVariable('loginCorp')
def loginUser=binding.getVariable('loginUser')


    listQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    listQuery.criteria.add(Restrictions.eq('billTypeCode', 'I5'))
    countQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    countQuery.criteria.add(Restrictions.eq('billTypeCode', 'I5'))
if(targetBill=='xxxxx'){

}else {

}

binding.setVariable('returnValue',[listQuery:listQuery,countQuery:countQuery])
    