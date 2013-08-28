package com.app.util

import com.app.exception.BusinessException

/**
 * Created with IntelliJ IDEA.
 * User: lanyer
 * Date: 13-4-2
 * Time: 下午3:55
 * To change this template use File | Settings | File Templates.
 */
class SystemConfig {
   private  static String web_app_path
   static String getWebAppPath(){
       if (!web_app_path){//webapp目录未初始化
           web_app_path= System.getenv('ebmp.webapp.dir')

           if (!web_app_path){//环境变量中未设置 webapp路径
             def classes=  SystemConfig.class.getClassLoader().getResource('../../')//暂时未处理，放入正是环境中待测试处理

               // println classes.getPath()
               web_app_path=classes.getPath()
           }
       }

      return web_app_path;
    }
}
