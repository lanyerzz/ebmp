package com.app.security

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.sm.user.SmUser
import grails.converters.JSON

import static java.util.UUID.randomUUID

class LoginInfoController {
    def static _pageId=randomUUID().toString().replaceAll('-','')
    def springSecurityService






    def index() {
        println '~~~~~~~~~~~~~~~~'
        def _loginCorp = springSecurityService.getAuthentication().loginCorp
        def loginUser = springSecurityService.currentUser
        def loginCorp = BdCorp.get(_loginCorp)

        def userRealName = loginUser.userRealName
        def corpName = loginCorp.unitName
       // def data = [userRealName:userRealName,corpName:corpName,pageId: _pageId]
        render view:'index' , model: ['loginUser':loginUser,'loginCorp':loginCorp]
    }

    def checkOrPassword(){
        try{
//            def data = JSON.parse(params.jsonData)

            def inpassword = data.orPassword//输入的原密码
            def password = springSecurityService.encodePassword(inpassword)//对输入的原密码加密
            def _loginUser = springSecurityService.currentUser.id//当前用户id
            def loginUser = SmUser.get(_loginUser)
            if(!loginUser.password.equalsIgnoreCase(password)){
                throw new BusinessException("原密码不正确")
            }
            bindData(loginUser,data)
            if(loginUser.validate()){
                loginUser.save()

            }
//            render	new TDTO(status:TDTO.STATUS_SUCCESS) as JSON

        }catch(Exception e){
//            render new TDTO(status:TDTO.STATUS_FAILURE,errors:e.getMessage()) as JSON
        }

    }

    def openChangeCorpDlg(){
        def pkCorp = springSecurityService.authentication.loginCorp
        render view: 'changeCorp',model: [loginCorp:pkCorp,pageId:_pageId]
    }

    def changeCorp(){
        def pkCorp = params.corp
        if(pkCorp=="null"){
            throw new BusinessException("请选择公司")
        }
        springSecurityService.getAuthentication().loginCorp = pkCorp
        springSecurityService.userCache
        def corp = BdCorp.get(pkCorp)
        def data = [corpName: corp.unitName]
        render data as JSON

    }


    def openLockWindowDlg(){
        def _loginCorp = springSecurityService.getAuthentication().loginCorp
        def _loginUser = springSecurityService.currentUser

        if (!_loginCorp){
            throw new BusinessException('无法获取登录公司信息！')
        }
        if (!_loginUser){
            throw new BusinessException('无法获取登录用户信息!')
        }
        


        def data = [username:_loginUser.username,loginCorp: _loginCorp]
        render view:'lockWindow',model: [data:data]

    }

}
