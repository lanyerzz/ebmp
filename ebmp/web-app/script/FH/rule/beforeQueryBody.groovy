
import com.app.util.CriteriaHelper
import org.hibernate.criterion.Restrictions


def headId= binding.getVariable('headId')
CriteriaHelper criteria=binding.getVariable('criteria')
def targetBill=binding.getVariable('targetBill')

if(targetBill=='GBC'){
    criteria.criteria.add(Restrictions.eq('head.id',headId))
    criteria.criteria.add(Restrictions.gtProperty('bcsy','outnum'));

    binding.setVariable('returnValue',criteria.list())

}else{
    def returnValue= criteria.criteria.add(Restrictions.eq('head.id',headId)).list()
    binding.setVariable('returnValue',returnValue)
}



        