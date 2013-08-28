package com.app.ic.transfer

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.ic.special.IcSpecial
import com.app.ic.special.IcSpecialB
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import grails.web.JSONBuilder
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

class IcTransferController {
    //注册pageId   UUID 去除“-”

    def billTypeCode='I6'
    def  _pageId=billTypeCode?:"I6"
    def  ref_pageId=_pageId+'Ref'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def icSpecialService
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
                def body =  IcSpecialB.findOrCreateById(it.id)
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

        [icSpecialInstance: icSpecialInstance,pageId:_pageId]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def icSpecialInstance = IcSpecial.get(id)

        if (icSpecialInstance.checker)
            throw new BusinessException('单据已经审核,不能修改！')

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
       icSpecialService.delete(id)
        def rt=[remoteMessage:'删除成功！']
        render rt as JSON

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



            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
            icSpecialInstanceTotal = query.countQuery.count()

            icSpecialInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO

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


            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
            icSpecialInstanceTotal = query.countQuery.count()

            icSpecialInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
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
    def queryBody(String headId,String targetBill){


        // def bodys = YxhjhdB.findAllWhere(['head.id':headId])
        def dt= pubActionscriptService.runScript(billTypeCode,'queryBody',[headId:headId,criteria:new CriteriaHelper(IcSpecialB.createCriteria()),targetBill:targetBill],0,null)
        def data=[data:dt]
        def rt= pubActionscriptService.runScript(billTypeCode,'queryBody',data,1,null)
        def json= [rows: rt]
        render json as JSON
    }

    def refPage(String businessKey){
        params.page_id=ref_pageId
        params.billTypeCode=billTypeCode
        return params
    }

    def check(String id){
       icSpecialService.check(id)
        def rt=[remoteMessage:'审核成功！']
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id){
        icSpecialService.uncheck(id)
        def rt = [remoteMessage:'弃审成功！']
        render rt as JSON
    }

    def outPage(String headId){

        def head = IcSpecial.get(headId) //TODO

        if (!head.checker)
            throw new BusinessException('单据未审核,不能出库！')


         def bodys = IcSpecialB.findAllWhere(['head.id':headId])

        def data=[]
        bodys?.each {
           def row= it.part(defaultPart: true);
            row.outastnum=row.outastnum?:0
            row.outnum=row.outnum?:0
            data<< row;
        }

       render(view:'outWindow' ,model: [data:data,pageId: _pageId])


    }

    def inPage(String headId){

        def head = IcSpecial.get(headId) //TODO

        if (!head.checker)
            throw new BusinessException('单据未审核,不能出库！')


        def bodys = IcSpecialB.findAllWhere(['head.id':headId])

        def data=[]
        bodys?.each {

            def row= it.part(defaultPart: true);
            row.inastnum=row.inastnum?:0

            row.innum=row.innum?:0
            data<< row;
        }

        render(view:'inWindow' ,model: [data:data,pageId: _pageId])


    }


    def outHouse(){
       icSpecialService.out(JSON.parse(params.data))
        def rt=[remoteMessage:'完成成功！']
        render rt as JSON
    }

    def inHouse(){
        icSpecialService.inHouse(JSON.parse(params.data))
        def rt=[remoteMessage:'完成成功！']
        render rt as JSON
    }

}
