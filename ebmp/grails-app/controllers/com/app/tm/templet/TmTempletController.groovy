package com.app.tm.templet

import com.app.bd.corp.BdCorp
import com.app.tm.templet.TmTemplet
import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class TmTempletController {
    //注册pageId   UUID 去除“-”
    def static _pageId='TmTemplet'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def tmTempletService
    def pubActionscriptService

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tmTempletInstanceList: TmTemplet.list(params), tmTempletInstanceTotal: TmTemplet.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [tmTempletInstance: new TmTemplet(params),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def tmTempletInstance = new TmTemplet(params)
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        tmTempletInstance.corp = corp
        if (!tmTempletInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: tmTempletInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=tmTempletInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'tmTemplet.label', default: 'TmTemplet'), tmTempletInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def tmTempletInstance = TmTemplet.get(id)
        if (!tmTempletInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tmTemplet.label', default: 'TmTemplet'), id])
            redirect(action: "list")
            return
        }

        [tmTempletInstance: tmTempletInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def tmTempletInstance = TmTemplet.get(id)
        if (!tmTempletInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tmTemplet.label', default: 'TmTemplet'), id])

        }

        [tmTempletInstance: tmTempletInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {

        def tmTempletInstance = TmTemplet.get(id)
        println tmTempletInstance
        if (!tmTempletInstance) {

            def json= [remoteErrors: message(code: 'default.not.found.message', args: [message(code: 'tmTemplet.label')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (tmTempletInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'tmTemplet.label', default: 'TmTemplet')] as Object[],
                        "Another user has updated this TmTemplet while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        tmTempletInstance.properties = params

        if (!tmTempletInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: tmTempletInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }


        def message = message(code: 'default.updated.message', args: [message(code: 'tmTemplet.label', default: 'TmTemplet'), tmTempletInstance.templetCode])
        def data= [:]
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def tmTempletInstance = TmTemplet.get(id)
        if (!tmTempletInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        tmTempletInstance.delete(flush: true)
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

        def tmTempletInstanceLs
        def tmTempletInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(TmTemplet.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('corp.id', corp))
            def cc=new CriteriaHelper(TmTemplet.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('corp.id', corp))
            tmTempletInstanceTotal = cc.count()

            tmTempletInstanceLs = ch.list(params,"templetCode")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'templetCode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'templetName','value':'${params.q}'},
                                    {'operaotr':'contains','fieldName':'corp.id','value':'${corp}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(TmTemplet.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('corp.id', corp))
            def cc=new CriteriaHelper(TmTemplet.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('corp.id', corp))
            tmTempletInstanceTotal = cc.count()

            tmTempletInstanceLs = ch.list(params,"templetCode")

        }else if (params.id){
            def tmTempletInstanceInstance= TmTemplet.get(params.id)
            def json= [rows: [tmTempletInstanceInstance], total: TmTemplet.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(TmTemplet.createCriteria())
            ch.criteria.add(Restrictions.eq('corp.id', corp))
            def cc=new CriteriaHelper(TmTemplet.createCriteria())
            cc.criteria.add(Restrictions.eq('corp.id', corp))
            tmTempletInstanceTotal = cc.count()

            tmTempletInstanceLs = ch.list(params,"templetCode")
        }





        def dt = [data:tmTempletInstanceLs,type:'default']
        def data = pubActionscriptService.runScript('TMTEMPLET','query',dt,1,null)
        def json = [rows: data, total: tmTempletInstanceTotal]
        render json as JSON
    }

//编译模板
    def compileTemplet(){

        TmTemplet tm=TmTemplet.load(params.id)
        tmTempletService.compileTemplet(servletContext.getRealPath(""),tm.templetPath)
        def data = ['success':true]
        render data as JSON
    }


    /**
     * 获取对应节点打印模板信息
     * @return
     */
    def queryPrintTemplet(){

        def tids= tmTempletService.queryPrintTemplet(params.functionId, springSecurityService.currentUser)
//        def data=[]
//        tids?.each {
//            data << it.tmTemplet.part()
//        }
        def _data=tids.collect {
            it.tmTemplet
        }

        render  view: '/printView/printView' ,model: [data:_data,url:"${createLink(controller: params._controller,action: params._action)}",_params:params.queryParams]

    }

}
