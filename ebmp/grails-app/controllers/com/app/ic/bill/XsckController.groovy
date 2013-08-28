package com.app.ic.bill

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

class XsckController {
    //注册pageId   UUID 去除“-”
    def billTypeCode='I1'
    def static _pageId = 'I1'
    def static ref_pageId = 'I1Ref'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def icGeneralService
    def index() {
        [pageId: _pageId]
    }



    /**
     * 进入添加页面
     * @return
     */
    def create(String keys,String businessKey,String sourceBillTypeCode) {

        def instance
       if(sourceBillTypeCode){
            instance= pubActionscriptService.runChangeScript(sourceBillTypeCode,billTypeCode,[data:keys?.split(','),'businessKey':businessKey])
       }else{
           instance=new IcGeneralHead()
           instance.businessType=PubBusinessType.get(businessKey);

       }
        instance.billTypeCode=billTypeCode
        instance.billtype=PubBilltype.findByBilltypecode(billTypeCode)
        instance.bdCorp = BdCorp.get(springSecurityService.authentication.loginCorp)
        instance.maker = springSecurityService.currentUser
        instance.makeDate = new Date()
        instance.billdate=new Date()
        def param=    pubActionscriptService.runScript(billTypeCode,'create',[data:instance],1,null)
//        [icGeneralHeadInstance: instance, pageId: _pageId]
         param.pageId=_pageId

        return   param
    }



    def save() {
        JSONObject head = JSON.parse(params.head)

        def bodys = JSON.parse(params.bodys)

        IcGeneralHead icGeneralHeadInstance

        if (head.id) {//update
            icGeneralHeadInstance = IcGeneralHead.get(head.id)
            bindData(icGeneralHeadInstance, head)


        } else {//save
            icGeneralHeadInstance = new IcGeneralHead(head)
        }

//
        if (!icGeneralHeadInstance.validate()) {
            def _errors = []
            g.eachError(bean: icGeneralHeadInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }


            def json = [validateerrors: _errors]

            render json as JSON
            return
        }





        if (bodys == null) {
            throw new BusinessException('表体数据不能为空!')
        }

        // def _bodys=[]
        def _delKey = []
        int row = 0
        bodys?.each {



            if (it.isDeleted) {
                _delKey << it.id
            } else {

                def body =  IcGeneralBody.findOrCreateById(it.id)
                JSONObject obj= (JSONObject)it
                bindData(body,obj)


                row++
                if (!body.validate()) {

                    log.debug body.errors
                    def msg = ""
                    g.eachError(bean: body) {

                        msg += g.message(error: it)
                        msg += ';'
                    }

                    throw new BusinessException('行：' + row + ',' + msg)


                }
                if (!body.id) {
                    icGeneralHeadInstance.addToBody(body);
                }

            }


        }

        icGeneralService.save(icGeneralHeadInstance, _delKey)

        def data = [:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'icGeneralHead.label', default: 'IcGeneralHead'), icGeneralHeadInstance.id])
        render data as JSON
    }


    def show(String id){
        def icGeneralHeadInstance = IcGeneralHead.get(id)
        if (!icGeneralHeadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'icGeneralHead.label', default: 'IcGeneralHead'), id])

        }

        [icGeneralHeadInstance: icGeneralHeadInstance, pageId: _pageId]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def icGeneralHeadInstance = IcGeneralHead.get(id)
        if (!icGeneralHeadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'icGeneralHead.label', default: 'IcGeneralHead'), id])

        }

        [icGeneralHeadInstance: icGeneralHeadInstance, pageId: _pageId]
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        icGeneralService.delete(id)
        def rt = [remoteMessage: '删除成功！']
        render rt as JSON
    }

    def createQuery() {
        render(view: 'query', model: [pageId: _pageId])
    }

    /**
     * 查询
     * @return
     */
    def query() {

        def icGeneralHeadInstanceLs
        def icGeneralHeadInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams) {
            def json = JSON.parse(URLDecoder.decode(params.queryParams, 'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(IcGeneralHead.createCriteria(), json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc = new CriteriaHelper(IcGeneralHead.createCriteria(), json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
            icGeneralHeadInstanceTotal = query.countQuery.count()

            icGeneralHeadInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }  else if (params.id) {
            def icGeneralHeadInstanceInstance = IcGeneralHead.get(params.id)
            def json = [rows: [icGeneralHeadInstanceInstance], total: 1]
            render json as JSON
            return;
        } else {

            CriteriaHelper ch = new CriteriaHelper(IcGeneralHead.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc = new CriteriaHelper(IcGeneralHead.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
            icGeneralHeadInstanceTotal = query.countQuery.count()

            icGeneralHeadInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }





        def data = []
        icGeneralHeadInstanceLs?.each {
            data << it.part([defaultPart:true])
        }

        def json = [rows: data, total: icGeneralHeadInstanceTotal]
        render json as JSON
    }

    /**
     * 子表查询
     */
    def queryBody(String headId,String targetBill){


        // def bodys = YxhjhdB.findAllWhere(['head.id':headId])
        def dt= pubActionscriptService.runScript(billTypeCode,'queryBody',[headId:headId,criteria:new CriteriaHelper(IcGeneralBody.createCriteria()),targetBill:targetBill],0,null)
        def data=[data:dt,type:'default']
        def rt= pubActionscriptService.runScript(billTypeCode,'queryBody',data,1,null)
        def json= [rows: rt]
        render json as JSON
    }

    def refPage(String businessKey) {
        [pageId: ref_pageId, handler: params.handler, 'businessKey': businessKey]
    }

    def check(String id) {
        icGeneralService.check(id)
        def rt = [remoteMessage: '审核成功！']
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id) {
        icGeneralService.uncheck(id)
        def rt = [remoteMessage: '弃审成功！']
        render rt as JSON
    }

}
