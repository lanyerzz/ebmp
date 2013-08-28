package com.app.ywms.bd.cddw

import com.app.bd.corp.BdCorp
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YCddwController {
    //注册pageId   UUID 去除“-”
    def static _pageId='YCddw'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [YCddwInstanceList: YCddw.list(params), YCddwInstanceTotal: YCddw.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [YCddwInstance: new YCddw(params),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        def maker = springSecurityService.currentUser
        def YCddwInstance = new YCddw(params)
        YCddwInstance.maker = maker
        YCddwInstance.makedate = new Date()
        YCddwInstance.pkCorp = corp
        if (!YCddwInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: YCddwInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=YCddwInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'YCddw.label', default: 'YCddw'), YCddwInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def YCddwInstance = YCddw.get(id)
        if (!YCddwInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'YCddw.label', default: 'YCddw'), id])
            redirect(action: "list")
            return
        }

        [YCddwInstance: YCddwInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def YCddwInstance = YCddw.get(id)
        if (!YCddwInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'YCddw.label', default: 'YCddw'), id])

        }

        [YCddwInstance: YCddwInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def YCddwInstance = YCddw.get(id)
        if (!YCddwInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'YCddw.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (YCddwInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'YCddw.label', default: 'YCddw')] as Object[],
                        "Another user has updated this YCddw while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        YCddwInstance.properties = params

        if (!YCddwInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: YCddwInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'YCddw.label', default: 'YCddw'), YCddwInstance.id])
        def data= YCddwInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def YCddwInstance = YCddw.get(id)
        if (!YCddwInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        YCddwInstance.delete(flush: true)
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

        def YCddwInstanceLs
        def YCddwInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(YCddw.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc=new CriteriaHelper(YCddw.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            YCddwInstanceTotal = cc.count()

            YCddwInstanceLs = ch.list(params,"code")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'code','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'name','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(YCddw.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc=new CriteriaHelper(YCddw.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            YCddwInstanceTotal = cc.count()

            YCddwInstanceLs = ch.list(params,"code")

        }else if (params.id){
            def YCddwInstanceInstance= YCddw.get(params.id)
            def json= [rows: [YCddwInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(YCddw.createCriteria())
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc=new CriteriaHelper(YCddw.createCriteria())
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            YCddwInstanceTotal = cc.count()

            YCddwInstanceLs = ch.list(params,"code")
        }





        def data = []
        YCddwInstanceLs?.each {
            data << it.part()
        }

        def json= [rows: data, total: YCddwInstanceTotal]
        render json as JSON
    }

}
