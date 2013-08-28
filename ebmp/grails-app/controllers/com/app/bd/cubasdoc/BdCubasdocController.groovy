package com.app.bd.cubasdoc

import com.app.bd.areacl.BdAreacl
import com.app.bd.corp.BdCorp
import com.app.util.PageHelper
import org.hibernate.criterion.Restrictions
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON

import static java.util.UUID.randomUUID

class BdCubasdocController {
    //注册pageId   UUID 去除“-”
    def static _pageId = 'BdCubasdoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def bdCubasdocService


    def index() {
        [pageId: _pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdCubasdocInstanceList: BdCubasdoc.list(params), bdCubasdocInstanceTotal: BdCubasdoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String id) {
        def bdAreaclInstance = BdAreacl.get(id)
        def bdCubasdocInstance = new BdCubasdoc()
        if (!bdCubasdocInstance){
            flash.message = message(code: 'default.not.found.message',default:'没有找到地区分类')
            [bdCubasdocInstance:bdCubasdocInstance,pageId:_pageId]
        }else{
            bdCubasdocInstance.pkAreacl = bdAreaclInstance
            [bdCubasdocInstance:bdCubasdocInstance,pageId:_pageId]
        }
    }

/**
 * 保存
 * @return
 */
    def save() {
        def bdCubasdocInstance = new BdCubasdoc(params)
        def creator = springSecurityService.currentUser
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        bdCubasdocInstance.creator = creator
        bdCubasdocInstance.pkCorp = corp
        if (!bdCubasdocInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: bdCubasdocInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json = [validateerrors: _errors]

            render json as JSON
            return
        }

        def data = bdCubasdocInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdCubasdoc.label', default: 'BdCubasdoc'), bdCubasdocInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdCubasdocInstance = BdCubasdoc.get(id)
        if (!bdCubasdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdCubasdoc.label', default: 'BdCubasdoc'), id])
            redirect(action: "list")
            return
        }

        [bdCubasdocInstance: bdCubasdocInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdCubasdocInstance = BdCubasdoc.get(id)
        if (!bdCubasdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdCubasdoc.label', default: 'BdCubasdoc'), id])

        }

        [bdCubasdocInstance: bdCubasdocInstance, pageId: _pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdCubasdocInstance = BdCubasdoc.get(id)
        if (!bdCubasdocInstance) {

            def json = [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdCubasdoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdCubasdocInstance.version > version) {
                def msg = message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdCubasdoc.label', default: 'BdCubasdoc')] as Object[],
                        "Another user has updated this BdCubasdoc while you were editing")
                def josn = [remoteErrors: msg]
                render josn as JSON
                return
            }
        }

        bdCubasdocInstance.properties = params

        if (!bdCubasdocInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: bdCubasdocInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }
            def json = [validateerrors: _errors]
            render json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdCubasdoc.label', default: 'BdCubasdoc'), bdCubasdocInstance.id])
        def data = bdCubasdocInstance.part()
        data.remoteMessage = message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdCubasdocInstance = BdCubasdoc.get(id)
        if (!bdCubasdocInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdCubasdocInstance.delete(flush: true)
        render id

    }

    def createQuery() {
        render(view: 'query', model: [pageId: _pageId])
    }

    /**
     * 查询
     * @return
     */
    def query() {
        println  params


        def bdCubasdocInstanceLs
        def bdCubasdocInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( params.queryParams)

            CriteriaHelper ch = new CriteriaHelper(BdCubasdoc.createCriteria(),json)
            def cc= new CriteriaHelper(BdCubasdoc.createCriteria(),json)

            if(corp=='00000000000000000000000000000009'){
                ch.criteria.add(Restrictions.or(Restrictions.eq('pkCorp.id', corp),Restrictions.isNull('pkCorp.id')))
                cc.criteria.add(Restrictions.or(Restrictions.eq('pkCorp.id', corp),Restrictions.isNull('pkCorp.id')))
            }else{
                ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
                cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            }

            bdCubasdocInstanceTotal = cc.count()

            bdCubasdocInstanceLs = ch.list(params,"custcode")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'custcode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'custname','value':'${params.q}'},
                                    {'operaotr':'contains','fieldName':'pkCorp.id','value':'${corp}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdCubasdoc.createCriteria())
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))

            def cc= new CriteriaHelper(BdCubasdoc.createCriteria())
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))

            bdCubasdocInstanceTotal = cc.count()


            bdCubasdocInstanceLs = ch.list(params,"custcode")

        }else if (params.id){
            def bdCubasdocInstanceInstance= BdCubasdoc.get(params.id)
            def json= [rows: [bdCubasdocInstanceInstance], total: BdCubasdoc.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdCubasdoc.createCriteria())

            def cc=new CriteriaHelper(BdCubasdoc.createCriteria())


            if(corp=='00000000000000000000000000000009'){
                ch.criteria.add(Restrictions.or(Restrictions.eq('pkCorp.id', corp),Restrictions.isNull('pkCorp.id')))
                cc.criteria.add(Restrictions.or(Restrictions.eq('pkCorp.id', corp),Restrictions.isNull('pkCorp.id')))
            }else{
                ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
                cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            }

            bdCubasdocInstanceTotal = cc.count()

            bdCubasdocInstanceLs = ch.list(params,"custcode")
        }





