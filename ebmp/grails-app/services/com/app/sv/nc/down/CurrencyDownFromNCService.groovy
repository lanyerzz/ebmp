package com.app.sv.nc.down

import com.app.bd.currtype.BdCurrtype

import com.app.nc.NcDataBaseConfig
import groovy.sql.Sql



class CurrencyDownFromNCService {

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
     * @throws ClassNotFoundException
     */
    private void downFromNC() throws ClassNotFoundException {
        String sqlnc = "select currtypecode, currtypename, pk_currtype from bd_currtype where nvl(dr,0)=0";


        Sql sql= Sql.newInstance(config.url,config.username,config.password,config.driverClassName)
        sql.eachRow(sqlnc,{
            BdCurrtype currency=BdCurrtype.findOrCreateBySourceId(it.pk_currtype)


            currency.currtypecode=it.currtypecode
            currency.currtypename=it.currtypename

            currency.sourceId=it.pk_currtype

            if(!currency.save()){
                log.error(currency.errors)
            }
        })

    }



}
