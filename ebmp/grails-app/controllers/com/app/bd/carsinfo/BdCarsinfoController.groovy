package com.app.bd.carsinfo

import com.app.util.CriteriaHelper

import com.app.exception.BusinessException
import grails.converters.JSON
import static java.util.UUID.randomUUID

/**
 *
 */
class BdCarsinfoController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdCarsinfo'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        [pageId:_pageId]
    }

    def createQuery(){
       render(view: 'query',model:  [pageId:_pageId])
    }

    def query(){

        def cars
        def count
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdCarsinfo.createCriteria(),json)
           count = new CriteriaHelper(BdCarsinfo.createCriteria(),json).count()
             cars = ch.list(params,"carCode")
        }else{
            CriteriaHelper ch = new CriteriaHelper(BdCarsinfo.createCriteria())
           count = new CriteriaHelper(BdCarsinfo.createCriteria()).count()

            cars = ch.list(params,"carCode")
        }





        def data = []
        cars?.each {
            Map row = it.part()
            row['carrier.pkCubasdoc.custname'] = it?.carrier?.pkCubasdoc?.custname
            row['clqsdw.pkCubasdoc.custname'] = it?.clqsdw?.pkCubasdoc?.custname
            data << row
        }
        def json= [rows: data, total: count]
        render json as JSON
    }

    def list(Integer max) {
        println params
        params.max = Math.min(max ?: 10, 100)
        [rows: BdCarsinfo.list(params), total: BdCarsinfo.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [bdCarsinfoInstance: new BdCarsinfo(params),pageId:_pageId]
    }

    /**
     * 保存
     * @return
     */
    def save() {
        def bdCarsinfoInstance = new BdCarsinfo(params)
        if (!bdCarsinfoInstance.save( flush: true)) {
            def _errors=[]
            g.eachError(bean: bdCarsinfoInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }


            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdCarsinfoInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdCarsinfo.label', default: 'BdCarsinfo'), bdCarsinfoInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdCarsinfoInstance = BdCarsinfo.get(id)
        if (!bdCarsinfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdCarsinfo.label', default: 'BdCarsinfo'), id])
            redirect(action: "list")
            return
        }

        [bdCarsinfoInstance: bdCarsinfoInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdCarsinfoInstance = BdCarsinfo.get(id)
        if (!bdCarsinfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdCarsinfo.label', default: 'BdCarsinfo'), id])

        }

        [bdCarsinfoInstance: bdCarsinfoInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {

        def bdCarsinfoInstance = BdCarsinfo.get(id)
        if (!bdCarsinfoInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdCarsinfo.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdCarsinfoInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdCarsinfo.label', default: 'BdCarsinfo')] as Object[],
                          "Another user has updated this BdCarsinfo while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        bdCarsinfoInstance.properties = params

        if (!bdCarsinfoInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdCarsinfoInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdCarsinfo.label', default: 'BdCarsinfo'), bdCarsinfoInstance.id])
        def data= bdCarsinfoInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdCarsinfoInstance = BdCarsinfo.get(id)
        if (!bdCarsinfoInstance) {
           throw new BusinessException('未找到要删除的数据!')
        }
        bdCarsinfoInstance.delete(flush: true)
        render id

    }
}
