
import org.hibernate.criterion.Restrictions


def ch=binding.getVariable('listQuery')
def cc=binding.getVariable('countQuery')
def targetBill=binding.getVariable('targetBill')
def corp=binding.getVariable('loginCorp')
def loginUser=binding.getVariable('loginUser')



    ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
    cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
    binding.setVariable('returnValue',[listQuery:ch,countQuery:cc])



