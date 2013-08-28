import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import org.hibernate.criterion.Restrictions

CriteriaHelper listQuery=binding.getVariable('listQuery')
def businessType=binding.getVariable('params').businessType
def countQuery=binding.getVariable('countQuery')
def targetBill=binding.getVariable('targetBill')
def loginCorp=binding.getVariable('loginCorp')
def loginUser=binding.getVariable('loginUser')
println businessType
if(targetBill=='GBC'){

    listQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    listQuery.criteria.add(Restrictions.isNotNull('checker'))

    listQuery.criteria.add(Restrictions.ge('yxrq', new Date()))
    listQuery.criteria.add(Restrictions.not(Restrictions.eq('closed',true)))
    listQuery.createCriteria('bodys','bodys')
    listQuery.criteria.add(Restrictions.gtProperty('bodys.bcsy','bodys.outnum'))

    countQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    countQuery.criteria.add(Restrictions.ge('yxrq', new Date()))
    countQuery.criteria.add(Restrictions.not(Restrictions.eq('closed',true)))
    countQuery.criteria.add(Restrictions.isNotNull('checker'))
    countQuery.createCriteria('bodys','bodys')
    countQuery.criteria.add(Restrictions.gtProperty('bodys.bcsy','bodys.outnum'))

    if(businessType){
        listQuery.add(Restrictions.eq('businessType.id',businessType))
        countQuery.add(Restrictions.eq('businessType.id',businessType))
    }

}else {
    listQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    countQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))

    if(businessType){
        listQuery.criteria.add(Restrictions.eq('businessType.id',businessType))
        countQuery.criteria.add(Restrictions.eq('businessType.id',businessType))
    }

}

binding.setVariable('returnValue',[listQuery:listQuery,countQuery:countQuery])
    