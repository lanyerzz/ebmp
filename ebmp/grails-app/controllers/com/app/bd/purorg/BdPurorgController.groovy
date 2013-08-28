package com.app.bd.purorg

import com.app.bd.corp.BdCorp
import org.springframework.dao.DataIntegrityViolationException

import com.app.exception.BusinessException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class BdPurorgController {
    //注册pageId   UUID 去除“-”
    def static _pageId = 'BdPurorg'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        [pageId: _pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [rows: BdPurorg.list(params), total: BdPurorg.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [bdPurorgInstance: new BdPurorg(params), pageId: _pageId]
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def bdPurorgInstance = new BdPurorg(params)
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        bdPurorgInstance.ownercorp = corp
        if (!bdPurorgInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: bdPurorgInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }

            def json = [validateerrors: _errors]

            render json as JSON
            return
        }

        def data = bdPurorgInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdPurorg.label', default: 'BdPurorg'), bdPurorgInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdPurorgInstance = BdPurorg.get(id)
        if (!bdPurorgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPurorg.label', default: 'BdPurorg'), id])
            redirect(action: "list")
            return
        }

        [bdPurorgInstance: bdPurorgInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdPurorgInstance = BdPurorg.get(id)
        if (!bdPurorgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPurorg.label', default: 'BdPurorg'), id])

        }

        [bdPurorgInstance: bdPurorgInstance, pageId: _pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdPurorgInstance = BdPurorg.get(id)
        if (!bdPurorgInstance) {

            def json = [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdPurorg.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdPurorgInstance.version > version) {
                def msg = message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdPurorg.label', default: 'BdPurorg')] as Object[],
                        "Another user has updated this BdPurorg while you were editing")
                def josn = [remoteErrors: msg]
                render josn as JSON
                return
            }
        }

        bdPurorgInstance.properties = params

        if (!bdPurorgInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: bdPurorgInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }
            def json = [validateerrors: _errors]
            render json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdPurorg.label', default: 'BdPurorg'), bdPurorgInstance.id])
        def data = bdPurorgInstance.part()
        data.remoteMessage = message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdPurorgInstance = BdPurorg.get(id)
        if (!bdPurorgInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdPurorgInstance.delete(flush: true)
        render id

    }

    def query(){
        def sf = BdPurorg.list()
        def data = []
        sf?.each {
            data << it.part()
        }
        render data as JSON
    }
}
