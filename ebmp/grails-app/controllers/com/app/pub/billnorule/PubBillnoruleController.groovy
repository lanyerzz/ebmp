package com.app.pub.billnorule

import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import org.springframework.dao.DataIntegrityViolationException

import com.app.exception.BusinessException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class PubBillnoruleController {
    //注册pageId   UUID 去除“-”
    def static _pageId=randomUUID().toString().replaceAll('-','')
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pubBillnoruleInstanceList: PubBillnorule.list(params), pubBillnoruleInstanceTotal: PubBillnorule.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String id) {
        def pubBilltypeInstance = PubBilltype.get(id)
        def pubBillnoruleInstance = new PubBillnorule()
        if (!pubBilltypeInstance){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubBilltype.label', default: 'PubBilltype'), id])
        }else{
            pubBillnoruleInstance.pubbilltype = pubBilltypeInstance
        }
        [pubBillnoruleInstance: pubBillnoruleInstance,pageId:_pageId]
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def pubBillnoruleInstance = new PubBillnorule(params)
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        pubBillnoruleInstance.bdCorp = corp
        if (!pubBillnoruleInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubBillnoruleInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=pubBillnoruleInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'pubBillnorule.label', default: 'PubBillnorule'), pubBillnoruleInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def pubBillnoruleInstance = PubBillnorule.get(id)
        if (!pubBillnoruleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubBillnorule.label', default: 'PubBillnorule'), id])
            redirect(action: "list")
            return
        }

        [pubBillnoruleInstance: pubBillnoruleInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def pubBillnoruleInstance = PubBillnorule.get(id)
        if (!pubBillnoruleInstance){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubBillnorule.label', default: 'PubBillnorule'), id])
        }

        [pubBillnoruleInstance: pubBillnoruleInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def pubBillnoruleInstance = PubBillnorule.get(id)
        if (!pubBillnoruleInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'pubBillnorule.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (pubBillnoruleInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'pubBillnorule.label', default: 'PubBillnorule')] as Object[],
                        "Another user has updated this PubBillnorule while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        pubBillnoruleInstance.properties = params

        if (!pubBillnoruleInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubBillnoruleInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'pubBillnorule.label', default: 'PubBilltype'), pubBillnoruleInstance.id])
        def data= pubBillnoruleInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def pubBillnoruleInstance = PubBillnorule.get(id)
        if (!pubBillnoruleInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        pubBillnoruleInstance.delete(flush: true)
        render id

    }


    /**
     * 查询
     */
    def query(){
        def pubBilltypeInstances = PubBilltype.list()
        def data = []
        pubBilltypeInstances?.each {
            def row = [:]
            if (PubBillnorule.findByPubbilltype(it)){
                row = PubBillnorule.findByPubbilltype(it).part()
                row['pubbilltype'] = PubBillnorule?.findByPubbilltype(it)?.pubbilltype?.part()
                row['bdCorp.unitName'] = PubBillnorule?.findByPubbilltype(it)?.bdCorp?.unitName
            }else{
                row = new PubBillnorule().part()
                row.pubbilltype = it
            }
            data << row
        }
        render data as JSON
    }
}
