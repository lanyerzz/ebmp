package com.app.bd.qwsz

import com.app.bd.corp.BdCorp
import org.hibernate.criterion.Restrictions
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 * 鹤位设置
 */
class BdQwszController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdQwsz'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdQwszInstanceList: BdQwsz.list(params), bdQwszInstanceTotal: BdQwsz.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        def bdQwszInstance_=new BdQwsz(params)
       // bdQwszInstance_.bdCorp= BdCorp.get(springSecurityService.authentication.loginCorp)
        [bdQwszInstance: new BdQwsz(params),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        println params
        def bdQwszInstance = new BdQwsz(params)
        bdQwszInstance.bdCorp=BdCorp.load(springSecurityService.authentication.loginCorp)
        if (!bdQwszInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdQwszInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data= toJSON(bdQwszInstance)
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdQwsz.label', default: 'BdQwsz'), bdQwszInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdQwszInstance = BdQwsz.get(id)
        if (!bdQwszInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdQwsz.label', default: 'BdQwsz'), id])
            redirect(action: "list")
            return
        }

        [bdQwszInstance: bdQwszInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdQwszInstance = BdQwsz.get(id)
        if (!bdQwszInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdQwsz.label', default: 'BdQwsz'), id])

        }

        [bdQwszInstance: bdQwszInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        println params
        def bdQwszInstance = BdQwsz.get(id)
        if (!bdQwszInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdQwsz.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdQwszInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdQwsz.label', default: 'BdQwsz')] as Object[],
                        "Another user has updated this BdQwsz while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        bdQwszInstance.properties = params

        if (!bdQwszInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdQwszInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdQwsz.label', default: 'BdQwsz'), bdQwszInstance.id])
        def data=  toJSON(bdQwszInstance)
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdQwszInstance = BdQwsz.get(id)
        if (!bdQwszInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdQwszInstance.delete(flush: true)
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

        def bdQwszInstanceLs
        def bdQwszInstanceTotal
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdQwsz.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', springSecurityService.authentication.loginCorp))
            bdQwszInstanceTotal = new CriteriaHelper(BdQwsz.createCriteria(),json).count()

            bdQwszInstanceLs = ch.list(params,"code") //TODO
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'code','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'name','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'bdCorp','value':'${springSecurityService.authentication.loginCorp}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdQwsz.createCriteria(),json)
            bdQwszInstanceTotal = new CriteriaHelper(BdQwsz.createCriteria(),json).count()

            bdQwszInstanceLs = ch.list(params,"code")//TODO

        }else if (params.id){
            def bdQwszInstanceInstance= BdQwsz.get(params.id)
            def json= [rows: [bdQwszInstanceInstance], total: BdQwsz.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdQwsz.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', springSecurityService.authentication.loginCorp))
            bdQwszInstanceTotal = new CriteriaHelper(BdQwsz.createCriteria()).count()

            bdQwszInstanceLs = ch.list(params,"code")//TODO
        }
        def data = []
        bdQwszInstanceLs?.each {


            data << toJSON(it)
        }

        def json= [rows: data, total: bdQwszInstanceTotal]
        render json as JSON
    }


    private toJSON(data){
        def row=data.part()

        row["bdInvmandoc.pkInvbasdoc.invcode"]=data.bdInvmandoc?.pkInvbasdoc?.invcode
        row["bdInvmandoc.pkInvbasdoc.invname"]=data.bdInvmandoc?.pkInvbasdoc?.invname
        row["bdCorp.unitName"]=data.bdCorp.unitName
        return row
    }

}
