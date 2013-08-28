import org.hibernate.criterion.Restrictions

def listQuery=binding.getVariable('listQuery')
def countQuery=binding.getVariable('countQuery')
def targetBill=binding.getVariable('targetBill')
def loginCorp=binding.getVariable('loginCorp')
def loginUser=binding.getVariable('loginUser')

if(targetBill=='S02'){
    listQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    listQuery.criteria.add(Restrictions.isNotNull('checker'))
    listQuery.criteria.add(Restrictions.gtProperty('nrecmnny', 'hxje'))
    countQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    countQuery.criteria.add(Restrictions.isNotNull('checker'))
    countQuery.criteria.add(Restrictions.gtProperty('nrecmnny', 'hxje'))
}else if(targetBill=='I1'){
    listQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    listQuery.criteria.add(Restrictions.isNotNull('checker'))
    listQuery.createCriteria('bodys','bodys')
    listQuery.criteria.add(Restrictions.gtProperty('bodys.nnumber','bodys.noutnum'))



    countQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    countQuery.criteria.add(Restrictions.isNotNull('checker'))
    countQuery.createCriteria('bodys','bodys')
    countQuery.criteria.add(Restrictions.gtProperty('bodys.nnumber','bodys.noutnum'))

}else {
    listQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    countQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
}

binding.setVariable('returnValue',[listQuery:listQuery,countQuery:countQuery])
