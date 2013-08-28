package com.app.bd.salestru




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
class BdSalestruController {
    //注册pageId   UUID 去除“-”

    def billTypeCode=''
    def  _pageId=billTypeCode?:"8ae9694813774732a402f6525ea29937"
    def  ref_pageId=_pageId+'Ref'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId,billTypeCode:billTypeCode]
    }


    /**
     * 进入添加页面
     * @return
     */
    def create(String keys,String businessKey,String sourceBillTypeCode) {
        def instance

        instance= new BdSalestru(params)

        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)

        [bdSalestruInstance: instance,pageId:_pageId]
    }



    def save(){






        BdSalestru bdSalestruInstance

        if(params.id){//update
            bdSalestruInstance=BdSalestru.get(params.id)
            bindData(bdSalestruInstance,params)


        }else{//save
            bdSalestruInstance=new BdSalestru(params)
        }

//
        if (!bdSalestruInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdSalestruInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }


            def json=[validateerrors:_errors]

            render json as JSON
            return
        }





        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdSalestru.label', default: 'BdSalestru'), bdSalestruInstance.code])
        render data as JSON
    }


    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdSalestruInstance = BdSalestru.get(id)
        if (!bdSalestruInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdSalestru.label', default: 'BdSalestru'), id])
            redirect(action: "list")
            return
        }

        [bdSalestruInstance: bdSalestruInstance,pageId:_pageId]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdSalestruInstance = BdSalestru.get(id)
        if (!bdSalestruInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdSalestru.label', default: 'BdSalestru'), id])

        }

        [bdSalestruInstance: bdSalestruInstance,pageId:_pageId]
    }




    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdSalestruInstance = BdSalestru.get(id)
        if (!bdSalestruInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdSalestruInstance.delete(flush: true)
        render id

    }


    /**
     * 查询
     * @return
     */
    def query(){

        def bdSalestruInstanceLs
        def bdSalestruInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse(params.queryParams,'utf-8')

            CriteriaHelper ch = new CriteriaHelper(BdSalestru.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdSalestru.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdSalestruInstanceTotal = cc.count()
            bdSalestruInstanceLs = ch.list(params,"code") //TODO



        }else if (params.q!=null){//TODO 需要修改JSON中的字段
            JSONBuilder json=new  JSONBuilder()
            json.or{
                criterias[
                        {operator:'operator'
                            fieldName:'code'
                            value:'${params.q}'
                        },
                        {operator:'operator'
                            fieldName:'code'
                            value:'${params.q}'
                        }

                        ]
            }




            CriteriaHelper ch = new CriteriaHelper(BdSalestru.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdSalestru.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdSalestruInstanceTotal = cc.count()

            bdSalestruInstanceLs = ch.list(params,"code")//TODO

        }else if (params.id){
            def bdSalestruInstanceInstance= BdSalestru.get(params.id)
            def json= [rows: [bdSalestruInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdSalestru.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdSalestru.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdSalestruInstanceTotal = cc.count()

            bdSalestruInstanceLs = ch.list(params,"code")//TODO

        }





        def data = []
        bdSalestruInstanceLs?.each {
            data << it.part([defaultPart:true])
        }

        def json= [rows: data, total: bdSalestruInstanceTotal]
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
        def user = springSecurityService.currentUser
        def instance = BdSalestru.get(id)
        if(instance.checker!=null){
            throw new BusinessException('单据已经是审核状态！')
        }

        instance.checker = user
        instance.checkDate = new Date()
        instance.save()
        def rt=[remoteMessage:'审核成功！',data:[checker:[userRealName:instance.checker.userRealName],'checkDate':instance.checkDate]]
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id){
        def instance = BdSalestru.get(id)
        if(instance.checker==null){
            throw new BusinessException('单据未被审核，弃审动作失败！')
        }

        instance.checker = null
        instance.checkDate = null
        instance.save()
        def rt = [remoteMessage:'弃审成功！',data:[checker:[userRealName:''],'checkDate':'']]
        render rt as JSON
    }

}
