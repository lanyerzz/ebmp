package com.app.pub.actionscript

import com.app.exception.BusinessException
import com.app.lang.SpringBinding
import com.app.pub.billtype.PubBilltype
import com.app.pub.change.PubChangescript
import com.app.util.SystemConfig

class PubActionscriptService {
    def private static scriptCache=[:]
    def grailsApplication

    def saveScript(String id,String scriptFile,String webappPath){
        def sc= PubActionscript.get(id)
        if (!sc){
           // def mp=[remoteErrors: '您选择的数据不存在，请重新刷新数据！']

            throw new BusinessException('您选择的数据不存在，请重新刷新数据！')
        }


        def scriptPath=webappPath+"/script/"+sc.path


        //保存脚本文件
        def file=new File(scriptPath)
        if (!file.parentFile.exists()){
            file.parentFile.mkdirs()
        }
        if(!file.exists())
            file.createNewFile()
        file.write(scriptFile)

        //编译脚本文件

       // def engine = new GroovyScriptEngine(scriptPath) // scriptBase为存放动态Groovy脚本的路径列表
       // def bind = new Binding()
       // engine.createScript()// scriptName脚本名称

        //def mp=[remoteMessage:'操作完成！']
        //return mp

    }

    def saveChangeScript(String id,String scriptFile){
        saveChangeScript(id,scriptFile,SystemConfig.getWebAppPath());
    }

    def saveChangeScript(String id,String scriptFile,String webappPath){
        def sc= PubChangescript.get(id)
        if (!sc){
            // def mp=[remoteErrors: '您选择的数据不存在，请重新刷新数据！']

            throw new BusinessException('您选择的数据不存在，请重新刷新数据！')
        }


        def scriptPath=webappPath+"/script/"+sc.path


        //保存脚本文件
        def file=new File(scriptPath)
        if (!file.parentFile.exists()){
            file.parentFile.mkdirs()
        }
        if(!file.exists())
            file.createNewFile()
        file.write(scriptFile)



    }


    /**
     * 编辑脚本文件
     * @param id
     */
    def getScriptFile(String id,String webappPath){
        def sc= PubActionscript.get(id)
        if (!sc){


            throw new BusinessException('您选择的数据不存在，请重新刷新数据！')
        }


        def scriptPath=webappPath+"/script/"+sc.path
        def scbuff=new StringBuffer()

        def file=new File(scriptPath)
        if (!file.exists()){
            return ''
        }
        file.eachLine {
            scbuff.append(it).append("\n");
        }

       return scbuff.toString()

    }

    def getChangeScriptFile(String id){
        def sc= PubChangescript.get(id)
        if (!sc){


            throw new BusinessException('您选择的数据不存在，请重新刷新数据！')
        }


        def scriptPath=SystemConfig.getWebAppPath()+"/script/"+sc.path
        def scbuff=new StringBuffer()

        def file=new File(scriptPath)
        if (!file.exists()){
            return ''
        }
        file.eachLine {
            scbuff.append(it).append("\n");
        }

        return scbuff.toString()

    }

    def runScript(String billtypecode,String action,data,Integer actionType,String buskey){
        this.runScript(billtypecode,action,data,SystemConfig.getWebAppPath(),actionType,buskey)

    }

    /**
     *
     * @param billtypecode  单据号
     * @param action
     * @param data
     * @param webappPath
     * @param actionType 动作前  动作后
     * @param buskey 业务类型
     * @return
     */
    def runScript(String billtypecode,String action,data,String webappPath,Integer actionType,String buskey){
       def billtype= PubBilltype.findByBilltypecode(billtypecode)
        if (!billtype){
            //throw new BusinessException('单据类型未找到！')
            return
        }


            println webappPath+'...........................'
            this.runScript(billtype,action,data,webappPath,actionType,buskey)

    }

    def runScript(PubBilltype billtype,String action,Map data,Integer actionType,String buskey){

        return  this.runScript(billtype,action,data,SystemConfig.getWebAppPath(),actionType,buskey)
    }

    def runScript(PubBilltype billtype,String action,Map data,String webappPath,Integer actionType,String buskey){



        PubActionscript sc=PubActionscript.findByPubBilltypeAndScriptCodeAndActionType(billtype,action,actionType)


        if (!sc)
            return
        if (actionType==0)
            println '执行动作前脚本......'+sc.path
        else
            println '执行动作后脚本......'+sc.path
        def scriptPath=webappPath+"/script/"+sc.path
        println '脚本路径：'+scriptPath
        log.info('脚本路径：'+scriptPath)

        def file=new File(scriptPath)
//        println file.getAbsolutePath()
//        println file.getCanonicalPath()
//        println file.getParentFile().getPath()
//        println file.getName()
        //def path=scriptPath.substring(0,scriptPath.lastIndexOf("/"))
        def engine = new GroovyScriptEngine(file.getParentFile().getPath(),this.class.getClassLoader()) // scriptBase为存放动态Groovy脚本的路径列表
        def bind = new SpringBinding(grailsApplication.mainContext)


       data.keySet().each {

           bind.setVariable(it,data[it])
       }




        engine.run(file.getName(),bind)// scriptName脚本名称

        return bind.getVariable("returnValue")
    }


    def runChangeScript(String formCode,String toCode,Map data){


        this.runChangeScript(formCode,toCode,data,SystemConfig.getWebAppPath())

    }

    def runChangeScript(String formCode,String toCode,Map data,String webappPath){


        def frombilltype= PubBilltype.findByBilltypecode(formCode)
        if (!frombilltype){
            throw new BusinessException('单据类型未找到！')
            return
        }
        def tobilltype= PubBilltype.findByBilltypecode(toCode)
        if (!tobilltype){
            throw new BusinessException('单据类型未找到！')
            return
        }

      return  this.runChangeScript(frombilltype,tobilltype,data,webappPath)

    }

    def runChangeScript(PubBilltype from,PubBilltype to,Map data,String webappPath){

        PubChangescript sc=PubChangescript.findByChangeFromAndChangeTo(from,to)
        if (!sc)
            return

        def scriptPath=webappPath+"/script/"+sc.path
        println '执行交换规则脚本..........'+scriptPath
        def file=new File(scriptPath)
        //def path=scriptPath.substring(0,scriptPath.lastIndexOf("/"))
        def engine = new GroovyScriptEngine(file.getParentFile().getPath(),this.class.classLoader) // scriptBase为存放动态Groovy脚本的路径列表
        def bind = new SpringBinding(grailsApplication.mainContext)

        data.keySet().each {

            bind.setVariable(it,data[it])
        }




        engine.run(file.getName(),bind)// scriptName脚本名称

        return bind.getVariable("returnValue")
    }

    def runChangeScript(PubBilltype from,PubBilltype to,Map data){
        return this.runChangeScript(from,to,data,SystemConfig.getWebAppPath())
    }

}
