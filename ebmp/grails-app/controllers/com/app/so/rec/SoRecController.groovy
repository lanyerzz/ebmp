package com.app.so.rec




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.so.order.SoSale
import com.app.util.CriteriaHelper
import com.app.ywms.rk.xhjhd.YxhjhdB
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class SoRecController {
    //注册pageId   UUID 去除“-”
    def static _pageId='SoRec'
    def static ref_pageId='SoRecRef'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def soRecService
    def pubActionscriptService
    def uploadSKToNCService
    def uploadSKZKToNCService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [soRecInstanceList: SoRec.list(params), soRecInstanceTotal: SoRec.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String businessKey) {

        def instance= new SoRec(params)
        if(businessKey){
            instance.businessType=PubBusinessType.get(businessKey);
            println instance.businessType

        }
        instance.sourceBill=SoSale.get(params.keys)
        instance.billtype=PubBilltype.findByBilltypecode('S02')

        instance.billTypeCode='S02'
        instance.billdate=new Date()
        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)
        instance.maker=springSecurityService.currentUser
        instance.makeDate=new Date()
        [soRecInstance: instance,pageId:_pageId]
    }



/**
 * 保存
 * @return
 */
    def save() {
        JSONObject head = JSON.parse( URLDecoder.decode(params.head,'utf-8'))



        def bodys = JSON.parse( URLDecoder.decode(params.bodys,'utf-8'))


        SoRec soRecInstance

        if(head.id){//update
            soRecInstance=SoRec.get(head.id)


            bindData(soRecInstance,head)


        }else{//save
            soRecInstance=new SoRec(head)
        }

//
        if (!soRecInstance.validate()) {
            def _errors=[]
            g.eachError(bean: soRecInstance){
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
                def body =  SoRecBody.findOrCreateById(it.id)
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
                    soRecInstance.addToBodys(body);
                }

            }



        }

        soRecService.save(soRecInstance,_delKey)
        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'soRec.label', default: 'SoRec'), soRecInstance.billno])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def soRecInstance = SoRec.get(id)
        if (!soRecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'soRec.label', default: 'SoRec'), id])
            redirect(action: "list")
            return
        }

        [soRecInstance: soRecInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def soRecInstance = SoRec.get(id)
        if (!soRecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'soRec.label', default: 'SoRec'), id])

        }

        [soRecInstance: soRecInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def soRecInstance = SoRec.get(id)
        if (!soRecInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'soRec.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (soRecInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'soRec.label', default: 'SoRec')] as Object[],
                        "Another user has updated this SoRec while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        soRecInstance.properties = params

        if (!soRecInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: soRecInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'soRec.label', default: 'SoRec'), soRecInstance.id])
        def data= soRecInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {

        soRecService.delete(id)


        def data=[:]
        data.remoteMessage=message(code: 'default.delete.message', args: [message(code: 'soRec.label', default: 'SoRec'), id])
        render data
    }

    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId])
    }

    /**
     * 查询
     * @return
     */
    def query(){

        def soRecInstanceLs
        def soRecInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(SoRec.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(SoRec.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            soRecInstanceTotal = cc.count()

            soRecInstanceLs = ch.list(params,"billno") //TODO
        }else if (params.id){
            def soRecInstanceInstance= SoRec.get(params.id)
            def json= [rows: [soRecInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(SoRec.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(SoRec.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            soRecInstanceTotal = cc.count()

            soRecInstanceLs = ch.list(params,"billno")//TODO
        }





        def data = []
        soRecInstanceLs?.each {
            data << it.part([defaultPart:true])
        }

        def json= [rows: data, total: soRecInstanceTotal]
        render json as JSON
    }


    /**
     * 子表查询
     */
    def queryBody(String headId,String targetBill){
        println params

        def bodys = SoRecBody.findAllWhere(['head.id':headId])
        def dt= pubActionscriptService.runScript('S02','queryBody',[headId:headId,criteria:new CriteriaHelper(SoRecBody.createCriteria()),targetBill:targetBill],0,null)
        println dt
        def data=[data:dt]
        def rt= pubActionscriptService.runScript('S02','queryBody',data,1,null)
        println rt
        def json= [rows: rt]
        render json as JSON
    }

    def refPage(String businessKey,String targetBill){
        [pageId:ref_pageId,handler:params.handler,'businessKey':businessKey,targetBill:targetBill]
    }

    def check(String id){
        soRecService.check(id)
        def rt=[remoteMessage:'审核成功！']
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id){
        soRecService.uncheck(id)
        def rt = [remoteMessage:'弃审成功！']
        render rt as JSON
    }

    def up(String id){
        uploadSKToNCService.doUpload(id)

        def rt = [remoteMessage:'上传成功！']
        render rt as JSON
    }

    def ups(){
        uploadSKToNCService.doUploads(springSecurityService.authentication.loginCorp)

        def rt = [remoteMessage:'上传成功！']
        render rt as JSON
    }

    def upZK(String id){
        uploadSKZKToNCService.doUpload(id)

        def rt = [remoteMessage:'上传成功！']
        render rt as JSON
    }

    def upsZK(){
        uploadSKZKToNCService.doUploads(springSecurityService.authentication.loginCorp)

        def rt = [remoteMessage:'上传成功！']
        render rt as JSON
    }

}
