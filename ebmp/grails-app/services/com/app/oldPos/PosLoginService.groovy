package com.app.oldPos

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.sm.user.SmUser





class PosLoginService {

    def springSecurityService





    public LoginSession login(String corpID,String uCode, String uPwd) throws Exception {
        println corpID
        println uCode
        println uPwd
              LoginSession ls= this._login(corpID,uCode, uPwd);

        return ls;
    }

    private LoginSession _login(String corpID,String uCode,String uPwd){


            log.info("用户："+uCode+"开始登录.........");
            if(uCode==null || uPwd==null || uCode.toString().trim().length()==0 || uPwd.toString().trim().length()==0 )
                throw new BusinessException("用户编码或密码不能为空！");

            LoginSession ls=new LoginSession();
        	def password = springSecurityService.encodePassword(uPwd)


          def user= SmUser.findByUsernameAndPasswordAndAccountLockedAndUserenabledAndAccountExpiredAndPasswordExpired(uCode,password,false,true,false,false)
            if(!user)
                throw new BusinessException("用户名或密码错误，登录失败！");



            SmUserDTO user_new=new SmUserDTO();
            user_new.username=user.userRealName
            user_new.usercode=user.username
            user_new.userPassword=password

            ls.setUserDto(user_new);



          //普通用户需要查询分配的权限

//        def sms=this.queryModuleByUser(user.id,corpID)
//
//            SmFunctionDTO[] fundtos=new SmFunctionDTO[sms.size()];
//        sms.eachWithIndex {it,index->
//           // data<<[id:it.id,text:it.funName,attributes:[url:"${createLink(controller:it.smcontroller ,action:it.smaction)}/${it.id}"]]
//                fundtos[index]=new SmFunctionDTO();
//            fundtos[index].pkFunction=it.id;
//            fundtos[index].funcode=it.funCode;
//            fundtos[index].funname=it.funName;
//            fundtos[index].fatherid=it.parentId;
//            fundtos[index].classpath=it.smaction;
//            }
//
//
//            ls.setFunDTO(fundtos);
            BdCorp corp= BdCorp.get(corpID)
            CorpDTO corpdto=new CorpDTO();
            corpdto.pkCorp=corp.id;
            corpdto.unitname=corp.unitName;
            corpdto.unitcode=corp.unitCode;
           corpdto.cfatherid=corp.fathercorp;
        ls.setCorp(corpdto);//登录公司ID
            //向session管理器增加session

            return ls;
        }




//
//private queryChildByUser(parentId,userid,loginCorp){
//    if(!parentId)
//    {
//        throw new BusinessException('参数不能为空！')
//    }
//        //def sm= SmFunction.get(parentId) //查找节点编码
//        def sf=	 SmUserSmRoles.executeQuery("""
//				select distinct sf from SmUserSmRoles ur
//				left join  ur.smRoles role
//				left join role.function f
//				left join f.smFunction sf
//				join  ur.smRoles.corp c
//				where ur.smUser.id=? and c.id=?
//				and sf.funType<3 and sf.parentId=?
//				order by sf.funCode
//				""",[userid, loginCorp,parentId])
//        return sf
//
//}
//
///**
// * 查询用户拥有的权限模块
// * @return
// */
//private queryModuleByUser(String _userid,_loginCorp){
//        def f=	 SmUserSmRoles.executeQuery("""
//				select distinct sf from SmUserSmRoles ur
//				left join  ur.smRoles role
//				left join role.function f
//				left join f.smFunction sf
//				join  ur.smRoles.corp c
//				where ur.smUser.id=? and c.id=? and f.smFunction.parentId='0'
//				and sf.funType=0
//				order by sf.funCode
//				""",[_userid, _loginCorp])
//
//        return f
//
//}

}
