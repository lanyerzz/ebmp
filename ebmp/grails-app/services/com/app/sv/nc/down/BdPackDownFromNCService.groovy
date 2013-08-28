package com.app.sv.nc.down

import com.app.bd.measdoc.BdMeasdoc
import com.app.bd.pack.BdPack
import com.app.bd.pack.BdPackTemp
import com.app.exception.BusinessException
import com.app.nc.NcDataBaseConfig
import groovy.sql.Sql

class BdPackDownFromNCService {



    private boolean isrun = false;
    Object key = new Object();
    NcDataBaseConfig config
    public void doDown(config) throws BusinessException {
        this.config=config
        if (isrun)
            throw new BusinessException("客商分类的下载服务正在运行");
        synchronized (key) {
            if (isrun)
                throw new BusinessException("客商分类的下载服务正在运行");

            // 下载数据到临时表

            this.downPack();
            // 翻译数据
            this.transPack();

        }

    }


    /**
     * 翻译 vo
     */
    private void transPack() {
        def ls = BdPackTemp.listOrderByCode()

        ls.each {

            BdPack pack=BdPack.findOrCreateBySourceId(it.sourceId)
            pack.code=it.code
            pack.name=it.name
            pack.hsl=it.hsl
            pack.note=it.note
            pack.measdoc=BdMeasdoc.findBySourceId(it.measdoc?:'-')

            if(it.pid){
                pack.pid=BdPack.findBySourceId(it.pid?:'-')?.id
            }else{
                pack.pid='0'
            }

            if(!pack.save(flush: true)){

                log.error(pack.errors)
            }

        }





    }


    /*
     * 下载自定档案到临时表
     */
    private void downPack()  {

        String sqlnc = """
select l.doclistcode, l.doclistname, l.pk_defdoclist, doc.doccode, doc.docname,
doc.memo,doc.pk_defdoc,doc.pk_defdoc1 from  bd_defdoc doc left join bd_defdoclist l on doc.pk_defdoclist= l.pk_defdoclist
where l.doclistcode ='GY01'
"""


        // 删除临时表数据
        String hql = "delete BdPackTemp ";
        BdPackTemp.executeUpdate(hql)

        Sql sql= Sql.newInstance(config.url,config.username,config.password,config.driverClassName)
        sql.eachRow(sqlnc,{


            BdPackTemp temp = new BdPackTemp();
            temp.code=it.doccode
            temp.name=it.docname
            temp.pid=it.pk_defdoc1
            temp.note=it.memo
            temp.hsl=it.memo?.toBigDecimal()
            temp.sourceId=it.pk_defdoc
            if(!temp.save(flush: true)){
                log.error(temp.errors)
            }
        })





    }


}
