package com.app.pub.billtype

import com.app.pub.billnorule.PubBillnorule
import com.app.util.CriteriaHelper
import org.springframework.dao.DataIntegrityViolationException

import com.app.exception.BusinessException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class PubBilltypeController {
    //注册pageId   UUID 去除“-”
    def static _pageId=randomUUID().toString().replaceAll('-','')
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        [pageId:_pageId]
    }

    def list() {
        List sf = PubBilltype.list()
        def data = []
        sf?.each {
            data << it.part()
        }
        render data as JSON
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [pubBilltypeInstance: new PubBilltype(params),pageId:_pageId]
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def pubBilltypeInstance = new PubBilltype(params)
        if (!pubBilltypeInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubBilltypeInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=pubBilltypeInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'pubBilltype.label', default: 'PubBilltype'), pubBilltypeInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def pubBilltypeInstance = PubBilltype.get(id)
        if (!pubBilltypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubBilltype.label', default: 'PubBilltype'), id])
            redirect(action: "list")
            return
        }

        [pubBilltypeInstance: pubBilltypeInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def pubBilltypeInstance = PubBilltype.get(id)
        if (!pubBilltypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubBilltype.label', default: 'PubBilltype'), id])

        }

        [pubBilltypeInstance: pubBilltypeInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def pubBilltypeInstance = PubBilltype.get(id)
        if (!pubBilltypeInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'pubBilltype.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (pubBilltypeInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'pubBilltype.label', default: 'PubBilltype')] as Object[],
                          "Another user has updated this PubBilltype while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        pubBilltypeInstance.properties = params

        if (!pubBilltypeInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubBilltypeInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'pubBilltype.label', default: 'PubBilltype'), pubBilltypeInstance.id])
        def data= pubBilltypeInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def pubBilltypeInstance = PubBilltype.get(id)
        if (!pubBilltypeInstance) {
           throw new BusinessException('未找到要删除的数据!')
        }
        if(PubBillnorule.findByPubbilltype(pubBilltypeInstance)){
           throw new BusinessException('存在单据号规则，不能删除！')
        }
        pubBilltypeInstance.delete(flush: true)
        render id

    }

    /**
     * 查询
     * @return
     */
    def query(){
        def pubBilltypeInstanceList
        def pubBilltypeInstanceTotal
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(PubBilltype.createCriteria(),json)
            pubBilltypeInstanceTotal = new CriteriaHelper(PubBilltype.createCriteria(),json).count()

            pubBilltypeInstanceList = ch.list(params,"billtypecode")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'billtypecode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'billtypename','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(PubBilltype.createCriteria(),json)
            pubBilltypeInstanceTotal = new CriteriaHelper(PubBilltype.createCriteria(),json).count()

            pubBilltypeInstanceList = ch.list(params,"billtypecode")

        }else if (params.id){
            def pubRefResourceInstance= PubBilltype.get(params.id)
            def json= [rows: [pubRefResourceInstance], total: PubBilltype.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(PubBilltype.createCriteria())
            pubBilltypeInstanceTotal = new CriteriaHelper(PubBilltype.createCriteria()).count()

            pubBilltypeInstanceList = ch.list(params,"billtypecode")
        }





        def data = []
        pubBilltypeInstanceList?.each {
            data << it.part()
        }

        def json= [rows: data, total: pubBilltypeInstanceTotal]
        render json as JSON
    }
}
