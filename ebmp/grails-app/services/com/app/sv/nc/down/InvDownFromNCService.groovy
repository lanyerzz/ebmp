package com.app.sv.nc.down

import com.app.bd.corp.BdCorp
import com.app.bd.invbasdoc.BdInvbasdoc
import com.app.bd.invbasdoc.BdInvbasdocTemp
import com.app.bd.invcl.BdInvcl
import com.app.bd.invmandoc.BdInvmandoc
import com.app.bd.invmandoc.BdInvmandocTemp
import com.app.bd.measdoc.BdMeasdoc
import com.app.bd.pack.BdPack
import com.app.exception.BusinessException
import com.app.nc.NcContrast
import com.app.nc.NcDataBaseConfig
import groovy.sql.Sql
import org.hibernate.impl.SessionImpl
import org.springframework.transaction.annotation.Propagation
import org.springframework.transaction.annotation.Transactional

class InvDownFromNCService {

    static transactional = false
//

    Object key = new Object();
//

    private NcDataBaseConfig  config;

    public void doDown(config) throws BusinessException {

        synchronized (key) {

            this.config=config
            // 下载数据到临时表

           this.downInv();
           this.trans();
            this.downMan();
            distribution();
        }

    }

//    /**
//     * 翻译 到正式表
//     */

    private void trans() {
        def ls = BdInvbasdocTemp.listOrderByInvcode()

        BdInvbasdoc.withSession {session->
            ls.each {


                BdInvbasdoc invbas=BdInvbasdoc.findOrCreateBySourceId(it.sourceId)
                invbas.invcode=it.invcode
                invbas.invname=it.invname
                invbas.invmnecode=it.invmnecode
                invbas.sourceId=it.sourceId
                invbas.bdmeasdoc=BdMeasdoc.findBySourceId(it.bdmeasdoc?:'-')
                invbas.bdmeasdoc1=BdMeasdoc.findBySourceId(it.bdmeasdoc1?:'-')
                invbas.bdmeasdoc2=BdMeasdoc.findBySourceId(it.bdmeasdoc2?:'-')
                invbas.bdmeasdoc3=BdMeasdoc.findBySourceId(it.bdmeasdoc3?:'-')

                invbas.pkInvcl=BdInvcl.findBySourceId(it.pkInvcl?:'-')

                invbas.invbarcode=it.invbarcode // 条码
                if(!invbas.save()){
                    log.error(invbas.errors)
                }
            }
            session.flush()
        }



    }
//
//    /**
//     * 下载nc的存货档案数据
//     *
//     * @throws ClassNotFoundException
//     */

    private void downInv() {


        String codes = "'-1'";

        def trast= NcContrast.findAllByType('bdCorp')

        trast?.each {
            codes = codes + ",'" + it.targetValue + "'";
        }



        String ncsql = """
        select DISTINCT bc.invcode,bc.invmnecode, bc.invname, bc.pk_invbasdoc,
        bc.pk_invcl, bc.pk_invcl,bc.pk_measdoc, bc.pk_measdoc1,bc.pk_measdoc2,bc.pk_measdoc3,bc.invbarcode
        from bd_invmandoc mc left join bd_invbasdoc bc on mc.pk_invbasdoc=bc.pk_invbasdoc
         left join bd_corp corp on mc.pk_corp=corp.pk_corp where corp.unitcode in(${codes}) and  nvl(mc.dr,0)=0 and nvl(corp.dr,0)=0
        """

        // 删除临时表数据
        String hql = "delete BdInvbasdocTemp ";

       BdInvbasdocTemp.executeUpdate(hql)


        Sql sql=Sql.newInstance(config.url,config.username,config.password,config.driverClassName)


        def temps=[]
        println '开始下载存货.........'
        BdInvbasdocTemp.withSession { session ->


            sql.eachRow(ncsql,{


                BdInvbasdocTemp temp= new BdInvbasdocTemp()
                temp.invcode=it.invcode
                temp.invname=it.invname
                temp.pkInvcl= it.pk_invcl
                temp.invmnecode=it.invmnecode
                temp.sourceId=it.pk_invbasdoc
                temp.bdmeasdoc=it.pk_measdoc
                temp.bdmeasdoc1=it.pk_measdoc1
                temp.bdmeasdoc2=it.pk_measdoc2
                temp.bdmeasdoc3=it.pk_measdoc3
                temp.invbarcode=it.invbarcode

                if(!temp.save()){
                    log.error(temp.errors)
                }


            })

            session.flush()
            //session.getTransaction().commit()
        }


      //  BdInvbasdocTemp.

       println 'count:'+  BdInvbasdocTemp.count()



    }


//
//    /**
//     * 查询nc 管理档案 分配数据
//     *
//     * @param ncunitcode
//     * @param localcorpid
//     * @throws ClassNotFoundException
//     */

    private void distribution() {
        def trast= NcContrast.findAllByType('bdCorp')

        trast.each {
            def ls= BdInvmandocTemp.list()
            def corp=BdCorp.findByUnitCode(it.sourveValue)

            BdInvmandoc.withSession {session->

                ls.each {

                    if(it.dr==1){
                        BdInvmandoc.executeUpdate('delete from BdInvmandoc where sourceId=?',[it.sourceId])
                    }else{
                        def invbas= BdInvbasdoc.findBySourceId(it.pkInvbasdoc)

                        BdInvmandoc mandoc= BdInvmandoc.findOrCreateBySourceId(it.sourceId)

                        mandoc.pkInvbasdoc=invbas
                        mandoc.pkCorp=corp
                        mandoc.refSalePrice=it.refSalePrice
                        mandoc.defaultNumber=it.defaultNumber//默认数量
                        mandoc.defaultPack= BdPack.findByName( it.defaultPack)//默认装数
                        if(!mandoc.save()){
                            log.error(mandoc.errors)
                        }
                    }


                }
                session.flush()
            }


        }


    }


    private void downMan() {


        BdInvmandocTemp.executeUpdate('delete from BdInvmandocTemp')


        def trast= NcContrast.findAllByType('bdCorp')
        Sql sql=Sql.newInstance(config.url,config.username,config.password,config.driverClassName)
        trast?.each {
            String ncsql = """
select m.pk_invmandoc,m.dr, m.pk_invbasdoc,m.refsaleprice,m.def1,m.def2 from bd_invmandoc m left join bd_corp corp on m.pk_corp=corp.pk_corp
 where corp.unitcode='${it.targetValue}'  and nvl(corp.dr,0)=0
"""

            def corp=it.sourveValue


            BdInvmandocTemp.withSession {session->

                sql.eachRow(ncsql,{


                    BdInvmandocTemp mandoc= new BdInvmandocTemp()
                    mandoc.sourceId=it.pk_invmandoc
                    mandoc.pkInvbasdoc=it.pk_invbasdoc
                    mandoc.pkCorp=corp
                    mandoc.refSalePrice=it.refsaleprice?.toBigDecimal()
                    mandoc.defaultNumber=it.def2?.toBigDecimal()//默认数量
                    mandoc.defaultPack=it.def1//默认装数
                    if(it.dr==1){
                        mandoc.dr=true
                    }

                    if(!mandoc.save()){
                        log.error(mandoc.errors)
                    }
                })
                session.flush()
            }



        }



    }

}
