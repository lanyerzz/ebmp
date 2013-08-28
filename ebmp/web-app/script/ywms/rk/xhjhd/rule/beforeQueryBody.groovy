import com.app.util.CriteriaHelper
import org.hibernate.criterion.Restrictions


def headId= binding.getVariable('headId')
CriteriaHelper criteria=binding.getVariable('criteria')
def targetBill=binding.getVariable('targetBill')

if (targetBill=='YXHQRD'){
    criteria.criteria.add(Restrictions.eq('head.id',headId))
    criteria.criteria.add(Restrictions.eq('closed',false))
    def returnValue= criteria.list()
    binding.setVariable('returnValue',returnValue)
}else {

    def returnValue= criteria.criteria.add(Restrictions.eq('head.id',headId)).list()
    binding.setVariable('returnValue',returnValue)

}
