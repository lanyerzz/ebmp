package com.app.bd.cubasdoc

import com.app.bd.cumandoc.BdCumandoc
import com.app.util.PageHelper
import grails.converters.JSON

class BdCubasdocService {
    def springSecurityService
    def allot(pkCubasdoc,pkCorp){
        BdCumandoc.findOrSaveWhere('pkCubasdoc.id': pkCubasdoc,'pkCorp.id':pkCorp)
    }

    def allotAll(String pkCorp,String pkAreacl){
        def sql="""select bas from BdCubasdoc bas
		where bas.id not in
		(
			select man.pkCubasdoc from BdCumandoc as man where man.pkCorp.id=?
		)
		and bas.pkAreacl.id=?  """
        def data=BdCubasdoc.executeQuery(sql, [pkCorp,pkAreacl])
        data.each {

            //判断存货管理档案里是否存在此存货
            //如果不存在 增加 BdInvmandoc.save
            //如果存在，不做任何处理
            BdCumandoc.findOrSaveWhere(pkCubasdoc: it,'pkCorp.id':pkCorp)


        }
    }

    def deleteAllot(pkCubasdoc,pkCorp){
            def cumandoc = BdCumandoc.findWhere('pkCubasdoc.id':pkCubasdoc,'pkCorp.id':pkCorp)
            cumandoc?.delete()
    }

    def deleteAllotAll(String pkCorp,String pkAreacl){


        //	BdCumandoc.executeUpdate("""delete  from BdCumandoc  where pkCorp.id=? and pkCubasdoc.pkAreacl.id=?""", [corpid,pkAreacl])

        String sql="from BdCumandoc where pkCorp.id=? and pkCubasdoc.pkAreacl.id=?"
        def cus= BdCumandoc.executeQuery(sql,[pkCorp,pkAreacl])

        if(cus)
            cus*.delete()

    }



}
