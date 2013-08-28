package com.app.bd.areacl

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class BdAreaclController {
    //注册pageId   UUID 去除“-”
    def springSecurityService
    def static _pageId='BdAreacl'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdAreaclInstanceList: BdAreacl.list(params), bdAreaclInstanceTotal: BdAreacl.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String id) {
        if (id){
            def father = BdAreacl.get(id)
            if (!father){
                flash.message = message(code: 'default.not.found.message',default:'没有找到地区分类')
                [bdAreaclInstance:new BdAreacl(),pageId:_pageId]
            }else{
                def newInstance = new BdAreacl()
                newInstance.pid = id
                [bdAreaclInstance: newInstance,pageId:_pageId]
            }
        }else{
            [bdAreaclInstance:new BdAreacl(),pageId:_pageId]
        }
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def bdAreaclInstance = new BdAreacl(params)
        def pkCorp = springSecurityService.authentication.loginCorp
        bdAreaclInstance.pkCorp = BdCorp.get(pkCorp)

        if (!bdAreaclInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdAreaclInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }
        def areaclcode = bdAreaclInstance.areaclcode
        def areaclname = bdAreaclInstance.areaclname
        def _id = bdAreaclInstance.id
        def corp = bdAreaclInstance?.pkCorp?.unitName?:""
        def mnecode = bdAreaclInstance.mnecode?:""
        def pid = bdAreaclInstance.pid
        Map row = [areaclcode:areaclcode,areaclname:areaclname,id:_id,pkCorp:corp,pid:pid,mnecode:mnecode]
        row.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdAreacl.label', default: 'BdAreacl'), bdAreaclInstance.id])
        println row
        render row as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdAreaclInstance = BdAreacl.get(id)
        if (!bdAreaclInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdAreacl.label', default: 'BdAreacl'), id])
            redirect(action: "list")
            return
        }

        [bdAreaclInstance: bdAreaclInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdAreaclInstance = BdAreacl.get(id)
        if (!bdAreaclInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdAreacl.label', default: 'BdAreacl'), id])

        }

        [bdAreaclInstance: bdAreaclInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdAreaclInstance = BdAreacl.get(id)
        if (!bdAreaclInstance) {

           throw new BusinessException(code: 'default.not.found.message', args: [message(code: 'bdAreacl.label', default: '功能节点')])

        }

        if (version != null) {
            if (bdAreaclInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdAreacl.label', default: 'BdAreacl')] as Object[],
                          "Another user has updated this BdAreacl while you were editing")
                throw new BusinessException(msg)
            }
        }

        bdAreaclInstance.properties = params

        if (!bdAreaclInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdAreaclInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdAreacl.label', default: 'BdAreacl'), bdAreaclInstance.id])
        def data= bdAreaclInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdAreaclInstance = BdAreacl.get(id)
        if (!bdAreaclInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if (BdAreacl.countByPid(id)!=0){
            throw new BusinessException('请检查，存在子节点')
        }
        bdAreaclInstance.delete(flush: true)
        render id


    }

    /**
     * 查询树形
     * @param id
     * @return
     */
    def query(String id){
        List bdAreaclInstances
        if (id){
            bdAreaclInstances = BdAreacl.findAllByPid(id,[sort:'areaclcode'])
        }else{
            bdAreaclInstances = BdAreacl.findAllByPid('0',[sort:'areaclcode'])
        }
        def data = []
        bdAreaclInstances?.each {
            def areaclcode = it.areaclcode
            def areaclname = it.areaclname
            def _id = it.id
            def pkCorp = it?.pkCorp?.unitName?:""
            def mnecode = it.mnecode?:""
            def pid = it.pid
            Map row = [areaclcode:areaclcode,areaclname:areaclname,id:_id,pkCorp:pkCorp,pid:pid,mnecode:mnecode]
            if (BdAreacl.countByPid(it.id)!=0){
                row.state = 'closed'
            }
            data << row
        }

        render data as JSON

    }


}
