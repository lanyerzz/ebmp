package com.app.lang

/**
 * Created with IntelliJ IDEA.
 * User: lanyer
 * Date: 13-4-24
 * Time: 下午1:54
 * To change this template use File | Settings | File Templates.
 */
class SpringBinding extends  Binding{
    def context
    public SpringBinding(context){
        this.context=context
        this.setVariable('returnValue',null)
        this.setVariable('businessKey',null)
    }

    def getBean(String beanName){
      return  context.getBean(beanName)
    }
}
