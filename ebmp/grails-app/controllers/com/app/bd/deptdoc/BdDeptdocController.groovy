package com.app.bd.deptdoc

import com.app.bd.corp.BdCorp
import org.springframework.dao.DataIntegrityViolationException

import com.app.exception.BusinessException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class BdDeptdocController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdDeptdoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdDeptdocInstanceList: BdDeptdoc.list(params), bdDeptdocInstanceTotal: BdDeptdoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String id) {
        if (id){
            def bdDeptdocInstance = BdDeptdoc.get(id)
            if (!bdDeptdocInstance){
                flash.message = g.message(code:'defautl.not.found.message',default:'没有找到部门')
            }
            def nd = new BdDeptdoc()
            nd.fatherId = id
            [bdDeptdocInstance: nd,pageId:_pageId]
        }else{
            [bdDeptdocInstance: new BdDeptdoc(),pageId:_pageId]
        }
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def bdDeptdocInstance = new BdDeptdoc(params)
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        bdDeptdocInstance.corp = corp
        if (!bdDeptdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdDeptdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdDeptdocInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdDeptdoc.label', default: 'BdDeptdoc'), bdDeptdocInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdDeptdocInstance = BdDeptdoc.get(id)
        if (!bdDeptdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdDeptdoc.label', default: 'BdDeptdoc'), id])
            redirect(action: "list")
            return
        }

        [bdDeptdocInstance: bdDeptdocInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdDeptdocInstance = BdDeptdoc.get(id)
        if (!bdDeptdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdDeptdoc.label', default: 'BdDeptdoc'), id])

        }

        [bdDeptdocInstance: bdDeptdocInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdDeptdocInstance = BdDeptdoc.get(id)
        if (!bdDeptdocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdDeptdoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdDeptdocInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdDeptdoc.label', default: 'BdDeptdoc')] as Object[],
                          "Another user has updated this BdDeptdoc while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        bdDeptdocInstance.properties = params

        if (!bdDeptdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdDeptdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdDeptdoc.label', default: 'BdDeptdoc'), bdDeptdocInstance.id])
        def data= bdDeptdocInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdDeptdocInstance = BdDeptdoc.get(id)
        if (BdDeptdoc.countByFatherId(id)!=0){
            throw new BusinessException('存在子节点!')
        }
        if (!bdDeptdocInstance) {
           throw new BusinessException('未找到要删除的数据!')
        }
        bdDeptdocInstance.delete(flush: true)
        render id

    }

    def query(String id){
        List sf
        if(id){
            sf = BdDeptdoc.findAllByFatherId(id,[sort:'deptCode'])
        }else{
            sf = BdDeptdoc.findAllByFatherId('0',[sort:'deptCode'])
        }
        def data = []
        sf?.each {
            def row = [:]
            row = it.part()
            if (BdDeptdoc.countByFatherId(it.id)!=0){
                row.state = 'closed'
            }
            data << row
        }
        render data as JSON
    }
}
