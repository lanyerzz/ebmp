package com.app.bd.corp

import com.app.exception.BusinessException
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class BdCorpController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdCorp'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        [pageId:_pageId]
    }


    /**
     * 进入添加页面
     * @return
     */
    def create(String id) {
        if (id){
            def bdCorp = BdCorp.get(id)
            if (!bdCorp){
                flash.message = g.message(code:'defautl.not.found.message',default:'没有找到公司')
            }
            def nc = new BdCorp();
            nc.fathercorp = id
            [bdCorpInstance:nc,pageId:_pageId]
        }else{
            [bdCorpInstance: new BdCorp(),pageId:_pageId]
        }

    }

    /**
     * 保存
     * @return
     */
    def save() {

        def bdCorpInstance = new BdCorp(params)

        if (!bdCorpInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdCorpInstance){
                _errors << [ field:it.field,  message:g.message(error: it)]

            }


            def json=[validateerrors:_errors]

            render json as JSON
            return
        }
        def data=bdCorpInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdCorp.label', default: 'BdCorp'), bdCorpInstance.unitName])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdCorpInstance = BdCorp.get(id)
        if (!bdCorpInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdCorp.label', default: 'BdCorp'), id])
            redirect(action: "list")
            return
        }

        [bdCorpInstance: bdCorpInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdCorpInstance = BdCorp.get(id)
        if (!bdCorpInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdCorp.label', default: 'BdCorp'), id])

        }

        [bdCorpInstance: bdCorpInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdCorpInstance = BdCorp.get(id)
        if (!bdCorpInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdCorp.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdCorpInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdCorp.label', default: 'BdCorp')] as Object[],
                          "Another user has updated this BdCorp while you were editing")
                def josn=[validateerrors:msg]
                render josn as JSON
                return
            }
        }

        bdCorpInstance.properties = params

        if (!bdCorpInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdCorpInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdCorp.label', default: 'BdCorp'), bdCorpInstance.id])
        def data= bdCorpInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdCorpInstance = BdCorp.get(id)
        if (BdCorp.countByFathercorp(id)!=0){
            throw new BusinessException('default.exist.childrennode.message','存在子节点！');
        }
        if (!bdCorpInstance) {
            throw new BusinessException('default.not.found.message','要删除的数据未找到!');
        }
        bdCorpInstance.delete(flush: true)
        render id;
    }
    /**
     * treegrid查询
     * @param id
     * @return
     */
    def query(String id){
        println '================'+params
        List bdCorpInstances
        if (id){
            bdCorpInstances = BdCorp.findAllByFathercorp(id,[sort:'unitCode'])
        }else{
            bdCorpInstances = BdCorp.findAllByFathercorp('0',[sort:'unitCode'])
        }
        def data = []
        bdCorpInstances?.each {
            Map row = it.part()
            if (BdCorp.countByFathercorp(it.id)!=0){
                row.state = 'closed'
            }
            row.text=row.unitName
            row['currencyType.currtypename'] = it?.currencyType?.currtypename
            data << row
        }


        render data as JSON

    }

    def queryCorp(){
        List bdCorpInstances
        bdCorpInstances = BdCorp.list()
        def data = []
        bdCorpInstances?.each {
            Map row = it.part(include:['id','unitCode','unitName'])
            data << row
        }

        render data as JSON
    }



}
