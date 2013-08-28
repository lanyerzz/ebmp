package com.app.sm.roles

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class SmRolesController {
    //注册pageId   UUID 去除“-”
    def static _pageId=randomUUID().toString().replaceAll('-','')
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def data = [rows: SmRoles.list(), total: SmRoles.count()]
        render data as JSON
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [smRolesInstance: new SmRoles(params),pageId:_pageId]
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def smRolesInstance = new SmRoles(params)
        if (!smRolesInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: smFunctionInstance){
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=smRolesInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'smRoles.label', default: 'SmRoles'), smRolesInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def smRolesInstance = SmRoles.get(id)
        if (!smRolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'smRoles.label', default: 'SmRoles'), id])
            redirect(action: "list")
            return
        }

        [smRolesInstance: smRolesInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def smRolesInstance = SmRoles.get(id)
        if (!smRolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'smRoles.label', default: 'SmRoles'), id])

        }

        [smRolesInstance: smRolesInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def smRolesInstance = SmRoles.get(id)
        if (!smRolesInstance) {

            throw new BusinessException (code: 'default.not.found.message', args: [message(code: 'smRoles.label', default: '功能节点')])

        }

        if (version != null) {
            if (smRolesInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'smRoles.label', default: 'SmRoles')] as Object[],
                          "Another user has updated this SmRoles while you were editing")
                throw new BusinessException(msg)
            }
        }

        smRolesInstance.properties = params

        if (!smRolesInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: smRolesInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]
                def json=[validateerrors:_errors]
                render  json as JSON
        }

        def message = message(code: 'default.updated.message', args: [message(code: 'smRoles.label', default: 'SmRoles'), smRolesInstance.id])
            def data= smRolesInstance.part()
            data.remoteMessage=message
            render data as JSON


    }
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def smRolesInstance = SmRoles.get(id)
        if (!smRolesInstance) {
            def errors = message(code: 'default.not.found.message', args: [message(code: 'smRoles.label', default: 'SmRoles')])
            def json=[remoteErrors:errors ]
            render json as JSON
            return
        }

        try {
            smRolesInstance.delete(flush: true)
            def message = message(code: 'default.deleted.message', args: [message(code: 'smRoles.label', default: 'SmRoles')])
           def data=['id':id,remoteMessage:message]
            render data as JSON
        }
        catch (DataIntegrityViolationException e) {
            def errors = message(code: 'default.not.deleted.message', args: [message(code: 'smRoles.label', default: 'SmRoles'), id])
            def json=[remoteErrors:errors ]
            render json as JSON
        }
    }


    private loadCorp(map,dt,data,Set keys){

            dt?.each {
                def node=[id: it.id,text: it.unitName,checked:keys.contains(it.id),children: []]
                data <<node

                loadCorp(map,map[node.id],node.children,keys)
        }

    }
    def createLinkCorp(String id){



       def corps= BdCorp.list()

        def fcorps=[:]
        corps.each {
            if(fcorps[it.fathercorp]){
                fcorps[it.fathercorp]<< it
            }else{
                fcorps[it.fathercorp]=[]
                fcorps[it.fathercorp]<< it
            }
        }

        def rc=SmRoles.get(id)?.corp
        def keys=new TreeSet<String>()
        rc.each {
            keys.add(it.id)
        }

        def c = fcorps['0'];
        def data=[]
        loadCorp(fcorps,c,data,keys)
        log.debug(data)
        render view:'corpTree',model: [data:data as JSON,pageId: _pageId]
    }


    def linkCorps(String id,String data){
        def sr= SmRoles.get(id)
        if(!sr){
            def dt=[remoteErrors: message(code: 'default.not.found.message',default:  "请求的数据未找到！")]
            render dt as JSON
        }
        def json=JSON.parse(data)
        sr.corp.clear()
        json.id.each {
            sr.corp<< BdCorp.get(it)
        }

       sr.save(true)

        def dt=[remoteMessage: message(code: 'default.success.message',default:  "操作完成！")]
        render dt as JSON

    }

}
