package com.app.so.order




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.so.rec.SoRec
import com.app.util.CriteriaHelper
import grails.converters.JSON
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import javax.servlet.ServletOutputStream

import static java.util.UUID.randomUUID
class SoSaleController {

    def static _pageId='SoSale'
    def static ref_pageId='SoSaleRef'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def soSaleService
    def billtypecode='S01'
    def uploadOrderToNCService
    def tmTempletService

    def index() {

        [pageId:_pageId,functionId:params.id]
    }



    /**
     * 进入添加页面
     * @return
     */
    def create(String keys,String businessKey,String sourceBillTypeCode) {

        def key= keys?.split(',')
        SoSale instance

        if(sourceBillTypeCode)
            instance= pubActionscriptService.runChangeScript(sourceBillTypeCode,billtypecode,[data:key,'businessKey':businessKey])
        else
            instance= new SoSale(params)
        def dt = [data:instance?.bodys]
        def data = pubActionscriptService.runScript(billtypecode,'create',dt,1,null)

        if(businessKey){
            instance.businessType=PubBusinessType.get(businessKey);

        }

        if(sourceBillTypeCode){
            instance.sourceBillTypeCode=sourceBillTypeCode
            instance.sourceBillType=PubBilltype.findByBilltypecode(sourceBillTypeCode)
        }
        instance.billTypeCode=billtypecode
        instance.billtype=PubBilltype.findByBilltypecode(billtypecode)
        instance.ndiscountrate=100
        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)
        instance.maker=springSecurityService.currentUser
        instance.makeDate=new Date()
        instance.billdate=new Date()


        [soSaleInstance: instance,pageId:_pageId,bodys:data]
    }


    def sk(String businessKey){
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


        SoSale soSaleInstance

        if(head.id){//update
            soSaleInstance=SoSale.get(head.id)
            bindData(soSaleInstance,head)


        }else{//save
            soSaleInstance=new SoSale(head)
        }

//
        if (!soSaleInstance.validate()) {
            def _errors=[]
            g.eachError(bean: soSaleInstance){
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
            def body =  SoSaleOrder.findOrCreateById(it.id)
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
                    soSaleInstance.addToBodys(body);
                }

            }



        }

        soSaleService.save(soSaleInstance,_delKey)




        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'soSale.label', default: 'SoSale'), soSaleInstance.billno])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def soSaleInstance = SoSale.get(id)
        if (!soSaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'soSale.label', default: 'SoSale'), id])

            return
        }

        [soSaleInstance: soSaleInstance,pageId:_pageId]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def soSaleInstance = SoSale.get(id)
        if (!soSaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'soSale.label', default: 'SoSale'), id])

        }

        [soSaleInstance: soSaleInstance,pageId:_pageId]
    }



    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        soSaleService.delete(id)

        def rt = [remoteMessage:'删除成功！']
        render rt as JSON

    }

    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId])
    }

    /**
     * 查询
     * @return
     */
    def query(){
        println params
        def soSaleInstanceLs
        def soSaleInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))
            println URLDecoder.decode(params.queryParams,'utf-8')
            CriteriaHelper ch = new CriteriaHelper(SoSale.createCriteria(),json)

            def cc=new CriteriaHelper(SoSale.createCriteria(),json)



            def query= pubActionscriptService.runScript(billtypecode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)

            soSaleInstanceTotal = query.countQuery.count()
            soSaleInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }else if (params.id){
            def soSaleInstanceInstance= SoSale.get(params.id)
            def json= [rows: [soSaleInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(SoSale.createCriteria())

            def cc=new CriteriaHelper(SoSale.createCriteria())
            def query= pubActionscriptService.runScript('S01','query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)

            soSaleInstanceTotal = query.countQuery.count()
            soSaleInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }





       def data= pubActionscriptService.runScript(billtypecode,'query',[data:soSaleInstanceLs],1,null)
        def json= [rows: data, total: soSaleInstanceTotal]
        render json as JSON
    }

    def queryBody(String headId,String targetBill){


        def  c= new CriteriaHelper(SoSaleOrder.createCriteria())
        def bodys= pubActionscriptService.runScript('S01','queryBody',[criteria:c,'headId':headId,'targetBill':targetBill],0,null)

        def data=[data:bodys]
        def rt= pubActionscriptService.runScript('S01','queryBody',data,1,null)


        def json= [rows: rt]

        render json as JSON


    }

    def refPage(String businessKey){
        println params
        [pageId:ref_pageId,targetBill:params.targetBill,handler:params.handler,businessKey:businessKey]
    }

    def print(){


         def json=JSON.parse( params.data)


        def bc= SoSale.load(json.queryParams.id)
        try{

            JasperPrint jasperPrint = tmTempletService.fillTemplet(json.templet,[:], new JRBeanCollectionDataSource([bc]));

            response.setContentType("application/octet-stream");

            ServletOutputStream ouputStream = response.getOutputStream();

            ObjectOutputStream oos = new ObjectOutputStream(ouputStream);
            oos.writeObject(jasperPrint);
            oos.flush();
            oos.close();

            ouputStream.flush();
            ouputStream.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }


    def check(String id){
        soSaleService.check(id)
        def rt=[remoteMessage:'审核成功！']
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id){
        soSaleService.uncheck(id)
        def rt = [remoteMessage:'弃审成功！']
        render rt as JSON
    }

    /**
     * 单条上传
     */
    def up(String id){
        uploadOrderToNCService.doUpload(id)
        def rt = [remoteMessage:'上传工作完成！']
        render rt as JSON
    }

    /**
     * 批量上传
     */
    def ups(){
        uploadOrderToNCService.doUploads(springSecurityService.authentication.loginCorp)
        def rt = [remoteMessage:'上传工作完成！']
        render rt as JSON
    }

}
