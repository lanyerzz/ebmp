package com.app.bd.stordoc




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class BdStordocController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdStordoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdStordocInstanceList: BdStordoc.list(params), bdStordocInstanceTotal: BdStordoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        def instance= new BdStordoc(params)

        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)
        instance.maker=springSecurityService.currentUser
        instance.makeDate=new Date()
        [bdStordocInstance:instance,pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def bdStordocInstance = new BdStordoc(params)
        if (!bdStordocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdStordocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdStordocInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdStordoc.label', default: 'BdStordoc'), bdStordocInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdStordocInstance = BdStordoc.get(id)
        if (!bdStordocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdStordoc.label', default: 'BdStordoc'), id])
            redirect(action: "list")
            return
        }

        [bdStordocInstance: bdStordocInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdStordocInstance = BdStordoc.get(id)
        if (!bdStordocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdStordoc.label', default: 'BdStordoc'), id])

        }

        [bdStordocInstance: bdStordocInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdStordocInstance = BdStordoc.get(id)
        if (!bdStordocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdStordoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdStordocInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdStordoc.label', default: 'BdStordoc')] as Object[],
                        "Another user has updated this BdStordoc while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        bdStordocInstance.properties = params

        if (!bdStordocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdStordocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdStordoc.label', default: 'BdStordoc'), bdStordocInstance.id])
        def data= bdStordocInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdStordocInstance = BdStordoc.get(id)
        if (!bdStordocInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdStordocInstance.delete(flush: true)
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

        def bdStordocInstanceLs
        def bdStordocInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdStordoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdStordoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdStordocInstanceTotal = cc.count()

            bdStordocInstanceLs = ch.list(params,"code") //TODO
        }else if (params.q!=null){//TODO 需要修改JSON中的字段
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'code','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'name','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdStordoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdStordoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdStordocInstanceTotal = cc.count()

            bdStordocInstanceLs = ch.list(params,"code")

        }else if (params.id){
            def bdStordocInstanceInstance= BdStordoc.get(params.id)
            def json= [rows: [bdStordocInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdStordoc.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdStordoc.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdStordocInstanceTotal = cc.count()

            bdStordocInstanceLs = ch.list(params,"code")
        }





        def data = []
        bdStordocInstanceLs?.each {
            data << it.part([defaultPart:true])
        }

        def json= [rows: data, total: bdStordocInstanceTotal]
        render json as JSON
    }

}
