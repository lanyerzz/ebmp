package com.app.ywms.rk.xhqrd

import com.app.bd.corp.BdCorp
import com.app.exception.ValidateException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YxhqrdController {
    //注册pageId   UUID 去除“-”
    def static _pageId='Yxhqrd'
    def billTypeCode='YXHQRD'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def static ref_pageId = randomUUID().toString().replaceAll('-','')
    def pubActionscriptService
    def yxhqrdService

    def index() {
        [pageId:_pageId,billTypeCode:billTypeCode]
    }



    /**
     * 进入添加页面
     * @return
     */
    def create(String keys,String businessKey,String sourceBillTypeCode) {
        def yxhqrdInstance
        println params
        if(sourceBillTypeCode){

            yxhqrdInstance= pubActionscriptService.runChangeScript(sourceBillTypeCode,billTypeCode,[data:keys,'businessKey':businessKey])
            yxhqrdInstance.sourceBillTypeCode=sourceBillTypeCode
            yxhqrdInstance.sourceBillType=PubBilltype.findByBilltypecode(sourceBillTypeCode)
        }else {

            yxhqrdInstance= new Yxhqrd()
            yxhqrdInstance.businessType=PubBusinessType.get(businessKey);

        }
        [yxhqrdInstance: yxhqrdInstance,pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        Yxhqrd yxhqrdInstance
        JSONObject head = JSON.parse( params.head)
        def gh = JSON.parse(params.gh)
        if(head.id){

            yxhqrdInstance=Yxhqrd.get(head.id)
            bindData(yxhqrdInstance,head)

        }else
            yxhqrdInstance = new Yxhqrd(head)

        yxhqrdInstance.maker=springSecurityService.currentUser
        yxhqrdInstance.makeDate=new Date()
        yxhqrdInstance.bdCorp = corp
        if (!yxhqrdInstance.validate()) {
            def _errors=[]
            g.eachError(bean: yxhqrdInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }


        if (gh == null) {
            throw new BusinessException('表体数据不能为空!')
        }

        // def _bodys=[]
        def _delKey = []
        int row = 0
        gh?.each {



            if (it.isDeleted) {
                _delKey << it.id
            } else {

                def _gh =  YxhqrdGh.findOrCreateById(it.id)
                JSONObject obj= (JSONObject)it
                bindData(_gh,obj)


                row++
                if (!_gh.validate()) {

                    log.debug _gh.errors
                    def msg = ""
                    g.eachError(bean: _gh) {

                        msg += g.message(error: it)
                        msg += ';'
                    }

                    throw new BusinessException('行：' + row + ',' + msg)


                }
                if (!_gh.id) {
                    yxhqrdInstance.addToGh(_gh)
                }

            }
        }



            def dt=  yxhqrdService.save(yxhqrdInstance,_delKey)
            def data=[:]
            data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'yxhqrd.label', default: 'Yxhqrd'), yxhqrdInstance.billno])
            data.rows=dt
            render data as JSON


    }




    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def yxhqrdInstance = Yxhqrd.get(id)
        if (!yxhqrdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yxhqrd.label', default: 'Yxhqrd'), id])

        }

        [yxhqrdInstance: yxhqrdInstance,pageId:_pageId]
    }

    def show(String id) {
        def yxhqrdInstance = Yxhqrd.get(id)
        if (!yxhqrdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yxhqrd.label', default: 'Yxhqrd'), id])

        }

        [yxhqrdInstance: yxhqrdInstance,pageId:_pageId]
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {

        yxhqrdService.delete(id);
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

        def yxhqrdInstanceLs
        def yxhqrdInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(Yxhqrd.createCriteria(),json)

            def cc=new CriteriaHelper(Yxhqrd.createCriteria(),json)

            def query= pubActionscriptService.runScript('YXHQRD','query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)

            yxhqrdInstanceTotal = query.countQuery.count()

            yxhqrdInstanceLs = query.listQuery.list(params,"dgsj")
        }else if (params.id){
            def yxhqrdInstanceInstance= Yxhqrd.get(params.id)
            def json= [rows: [yxhqrdInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(Yxhqrd.createCriteria())

            def cc=new CriteriaHelper(Yxhqrd.createCriteria())
            def query= pubActionscriptService.runScript('YXHQRD','query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)

            yxhqrdInstanceTotal = query.countQuery.count()

            yxhqrdInstanceLs = query.listQuery.list(params,"dgsj")
        }


        def rt= pubActionscriptService.runScript('YXHQRD','query',[data:yxhqrdInstanceLs],1,null)

        def json= [rows: rt, total: yxhqrdInstanceTotal]
        render json as JSON
    }
    def refPage(String businessKey){
        [pageId:ref_pageId,handler:params.handler,'businessKey':businessKey]
    }

    def check(String id){

        def yxhjhdInstance = Yxhqrd.get(id)


       yxhqrdService.check(yxhjhdInstance)
        def rt=[remoteMessage:'审核成功！',data:[checker:[userRealName:yxhjhdInstance.checker.userRealName],'checkDate':yxhjhdInstance.checkDate]]
        render rt as JSON

    }

    def uncheck(String id){
        def yxhjhdInstance = Yxhqrd.get(id)


       yxhqrdService.uncheck(yxhjhdInstance)
        def rt = [remoteMessage:'弃审成功！',data:[checker:[userRealName:''],'checkDate':'']]
        render rt as JSON
    }


    def queryGH(String id){

        def ls=YxhqrdGh.findAll {
            eq('head.id',id)
        }

        def json=[rows:ls*.part([defaultPart:true])]


        render json as JSON
    }

}