        def data = []
        bdCubasdocInstanceLs?.each {
            Map row = it.part([defaultPart:true])
            data << row
        }

        def json= [rows: data, total: bdCubasdocInstanceTotal]
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

    def openAllotDlg(String pkAreacl){
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        render view:'allotDlg',model:[corp:corp,pkAreacl:pkAreacl,pageId:_pageId]
    }

    def allot(){
        def pkCubasdoc = params.pkCubasdoc
        def pkCorp = params.pkCorp
        if(!pkCubasdoc){
            throw new BusinessException("无数据")
        }
        if(!pkCorp){
            throw new BusinessException("请选择公司");
        }
        bdCubasdocService.allot(pkCubasdoc, pkCorp)
        def state = ['success':true]
        render state as JSON
    }

    def allotAll(){
        def pkCorp = params.pkCorp
        def pkAreacl = params.pkAreacl
        if(pkCorp.equalsIgnoreCase("null")){
            throw new BusinessException("请选择公司");
        }

        bdCubasdocService.allotAll(pkCorp,pkAreacl)

        def state = ['success':true]
        render state as JSON
    }

    def deleteAllot(){
        def pkCubasdoc = params.pkCubasdoc
        def pkCorp= params.pkCorp
        if(!pkCubasdoc){
            throw new BusinessException("无数据")
        }
        if(!pkCorp){
            throw new BusinessException("请选择公司");
        }
        bdCubasdocService.deleteAllot(pkCubasdoc, pkCorp)
        def state = ['success':true]
        render state as JSON

    }

    def deleteAllotAll(){

        def pkCorp= params.pkCorp
        def pkAreacl= params.pkAreacl

        if(!pkCorp){
            throw new BusinessException("请选择公司");
        }
        bdCubasdocService.deleteAllotAll(pkCorp, pkAreacl);
        def state = ['success':true]
        render state as JSON



    }

    def queryCubasdocInCorp(String pkAreacl,String pkCorp){
        if (!pkAreacl || !pkCorp){
            def row = [rows:[],total:0]
            render row as JSON
        }else{

            def _corpid=pkCorp
            def _areaclid=pkAreacl

            def sql="""select bas from BdCubasdoc bas
            where bas.id in
            (
                select man.pkCubasdoc from BdCumandoc as man where man.pkCorp.id=?
            )
            and bas.pkAreacl.id=?  """

            def sf=BdCubasdoc.executeQuery(sql, [_corpid,_areaclid],PageHelper.pageMap(params,"custcode"))

            def data=[]
            sf?.each{
                data << it.part()
            }
            def sql1="""select count(bas) from BdCubasdoc bas
            where bas.id in
            (
                select man.pkCubasdoc from BdCumandoc as man where man.pkCorp.id=?
            )
            and bas.pkAreacl.id=?"""
            def count=BdCubasdoc.executeQuery(sql1, [_corpid,_areaclid])
            def rows = [rows:data,total:count]
            render rows as JSON
        }

    }

    def queryCubasdocNotInCorp(String pkAreacl,String pkCorp){
        if (!pkAreacl || !pkCorp){
            def row = [rows:[],total:0]
            render row as JSON
        }else{
            def _corpid= pkCorp
            def _areaclid= pkAreacl

            def sql="""select bas from BdCubasdoc bas
            where bas.id not in
            (
                select man.pkCubasdoc from BdCumandoc as man where man.pkCorp.id=?
            )
            and bas.pkAreacl.id=?  """
            def sf=BdCubasdoc.executeQuery(sql, [_corpid,_areaclid],PageHelper.pageMap(params,"custcode"))

            def data=[]
            sf?.each{
                data << it.part()
            }
            def sql1="""select count(bas) from BdCubasdoc bas
            where bas.id not in
            (
                select man.pkCubasdoc from BdCumandoc as man where man.pkCorp.id=?
            )
            and bas.pkAreacl.id=?"""
            def count=BdCubasdoc.executeQuery(sql1, [_corpid,_areaclid])
            def row = [rows:data,total:count]
            render row as JSON
        }

    }
}
