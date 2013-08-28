import com.app.ywms.ck.fhtzd.Yfhtzdb
import com.app.ywms.rk.xhqrd.Yxhqrd

def data=binding.getVariable('data')
    def rtdata=[]
    data.each {
      Yfhtzdb tzdb=(Yfhtzdb)it

        def row=['billno':tzdb.td.head.billno,'khtdh':tzdb.head.khtdh,'hc':tzdb.td.rk.hc,'hth':tzdb.td.rk.ht.contractNo,'pc':tzdb.td.rk.pc?:'',
                'max':tzdb.max,
                'bcsy':tzdb.bcsy,'td.id':tzdb.td.id,
                'gh':tzdb.td.rk.gh.code
        ]
        rtdata<<row
    }

    binding.setVariable('returnValue',rtdata)
        