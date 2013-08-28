package com.app.ic.special




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
class IcSpecialController {
    //注册pageId   UUID 去除“-”

    def billTypeCode=''
    def  _pageId=billTypeCode?:"8368cf454b86476888fd1ad32217bdde"
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
        if(sourceBillTypeCode){
            instance= pubActionscriptService.runChangeScript(sourceBillTypeCode,billTypeCode,[data:keys.split(','),'businessKey':businessKey])
        }else {
             instance= new IcSpecial(params)

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
        [icSpecialInstance: instance,pageId:_pageId]
    }



    def save(){
        JSONObject head = JSON.parse( URLDecoder.decode(params.head,'utf-8'))



        def bodys = JSON.parse( URLDecoder.decode(params.bodys,'utf-8'))


        IcSpecial icSpecialInstance

        if(head.id){//update
            icSpecialInstance=IcSpecial.get(head.id)
            bindData(icSpecialInstance,head)


        }else{//save
            icSpecialInstance=new IcSpecial(head)
        }

//
        if (!icSpecialInstance.validate()) {
            def _errors=[]
            g.eachError(bean: icSpecialInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }


            def json=[validateerrors:_errors]

            render json as JSON
            return
        }





        if(bodys == null){
            throw new BusinessException('表体数据不能为空!')
        }


        // def _bodys=[]
        def _delKey=[]
        int row=0
        bodys?.each {

            if(it.isDeleted){
                _delKey<<it.id
            }else{
                def body =  icSpecialInstance.findOrCreateById(it.id)
                bindData(body,it)
                row++
                if(!body.validate()){

                    log.debug body.errors
                    def msg=""
                    g.eachError(bean: body){

                        msg += g.message(error: it)
                        msg +=  ';'
                    }

                    throw new BusinessException('行：'+row+','+msg)



                }
                if(!body.id){
                    icSpecialInstance.addToBodys(body);
                }

            }



        }

        icSpecialService.save(icSpecialInstance,_delKey)

        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'icSpecial.label', default: 'IcSpecial'), icSpecialInstance.billno])
        render data as JSON
    }


    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def icSpecialInstance = IcSpecial.get(id)
        if (!icSpecialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'icSpecial.label', default: 'IcSpecial'), id])
            redirect(action: "list")
            return
        }

        [icSpecialInstance: icSpecialInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def icSpecialInstance = IcSpecial.get(id)
        if (!icSpecialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'icSpecial.label', default: 'IcSpecial'), id])

        }

        [icSpecialInstance: icSpecialInstance,pageId:_pageId]
    }




    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def icSpecialInstance = IcSpecial.get(id)
        if (!icSpecialInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        icSpecialInstance.delete(flush: true)
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

        def icSpecialInstanceLs
        def icSpecialInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse(params.queryParams,'utf-8')

            CriteriaHelper ch = new CriteriaHelper(IcSpecial.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(IcSpecial.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            icSpecialInstanceTotal = cc.count()
            icSpecialInstanceLs = ch.list(params,"billno",'desc') //TODO


//            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
//            icSpecialInstanceTotal = query.countQuery.count()
//
//            icSpecialInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO

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




            CriteriaHelper ch = new CriteriaHelper(IcSpecial.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(IcSpecial.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            icSpecialInstanceTotal = cc.count()

            icSpecialInstanceLs = ch.list(params,"billno",'desc')//TODO

        }else if (params.id){
            def icSpecialInstanceInstance= IcSpecial.get(params.id)
            def json= [rows: [icSpecialInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(IcSpecial.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(IcSpecial.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            icSpecialInstanceTotal = cc.count()

            icSpecialInstanceLs = ch.list(params,"billno",'desc')//TODO

            //def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
//            icSpecialInstanceTotal = query.countQuery.count()
//
//            icSpecialInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }





        def data = []
        icSpecialInstanceLs?.each {
            data << it.part([defaultPart:true])
        }

        def json= [rows: data, total: icSpecialInstanceTotal]
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
        def instance = IcSpecial.get(id)
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
        def instance = IcSpecial.get(id)
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
