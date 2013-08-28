package com.app.bd.bankdoc

import com.app.bd.corp.BdCorp
import org.springframework.dao.DataIntegrityViolationException

import com.app.exception.BusinessException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class BdBankdocController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdBankdoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService


    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdBankdocInstanceList: BdBankdoc.list(params), bdBankdocInstanceTotal: BdBankdoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String id) {
        if (id){
            def bdBankdoc = BdBankdoc.get(id)
            if (!bdBankdoc){
                flash.message = g.message(code:'defautl.not.found.message',default:'没有找到公司档案')
            }
            def nc = new BdBankdoc();
            nc.pid = id
            [bdBankdocInstance:nc,pageId:_pageId]
        }else{
            [bdBankdocInstance: new BdBankdoc(),pageId:_pageId]
        }
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def bdBankdocInstance = new BdBankdoc(params)
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        def loginUser = springSecurityService.currentUser
        bdBankdocInstance.creator = loginUser
        bdBankdocInstance.bdCorp = corp
        if (!bdBankdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdBankdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdBankdocInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdBankdoc.label', default: 'BdBankdoc'), bdBankdocInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdBankdocInstance = BdBankdoc.get(id)
        if (!bdBankdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdBankdoc.label', default: 'BdBankdoc'), id])
            redirect(action: "list")
            return
        }

        [bdBankdocInstance: bdBankdocInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdBankdocInstance = BdBankdoc.get(id)
        if (!bdBankdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdBankdoc.label', default: 'BdBankdoc'), id])

        }

        [bdBankdocInstance: bdBankdocInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdBankdocInstance = BdBankdoc.get(id)
        if (!bdBankdocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdBankdoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdBankdocInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdBankdoc.label', default: 'BdBankdoc')] as Object[],
                          "Another user has updated this BdBankdoc while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }
        def loginUser = springSecurityService.currentUser
        params.modifier = loginUser
        bdBankdocInstance.properties = params

        if (!bdBankdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdBankdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdBankdoc.label', default: 'BdBankdoc'), bdBankdocInstance.id])
        def data= bdBankdocInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdBankdocInstance = BdBankdoc.get(id)
        if(BdBankdoc.countByPid(id)!=0){
            throw new BusinessException('存在子节点！')
        }
        if (!bdBankdocInstance) {
           throw new BusinessException('未找到要删除的数据!')
        }
        bdBankdocInstance.delete(flush: true)
        render id

    }

    def query(String id){
        def bdBankdocInstances
        if (id){
            bdBankdocInstances = BdBankdoc.findAllByPid(id,[sort:'bankdoccode'])
        }else{
            bdBankdocInstances = BdBankdoc.findAllByPid('0',[sort:'bankdoccode'])
        }
        def data = []
        bdBankdocInstances.each {
            Map row = it.part()
            if (BdBankdoc.countByPid(it.id)!=0){
                row.state = 'closed'
            }
            row['banktype.banktypename'] = it?.banktype?.banktypename
            row['bdCorp.unitName'] = it?.bdCorp?.unitName
            row['creator.userRealName'] = it?.creator?.userRealName
            row['modifier.userRealName'] = it?.modifier?.userRealName

            data << row
        }
        render data as JSON
    }
}
