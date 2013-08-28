import com.app.util.CriteriaHelper
import org.hibernate.criterion.Restrictions


def headId= binding.getVariable('headId')
CriteriaHelper criteria=binding.getVariable('criteria')
//def targetBill=binding.getVariable('targetBill')


    def returnValue= criteria.criteria.add(Restrictions.eq('head.id',headId)).list()
    binding.setVariable('returnValue',returnValue)



