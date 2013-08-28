package com.app.sm.function
import grails.converters.JSON


import com.app.dto.TDTO
import com.app.exception.BusinessException

import static java.util.UUID.randomUUID


class SmFunctionController {
   // def static pageId=randomUUID().toString().replaceAll('-','')
    def static _pageId=randomUUID().toString().replaceAll('-','')

    def springSecurityService
    def smFunctionService


    private List getfunTypeList(){
        [
                message(code: 'SmFunction.funType.0',default: '功能目录'),
                message(code: 'SmFunction.funType.1',default: '单据界面'),
                message(code: 'SmFunction.funType.2',default: '执行节点'),
                message(code: 'SmFunction.funType.3',default: '按钮')
        ]
    }


    private List getConfigAttributeList(){
        ["不允许匿名访问(需要权限分配)",
         "不允许匿名访问(不需要权限分配)",
         "允许匿名访问"
        ]
    }
    private List getConfigAttributeKey(){
        ['',"IS_AUTHENTICATED_FULLY","IS_AUTHENTICATED_ANONYMOUSLY"
        ]
    }





    //删除操作
    def delete(String id){
           def sm=  smFunctionService.delete(id)
        def data=['id':id,remoteMessage:message(code: 'default.delete.success.message',default: '删除成功')]
           render data as JSON
    }

    /**
     * 获取用户 打开节点 的按钮权限
     * @return
     */
    def queryButtonPower(){

        if(!params['functionid'])//节点ID
        {
            TDTO dto=new TDTO(status:TDTO.STATUS_FAILURE,errors:'参数为空！')
            render dto as JSON
        }
        TDTO dto
        def fid=params.functionid
        SmFunction f=	SmFunction.load(fid)
        def username = springSecurityService.principal.username
        def _id=springSecurityService.principal.id
        def _loginCorp=springSecurityService.authentication.loginCorp




        if(username=='admin'){//超级用户  返回所有按钮权限
//			def sf=	 SmUserSmRoles.executeQuery(""" select ff from SmFunction ff where ff.parentId=? """,fid)
            dto=new TDTO(status:TDTO.STATUS_SUCCESS,data:'all')

        }else{//节点按钮按钮权限控制  其下的所有的按钮都默认启用按钮权限      //判断节点是否按钮权限控制

            def sm= SmFunction.get(fid) //查找节点编码
            def sf=	 SmUserSmRoles.executeQuery("""
			select f from SmUserSmRoles ur
			left join  ur.smRoles.function f
			left join  ur.smRoles.corp c where ur.smUser.id=? and c.id=? and f.parentId = ?  and f.funType=3  order by f.funCode
			""",[_id, _loginCorp, fid])
            dto=new TDTO(status:TDTO.STATUS_SUCCESS,data:sf)
        }


        render dto as JSON


    }





    /**
     * 查询用户模块下的节点权限
     * @return
     */
    def queryChildByUser(){
        println params
        def pid=params.id?:params.pid
        def sf=  smFunctionService.queryChildByUser(pid)

        def data=[]
        sf.each {

            if(it.funType==0)
                data<<[id:it.id,text:it.funName,state:'closed']
            else
                data<<[id:it.id,text:it.funName,attributes:[url:"${createLink(controller:it.smcontroller ,action:it.smaction)}/${it.id}"]]
        }
        render data as JSON
    }






    /**
     * 查询用户拥有的权限模块
     * @return
     */
    def queryModuleByUser(){

        def sf=  smFunctionService.queryModuleByUser()


        render (view: 'moduleList',model: [moduleData:sf])
    }




    //查询
    def query1(String id){
        println params
        List sf
        if(id){

            //SmFunction.executeQuery(" from SmFunction where url is not null and url")
            sf= SmFunction.findAllByParentId(id,[sort:'funCode'])

        }else{
            sf= SmFunction.findAllByParentId('0',[sort:'funCode']);//?.toDTO(SmFunctionDTO)

        }
        def data=[]
        sf.each {

                Map row=it.part()
                if (SmFunction.countByParentId(it.id))
                    row.state='closed'

                row.funType_=g.smFunctionType(value: row.funType)
                if(row.funType!=0)
                row.configAttribute=g.smConfigAttribute(value:row.configAttribute);
                row['pubBilltype.billtypename'] = it?.pubBilltype?.billtypename
                data<<row


        }
        render data as JSON
    }


    def index(){

        render(view: 'index',model: [pageId:_pageId])
    }


    def show(){

        render(view: 'show',model: [smFunctionInstance:SmFunction.get(params.id),pageId:_pageId])
    }



