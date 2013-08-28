package com.app.sv.nc.down

import com.app.bd.areacl.BdAreacl
import com.app.bd.areacl.BdAreaclTemp
import com.app.exception.BusinessException
import com.app.nc.NcDataBaseConfig
import groovy.sql.Sql

class CustClsDownFromNcService{


/**
 * 从临时表翻译到正式表
 */

public void transCustCls() {
    def ls = BdAreaclTemp.listOrderByAreaclcode()
    println '开始转换地区分类.....'+ls.size()
    ls.each {
        BdAreacl c = BdAreacl.findOrCreateBySourceId(it.sourceId);
            println it.areaclcode
            c.areaclcode=it.areaclcode
            c.areaclname=it.areaclname
            c.sourceId=it.sourceId
            c.pid=BdAreacl.findBySourceId(it.pid)?.id ?:'0'

            if(!c.save(flush: true))
                log.error(c.errors)
            }


    }




Object key = new Object();
NcDataBaseConfig config


/**
 * 获取NC客商分类数据 保存到中间表中
 *
 * @throws 
 * @throws 
 */

private void downNC_CustCls() {
    
    // 删除临时表数据
    String hql = "delete  BdAreaclTemp";

    BdAreaclTemp.executeUpdate(hql)
    
    Sql sql= Sql.newInstance(config.url,config.username,config.password,config.driverClassName)
      sql.eachRow( "select  areaclcode, areaclname, pk_areacl, pk_fatherarea from bd_areacl",{
          BdAreaclTemp temp = new BdAreaclTemp();
          temp.areaclcode=it.areaclcode
          temp.areaclname=it.areaclname
          temp.pid=it.pk_fatherarea
          temp.sourceId=it.pk_areacl
          temp.save(flush: true)
      }) 
    }



public void doDown(config) throws BusinessException {

    synchronized (key) {
        this.config=config
        // 下载数据到临时表

        this.downNC_CustCls();

        // 翻译数据
        this.transCustCls();
    }
}

}





