package com.app.bd.invcl

import com.app.bd.corp.BdCorp
import org.springframework.dao.DataIntegrityViolationException

import com.app.exception.BusinessException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class BdInvclController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdInvcl'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdInvclInstanceList: BdInvcl.list(params), bdInvclInstanceTotal: BdInvcl.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String id) {
        if (id){
            def bdInvclInstance = BdInvcl.get(id)
            if (!bdInvclInstance){
                flash.message = message(code: 'default.not.found.message',default:'没有找到存货分类')
                [bdInvclInstance: new BdInvcl(),pageId:_pageId]
            }else{
                def newInstance = new BdInvcl()
                newInstance.pid = id
                [bdInvclInstance:newInstance,pageId:_pageId]
            }
        }else{
            [bdInvclInstance: new BdInvcl(),pageId:_pageId]
        }

    }

    /**
     * 保存
     * @return
     */
    def save() {
        def bdInvclInstance = new BdInvcl(params)
        if (!bdInvclInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdInvclInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdInvclInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdInvcl.label', default: 'BdInvcl'), bdInvclInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdInvclInstance = BdInvcl.get(id)
        if (!bdInvclInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdInvcl.label', default: 'BdInvcl'), id])
            redirect(action: "list")
            return
        }

        [bdInvclInstance: bdInvclInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdInvclInstance = BdInvcl.get(id)
        if (!bdInvclInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdInvcl.label', default: 'BdInvcl'), id])

        }

        [bdInvclInstance: bdInvclInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdInvclInstance = BdInvcl.get(id)
        if (!bdInvclInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdInvcl.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdInvclInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdInvcl.label', default: 'BdInvcl')] as Object[],
                          "Another user has updated this BdInvcl while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        bdInvclInstance.properties = params

        if (!bdInvclInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdInvclInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdInvcl.label', default: 'BdInvcl'), bdInvclInstance.id])
        def data= bdInvclInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdInvclInstance = BdInvcl.get(id)
        if (!bdInvclInstance) {
           throw new BusinessException('未找到要删除的数据!')
        }
        bdInvclInstance.delete(flush: true)
        render id

    }

    /**
     * 查询
     */
    def query(String id){
        List bdInvclInstance
        if (id){
            bdInvclInstance = BdInvcl.findAllByPid(id,[sort:'invclassCode'])
        }else{
            bdInvclInstance = BdInvcl.findAllByPid('0',[sort:'invclassCode'])
        }
        def data = []
        bdInvclInstance?.each {
            Map row = it.part()
            if (BdInvcl.countBypid(it.id)!=0){
                row.state = 'closed'
            }
            row['pkCorp.unitName'] = it?.pkCorp?.unitName
            data << row
        }


        render data as JSON
    }
}
