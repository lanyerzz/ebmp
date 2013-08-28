
import org.hibernate.criterion.Restrictions

def springSecurityService
def params=binding.getVariable('params')
def businessType=params.businessType
def ch=binding.getVariable('listQuery')
def cc=binding.getVariable('countQuery')
def targetBill=binding.getVariable('targetBill')
def corp=binding.getVariable('loginCorp')
def loginUser=binding.getVariable('loginUser')


if (targetBill=='YXHJHD'){


    ch.createCriteria('bodys','bodys')
    ch.criteria.add(Restrictions.eq('bodys.closed', false))
    cc.createCriteria('bodys','bodys')
    cc.criteria.add(Restrictions.eq ('bodys.closed', false))
    ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
    cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
    ch.criteria.add(Restrictions.isNotNull('checker'))  //已经审核
    cc.criteria.add(Restrictions.isNotNull('checker'))  //已经审核
    if(businessType){
        ch.criteria.add(Restrictions.eq('businessType.id',businessType))
        cc.criteria.add(Restrictions.eq('businessType.id',businessType))
    }

    binding.setVariable('returnValue',[listQuery:ch,countQuery:cc])

}else {

    ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
    cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
    binding.setVariable('returnValue',[listQuery:ch,countQuery:cc])


}