    def update(String id,Long version){
        println params
        def smFunctionInstance = SmFunction.get(id)
        if (!smFunctionInstance) {
           def json= [errors: message(code: 'default.not.found.message', args: [message(code: 'smFunction.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (smFunctionInstance.version > version) {
              def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'smFunction.label', default: '功能节点')] as Object[],
                        "Another user has updated this HtTest while you were editing")
                def josn=[errors:msg]
                render json as JSON
                return

            }
        }

        smFunctionInstance.properties = params

        if(smFunctionInstance.smcontroller){

            smFunctionInstance.url=''

                def url=createLink(controller: smFunctionInstance.smcontroller,action: smFunctionInstance.smaction).toString()
                smFunctionInstance.url+='/'+url.split('/',3)[2]+'/**'



        }

        if (!smFunctionInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: smFunctionInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            springSecurityService.clearCachedRequestmaps();
            def json=[errors:_errors]
            render  json as JSON
        }

        def message = message(code: 'default.updated.message', args: [message(code: 'smFunction.label', default: '功能节点'), smFunctionInstance.funCode])
        if(smFunctionInstance.funType==0){
            Map row=smFunctionInstance.part()
            row.flash_message=message
            row.state='closed'
            row.funType=g.smFunctionType(value: row.funType)
            if(row.funType!=0)
            row.configAttribute=g.smConfigAttribute(value:row.configAttribute);
            render row as JSON
        }
        else{
            Map row=smFunctionInstance.part()
            row.flash_message=message
            row.funType=g.smFunctionType(value: row.funType)
            if(row.funType!=0)
            row.configAttribute=g.smConfigAttribute(value:row.configAttribute);
            render row as JSON
        }

    }


    def create(){

            if(params.id){
                def sm=SmFunction.get(params.id)
                if(!sm){
                    // 'default.not.found.message','功能节点未找到！'
                    flash.message= g.message(code:'default.not.found.message',default: '项目未找到!' )
                }
                def nf=new SmFunction()
                nf.parentId=params.id

                [smFunctionInstance:nf,parentCode:sm.funCode,funTypeList: getfunTypeList(),pageId:_pageId,configAttribute:getConfigAttributeList(),configAttributeKey:getConfigAttributeKey()]
            }else{
                [smFunctionInstance: new SmFunction(),funTypeList: getfunTypeList(),pageId:_pageId,configAttribute:getConfigAttributeList(),configAttributeKey:getConfigAttributeKey()]
            }

    }


    def save(){

        def smFunctionInstance = new SmFunction(params)

        // smFunctionInstance.properties = params

        if(smFunctionInstance.smcontroller){

            smFunctionInstance.url=''

                def url=createLink(controller: smFunctionInstance.smcontroller,action: smFunctionInstance.smaction).toString()
                smFunctionInstance.url+='/'+url.split('/',3)[2]+'/**'



        }
        if (!smFunctionInstance.save(flush: true)) {

            def _errors=[]
            g.eachError(bean: smFunctionInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            springSecurityService.clearCachedRequestmaps();

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        Map row=smFunctionInstance.part()
        if(SmFunction.countByParentId(row.id)!=0){
            row.state='closed'
        }
        row.funType=g.smFunctionType(value: row.funType)
        if(row.funType!=0)
        row.configAttribute=g.smConfigAttribute(value:row.configAttribute);
        render row as JSON


    }


    def edit(String id){


        if(id){
            def sm=SmFunction.get(id)
            if(!sm){
                // 'default.not.found.message','功能节点未找到！'
               flash.message=  g.message(code:'default.not.found.message',default: '项目未找到!' )

            }

            [smFunctionInstance:sm,funTypeList: getfunTypeList(),pageId:_pageId,configAttribute:getConfigAttributeList(),configAttributeKey:getConfigAttributeKey()]
        }
    }


    def queryNodeByCode(String funCode){
        def fun=SmFunction.findByFunCode(funCode)
        if(!fun) {
            render "{}"
            return
        }
        render "{id:'${fun.id}',text:'${fun.funName}',attributes:{url:'${createLink(controller:fun.smcontroller ,action:fun.smaction)}/${fun.id}'}}"

    }

    def queryNodeByNode(String funCode){
        def fun=SmFunction.findByFunCode(funCode)
        if(!fun) {
            render [] as JSON
            return
        }
        render ([id:fun.id,text:fun.funName,attributes:[url:g.createLink(controller:fun.smcontroller ,action:fun.smaction)]] as JSON)

    }
}