package com.app.tm.templetallot

import com.app.bd.corp.BdCorp
import com.app.sm.function.SmFunction
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class TmTempletallotController {
    //注册pageId   UUID 去除“-”
    def static _pageId='TmTempletallot'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def tmTempletService
    def pubActionscriptService

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tmTempletallotInstanceList: TmTempletallot.list(params), tmTempletallotInstanceTotal: TmTempletallot.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String id) {
        def smFunctionInstance = SmFunction.get(id)
        def tmTempletallotInstance = new TmTempletallot()
        if (!smFunctionInstance){
            flash.message = message(code: 'default.not.found.message',default:'没有找到功能节点')
            [tmTempletallotInstance:tmTempletallotInstance,pageId:_pageId]
        }else{
            tmTempletallotInstance.function = smFunctionInstance
            [tmTempletallotInstance:tmTempletallotInstance ,pageId:_pageId]
        }
    }

/**
 * 保存
 * @return
 */
    def save() {
        def tmTempletallotInstance = new TmTempletallot(params)
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        tmTempletallotInstance.corp = corp
        if (!tmTempletallotInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: tmTempletallotInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=tmTempletallotInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'tmTempletallot.label', default: 'TmTempletallot'), tmTempletallotInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def tmTempletallotInstance = TmTempletallot.get(id)
        if (!tmTempletallotInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tmTempletallot.label', default: 'TmTempletallot'), id])
            redirect(action: "list")
            return
        }

        [tmTempletallotInstance: tmTempletallotInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def tmTempletallotInstance = TmTempletallot.get(id)
        if (!tmTempletallotInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tmTempletallot.label', default: 'TmTempletallot'), id])

        }

        [tmTempletallotInstance: tmTempletallotInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def tmTempletallotInstance = TmTempletallot.get(id)
        if (!tmTempletallotInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'tmTempletallot.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (tmTempletallotInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'tmTempletallot.label', default: 'TmTempletallot')] as Object[],
                        "Another user has updated this TmTempletallot while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        tmTempletallotInstance.properties = params

        if (!tmTempletallotInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: tmTempletallotInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'tmTempletallot.label', default: 'TmTempletallot'), tmTempletallotInstance.id])
        def data= tmTempletallotInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def tmTempletallotInstance = TmTempletallot.get(id)
        if (!tmTempletallotInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        tmTempletallotInstance.delete(flush: true)
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

            def functionId= params.functionId
            def corp =springSecurityService.authentication.loginCorp


            CriteriaHelper ch = new CriteriaHelper(TmTempletallot.createCriteria())
            ch.criteria.add(Restrictions.eq('function.id', functionId))
            ch.criteria.add(Restrictions.eq('corp.id', corp))
            def cc=new CriteriaHelper(TmTempletallot.createCriteria())
            cc.criteria.add(Restrictions.eq('function.id', functionId))
            cc.criteria.add(Restrictions.eq('corp.id', corp))




        def _json= [rows: ch.list(params,"code"), total: cc.count()]
        render _json as JSON
    }


    def queryTree(String id){
        def data = []
        List smFunctionInstance
        if(id){
            smFunctionInstance = SmFunction.findAllByParentId(id,[sort:'funCode'])
        }else{
            smFunctionInstance = SmFunction.findAllByParentId('0',[sort:'funCode'])
        }

        smFunctionInstance?.each {
            def row = [:]
            row = [id:it.id,text: it.funName]
            if (SmFunction.countByParentId(it.id)!=0){
                row.state = 'closed'
            }
            data << row
        }
        render data as JSON

    }

    /**
     * 获取对应节点打印模板信息
     * @return
     */
    def queryPrintTemplet(){
        def tids= tmTempletService.queryPrintTemplet(params.id, springSecurityService.currentUser)
        def data=[]
        tids?.each {
            data << it.tmTemplet.part()
        }
        
//        render new TDTO(data:data,sessionid:request.getSession().getId()	) as JSON

    }
}
