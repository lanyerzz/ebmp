package com.app.sv.sm


import com.app.exception.BusinessException
import com.app.sm.function.SmFunction
import com.app.sm.user.SmUserSmRoles
import org.codehaus.groovy.grails.web.errors.GrailsWrappedRuntimeException
import org.codehaus.groovy.grails.web.util.WebUtils
import org.springframework.context.i18n.LocaleContextHolder as LCH



class SmFunctionService {
    def messageSource
    def springSecurityService
    /**
     * 查询用户模块下的节点权限
     * @return
     */
    def queryChildByUser(parentId){
        if(!parentId)
        {
          throw new BusinessException('参数不能为空！')
        }

        def username = springSecurityService.principal.username


        if(username=='admin'){//超级用户
            def sm= SmFunction.get(parentId) //查找节点编码
            def sf=	 SmUserSmRoles.executeQuery('select f from SmFunction f where   f.parentId=? and f.funType<3  order by f.funCode',[ parentId])
            return sf
        }else{
            def _id=springSecurityService.principal.id
            def _loginCorp=springSecurityService.authentication.loginCorp

            //def sm= SmFunction.get(parentId) //查找节点编码
            def sf=	 SmUserSmRoles.executeQuery("""
				select distinct sf from SmUserSmRoles ur
				left join  ur.smRoles role
				left join role.function f
				left join f.smFunction sf
				join  ur.smRoles.corp c
				where ur.smUser.id=? and c.id=?
				and sf.funType<3 and sf.parentId=?
				order by sf.funCode
				""",[_id, _loginCorp,parentId])
            return sf
        }





    }

    /**
     * 查询用户拥有的权限模块
     * @return
     */
    def queryModuleByUser(){
        def username = springSecurityService.principal.username

        if(username=='admin'){//超级用户
            def f=	 SmUserSmRoles.executeQuery("select f from SmFunction  f where  f.parentId='0' and f.funType=0 order by f.funCode")
           return f
        }else{
            def _id=springSecurityService.principal.id
            def _loginCorp=springSecurityService.authentication.loginCorp

            println _id
            println _loginCorp
            def f=	 SmUserSmRoles.executeQuery("""
				select distinct sf from SmUserSmRoles ur
				left join  ur.smRoles role
				left join role.function f
				left join f.smFunction sf
				join  ur.smRoles.corp c
				where ur.smUser.id=? and c.id=? and f.smFunction.parentId='0'
				and sf.funType=0
				order by sf.funCode
				""",[_id, _loginCorp])

            return f
        }
    }


    def queryButtonPower(functionid){

            if(!functionid)//节点ID
            {
               throw new BusinessException('参数为空！')

            }


            SmFunction f=	SmFunction.load(functionid)
            def username = springSecurityService.principal.username
            def _id=springSecurityService.principal.id
            def _loginCorp=springSecurityService.authentication.loginCorp




            if(username=='admin'){//超级用户  返回所有按钮权限
			def sf=	 SmUserSmRoles.executeQuery(""" select ff from SmFunction ff where ff.parentId=? """,fid)
              return sf

            }else{//节点按钮按钮权限控制  其下的所有的按钮都默认启用按钮权限      //判断节点是否按钮权限控制

                def sm= SmFunction.get(functionid) //查找节点编码
                def sf=	 SmUserSmRoles.executeQuery("""
			select f from SmUserSmRoles ur
			left join  ur.smRoles.function f
			left join  ur.smRoles.corp c where ur.smUser.id=? and c.id=? and f.parentId = ?  and f.funType=3  order by f.funCode
			""",[_id, _loginCorp, functionid])
              return sf
            }



    }

    def delete(String id) throws BusinessException {
        GrailsWrappedRuntimeException

        def c=SmFunction.countByParentId(id)
        if(c>0){
            log.info('存在子节点，不允许删除！')
            def msg=messageSource.getMessage('smFunction.haschild.message',null,'存在子节点，不允许删除！',LCH.getLocale())
            throw new BusinessException( msg)
//            messageSource.getMessage('code',null,'defaultMessage,locale')
        }
        //
        SmFunction sm=SmFunction.load(id)


        if (!sm) {
            log.info('节点不存在!')
           throw new BusinessException( 'default.not.found.message','功能节点未找到！')

        }

        sm.delete(flush: true)

        return sm





    }
}
