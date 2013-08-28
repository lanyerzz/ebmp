package com.app.sv.nc.down

import com.app.bd.areacl.BdAreacl
import com.app.bd.corp.BdCorp
import com.app.bd.cubasdoc.BdCubasdoc
import com.app.bd.cubasdoc.BdCubasdocTemp
import com.app.bd.cumandoc.BdCumandoc
import com.app.bd.cumandoc.BdCumandocTemp
import com.app.bd.currtype.BdCurrtype
import com.app.exception.BusinessException
import com.app.nc.NcContrast
import com.app.nc.NcDataBaseConfig
import groovy.sql.Sql

class CustDownFromNCService {


    Object key = new Object();
    NcDataBaseConfig config

    public void doDown(config) throws BusinessException {

        synchronized (key) {
            this.config=config

            // 下载数据到临时表

           // this.downNC_Cust();


            // 翻译数据
          // this.transCust();

           distribution();

        }

    }



    private void downNC_Cust() throws ClassNotFoundException {
        def corps=NcContrast.findAllByType('bdCorp')
        String codes="'-1'";
        corps.each {
            codes=codes+",'${it.targetValue}'";
        }

        String sqlnc = "select DISTINCT cub.pk_cubasdoc,cub.custcode,cub.custname,cub.pk_areacl, cub.conaddr ,cub.pk_corp,cub.mnecode from bd_cubasdoc cub "+
                " left join bd_cumandoc cum on cub.pk_cubasdoc= cum.pk_cubasdoc "+
                " left join bd_corp corp on corp.pk_corp=cum.pk_corp "+
                " where nvl(cum.dr,0)=0 and nvl(corp.dr,0)=0 and corp.unitcode in ("+codes+") and cum.custflag in ('0','2')";
        println codes
        // 删除临时表数据
        String hql = "delete BdCubasdocTemp ";

       BdCubasdocTemp.executeUpdate(hql)
        log.info('下载客商信息......')
        Sql sql= Sql.newInstance(config.url,config.username,config.password,config.driverClassName)
        BdCubasdocTemp.withSession {session->
            sql.eachRow(sqlnc,{
                BdCubasdocTemp temp = new BdCubasdocTemp();
                temp.custcode=it.custcode
                temp.custname=it.custname

                temp.conaddr=it.conaddr
                temp.sourceId=it.pk_cubasdoc
                temp.pkAreacl=it.pk_areacl
                temp.mnecode=it.mnecode

                temp.save()
            })

            session.flush()
        }




    }





    private void transCust() {
        def ls = BdCubasdocTemp.list()

        log.info('翻译客商信息......')
        BdCubasdoc.withSession {session->
            ls.each {
                BdCubasdoc cust = BdCubasdoc.findOrCreateBySourceId(it.sourceId)


                cust.custcode=it.custcode
                cust.custname=it.custname
                cust.sourceId=it.sourceId


                cust.pkAreacl=BdAreacl.findBySourceId(it.pkAreacl)

                cust.conaddr=it.conaddr
                cust.mnecode=it.mnecode
                cust.save()
            }
            session.flush()
        }


    }





    private void distribution() {
        BdCumandocTemp.executeUpdate('delete BdCumandocTemp ')

//		/ System.out.println(sql);
        Sql sql=Sql.newInstance(config.url,config.username,config.password,config.driverClassName)
        def corps=NcContrast.findAllByType('bdCorp')
        BdCumandocTemp.withSession {session->


            corps.each {
                String sqlnc="select man.pk_cubasdoc,man.pk_currtype1 from bd_cumandoc man left join bd_corp corp on man.pk_corp=corp.pk_corp "+
                        " where corp.unitcode='"+it.targetValue+"' and (corp.dr=0 or corp.dr is null) and nvl(man.dr,0)=0 and man.custflag in ('0','2')" ;
                String localCorp=it.sourveValue
                sql.eachRow(sqlnc,{

                    BdCumandocTemp cust=new BdCumandocTemp()
                    cust.pkCubasdoc=it.pk_cubasdoc;
                    cust.pkCorp=localCorp
                    cust.iscustomer=true
                    cust.isvender=true
                    cust.defaultCurrtype=it.pk_currtype1
                    cust.sourceId=it.pk_cubasdoc+localCorp
                    cust.save()
                })
            }


            session.flush()
        }


        def temps= BdCumandocTemp.list()


        BdCumandoc.withSession {session->
            temps.each {
                BdCumandoc mandoc=BdCumandoc.findOrCreateBySourceId(it.sourceId)
                mandoc.pkCubasdoc=BdCubasdoc.findBySourceId(it.pkCubasdoc)
                mandoc.pkCorp=BdCorp.findByUnitCode(it.pkCorp)
                mandoc.isvender=true
                mandoc.iscustomer=true
                mandoc.defaultCurrtype=BdCurrtype.findBySourceId(it.defaultCurrtype)
                mandoc.sourceId=it.sourceId
                mandoc.save()
            }

            session.flush()
        }




    }



}
