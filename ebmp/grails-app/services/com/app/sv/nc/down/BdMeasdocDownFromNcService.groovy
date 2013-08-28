package com.app.sv.nc.down

import com.app.bd.measdoc.BdMeasdoc
import com.app.nc.NcDataBaseConfig
import groovy.sql.Sql

class BdMeasdocDownFromNcService {

    Object key = new Object();
    NcDataBaseConfig config

    public void doDown(config) {

        synchronized (key) {
        this.config=config
            // 下载数据到临时表

            this.downFromNC();

        }

    }

    /**
     * 下载数据
     *
     *
     */
    private void downFromNC(){
        String sqlnc="select measname,shortname,pk_measdoc from NC55.bd_measdoc where nvl(dr,0)=0";

        Sql sql= Sql.newInstance(config.url,config.username,config.password,config.driverClassName)
        sql.eachRow(sqlnc,{
            BdMeasdoc meas =  BdMeasdoc.findOrCreateBySourceId(it.pk_measdoc?:'-')
            meas.shortname=it.shortname
            meas.measname=it.measname

            meas.sourceId=it.pk_measdoc

            meas.save()
        })

    }



}
