package com.app.ywms.bd.shipdoc

import com.app.bd.corp.BdCorp
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YshipdocController {
    //注册pageId   UUID 去除“-”
    def static _pageId='Yshipdoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [yshipdocInstanceList: Yshipdoc.list(params), yshipdocInstanceTotal: Yshipdoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [yshipdocInstance: new Yshipdoc(params),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        def maker = springSecurityService.currentUser
        def yshipdocInstance = new Yshipdoc(params)
        yshipdocInstance.pkCorp = corp
        yshipdocInstance.makedate = new Date()
        yshipdocInstance.maker = maker
        if (!yshipdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: yshipdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=yshipdocInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'yshipdoc.label', default: 'Yshipdoc'), yshipdocInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def yshipdocInstance = Yshipdoc.get(id)
        if (!yshipdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yshipdoc.label', default: 'Yshipdoc'), id])
            redirect(action: "list")
            return
        }

        [yshipdocInstance: yshipdocInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def yshipdocInstance = Yshipdoc.get(id)
        if (!yshipdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yshipdoc.label', default: 'Yshipdoc'), id])

        }

        [yshipdocInstance: yshipdocInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def yshipdocInstance = Yshipdoc.get(id)
        if (!yshipdocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'yshipdoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (yshipdocInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'yshipdoc.label', default: 'Yshipdoc')] as Object[],
                        "Another user has updated this Yshipdoc while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        yshipdocInstance.properties = params

        if (!yshipdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: yshipdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'yshipdoc.label', default: 'Yshipdoc'), yshipdocInstance.id])
        def data= yshipdocInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def yshipdocInstance = Yshipdoc.get(id)
        if (!yshipdocInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        yshipdocInstance.delete(flush: true)
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

        def yshipdocInstanceLs
        def yshipdocInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(Yshipdoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc=new CriteriaHelper(Yshipdoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            yshipdocInstanceTotal = cc.count()

            yshipdocInstanceLs = ch.list(params,"shipname")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'shipname','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'shipforeignname','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(Yshipdoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc=new CriteriaHelper(Yshipdoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            yshipdocInstanceTotal = cc.count()

            yshipdocInstanceLs = ch.list(params,"shipname")

        }else if (params.id){
            def yshipdocInstanceInstance= Yshipdoc.get(params.id)
            def json= [rows: [yshipdocInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(Yshipdoc.createCriteria())
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc=new CriteriaHelper(Yshipdoc.createCriteria())
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            yshipdocInstanceTotal = cc.count()

            yshipdocInstanceLs = ch.list(params,"shipname")
        }





        def data = []
        yshipdocInstanceLs?.each {
            Map row = it.part()
            row['maker.userRealName'] = it?.maker?.userRealName
            data << row
        }
        def json= [rows: data, total: yshipdocInstanceTotal]
        render json as JSON
    }

}
