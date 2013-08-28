package com.app.sv.nc.down

import com.app.bd.invcl.BdInvcl
import com.app.bd.invcl.BdInvclTemp
import com.app.exception.BusinessException
import groovy.sql.Sql


class InvClsDownFromNCService {

    private boolean isrun = false;
    Object key = new Object();
    def config

    public void doDown(config ) throws BusinessException {
        this.config=config
        if (isrun)
            throw new BusinessException("存货分类的下载服务正在运行");
        synchronized (key) {
            if (isrun)
                throw new BusinessException("存货分类的下载服务正在运行");
            // 下载NC的存货分类数据到临时表
            try {
                this.downNC_InvCls();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                throw new BusinessException(e.getMessage());

            }
            //把存货分类临时表中的数据放入到存货分类表中
            this.transInvCls();
            isrun=false;
        }
    }

    /**
     * 下载NC的存货分类数据到临时表
     * @throws ClassNotFoundException
     */
    private void downNC_InvCls(){
        // 删除临时表数据
        String hql = "delete from BdInvclTemp ";
        BdInvclTemp.executeUpdate(hql);

        Sql sql=Sql.newInstance(config.url,config.username,config.password,config.driverClassName)

        sql.eachRow("select invclasscode, invclassname, invclasslev, pk_invcl from bd_invcl   order by invclasslev , invclasscode",{
            //实例化存货分类临时表VO
            BdInvclTemp temp = new BdInvclTemp();
            //存货分类PK
            temp.sourceId=it.pk_invcl
            //存货分类编码
            temp.invclassCode=it.invclasscode
            //存货分类名称
            temp.invclassName=it.invclassname

            //把从NC系统中得到的存货分类数据保存到临时表中


            temp.save(flush:true)

        })




    }
    /**
     * 把存货分类临时表中的数据放入到存货分类表中
     */
    public void transInvCls() {
        //从存货分类临时表中查询数据
        def ls = BdInvclTemp.listOrderByInvclassCode()

        //把从存货分类临时表中查询的数据逐条放入到存货分类表中
        ls.eachWithIndex { BdInvclTemp temp, int i ->
            BdInvcl cl=BdInvcl.findOrCreateBySourceId(temp.sourceId)

            //存货分类编码
            cl.invclassCode=temp.invclassCode
            //存货分类名称
            cl.invclassName= temp.invclassName
            //NC系统中存货分类PK
            cl.sourceId=temp.sourceId

            if (cl.invclassCode.length() > 2) {

                //到存货分类表中查询父级存货分类
                 def f= BdInvcl.findByInvclassCode(cl.invclassCode.substring(0,cl.invclassCode.length()-2))
                if (f) {
                    cl.pid=f.id
                }
            }
            if(!cl.validate()){
                log.error(cl.errors)

            }
            cl.save(flush:true)

        }


    }
}
