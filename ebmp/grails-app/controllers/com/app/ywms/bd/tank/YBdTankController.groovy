package com.app.ywms.bd.tank

import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import static java.util.UUID.randomUUID
class YBdTankController {
    //注册pageId   UUID 去除“-”
    def static _pageId='YBdTank'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [YBdTankInstanceList: YBdTank.list(params), YBdTankInstanceTotal: YBdTank.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [YBdTankInstance: new YBdTank(params),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def YBdTankInstance = new YBdTank(params)
        if (!YBdTankInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: YBdTankInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=YBdTankInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'YBdTank.label', default: 'YBdTank'), YBdTankInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def YBdTankInstance = YBdTank.get(id)
        if (!YBdTankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'YBdTank.label', default: 'YBdTank'), id])
            redirect(action: "list")
            return
        }

        [YBdTankInstance: YBdTankInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def YBdTankInstance = YBdTank.get(id)
        if (!YBdTankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'YBdTank.label', default: 'YBdTank'), id])

        }

        [YBdTankInstance: YBdTankInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def YBdTankInstance = YBdTank.get(id)
        if (!YBdTankInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'YBdTank.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (YBdTankInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'YBdTank.label', default: 'YBdTank')] as Object[],
                        "Another user has updated this YBdTank while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        YBdTankInstance.properties = params

        if (!YBdTankInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: YBdTankInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'YBdTank.label', default: 'YBdTank'), YBdTankInstance.id])
        def data= YBdTankInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def YBdTankInstance = YBdTank.get(id)
        if (!YBdTankInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        YBdTankInstance.delete(flush: true)
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

        def YBdTankInstanceLs
        def YBdTankInstanceTotal
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(YBdTank.createCriteria(),json)
            YBdTankInstanceTotal = new CriteriaHelper(YBdTank.createCriteria(),json).count()

            YBdTankInstanceLs = ch.list(params,"code")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'code','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'describe','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(YBdTank.createCriteria(),json)
            YBdTankInstanceTotal = new CriteriaHelper(YBdTank.createCriteria(),json).count()

            YBdTankInstanceLs = ch.list(params,"code")

        }else if (params.id){
            def YBdTankInstanceInstance= YBdTank.get(params.id)
            def json= [rows: [YBdTankInstanceInstance], total: YBdTank.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(YBdTank.createCriteria())
            YBdTankInstanceTotal = new CriteriaHelper(YBdTank.createCriteria()).count()

            YBdTankInstanceLs = ch.list(params,"code")
        }





        def data = []
        YBdTankInstanceLs?.each {
            Map row = it.part()
            row['bdInvmandoc.pkInvbasdoc.invname'] = it?.bdInvmandoc?.pkInvbasdoc?.invname
            data << row
        }

        def json= [rows: data, total: YBdTankInstanceTotal]
        render json as JSON
    }

}
