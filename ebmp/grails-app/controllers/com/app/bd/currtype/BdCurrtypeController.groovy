package com.app.bd.currtype

import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource

import javax.servlet.ServletOutputStream;

import static java.util.UUID.randomUUID

class BdCurrtypeController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdCurrtype'
    def tmTempletService
    def springSecurityService
//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {

        [pageId:_pageId,functionId:params.id]
    }
    def query(){

        def datas
        def count
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdCurrtype.createCriteria(),json)
            count = new CriteriaHelper(BdCurrtype.createCriteria(),json).count()

            datas = ch.list(params,"currtypecode")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'currtypecode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'currtypename','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdCurrtype.createCriteria(),json)
            count = new CriteriaHelper(BdCurrtype.createCriteria(),json).count()

            datas = ch.list(params,"currtypecode")

        }else if (params.id){
           def currtype= BdCurrtype.get(params.id)
            def json= [rows: [currtype], total: BdCurrtype.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdCurrtype.createCriteria())
            count = new CriteriaHelper(BdCurrtype.createCriteria()).count()

            datas = ch.list(params,"currtypecode")
        }





        def data = []
        datas?.each {
            data << it.part()
        }

        def json= [rows: data, total: count]
        render json as JSON
    }


    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdCurrtypeInstanceList: BdCurrtype.list(params), bdCurrtypeInstanceTotal: BdCurrtype.count()]
    }

    def create() {
        [bdCurrtypeInstance: new BdCurrtype(params),pageId:_pageId]
    }

    def save() {
        println params
        def bdCurrtypeInstance = new BdCurrtype(params)
        if (!bdCurrtypeInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean:bdCurrtypeInstance){
                _errors << [field:it.field,message:g.message(error:it)]
            }
            def json = [validateerrors:_errors]
            render json as JSON
            return
        }
        Map row = bdCurrtypeInstance.part()
        render row as JSON;

    }

    def show(String id) {
        render(view:'index',model: [bdCurrtypeInstance:BdCurrtype.get(params.id),pageId:_pageId])
    }

    def edit(String id) {
        if (id){
            def bdCurrtypeInstance = BdCurrtype.get(id)
            if (!bdCurrtypeInstance) {
                def json = [errors:g.message(code:'default.not.found.message',default: '项目未找到!')]
                render json as JSON
            }

            [bdCurrtypeInstance: bdCurrtypeInstance,pageId:_pageId]
        }

    }

    def update(String id, Long version) {
        println params;
        def bdCurrtypeInstance = BdCurrtype.get(id)
        if (!bdCurrtypeInstance) {
            throw new BusinessException(code: 'default.not.found.message', args: [message(code: 'bdCurrtype.label', default: 'BdCurrtype'), id])

        }

        if (version != null) {
            if (bdCurrtypeInstance.version > version) {
                def msg = message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdCurrtype.label', default: 'BdCurrtype')] as Object[],
                          "Another user has updated this BdCurrtype while you were editing")
                throw new BusinessException(msg)
            }
        }

        bdCurrtypeInstance.properties = params

        if (!bdCurrtypeInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean:bdCurrtypeInstance){
                _errors << [ field:it.field,  message:g.message(error: it)]
            }
            def json = [validateerrors:_errors]
            render json as JSON
        }

        def message = message(code: 'default.updated.message', args: [message(code: 'bdCurrtype.label', default: 'BdCurrtype'), bdCurrtypeInstance.id])
        Map row = bdCurrtypeInstance.part()
        row.flash_message = message;
        render row as JSON
    }

    def delete(String id) {
        def bdCurrtypeInstance = BdCurrtype.load(id)
        if (!bdCurrtypeInstance){
            throw new BusinessException('default.not.found.message','要删除的数据未找到');
        }
        bdCurrtypeInstance.delete(flush: true)
        render id
    }
//    def printForm(){
//       [pageId:_pageId]
//
//    }

//    def queryPrintTemplet(){
//        println "~~~~~"+params.id
//        def tids= tmTempletService.queryPrintTemplet(params.id, springSecurityService.currentUser)
//        def data=[]
//        tids?.each {
//            data << it.tmTemplet.part(include:['id'])
//        }
//        println "~~~"+data
//        def datas = [data:data,sessionid:request.session.getId()]
//        render datas as JSON
//    }
//
//    def print(){
//    println params
//        def json=JSON.parse(params.data)
//
//        def templet=json.templet
//        println templet
//        def bc= BdCurrtype.load(json.queryParams.id)
//        try{
//
//
//
//
//
//            JasperPrint jasperPrint = tmTempletService.fillTemplet(servletContext.getRealPath(""),templet,[:], new JRBeanCollectionDataSource([bc]));
//
//            response.setContentType("application/octet-stream");
//
//            ServletOutputStream ouputStream = response.getOutputStream();
//
//            ObjectOutputStream oos = new ObjectOutputStream(ouputStream);
//            oos.writeObject(jasperPrint);
//            oos.flush();
//            oos.close();
//
//            ouputStream.flush();
//            ouputStream.close();
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//    }
}
