package com.app.ywms.bd.berthage

import com.app.bd.corp.BdCorp
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YBerthageController {
    //注册pageId   UUID 去除“-”
    def static _pageId='YBerthage'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [YBerthageInstanceList: YBerthage.list(params), YBerthageInstanceTotal: YBerthage.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [YBerthageInstance: new YBerthage(params),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        def YBerthageInstance = new YBerthage(params)
        YBerthageInstance.bdCorp = corp
        if (!YBerthageInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: YBerthageInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=YBerthageInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'YBerthage.label', default: 'YBerthage'), YBerthageInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def YBerthageInstance = YBerthage.get(id)
        if (!YBerthageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'YBerthage.label', default: 'YBerthage'), id])
            redirect(action: "list")
            return
        }

        [YBerthageInstance: YBerthageInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def YBerthageInstance = YBerthage.get(id)
        if (!YBerthageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'YBerthage.label', default: 'YBerthage'), id])

        }

        [YBerthageInstance: YBerthageInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def YBerthageInstance = YBerthage.get(id)
        if (!YBerthageInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'YBerthage.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (YBerthageInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'YBerthage.label', default: 'YBerthage')] as Object[],
                        "Another user has updated this YBerthage while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        YBerthageInstance.properties = params

        if (!YBerthageInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: YBerthageInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'YBerthage.label', default: 'YBerthage'), YBerthageInstance.id])
        def data= YBerthageInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def YBerthageInstance = YBerthage.get(id)
        if (!YBerthageInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        YBerthageInstance.delete(flush: true)
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

        def YBerthageInstanceLs
        def YBerthageInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(YBerthage.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(YBerthage.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            YBerthageInstanceTotal = cc.count()

            YBerthageInstanceLs = ch.list(params,"code")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'code','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'name','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'bdCorp.id','value':'${corp}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(YBerthage.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(YBerthage.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            YBerthageInstanceTotal = cc.count()

            YBerthageInstanceLs = ch.list(params,"code")

        }else if (params.id){
            def YBerthageInstanceInstance= YBerthage.get(params.id)
            def json= [rows: [YBerthageInstanceInstance], total:YBerthage.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(YBerthage.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(YBerthage.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            YBerthageInstanceTotal = cc.count()

            YBerthageInstanceLs = ch.list(params,"code")
        }





        def data = []
        YBerthageInstanceLs?.each {
            Map row = it.part()
            row['bdCorp.unitName'] = it?.bdCorp?.unitName
            data << row
        }

        def json= [rows: data, total: YBerthageInstanceTotal]
        render json as JSON
    }

}
