package com.app.pub.change

import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class PubChangescriptController {
    //注册pageId   UUID 去除“-”
    def static _pageId=randomUUID().toString().replaceAll('-','')
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pubChangescriptInstanceList: PubChangescript.list(params), pubChangescriptInstanceTotal: PubChangescript.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [pubChangescriptInstance: new PubChangescript(params),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def pubChangescriptInstance = new PubChangescript(params)

        pubChangescriptInstance.path=pubChangescriptInstance.changeTo.billtypecode+"/chg/${pubChangescriptInstance.changeFrom.billtypecode}TO${pubChangescriptInstance.changeTo.billtypecode}.groovy"
        if (!pubChangescriptInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubChangescriptInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }else{
     pubActionscriptService.saveChangeScript(pubChangescriptInstance.id,"""
        def keys=binding.getVariable('data')
        def businessKey=binding.getVariable('businessKey')
""")
            }




        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'pubChangescript.label', default: 'PubChangescript'), pubChangescriptInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def pubChangescriptInstance = PubChangescript.get(id)
        if (!pubChangescriptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubChangescript.label', default: 'PubChangescript'), id])
            redirect(action: "list")
            return
        }

        [pubChangescriptInstance: pubChangescriptInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def pubChangescriptInstance = PubChangescript.get(id)
        if (!pubChangescriptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubChangescript.label', default: 'PubChangescript'), id])

        }

        [pubChangescriptInstance: pubChangescriptInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {

        def pubChangescriptInstance = PubChangescript.get(id)
        if (!pubChangescriptInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'pubChangescript.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (pubChangescriptInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'pubChangescript.label', default: 'PubChangescript')] as Object[],
                        "Another user has updated this PubChangescript while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        pubChangescriptInstance.properties = params

        if (!pubChangescriptInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubChangescriptInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'pubChangescript.label', default: 'PubChangescript'), pubChangescriptInstance.id])
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
        def pubChangescriptInstance = PubChangescript.get(id)
        if (!pubChangescriptInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        pubChangescriptInstance.delete(flush: true)
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

        def pubChangescriptInstanceLs
        def pubChangescriptInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(PubChangescript.createCriteria(),json)

            def cc=new CriteriaHelper(PubChangescript.createCriteria(),json)

            pubChangescriptInstanceTotal = cc.count()

            pubChangescriptInstanceLs = ch.list(params,"changeFrom.billtypecode") //TODO
        }else if (params.id){
            def pubChangescriptInstanceInstance= PubChangescript.get(params.id)
            def json= [rows: [pubChangescriptInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(PubChangescript.createCriteria())

            def cc=new CriteriaHelper(PubChangescript.createCriteria())

            pubChangescriptInstanceTotal = cc.count()

            pubChangescriptInstanceLs = ch.list(params,"changeFrom.billtypecode")//TODO
        }





        def data = []
        pubChangescriptInstanceLs?.each {
            def row=it.part()

            row.changeFrom=[id:it.changeFrom.id,billtypecode:it.changeFrom.billtypecode,billtypename:it.changeFrom.billtypename]
            row.changeTo=[id:it.changeTo.id,billtypecode:it.changeTo.billtypecode,billtypename:it.changeTo.billtypename]
            data << row
        }

        def json= [rows: data, total: pubChangescriptInstanceTotal]
        render json as JSON
    }

    /**
     * 编辑脚本文件
     * @param id
     */
    def editScript(String id){

        def sc= pubActionscriptService.getChangeScriptFile(id)
        ['id':id,script:sc,pageId:_pageId]

    }

    /**
     * 保存脚本文件
     * @param id
     * @return
     */
    def saveScript(String id){

        pubActionscriptService.saveChangeScript(id,params.scriptFile)
        def rt=[remoteMessage:'保存完成！']
        render rt  as JSON
    }

}
