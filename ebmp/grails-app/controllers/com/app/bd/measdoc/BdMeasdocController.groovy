package com.app.bd.measdoc

import com.app.util.CriteriaHelper
import org.springframework.dao.DataIntegrityViolationException

import com.app.exception.BusinessException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class BdMeasdocController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdMeasdoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdMeasdocInstanceList: BdMeasdoc.list(params), bdMeasdocInstanceTotal: BdMeasdoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [bdMeasdocInstance: new BdMeasdoc(params),pageId:_pageId]
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def bdMeasdocInstance = new BdMeasdoc(params)
        if (!bdMeasdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdMeasdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdMeasdocInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdMeasdoc.label', default: 'BdMeasdoc'), bdMeasdocInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdMeasdocInstance = BdMeasdoc.get(id)
        if (!bdMeasdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdMeasdoc.label', default: 'BdMeasdoc'), id])
            redirect(action: "list")
            return
        }

        [bdMeasdocInstance: bdMeasdocInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdMeasdocInstance = BdMeasdoc.get(id)
        if (!bdMeasdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdMeasdoc.label', default: 'BdMeasdoc'), id])

        }

        [bdMeasdocInstance: bdMeasdocInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdMeasdocInstance = BdMeasdoc.get(id)
        if (!bdMeasdocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdMeasdoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdMeasdocInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdMeasdoc.label', default: 'BdMeasdoc')] as Object[],
                          "Another user has updated this BdMeasdoc while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        bdMeasdocInstance.properties = params

        if (!bdMeasdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdMeasdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdMeasdoc.label', default: 'BdMeasdoc'), bdMeasdocInstance.id])
        def data= bdMeasdocInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdMeasdocInstance = BdMeasdoc.get(id)
        if (!bdMeasdocInstance) {
           throw new BusinessException('未找到要删除的数据!')
        }
        bdMeasdocInstance.delete(flush: true)
        render id

    }

    def query(){
        def bdMeasdocInstanceList
        def bdMeasdocInstanceTotal
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdMeasdoc.createCriteria(),json)
            bdMeasdocInstanceTotal = new CriteriaHelper(BdMeasdoc.createCriteria(),json).count()

            bdMeasdocInstanceList = ch.list(params,"shortname")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'shortname','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'measname','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdMeasdoc.createCriteria(),json)
            bdMeasdocInstanceTotal = new CriteriaHelper(BdMeasdoc.createCriteria(),json).count()

            bdMeasdocInstanceList = ch.list(params,"shortname")

        }else if (params.id){
            def pubRefResourceInstance= BdMeasdoc.get(params.id)
            def json= [rows: [pubRefResourceInstance], total: BdMeasdoc.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdMeasdoc.createCriteria())
            bdMeasdocInstanceTotal = new CriteriaHelper(BdMeasdoc.createCriteria()).count()

            bdMeasdocInstanceList = ch.list(params,"shortname")
        }





        def data = []
        bdMeasdocInstanceList?.each {
            data << it.part()
        }

        def json= [rows: data, total: bdMeasdocInstanceTotal]
        render json as JSON
    }
}
