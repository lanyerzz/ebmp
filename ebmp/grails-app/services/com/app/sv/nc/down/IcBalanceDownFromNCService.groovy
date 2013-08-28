package com.app.sv.nc.down

import com.app.bd.corp.BdCorp
import com.app.bd.invbasdoc.BdInvbasdoc
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.measdoc.BdMeasdoc
import com.app.bd.pack.BdPack
import com.app.bd.stordoc.BdStordoc
import com.app.ic.handnum.IcOnhandnum
import com.app.ic.handnum.IcOnhandnumTemp
import com.app.nc.NcContrast
import com.app.nc.NcDataBaseConfig
import groovy.sql.Sql




class IcBalanceDownFromNCService {

    Object key = new Object();
    NcDataBaseConfig config


    public void doDown(config) {

        synchronized (key) {
            this.config=config
            // 下载数据到临时表

           // this.downFromNC();

            // 翻译数据
            this.transBalance();
        }
    }


    /**
     * 从NC系统下载余额表数据到POS系统的临时表中
     *
     */
    private void downFromNC()  {
        def corps=NcContrast.findAllByType('bdCorp')
        String hql = "delete IcOnhandnumTemp ";

        IcOnhandnumTemp.executeUpdate(hql)
        Sql sqlexe=Sql.newInstance(config.url,config.username,config.password,config.driverClassName)

        corps.each {
            def sqlnc = """select  hand.cinvbasid,hand.cinventoryid,hand.nonhandastnum,hand.nonhandnum,corp.unitcode,hand.castunitid,meas.measname,meas.shortname,hand.hsl,
hand.vfree1,hand.vfree2,hand.vfree3,hand.vfree4,hand.vfree5,hand.vfree6,hand.vfree7,hand.vfree8,hand.vfree9,hand.vfree10,hand.vlot,stor.STORCODE,stor.STORNAME
 from NC55.ic_onhandnum hand left join bd_corp corp on hand.pk_corp=corp.pk_corp
left join NC55.bd_measdoc meas on meas.pk_measdoc=hand.castunitid
left join bd_stordoc stor on stor.pk_stordoc=hand.cwarehouseid
where corp.unitcode ='${it.targetValue}'
"""





            println(sqlnc)


              IcOnhandnumTemp.withSession {session->
            sqlexe.eachRow(sqlnc,{
               // println '现存了下载....'
                IcOnhandnumTemp temp = new IcOnhandnumTemp();
                //temp.calbody=it.ccalbodyid
                temp.warehouse=it.STORCODE
                temp.invbasdoc=it.cinvbasid
                temp.invmandoc=it.cinventoryid
                temp.astunit=it.castunitid
                temp.corp=it.unitcode
                temp.pack=it.vfree1
                temp.hsl=it.hsl?.toBigDecimal()
                temp.nonhandnum=it.nonhandnum
                temp.nonhandastnum=it.nonhandastnum
//
//﻿
                if(!temp.save())
                    log.error(temp.errors)
            })

               session.flush()
            }


        }

    }

    /**
     * 临时表转换到正式表
     *
     */
    private void transBalance()  {
        String hql = "delete IcOnhandnum ";
       def corps= NcContrast.findAllByType('bdCorp')
        println corps
        def cm=[:]
        corps.each {

            cm[it.targetValue]=BdCorp.findByUnitCode(it.sourveValue)

        }
       IcOnhandnum.executeUpdate(hql)

       def ls=IcOnhandnumTemp.list()

        IcOnhandnum.withSession {session->

            ls.each {
                IcOnhandnum hand=new IcOnhandnum()
                hand.warehouse=BdStordoc.findByCodeAndBdCorp(it.warehouse,cm[it.corp])
                hand.calbody=hand.warehouse?.calbody
                hand.astunit=BdMeasdoc.findBySourceId(it.astunit?:'-')
                hand.hsl=it.hsl
                hand.invbasdoc=BdInvbasdoc.findBySourceId(it.invbasdoc?:'-')
                hand.invmandoc=BdInvmandoc.findBySourceId(it.invmandoc?:'-')
                hand.corp=cm[it.corp]
                hand.pack=BdPack.findByName(it.pack)
                hand.nonhandastnum=it.nonhandastnum
                hand.nonhandnum=it.nonhandnum
                if(!hand.save())
                    log.error(hand.errors)

            }

            session.flush()
        }





    }



}
