package com.app.ywms.cm.lossbill




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import grails.web.JSONBuilder
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YwmsLostBillController {
    //注册pageId   UUID 去除“-”

    def billTypeCode='YSHD'
    def  _pageId=billTypeCode?:"a5c6b1e394054b80840506c7668a0c17"
    def  ref_pageId=_pageId+'Ref'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def ywmsLostBillService
    def index() {
        [pageId:_pageId,billTypeCode:billTypeCode]
    }


    /**
     * 进入添加页面
     * @return
     */
    def create(String keys,String businessKey,String sourceBillTypeCode) {
        def instance
        if(sourceBillTypeCode){
            instance= pubActionscriptService.runChangeScript(sourceBillTypeCode,billTypeCode,[data:keys.split(','),'businessKey':businessKey])
        }else {
             instance= new YwmsLostBill(params)

        }

        if(businessKey){
            instance.businessType=PubBusinessType.get(businessKey);
        }
        instance.billdate=new Date()
        instance.billTypeCode=billTypeCode
        instance.billtype=PubBilltype.findByBilltypecode(billTypeCode)
        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)
        instance.maker=springSecurityService.currentUser
        instance.makeDate=new Date()
        [ywmsLostBIllInstance: instance,pageId:_pageId]
    }



    def save(){

        println params

        YwmsLostBill ywmsLostBIllInstance

        if(params.id){//update
            ywmsLostBIllInstance=YwmsLostBill.get(params.id)
            bindData(ywmsLostBIllInstance,params)


        }else{//save
            ywmsLostBIllInstance=new YwmsLostBill(params)
        }

//
        if (!ywmsLostBIllInstance.validate()) {
            def _errors=[]
            g.eachError(bean: ywmsLostBIllInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }


            def json=[validateerrors:_errors]

            render json as JSON
            return
        }







        ywmsLostBillService.save(ywmsLostBIllInstance)

        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'YwmsLostBill.label', default: 'YwmsLostBIll'), ywmsLostBIllInstance.billno])
        render data as JSON
    }


    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def ywmsLostBIllInstance = YwmsLostBill.get(id)
        if (!ywmsLostBIllInstance) {

            def data=[:]
            data.remoteErrors = message(code: 'default.not.found.message', args: [message(code: 'YwmsLostBill.label', default: 'YwmsLostBIll'), id])

            render data as JSON

            return
        }

        [ywmsLostBIllInstance: ywmsLostBIllInstance,pageId:_pageId]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def ywmsLostBIllInstance = YwmsLostBill.get(id)
        if (!ywmsLostBIllInstance) {

            def data=[:]
            data.remoteErrors = message(code: 'default.not.found.message', args: [message(code: 'YwmsLostBill.label', default: 'YwmsLostBIll'), id])

            render data as JSON

            return
        }

        [ywmsLostBIllInstance: ywmsLostBIllInstance,pageId:_pageId]
    }




    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def ywmsLostBIllInstance = YwmsLostBill.get(id)
        if (!ywmsLostBIllInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        ywmsLostBIllInstance.delete(flush: true)
        render id

    }

    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId,billTypeCode:billTypeCode])
    }

    /**
     * 查询
     * @return
     */
    def query(){

        def ywmsLostBIllInstanceLs
        def ywmsLostBIllInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse(params.queryParams,'utf-8')

            CriteriaHelper ch = new CriteriaHelper(YwmsLostBill.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(YwmsLostBill.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            ywmsLostBIllInstanceTotal = cc.count()
            ywmsLostBIllInstanceLs = ch.list(params,"billno",'desc') //TODO


//            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
//            ywmsLostBIllInstanceTotal = query.countQuery.count()
//
//            ywmsLostBIllInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO

        }else if (params.id){
            def ywmsLostBIllInstanceInstance= YwmsLostBill.get(params.id)
            def json= [rows: [ywmsLostBIllInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(YwmsLostBill.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(YwmsLostBill.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            ywmsLostBIllInstanceTotal = cc.count()

            ywmsLostBIllInstanceLs = ch.list(params,"billno",'desc')//TODO

            //def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
//            ywmsLostBIllInstanceTotal = query.countQuery.count()
//
//            ywmsLostBIllInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }





        def data = []
        ywmsLostBIllInstanceLs?.each {
            data << it.part([defaultPart:true])
        }

        def json= [rows: data, total: ywmsLostBIllInstanceTotal]
        render json as JSON
    }


    /**
     * 子表查询
     */
//    def queryBody(String headId,String targetBill){
//
//
//        // def bodys = YxhjhdB.findAllWhere(['head.id':headId])
//        def dt= pubActionscriptService.runScript(billTypeCode,'queryBody',[headId:headId,criteria:new CriteriaHelper(YxhjhdB.createCriteria()),targetBill:targetBill],0,null)
//        def data=[data:dt]
//        def rt= pubActionscriptService.runScript(billTypeCode,'queryBody',data,1,null)
//        def json= [rows: rt]
//        render json as JSON
//    }

    def refPage(String businessKey){
        params.page_id=ref_pageId
        params.billTypeCode=billTypeCode
        return params
    }

    def check(String id){
        ywmsLostBillService.check(id)
        def rt=[remoteMessage:'审核成功！']
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id){
        ywmsLostBillService.uncheck(id)
        def rt = [remoteMessage:'弃审成功！']
        render rt as JSON
    }

}
