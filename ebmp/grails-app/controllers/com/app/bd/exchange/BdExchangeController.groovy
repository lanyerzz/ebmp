package com.app.bd.exchange




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class BdExchangeController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdExchange'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def bdExchangeService
    def index() {
        [pageId:_pageId]
    }


    /**
     * 进入添加页面
     * @return
     */
    def create(String businessKey) {
        def instance= new BdExchange(params)
        if(businessKey){
            instance.businessType=PubBusinessType.get(businessKey);

        }
        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)

        [bdExchangeInstance: instance,pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {


        BdExchange bdExchangeInstance

        JSONObject head = JSON.parse( URLDecoder.decode(params.head,'utf-8'))

        def bodys = JSON.parse( URLDecoder.decode(params.bodys,'utf-8'))



        if(head.id){//update
            bdExchangeInstance=  BdExchange.get(head.id)
        }else{
            bdExchangeInstance=new BdExchange(head)

            //检查是否有重复方案

           def count= BdExchange.countByCurrtypeOneAndCurrtypeTwoAndYearAndMonth(bdExchangeInstance.currtypeOne,bdExchangeInstance.currtypeTwo,bdExchangeInstance.year,bdExchangeInstance.month)
            if(count){
                throw new BusinessException("${bdExchangeInstance.month}月汇率方案已经存在！");
            }
        }



        if(!bodys){
            throw new BusinessException('表体不能为空！')
        }

        if (!bdExchangeInstance.validate()) {
            def _errors=[]
            g.eachError(bean: bdExchangeInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }
        def _bodyerrors=[]
        int row=0
        bodys?.each {

            def body
            if(it.id){
                body=   BdExchangeB.findOrCreateById(it.id)
            }else{

                body=new BdExchangeB(it)
              bindData(body,it)
            }

           if( !body.validate()){

                println body.errors
               def _errors=[]
               g.eachError(bean: bdExchangeInstance){
                   println message:g.message(error: it)
                   log.error(message:g.message(error: it))
                   _errors << [ field:it.field,  message:g.message(error: it)]

               }

               _bodyerrors<< [rowno:row,errors:_errors]
           }

            bdExchangeInstance.addToBody(body);
            row++
        }

        if(_bodyerrors)
        {
            def json=[body_validateerrors:_bodyerrors]
            render json as JSON
            return
        }

        bdExchangeInstance.save()

        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdExchange.label', default: 'BdExchange'), bdExchangeInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdExchangeInstance = BdExchange.get(id)
        if (!bdExchangeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdExchange.label', default: 'BdExchange'), id])
            redirect(action: "list")
            return
        }

        [bdExchangeInstance: bdExchangeInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdExchangeInstance = BdExchange.get(id)
        if (!bdExchangeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdExchange.label', default: 'BdExchange'), id])

        }

        [bdExchangeInstance: bdExchangeInstance,pageId:_pageId]
    }




    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdExchangeInstance = BdExchange.get(id)
        if (!bdExchangeInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdExchangeInstance.delete(flush: true)
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

        def bdExchangeInstanceLs
        def bdExchangeInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdExchange.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdExchange.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdExchangeInstanceTotal = cc.count()

            bdExchangeInstanceLs = ch.list(params,"year,month") //TODO
        }else if (params.q!=null){//TODO 需要修改JSON中的字段
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'field1','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'field2','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdExchange.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdExchange.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdExchangeInstanceTotal = cc.count()

            bdExchangeInstanceLs = ch.list(params,"year,month")//TODO

        }else if (params.id){
            def bdExchangeInstanceInstance= BdExchange.get(params.id)
            def json= [rows: [bdExchangeInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdExchange.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdExchange.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdExchangeInstanceTotal = cc.count()

            bdExchangeInstanceLs = ch.list(params,"year,month")//TODO
        }





        def data = []
        bdExchangeInstanceLs?.each {
            data << it.part([defaultPart:true])
        }

        def json= [rows: data, total: bdExchangeInstanceTotal]
        render json as JSON
    }

    def queryBody(String id){
      def bodys=  BdExchangeB.executeQuery("from BdExchangeB where head.id=? order by day",[id])
        def rt=[rows:bodys]
        render rt as JSON
    }

    def getExchage(String currtypeId,Date date){
        def rt= bdExchangeService.getTaxrate(currtypeId,date)
        render rt
    }

    def getExchage2(String from,String to,Date date){
        def rt= bdExchangeService.getTaxrate(from,to,date)
        render rt
    }

}
