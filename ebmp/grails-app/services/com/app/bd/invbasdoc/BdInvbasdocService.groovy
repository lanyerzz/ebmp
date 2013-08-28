package com.app.bd.invbasdoc

import com.app.bd.invmandoc.BdInvmandoc

class BdInvbasdocService {

    def allot(pkInvbasdoc,pkCorp){
//        BdCorp corp = BdCorp.load(pkCorp)
        BdInvmandoc.findOrSaveWhere('pkInvbasdoc.id': pkInvbasdoc,'pkCorp.id':pkCorp)

    }

    def allotAll(String pkCorp,String pkInvcl){
        def sql="""select bas from BdInvbasdoc bas
	   where bas.id not in
	   (
		   select man.pkInvbasdoc from BdInvmandoc as man where man.pkCorp.id=?
	   )
	   and bas.pkInvcl.id=?  """

        def data=BdInvbasdoc.executeQuery(sql, [pkCorp,pkInvcl])
        data.each {

            //判断存货管理档案里是否存在此存货
            //如果不存在 增加 BdInvmandoc.save
            //如果存在，不做任何处理
            BdInvmandoc.findOrSaveWhere(pkInvbasdoc: it,'pkCorp.id':pkCorp)


        }
    }

    def deleteAllotAll(String pkCorp,String pkInvcl){
        String sql="from BdInvmandoc where pkCorp.id=? and pkInvbasdoc.pkInvcl.id=?"
        def inv= BdInvmandoc.executeQuery(sql,[pkCorp,pkInvcl])

        if(inv)
            inv*.delete()
    }


    def deleteAllot(pkInvbasdoc,pkCorp){

            def inv= BdInvmandoc.findWhere('pkInvbasdoc.id':pkInvbasdoc,'pkCorp.id':pkCorp)

            inv?.delete()

    }
}
