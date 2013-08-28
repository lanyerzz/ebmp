package com.app.bd.cumandoc

import com.app.bd.areacl.BdAreacl
import com.app.bd.corp.BdCorp
import org.hibernate.criterion.Restrictions
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import static java.util.UUID.randomUUID
class BdCumandocController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdCumandoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def pubActionscriptService
    def springSecurityService

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdCumandocInstanceList: BdCumandoc.list(params), bdCumandocInstanceTotal: BdCumandoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [bdCumandocInstance: new BdCumandoc(params),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def bdCumandocInstance = new BdCumandoc(params)
        if (!bdCumandocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdCumandocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdCumandocInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdCumandoc.label', default: 'BdCumandoc'), bdCumandocInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdCumandocInstance = BdCumandoc.get(id)
        if (!bdCumandocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdCumandoc.label', default: 'BdCumandoc'), id])
            redirect(action: "list")
            return
        }

        [bdCumandocInstance: bdCumandocInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdCumandocInstance = BdCumandoc.get(id)
        if (!bdCumandocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdCumandoc.label', default: 'BdCumandoc'), id])

        }

        [bdCumandocInstance: bdCumandocInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdCumandocInstance = BdCumandoc.get(id)
        if (!bdCumandocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdCumandoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdCumandocInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdCumandoc.label', default: 'BdCumandoc')] as Object[],
                        "Another user has updated this BdCumandoc while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        bdCumandocInstance.properties = params

        if (!bdCumandocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdCumandocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdCumandoc.label', default: 'BdCumandoc'), bdCumandocInstance.id])
        def data= bdCumandocInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdCumandocInstance = BdCumandoc.get(id)
        if (!bdCumandocInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdCumandocInstance.delete(flush: true)
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
        def bdCumandocInstanceLs
        def bdCumandocInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        def pkAreacl = ''
        if(params.pkAreacl!=null){
            pkAreacl = BdAreacl.get(params.pkAreacl)
        }
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdCumandoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.createCriteria('pkCubasdoc','pkCubasdoc')
            ch.criteria.add(Restrictions.eq('pkCubasdoc.pkAreacl',pkAreacl))
            def cc= new CriteriaHelper(BdCumandoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.createCriteria('pkCubasdoc','pkCubasdoc')
            cc.criteria.add(Restrictions.eq('pkCubasdoc.pkAreacl',pkAreacl))
            bdCumandocInstanceTotal = cc.count()


            bdCumandocInstanceLs = ch.list(params,"pkCubasdoc.custcode")
        }else if (params.q!=null){
            def sjson="""{'operator':'and',
                        'criterias':[
                                    {'operator':'equals','fieldName':'pkCorp.id','value':'${corp}'},
                                    {'operator':'equals','fieldName':'pkCubasdoc.pkAreacl','value':'${pkAreacl}'}
                                    ]
                        }"""
            def jsonObject=JSON.parse(sjson)
            CriteriaHelper ch = new CriteriaHelper(BdCumandoc.createCriteria(),jsonObject)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.createCriteria('pkCubasdoc','pkCubasdoc')
            ch.criteria.add(Restrictions.eq('pkCubasdoc.pkAreacl',pkAreacl))
            def cc= new CriteriaHelper(BdCumandoc.createCriteria(),jsonObject)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.createCriteria('pkCubasdoc','pkCubasdoc')
            cc.criteria.add(Restrictions.eq('pkCubasdoc.pkAreacl',pkAreacl))
            bdCumandocInstanceTotal = cc.count()


            bdCumandocInstanceLs = ch.list(params,"pkCubasdoc.custcode")

        }else if (params.id){
            def bdCumandocInstanceInstance= BdCumandoc.get(params.id)
            def json= [rows: [bdCumandocInstanceInstance], total: BdCumandoc.count()]
            render json as JSON
            return;
        }else if(!params.pkAreacl){
            def json= [rows: [], total:0]
            render json as JSON
            return
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdCumandoc.createCriteria())
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.createCriteria('pkCubasdoc','pkCubasdoc')
            ch.criteria.add(Restrictions.eq('pkCubasdoc.pkAreacl',pkAreacl))
            def cc= new CriteriaHelper(BdCumandoc.createCriteria())
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.createCriteria('pkCubasdoc','pkCubasdoc')
            cc.criteria.add(Restrictions.eq('pkCubasdoc.pkAreacl',pkAreacl))
            bdCumandocInstanceTotal = cc.count()


            bdCumandocInstanceLs = ch.list(params,"pkCubasdoc.custcode")
        }





        def data = []
        bdCumandocInstanceLs?.each {
            Map row = it.part()
            row['pkCubasdoc'] = [custcode:it?.pkCubasdoc?.custcode,custname:it?.pkCubasdoc?.custname,custshortname:it?.pkCubasdoc?.custshortname,engname:it?.pkCubasdoc?.engname,blockUp:it?.pkCubasdoc?.blockUp]
            data << row
        }

        def json= [rows: data, total: bdCumandocInstanceTotal]
        render json as JSON


    }

    /**
     * 查询地区分类
     * @param id
     * @return
     */
    def queryTree(String id){
        def data = []
        List bdAreaclInstances
        if (id){
            bdAreaclInstances = BdAreacl.findAllByPid(id,[sort:'areaclcode'])
        }else{
            bdAreaclInstances = BdAreacl.findAllByPid('0',[sort:'areaclcode'])
        }
        bdAreaclInstances?.each {
            def row = [:]
            row = [id:it.id,text:it.areaclname]
            if (BdAreacl.countByPid(it.id)!=0){
                row.state = 'closed'
            }
            data << row
        }
        render data as JSON
    }

    def queryAll(){
        render queryByState(params,true,true) as JSON
    }

    def queryVender(){

        render queryByState(params,true,false) as JSON
    }


    private queryByState(params,isvender,iscustomer){
        def bdCumandocInstanceLs
        def bdCumandocInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json = JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdCumandoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))

            if (isvender)
                ch.criteria.add(Restrictions.eq('isvender', isvender))
            if (iscustomer)
                ch.criteria.add(Restrictions.eq('iscustomer', iscustomer))
            def cc= new CriteriaHelper(BdCumandoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            if (isvender)
                cc.criteria.add(Restrictions.eq('isvender', isvender))
            if (iscustomer)
                cc.criteria.add(Restrictions.eq('iscustomer', iscustomer))
            bdCumandocInstanceTotal = cc.count()

            bdCumandocInstanceLs = ch.list(params,"pkCubasdoc.custcode")
        }
        else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'pkCubasdoc.custcode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'pkCubasdoc.custname','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdCumandoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            if (isvender)
                ch.criteria.add(Restrictions.eq('isvender', isvender))
            if (iscustomer)
                ch.criteria.add(Restrictions.eq('iscustomer', iscustomer))
            def cc= new CriteriaHelper(BdCumandoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            if (isvender)
                cc.criteria.add(Restrictions.eq('isvender', isvender))
            if (iscustomer)
                cc.criteria.add(Restrictions.eq('iscustomer', iscustomer))
            bdCumandocInstanceTotal = cc.count()


            bdCumandocInstanceLs = ch.list(params,"pkCubasdoc.custcode")

        }
        else if (params.id){
            def bdCumandocInstanceInstance= BdCumandoc.get(params.id)


            def json= [rows: [bdCumandocInstanceInstance.part()], total: 1]
            bdCumandocInstanceLs=[bdCumandocInstanceInstance]
            bdCumandocInstanceTotal=1

        }else{

            CriteriaHelper ch = new CriteriaHelper(BdCumandoc.createCriteria())
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            if (isvender)
                ch.criteria.add(Restrictions.eq('isvender', isvender))
            if (iscustomer)
                ch.criteria.add(Restrictions.eq('iscustomer', iscustomer))
            def cc= new CriteriaHelper(BdCumandoc.createCriteria())
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            if (isvender)
                cc.criteria.add(Restrictions.eq('isvender', isvender))
            if (iscustomer)
                cc.criteria.add(Restrictions.eq('iscustomer', iscustomer))
            bdCumandocInstanceTotal = cc.count()

            bdCumandocInstanceLs = ch.list(params,"pkCubasdoc.custcode")
        }





//        def data = []
//        bdCumandocInstanceLs?.each {
//            def row=it.part()
//            row.custname=it.pkCubasdoc.custname
//            data << row
//        }
        def acdata=[data:bdCumandocInstanceLs,type:'default']
        def data= pubActionscriptService.runScript('CUM','queryByState',acdata,servletContext.getRealPath(""),1,null)

        def json= [rows: data, total: bdCumandocInstanceTotal]
        return json
    }


    def queryCustomer(){

        render queryByState(params,false,true) as JSON
    }



}
