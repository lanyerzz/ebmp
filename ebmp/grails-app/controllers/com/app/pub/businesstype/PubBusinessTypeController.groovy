package com.app.pub.businesstype

import com.app.bd.corp.BdCorp
import com.app.sm.function.SmFunction
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class PubBusinessTypeController {
    //注册pageId   UUID 去除“-”
    def static _pageId=randomUUID().toString().replaceAll('-','')
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pubBusinessTypeInstanceList: PubBusinessType.list(params), pubBusinessTypeInstanceTotal: PubBusinessType.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [pubBusinessTypeInstance: new PubBusinessType(params),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def pubBusinessTypeInstance = null;
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        JSONObject head = JSON.parse( URLDecoder.decode(params.head,'utf-8'))
        def bodys = JSON.parse( URLDecoder.decode(params.body,'utf-8'))

        println URLDecoder.decode(params.body,'utf-8')

        if (head.id){
            pubBusinessTypeInstance = PubBusinessType.get(head.id)
            bindData(pubBusinessTypeInstance,head)
        }else{
            pubBusinessTypeInstance = new PubBusinessType(head)
            pubBusinessTypeInstance.bdCorp = corp
        }

        if(bodys == null){
            throw new BusinessException('表体数据不能为空')
        }

        def keys=[]
        if(pubBusinessTypeInstance.bills){
            pubBusinessTypeInstance.bills.each { keys << it.id }
        }

        bodys?.each {

            def _id=it.id?:'none'
            def body = PubBusinessBill.findOrCreateById(_id)

            keys.remove(body.id)
            //''{"billtype.id":"402881e43d42be9f013d440e89f50002","canDefine":"true","flowType":0,"head.id":"402881e83dc48b6e013dc48d76b60000","lastUpdated":1364802238148,"id":"402881e83dc48b6e013dc48d76b80001","version":0,"billtype":{"billtypecode":"YHYJH","billtypename":"货源计划(Y)","dateCreated":1362646436342,"lastUpdated":1362646436342,"id":"402881e43d42be9f013d440e89f50002","version":0},"sourceType":null,"sourceType.id":null}'

            bindData(body,it)
            if(!body.validate()){

                log.debug body.errors
            }
            pubBusinessTypeInstance.addToBills(body)
        }

        if(!pubBusinessTypeInstance.validate()){
            def _errors=""
            g.eachError(bean: pubBusinessTypeInstance){

                _errors +=   g.message(error: it)
            }

            def json=[remoteErrors: _errors]

            render json as JSON
            return
        }
        if(pubBusinessTypeInstance.bills==null || pubBusinessTypeInstance.bills.size()==0)
            throw new BusinessException('表体数据不能为空!')
        pubBusinessTypeInstance.save(flush: true)


        if(keys)
            PubBusinessBill.executeUpdate("delete from PubBusinessBill where id in ?",keys)

        def data=pubBusinessTypeInstance.part()
        data['bdCorp.unitName'] = pubBusinessTypeInstance?.bdCorp?.unitName
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'pubBusinessType.label', default: 'PubBusinessType'), pubBusinessTypeInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def pubBusinessTypeInstance = PubBusinessType.get(id)
        if (!pubBusinessTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubBusinessType.label', default: 'PubBusinessType'), id])
            redirect(action: "list")
            return
        }

        [pubBusinessTypeInstance: pubBusinessTypeInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def pubBusinessTypeInstance = PubBusinessType.get(id)
        if (!pubBusinessTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubBusinessType.label', default: 'PubBusinessType'), id])

        }

        [pubBusinessTypeInstance: pubBusinessTypeInstance,pageId:_pageId]
    }




    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def pubBusinessTypeInstance = PubBusinessType.get(id)
        if (!pubBusinessTypeInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        pubBusinessTypeInstance.delete(flush: true)
        render id

    }

    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId])
    }

    /**
     * 查询
     * @return
     */
    def query(String billtypecode){

        def pubBusinessTypeInstanceLs
        def pubBusinessTypeInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(PubBusinessType.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))


            def cc=new CriteriaHelper(PubBusinessType.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))


            if(billtypecode){
                ch.createCriteria('bills','bills')
                ch.createCriteria('bills.billtype','billtype')
                ch.criteria.add(Restrictions.eq('billtype.billtypecode',billtypecode))

                cc.createCriteria('bills','bills')
                cc.createCriteria('bills.billtype','billtype')
                cc.criteria.add(Restrictions.eq('billtype.billtypecode',billtypecode))
            }

            pubBusinessTypeInstanceTotal = cc.count()

            pubBusinessTypeInstanceLs = ch.list(params,"code")
        }else if (params.q!=null){

            def sjson

            if(billtypecode){
                sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'code','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'name','value':'${params.q}'},
                                    {'operator':'equals','fieldName':'bills.billtype.billtypecode','value':'${billtypecode}'},
                                    {'operator':'contains','fieldName':'bdCorp.id','value':'${corp}'}
                                    ]
                        }"""
            }else{
                sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'code','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'name','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'bdCorp.id','value':'${corp}'}
                                    ]
                        }"""
            }




            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(PubBusinessType.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(PubBusinessType.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            pubBusinessTypeInstanceTotal = cc.count()

            pubBusinessTypeInstanceLs = ch.list(params,"code")

        }else if (params.id){
            def pubBusinessTypeInstanceInstance= PubBusinessType.get(params.id)
            def json= [rows: [pubBusinessTypeInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(PubBusinessType.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(PubBusinessType.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))


            if(billtypecode){
                ch.createCriteria('bills','bills')
                ch.createCriteria('bills.billtype','billtype')
                ch.criteria.add(Restrictions.eq('billtype.billtypecode',billtypecode))

                cc.createCriteria('bills','bills')
                cc.createCriteria('bills.billtype','billtype')
                cc.criteria.add(Restrictions.eq('billtype.billtypecode',billtypecode))
            }


            pubBusinessTypeInstanceTotal = cc.count()

            pubBusinessTypeInstanceLs = ch.list(params,"code")
        }





        def data = []
        pubBusinessTypeInstanceLs?.each {
            Map row = it.part()
            row['bdCorp.unitName'] = it?.bdCorp?.unitName
            data << row
        }

        def json= [rows: data, total: pubBusinessTypeInstanceTotal]
        render json as JSON
    }

    def queryBody(String headId){
        def bodys = PubBusinessBill.findAll{
           eq('head.id',headId)
        }
        def data = []
        bodys.each {
            Map row = it.part()
            row['billtype'] = it?.billtype?.part()
            row['sourceType'] = it?.sourceType?.part()
            data << row
        }

        def json = [rows: data]
        render json as JSON
    }


    def refPage(String businessKey,String billTypeKey,String handler,String targetBill){
        //查找节点action

        println params
        println '------------------------------------'
       def fun= SmFunction.find {
            eq('pubBilltype.id',billTypeKey)
        }

        def ctr=fun.getSmcontroller()

        redirect(controller: ctr,action: 'refPage',params: params)
    }


}
