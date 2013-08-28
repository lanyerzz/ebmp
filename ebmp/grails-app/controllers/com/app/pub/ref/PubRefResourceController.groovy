package com.app.pub.ref

import com.app.util.CriteriaHelper
import org.springframework.dao.DataIntegrityViolationException

import com.app.exception.BusinessException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class PubRefResourceController {
    //注册pageId   UUID 去除“-”
    def static _pageId=randomUUID().toString().replaceAll('-','')
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        [pageId:_pageId]
    }

    def query(){

        def pubRefResourceInstanceList
        def pubRefResourceInstanceTotal
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(PubRefResource.createCriteria(),json)
            pubRefResourceInstanceTotal = new CriteriaHelper(PubRefResource.createCriteria(),json).count()

            pubRefResourceInstanceList = ch.list(params,"resourceCode")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'resourceCode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'resourceName','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(PubRefResource.createCriteria(),json)
            pubRefResourceInstanceTotal = new CriteriaHelper(PubRefResource.createCriteria(),json).count()

            pubRefResourceInstanceList = ch.list(params,"resourceCode")

        }else if (params.id){
            def pubRefResourceInstance= PubRefResource.get(params.id)
            def json= [rows: [pubRefResourceInstance], total: PubRefResource.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(PubRefResource.createCriteria())
            pubRefResourceInstanceTotal = new CriteriaHelper(PubRefResource.createCriteria()).count()

            pubRefResourceInstanceList = ch.list(params,"resourceCode")
        }





        def data = []
        pubRefResourceInstanceList?.each {
            data << it.part()
        }

        def json= [rows: data, total: pubRefResourceInstanceTotal]
        render json as JSON
    }




    /**
     * 进入添加页面
     * @return
     */
    def create() {

        [pubRefResourceInstance: new PubRefResource(params),pageId:_pageId]
    }

    /**
     * 保存
     * @return
     */
    def save() {
        println params
        def pubRefResourceInstance = new PubRefResource(params)
        if (!pubRefResourceInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubRefResourceInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=pubRefResourceInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'pubRefResource.label', default: 'PubRefResource'), pubRefResourceInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def pubRefResourceInstance = PubRefResource.get(id)
        if (!pubRefResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubRefResource.label', default: 'PubRefResource'), id])
            redirect(action: "list")
            return
        }

        [pubRefResourceInstance: pubRefResourceInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def pubRefResourceInstance = PubRefResource.get(id)
        if (!pubRefResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubRefResource.label', default: 'PubRefResource'), id])

        }

        [pubRefResourceInstance: pubRefResourceInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def pubRefResourceInstance = PubRefResource.get(id)
        if (!pubRefResourceInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'pubRefResource.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (pubRefResourceInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'pubRefResource.label', default: 'PubRefResource')] as Object[],
                          "Another user has updated this PubRefResource while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        pubRefResourceInstance.properties = params

        if (!pubRefResourceInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubRefResourceInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'pubRefResource.label', default: 'PubRefResource'), pubRefResourceInstance.id])
        def data= pubRefResourceInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def pubRefResourceInstance = PubRefResource.get(id)
        if (!pubRefResourceInstance) {
           throw new BusinessException('未找到要删除的数据!')
        }
        pubRefResourceInstance.delete(flush: true)
        render id

    }

    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId])
    }

    def createComponent(String refCode,String id,String billtypecode) {
//        def resource=PubRefResource.findByResourceCode(refCode)

        render(view: 'refComponent',model: [refCode:refCode,id:id,billtypecode:billtypecode])

    }
}
