package com.app.bd.banktype

import com.app.util.CriteriaHelper
import org.springframework.dao.DataIntegrityViolationException

import com.app.exception.BusinessException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class BdBanktypeController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdBanktype'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService


    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdBanktypeInstanceList: BdBanktype.list(params), bdBanktypeInstanceTotal: BdBanktype.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [bdBanktypeInstance: new BdBanktype(params),pageId:_pageId]
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def bdBanktypeInstance = new BdBanktype(params)
        def creator = springSecurityService.currentUser
        bdBanktypeInstance.creator = creator
        if (!bdBanktypeInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdBanktypeInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdBanktypeInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdBanktype.label', default: 'BdBanktype'), bdBanktypeInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdBanktypeInstance = BdBanktype.get(id)
        if (!bdBanktypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdBanktype.label', default: 'BdBanktype'), id])
            redirect(action: "list")
            return
        }

        [bdBanktypeInstance: bdBanktypeInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdBanktypeInstance = BdBanktype.get(id)
        if (!bdBanktypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdBanktype.label', default: 'BdBanktype'), id])

        }

        [bdBanktypeInstance: bdBanktypeInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdBanktypeInstance = BdBanktype.get(id)
        if (!bdBanktypeInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdBanktype.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdBanktypeInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdBanktype.label', default: 'BdBanktype')] as Object[],
                          "Another user has updated this BdBanktype while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }
        def modifier = springSecurityService.currentUser
        params.modifier = modifier
        bdBanktypeInstance.properties = params

        if (!bdBanktypeInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdBanktypeInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdBanktype.label', default: 'BdBanktype'), bdBanktypeInstance.id])
        def data= bdBanktypeInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdBanktypeInstance = BdBanktype.get(id)
        if (!bdBanktypeInstance) {
           throw new BusinessException('未找到要删除的数据!')
        }
        bdBanktypeInstance.delete(flush: true)
        render id

    }
    /**
     * 查询
     * @return
     */
    def query(){
        def bdBanktypeInstanceList
        def bdBanktypeInstanceTotal
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdBanktype.createCriteria(),json)
            bdBanktypeInstanceTotal = new CriteriaHelper(BdBanktype.createCriteria(),json).count()

            bdBanktypeInstanceList = ch.list(params,"banktypecode")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'banktypecode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'banktypename','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdBanktype.createCriteria(),json)
            bdBanktypeInstanceTotal = new CriteriaHelper(BdBanktype.createCriteria(),json).count()

            bdBanktypeInstanceList = ch.list(params,"banktypecode")

        }else if (params.id){
            def pubRefResourceInstance= BdBanktype.get(params.id)
            def json= [rows: [pubRefResourceInstance], total: BdBanktype.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdBanktype.createCriteria())
            bdBanktypeInstanceTotal = new CriteriaHelper(BdBanktype.createCriteria()).count()

            bdBanktypeInstanceList = ch.list(params,"banktypecode")
        }





        def data = []
        bdBanktypeInstanceList?.each {
            Map row = it.part()
            row['creator.userRealName'] = it?.creator?.userRealName
            row['modifier.userRealName'] = it?.modifier?.userRealName
            data << row
        }

        def json= [rows: data, total: bdBanktypeInstanceTotal]
        render json as JSON
    }
}
