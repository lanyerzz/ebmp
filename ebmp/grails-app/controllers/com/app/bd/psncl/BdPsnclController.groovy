package com.app.bd.psncl

import com.app.bd.corp.BdCorp
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class BdPsnclController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdPsncl'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdPsnclInstanceList: BdPsncl.list(params), bdPsnclInstanceTotal: BdPsncl.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String id) {
        if(id){
            def bdPsnclInstance = BdPsncl.get(id)
            if(!bdPsnclInstance){
                throw new BusinessException('没有找到人员分类！')
            }
            def newInstance = new BdPsncl()
            newInstance.pid = id
            [bdPsnclInstance: newInstance,pageId:_pageId]
        }else{
            [bdPsnclInstance: new BdPsncl(),pageId:_pageId]
        }
    }

/**
 * 保存
 * @return
 */
    def save() {
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        def bdPsnclInstance = new BdPsncl(params)
        bdPsnclInstance.bdCorp = corp
        if (!bdPsnclInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdPsnclInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdPsnclInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdPsncl.label', default: 'BdPsncl'), bdPsnclInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdPsnclInstance = BdPsncl.get(id)
        if (!bdPsnclInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPsncl.label', default: 'BdPsncl'), id])
            redirect(action: "list")
            return
        }

        [bdPsnclInstance: bdPsnclInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdPsnclInstance = BdPsncl.get(id)
        if (!bdPsnclInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPsncl.label', default: 'BdPsncl'), id])

        }

        [bdPsnclInstance: bdPsnclInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdPsnclInstance = BdPsncl.get(id)
        if (!bdPsnclInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdPsncl.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdPsnclInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdPsncl.label', default: 'BdPsncl')] as Object[],
                        "Another user has updated this BdPsncl while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        bdPsnclInstance.properties = params

        if (!bdPsnclInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdPsnclInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdPsncl.label', default: 'BdPsncl'), bdPsnclInstance.id])
        def data= bdPsnclInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdPsnclInstance = BdPsncl.get(id)
        if (!bdPsnclInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdPsnclInstance.delete(flush: true)
        render id

    }

    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId])
    }

    def queryById(String tid){
       def psncl= BdPsncl.get(tid)
        def json=[id:psncl.id,text:psncl.name]
        render json as JSON
    }

    /**
     * 查询
     * @return
     */
    def query(String id){

        List bdPsnclInstance

        if (id){
            bdPsnclInstance = BdPsncl.findAllByPid(id,[sort:'code'])
        }else{
            bdPsnclInstance = BdPsncl.findAllByPid('0',[sort:'code'])
        }
        def data = []
        bdPsnclInstance?.each {
            Map row = it.part()
            if (BdPsncl.countByPid(it.id)!=0){
                row.state = 'closed'
            }
            row.text=row.name
            row['bdCorp.unitName'] = it?.bdCorp?.unitName
            data << row
        }

        render data as JSON

    }
}
