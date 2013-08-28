package com.app.bd.psndoc

import com.app.bd.corp.BdCorp
import com.app.bd.deptdoc.BdDeptdoc
import com.app.bd.psnbasdoc.BdPsnbasdoc
import com.app.bd.psncl.BdPsncl
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class BdPsndocController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdPsndoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdPsndocInstanceList: BdPsndoc.list(params), bdPsndocInstanceTotal: BdPsndoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        def deptdoc = BdDeptdoc.get(params.deptId)
        if(!deptdoc){
            throw new BusinessException('为找到该部门档案！')
        }
        def bdPsndocInstance = new BdPsndoc()
        bdPsndocInstance.bdDeptdoc = deptdoc
        [bdPsndocInstance: bdPsndocInstance,bdPsnbasdocInstance:new BdPsnbasdoc(),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        println "~~~~"+params
        JSONObject psnbasObj = JSON.parse( URLDecoder.decode(params.obj1,'utf-8'))
        def bdPsnbasdocInstance = new BdPsnbasdoc(psnbasObj)
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        bdPsnbasdocInstance.bdCorp = corp
        if (!bdPsnbasdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdPsnbasdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }
        JSONObject psnObj = JSON.parse( URLDecoder.decode(params.obj,'utf-8'))
        def bdPsndocInstance = new BdPsndoc(psnObj)
        bdPsndocInstance.bdPsnbasdoc = bdPsnbasdocInstance
        bdPsndocInstance.bdCorp = corp
        if (!bdPsndocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdPsndocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            bdPsnbasdocInstance.delete(flush: true)
            return
        }

        def psn=bdPsndocInstance.part()
        def psnbas = bdPsnbasdocInstance.part()
        psn.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdPsndoc.label', default: 'BdPsndoc'), bdPsndocInstance.id])
        psnbas.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc'), bdPsnbasdocInstance.id])
        def json = [psn:psn,psnbas:psnbas]
        render json as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdPsndocInstance = BdPsndoc.get(id)
        if (!bdPsndocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPsndoc.label', default: 'BdPsndoc'), id])
            redirect(action: "list")
            return
        }

        [bdPsndocInstance: bdPsndocInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdPsndocInstance = BdPsndoc.get(id)
        if (!bdPsndocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPsndoc.label', default: 'BdPsndoc'), id])

        }
        def bdPsnbasdocInstance = BdPsnbasdoc.get(bdPsndocInstance.bdPsnbasdoc.id)
        if(!bdPsnbasdocInstance){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc'), id])
        }
        [bdPsndocInstance: bdPsndocInstance,bdPsnbasdocInstance:bdPsnbasdocInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update() {
        JSONObject psnbasObj = JSON.parse( URLDecoder.decode(params.obj1,'utf-8'))
        def bdPsnbasdocInstance = BdPsnbasdoc.get(psnbasObj.id)
        def psnbasVersion = psnbasObj.version
        if (!bdPsnbasdocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdPsnbasdoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (psnbasVersion != null) {
            if (bdPsnbasdocInstance.version > psnbasVersion) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc')] as Object[],
                        "Another user has updated this BdPsnbasdoc while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        bdPsnbasdocInstance.properties = psnbasObj

        if (!bdPsnbasdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdPsnbasdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        JSONObject psnObj = JSON.parse( URLDecoder.decode(params.obj,'utf-8'))
        def bdPsndocInstance = BdPsndoc.get(psnObj.id)
        def version = psnObj.version
        if (!bdPsndocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdPsndoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdPsndocInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdPsndoc.label', default: 'BdPsndoc')] as Object[],
                        "Another user has updated this BdPsndoc while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        bdPsndocInstance.properties = params

        if (!bdPsndocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdPsndocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def psnbasmessage = message(code: 'default.updated.message', args: [message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc'), bdPsnbasdocInstance.id])
        def message = message(code: 'default.updated.message', args: [message(code: 'bdPsndoc.label', default: 'BdPsndoc'), bdPsndocInstance.id])

        def psndata= bdPsndocInstance.part()
        psndata.remoteMessage=message
        def psnbasdata = bdPsnbasdocInstance.part()
        psndata.remoteMessage=psnbasmessage
        def json = [psn:psndata,psnbas:psnbasdata]
        render json as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdPsndocInstance = BdPsndoc.get(id)
        if (!bdPsndocInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdPsndocInstance.delete(flush: true)
        render id

    }

    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId])
    }


    def refQuery(){

        def bdPsndocInstanceLs
        def bdPsndocInstanceTotal
        def pkDept = params.pkDept
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdPsndoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))

            def cc=new CriteriaHelper(BdPsndoc.createCriteria(),json)

            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdPsndocInstanceTotal = cc.count()

            bdPsndocInstanceLs = ch.list(params,"psncode")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'psncode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'psnname','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdPsndoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))

            def cc=new CriteriaHelper(BdPsndoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))

            bdPsndocInstanceTotal = cc.count()

            bdPsndocInstanceLs = ch.list(params,"psncode")

        }else if (params.id){
            def bdPsndocInstanceInstance= BdPsndoc.get(params.id)
            def json= [rows: [bdPsndocInstanceInstance], total: 1]
            render json as JSON
            return;
        }else{

            CriteriaHelper ch = new CriteriaHelper(BdPsndoc.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))

            def cc=new CriteriaHelper(BdPsndoc.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))

            bdPsndocInstanceTotal = cc.count()

            bdPsndocInstanceLs = ch.list(params,"psncode")
        }





        def data = []
        bdPsndocInstanceLs?.each {
            Map row = it.part()
            row['bdCorp.unitName'] = it?.bdCorp?.unitName
            row['bdDeptdoc.deptName'] = it?.bdDeptdoc?.deptName
            row['bdPsncl.name'] = it?.bdPsncl?.name

            data << row
        }

        def json= [rows: data, total: bdPsndocInstanceTotal]
        render json as JSON
    }

    /**
     * 查询
     * @return
     */
    def query(){

        def bdPsndocInstanceLs
        def bdPsndocInstanceTotal
        def pkDept = params.pkDept
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdPsndoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            ch.criteria.add(Restrictions.eq('bdDeptdoc.id',pkDept))
            def cc=new CriteriaHelper(BdPsndoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdDeptdoc.id',pkDept))
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdPsndocInstanceTotal = cc.count()

            bdPsndocInstanceLs = ch.list(params,"psncode")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'psncode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'psnname','value':'${params.q}'}
                                    ]
                        }"""



            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdPsndoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            ch.criteria.add(Restrictions.eq('bdDeptdoc.id',pkDept))
            def cc=new CriteriaHelper(BdPsndoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            cc.criteria.add(Restrictions.eq('bdDeptdoc.id',pkDept))
            bdPsndocInstanceTotal = cc.count()

            bdPsndocInstanceLs = ch.list(params,"psncode")

        }else if (params.id){
            def bdPsndocInstanceInstance= BdPsndoc.get(params.id)
            def json= [rows: [bdPsndocInstanceInstance], total: 1]
            render json as JSON
            return;
        }else{

            CriteriaHelper ch = new CriteriaHelper(BdPsndoc.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
//            ch.criteria.add(Restrictions.eq('bdDeptdoc.id',pkDept))
            def cc=new CriteriaHelper(BdPsndoc.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
//            ch.criteria.add(Restrictions.eq('bdDeptdoc.id',pkDept))
            bdPsndocInstanceTotal = cc.count()

            bdPsndocInstanceLs = ch.list(params,"psncode")
        }





        def data = []
        bdPsndocInstanceLs?.each {
            Map row = it.part()
            row['bdCorp.unitName'] = it?.bdCorp?.unitName
            row['bdDeptdoc.deptName'] = it?.bdDeptdoc?.deptName
            row['bdPsncl.name'] = it?.bdPsncl?.name

            data << row
        }

        def json= [rows: data, total: bdPsndocInstanceTotal]
        render json as JSON
    }

    def queryTree(String id){
        List sf
        if(id){
            sf = BdDeptdoc.findAllByFatherId(id,[sort:'deptCode'])
        }else{
            sf = BdDeptdoc.findAllByFatherId('0',[sort:'deptCode'])
        }
        def data = []
        sf?.each {
            def row = [:]
            row = it.part()
            if (BdDeptdoc.countByFatherId(it.id)!=0){
                row.state = 'closed'
            }
            row.text = row.deptName
            data << row
        }
        render data as JSON
    }

    def queryBas(){
        def bdPsnbasdocInstanceLs
        def bdPsnbasdocInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdPsnbasdoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdPsnbasdoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdPsnbasdocInstanceTotal = cc.count()

            bdPsnbasdocInstanceLs = ch.list(params,"name")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'name','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'shenfenzhenghao','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdPsnbasdoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdPsnbasdoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdPsnbasdocInstanceTotal = cc.count()

            bdPsnbasdocInstanceLs = ch.list(params,"name")

        }else if (params.id){
            def bdPsnbasdocInstanceInstance= BdPsnbasdoc.get(params.id)
            def json= [rows: [bdPsnbasdocInstanceInstance], total: 1]
            render json as JSON
            return;
        }else if(params.psnId){

            def bdPsndocInstance =  BdPsndoc.get(params.psnId)
            bdPsnbasdocInstanceLs = BdPsnbasdoc.get(bdPsndocInstance.bdPsnbasdoc.id)
            bdPsnbasdocInstanceTotal = 1
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdPsnbasdoc.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdPsnbasdoc.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdPsnbasdocInstanceTotal = cc.count()

            bdPsnbasdocInstanceLs = ch.list(params,"name")
        }





        def data = []
        bdPsnbasdocInstanceLs?.each {
            Map row = it.part()
            row['bdCorp.unitName'] = it?.bdCorp?.unitName
            data << row
        }
        def json= [rows: data, total: bdPsnbasdocInstanceTotal]
        render json as JSON
    }

}
