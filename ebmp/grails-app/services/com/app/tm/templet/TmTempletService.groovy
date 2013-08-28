package com.app.tm.templet

import com.app.sm.user.SmUser
import com.app.sm.user.SmUserSmRoles
import com.app.tm.templetallot.TmTempletallot
import com.app.util.SystemConfig
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.JasperReport
import net.sf.jasperreports.engine.util.JRLoader

class TmTempletService {
    /**
     * 编译模板
     * @param webapp
     * @param filePath
     * @return
     */
    def compileTemplet(filePath){

        def url= SystemConfig.getWebAppPath()+"/templet/"+filePath

        JasperCompileManager.compileReportToFile(url+".jrxml")

    }

    /**
     * 获取打印模板
     * @param functionid
     * @param userid
     * @return
     */
    def queryPrintTemplet(String functionid,SmUser userid){
        def tl= queryTemplet(functionid,0,userid)

        return tl

    }


    /**
     * //模板分类
     * 0)打印模板
     *  1)查询模板
     *  2)单据模板
     *  3)报表模板
     * @param functionid
     * @param userid
     * @return
     */
    def queryTemplet(String functionid,int type,SmUser userid){
        //查找该节点是否分配给用户
        def tl= TmTempletallot.findAllWhere('function.id':functionid,user:userid,templetType:type)
        if(!tl){//如果未分配
            def roles=SmUserSmRoles.findAllBySmUser(userid)*.smRoles


            //查找对应角色的 的模板
            if(roles){
                tl=TmTempletallot.where {
                    function.id==functionid
                    role in roles
                }.list()
            }
            //	 findAllByRoleInList(roles)
        }

        if(!tl){//查找节点对应的默认模板
            tl=TmTempletallot.findAllWhere('function.id':functionid,isDefault:true,templetType:type)
        }

        if(!tl){
            //查询模板（未分配角色和用户的）
            tl=TmTempletallot.where {

                function.id==functionid
                user == null
                role==null
                templetType==type
            }.list()
        }

        return tl
    }

    def fillTemplet(templet,Map parameters,ds){


        def tl= TmTemplet.load(templet)
        def url= SystemConfig.getWebAppPath()+"/templet/"+tl.templetPath


        String ph=url.toString()
        int last_1=ph.lastIndexOf("\\")
        int last_2=ph.lastIndexOf("/")

        int index=last_2>last_1 ? last_2 : last_1

        parameters.put("SUBREPORT_DIR",  ph.substring(0, index)+"/")
        JasperPrint jasperPrint = JasperFillManager.fillReport(loadTemplet(url),parameters, ds)
        return jasperPrint
    }

    def loadTemplet(url){


        JasperReport jasperReport = (JasperReport) JRLoader.loadObjectFromFile(url+".jasper");
        return jasperReport
    }



    def loadTempletDefalut(){
        def url= SystemConfig.getWebAppPath()+"/templet/defalult"
        JasperReport jasperReport = (JasperReport) JRLoader.loadObjectFromFile(url+".jasper");
        return jasperReport
    }
}
