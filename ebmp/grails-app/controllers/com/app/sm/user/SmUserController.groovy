package com.app.sm.user

import com.app.exception.BusinessException
import com.app.sm.roles.SmRoles
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID



import org.springframework.dao.DataIntegrityViolationException

class SmUserController {
    //注册pageId   UUID 去除“-”
    def static _pageId = randomUUID().toString().replaceAll('-', '')
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def smUserService

    def index() {
        [pageId: _pageId]
    }



    def create() {
        [smUserInstance: new SmUser(params), pageId: _pageId]
    }

    def save() {
        def smUserInstance = new SmUser(params)
        if (!smUserInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: smFunctionInstance) {
                _errors << [field: it.field, message: g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json = [validateerrors: _errors]

            render json as JSON
            return
        }

        def data = smUserInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'smUser.label', default: 'SmUser'), smUserInstance.id])
        render data as JSON
    }

    def show(String id) {
        def smUserInstance = SmUser.get(id)
        if (!smUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'smUser.label', default: 'SmUser'), id])
            redirect(action: "list")
            return
        }

        [smUserInstance: smUserInstance]
    }

    def edit(String id) {
        def smUserInstance = SmUser.get(id)
        if (!smUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'smUser.label', default: 'SmUser'), id])

        }

        [smUserInstance: smUserInstance, pageId: _pageId]
    }

    def update(String id, Long version) {
        def smUserInstance = SmUser.get(id)
        if (!smUserInstance) {

            throw new BusinessException (code: 'default.not.found.message', args: [message(code: 'smUser.label', default: '功能节点')])

        }

        if (version != null) {
            if (smUserInstance.version > version) {
                def msg = message("version", "default.optimistic.locking.failure",
                        [message(code: 'smUser.label', default: 'SmUser')] as Object[],
                        "Another user has updated this SmUser while you were editing")
                throw new BusinessException(msg)
            }
        }

        smUserInstance.properties = params

        if (!smUserInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: smUserInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }
            def json = [validateerrors:_errors]
            render json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'smUser.label', default: 'SmUser'), smUserInstance.id])
        def data = smUserInstance.part()
        data.flash_message = message
        render data as JSON
    }
    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def smUserInstance = SmUser.get(id)
        if (!smUserInstance) {
            def errors = message(code: 'default.not.found.message', args: [message(code: 'smUser.label', default: 'SmUser')])
            def json = [remoteErrors: errors]
            render json as JSON
            return
        }

        try {
            smUserInstance.delete(flush: true)
            def message = message(code: 'default.deleted.message', args: [message(code: 'smUser.label', default: 'SmUser')])
            def data = ['id': id, remoteMessage: message]
            render data as JSON
        }
        catch (DataIntegrityViolationException e) {
            def errors = message(code: 'default.not.deleted.message', args: [message(code: 'smUser.label', default: 'SmUser'), id])
            def json = [remoteErrors: errors]
            render json as JSON
        }
    }
    def editPwd(String id){
        def smUserInstance = SmUser.get(id)
        if (!smUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'smUser.label', default: 'SmUser'), id])

        }

        [smUserInstance: smUserInstance, pageId: _pageId]
    }

    def savePwd(String id, Long version){
        println "~~~~~~~~~~~"+params;
        def smUserInstance = SmUser.get(id)
        if (!smUserInstance) {

            throw new BusinessException (code: 'default.not.found.message', args: [message(code: 'smUser.label', default: '功能节点')])

        }

        if (version != null) {
            if (smUserInstance.version > version) {
                def msg = message("version", "default.optimistic.locking.failure",
                        [message(code: 'smUser.label', default: 'SmUser')] as Object[],
                        "Another user has updated this SmUser while you were editing")
                throw new BusinessException(msg)
            }
        }

        smUserInstance.properties = params

        if (!smUserInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: smUserInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }
            def json = [validateerrors:_errors]
            render json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'smUser.label', default: 'SmUser'), smUserInstance.id])
        def data = smUserInstance.part()
        data.flash_message = message
        render data as JSON
    }


    def createLinkRole(){

        def ls= SmRoles.listOrderByRoleCode()
        def srs=  SmUserSmRoles.list(['smUser.id':params.userid])
        def keys=new TreeSet<String>()
        srs?.each {
            keys.add(it.smRoles.id+'_'+it.bdCorp.id)
        }
        def _data=[]
        ls.each {

            def _children=[]
            def roleid=it.id
            it.corp?.each {
                _children<< [id:it.id,text:it.unitName,checked:keys.contains(roleid+'_'+it.id)]
            }
            def node =  [id:it?.id,text:it?.roleName,children:_children]
            _data<<node
        }
        render view: 'linkRoles',model: [data:_data,pageId:_pageId]
    }

    /**
     * 保存用户与角色关系
     * @return
     */
    def saveLinkRole(){



       def data= JSON.parse(params.data)
        def srs=[] //存放SmUserSmRoles对象 用于批量保存
       data?.each {
           SmUserSmRoles ur=new SmUserSmRoles()

           ur.properties=['smUser.id':params.userid,'smRoles.id':it.roleid,'bdCorp.id':it.corpid]

           srs<<ur
       }
        try{
            smUserService.saveLinkRole(params.userid,srs)//保存关系
        }catch (e){
            def json=[remoteErrors: e.getMessage()]
            render json as JSON
            return
        }

        def json=[remoteMessage: '分配完成！']
        render json as JSON
    }

/**
 * 查询
 * @return
 */
    def query(){
        def smUserInstanceLs
        def smUserInstanceTotal
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(SmUser.createCriteria(),json)
            def cc= new CriteriaHelper(SmUser.createCriteria(),json)
            smUserInstanceTotal = cc.count()


            smUserInstanceLs = ch.list(params,"username")
        }else if (params.q!=null){
            def sjson="""{'operator':'and',
                    'criterias':[
                                {'operator':'equals','fieldName':'username','value':'${params.q}'},
                                ]
                    }"""
            def jsonObject=JSON.parse(sjson)
            CriteriaHelper ch = new CriteriaHelper(SmUser.createCriteria(),jsonObject)
            def cc= new CriteriaHelper(SmUser.createCriteria(),jsonObject)
            smUserInstanceTotal = cc.count()


            smUserInstanceLs = ch.list(params,"username")

        }else if (params.id){
            def smUserInstance= SmUser.get(params.id)
            def json= [rows: [smUserInstance], total: SmUser.count()]
            render json as JSON
            return;
        }else{

            CriteriaHelper ch = new CriteriaHelper(SmUser.createCriteria())
            def cc= new CriteriaHelper(SmUser.createCriteria())
            smUserInstanceTotal = cc.count()


            smUserInstanceLs = ch.list(params,"username")
        }

        def data = []
        smUserInstanceLs?.each {

            data << it.part()
        }

        def json= [rows: data, total: smUserInstanceTotal]
        render json as JSON



    }
}
