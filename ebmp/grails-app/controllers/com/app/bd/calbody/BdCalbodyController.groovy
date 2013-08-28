package com.app.bd.calbody




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID

class BdCalbodyController {
    //注册pageId   UUID 去除“-”
    def static _pageId = 'BdCalbody'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        [pageId: _pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdCalbodyInstanceList: BdCalbody.list(params), bdCalbodyInstanceTotal: BdCalbody.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String businessKey) {
        def instance = new BdCalbody(params)
        if (businessKey) {
            instance.businessType = PubBusinessType.get(businessKey);

        }
        instance.bdCorp = BdCorp.get(springSecurityService.authentication.loginCorp)

        [bdCalbodyInstance: instance, pageId: _pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def bdCalbodyInstance = new BdCalbody(params)
        if (!bdCalbodyInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: bdCalbodyInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json = [validateerrors: _errors]

            render json as JSON
            return
        }

        def data = bdCalbodyInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdCalbody.label', default: 'BdCalbody'), bdCalbodyInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdCalbodyInstance = BdCalbody.get(id)
        if (!bdCalbodyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdCalbody.label', default: 'BdCalbody'), id])
            redirect(action: "list")
            return
        }

        [bdCalbodyInstance: bdCalbodyInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdCalbodyInstance = BdCalbody.get(id)
        if (!bdCalbodyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdCalbody.label', default: 'BdCalbody'), id])

        }

        [bdCalbodyInstance: bdCalbodyInstance, pageId: _pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdCalbodyInstance = BdCalbody.get(id)
        if (!bdCalbodyInstance) {

            def json = [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdCalbody.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdCalbodyInstance.version > version) {
                def msg = message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdCalbody.label', default: 'BdCalbody')] as Object[],
                        "Another user has updated this BdCalbody while you were editing")
                def json = [remoteErrors: msg]
                render json as JSON
                return
            }
        }

        bdCalbodyInstance.properties = params

        if (!bdCalbodyInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: bdCalbodyInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }
            def json = [validateerrors: _errors]
            render json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdCalbody.label', default: 'BdCalbody'), bdCalbodyInstance.id])
        def data = bdCalbodyInstance.part()
        data.remoteMessage = message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdCalbodyInstance = BdCalbody.get(id)
        if (!bdCalbodyInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdCalbodyInstance.delete(flush: true)
        render id

    }

    def createQuery() {
        render(view: 'query', model: [pageId: _pageId])
    }

    /**
     * 查询
     * @return
     */
    def query() {

        def bdCalbodyInstanceLs
        def bdCalbodyInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams) {
            def json = JSON.parse(URLDecoder.decode(params.queryParams, 'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdCalbody.createCriteria(), json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc = new CriteriaHelper(BdCalbody.createCriteria(), json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdCalbodyInstanceTotal = cc.count()

            bdCalbodyInstanceLs = ch.list(params, "calbodyCode") //TODO
        } else if (params.q != null) {//TODO 需要修改JSON中的字段
            def sjson = """{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'calbodyCode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'calbodyCode','value':'${params.q}'}
                                    ]
                        }"""


            def json = JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdCalbody.createCriteria(), json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc = new CriteriaHelper(BdCalbody.createCriteria(), json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdCalbodyInstanceTotal = cc.count()

            bdCalbodyInstanceLs = ch.list(params, "calbodyCode")//TODO

        } else if (params.id) {
            def bdCalbodyInstanceInstance = BdCalbody.get(params.id)
            def json = [rows: [bdCalbodyInstanceInstance], total: 1]
            render json as JSON
            return;
        } else {

            CriteriaHelper ch = new CriteriaHelper(BdCalbody.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc = new CriteriaHelper(BdCalbody.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdCalbodyInstanceTotal = cc.count()

            bdCalbodyInstanceLs = ch.list(params, "calbodyCode")//TODO
        }





        def data = []
        bdCalbodyInstanceLs?.each {
            data << it.part([defaultPart:true])
        }
        println data as JSON
        def json = [rows: data, total: bdCalbodyInstanceTotal]
        render json as JSON
    }

}
