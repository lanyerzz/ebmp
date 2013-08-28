package com.app.sv.nc.down


import com.app.exception.BusinessException
import com.app.nc.NcDataBaseConfig
import groovy.sql.Sql

class QueryNrateFromNCService {




    public Object[] queryRateFromNC(String currencyfrom,String currencyto,String date) throws BusinessException{

        NcDataBaseConfig cofnig=NcDataBaseConfig.list()[0]
        Sql sqlexe= Sql.newInstance(cofnig.url,cofnig.username,cofnig.password,cofnig.driverClassName)
        StringBuffer sql=new StringBuffer();
        sql.append(" select info.pk_currtype, info.oppcurrtype, rate.rate,info.convmode from bd_currinfo info , bd_currrate rate ")
                .append(" where info.pk_currtype='"+currencyfrom+"' and info.oppcurrtype='"+currencyto+"' and info.pk_currinfo= rate.pk_currinfo and rate.ratedate='"+date+"' ")
                .append(" and nvl(info.dr,0)=0 and nvl(rate.dr,0)=0 ");


        def row= sqlexe.firstRow(sql.toString())
            if(row) {
                BigDecimal rate=row.rate
                String model=row.convmode

                if(rate==null){

                    throw new BusinessException("未找到合法汇率!NC设置的汇率值为空！");
                }
                if ("Y".equalsIgnoreCase(model)) {// 乘法

                    return ["M",rate];

                } else {// 除法 转换成 乘法

                    return ["D",rate];
                }
            }else{

                throw new BusinessException("未找到合法汇率!");
            }

    }


}
