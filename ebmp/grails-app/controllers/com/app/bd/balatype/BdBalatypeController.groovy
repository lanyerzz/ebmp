package com.app.bd.balatype




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class BdBalatypeController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdBalatype'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }



    /**
     * 进入添加页面
     * @return
     */
    def create(String businessKey) {
        def instance= new BdBalatype(params)

        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)

        [bdBalatypeInstance: instance,pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def bdBalatypeInstance = new BdBalatype(params)
        if (!bdBalatypeInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdBalatypeInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdBalatype.label', default: 'BdBalatype'), bdBalatypeInstance.code])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdBalatypeInstance = BdBalatype.get(id)
        if (!bdBalatypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdBalatype.label', default: 'BdBalatype'), id])
            redirect(action: "list")
            return
        }

        [bdBalatypeInstance: bdBalatypeInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdBalatypeInstance = BdBalatype.get(id)
        if (!bdBalatypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdBalatype.label', default: 'BdBalatype'), id])

        }

        [bdBalatypeInstance: bdBalatypeInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdBalatypeInstance = BdBalatype.get(id)
        if (!bdBalatypeInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdBalatype.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdBalatypeInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdBalatype.label', default: 'BdBalatype')] as Object[],
                        "Another user has updated this BdBalatype while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        bdBalatypeInstance.properties = params

        if (!bdBalatypeInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdBalatypeInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdBalatype.label', default: 'BdBalatype'), bdBalatypeInstance.id])
        def data= bdBalatypeInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdBalatypeInstance = BdBalatype.get(id)
        if (!bdBalatypeInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdBalatypeInstance.delete(flush: true)
        render id

    }

    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId])
    }

    /**
     * 查询
     * @return
     */
    def query(){

        def bdBalatypeInstanceLs
        def bdBalatypeInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdBalatype.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdBalatype.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdBalatypeInstanceTotal = cc.count()

            bdBalatypeInstanceLs = ch.list(params,"code") //TODO
        }else if (params.q!=null){//TODO 需要修改JSON中的字段
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'code','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'name','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdBalatype.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdBalatype.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdBalatypeInstanceTotal = cc.count()

            bdBalatypeInstanceLs = ch.list(params,"code")//TODO

        }else if (params.id){
            def bdBalatypeInstanceInstance= BdBalatype.get(params.id)
            def json= [rows: [bdBalatypeInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdBalatype.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdBalatype.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdBalatypeInstanceTotal = cc.count()

            bdBalatypeInstanceLs = ch.list(params,"code")//TODO
        }





        def data = []
        bdBalatypeInstanceLs?.each {
            data << it.part()
        }

        def json= [rows: data, total: bdBalatypeInstanceTotal]
        render json as JSON
    }

}
