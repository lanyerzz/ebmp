package com.app.ywms.ck.zmtd

import com.app.bd.corp.BdCorp
import com.app.bd.cumandoc.BdCumandoc
import com.app.pub.businesstype.PubBusinessType
import com.app.ywms.kc.Ycrkmx



import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YzmtdhController {
    //注册pageId   UUID 去除“-”
    def billTypeCode='Yzmtdh'
    def static _pageId='Yzmtdh'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def yzmtdService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [yzmtdhInstanceList: Yzmtdh.list(params), yzmtdhInstanceTotal: Yzmtdh.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String businessKey) {
       def instance= new Yzmtdh(params)
        if(businessKey){
            instance.businessType=PubBusinessType.get(businessKey);

        }
        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)
       // println instance.bdCorp.unitName
        instance.maker=springSecurityService.currentUser
        instance.makeDate=new Date()
        instance.billdate=new Date()

        [yzmtdhInstance: instance,pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {

        JSONObject head = JSON.parse( params.head)



        def bodys = JSON.parse( params.bodys)



        def yzmtdhInstance

        if(head.id){//update
            yzmtdhInstance=Yzmtdh.get(head.id)
            bindData(yzmtdhInstance,head)


        }else{//save
            yzmtdhInstance=new Yzmtdh(head)
        }

//
        if (!yzmtdhInstance.validate()) {
            def _errors=[]
            g.eachError(bean: yzmtdhInstance){
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


        def _bodys=[]

        int row=0
        bodys?.each {
            def body = new Yzmtdb(it)
//            bindData(body,it)
            row++
            if(!body.validate()){

                log.debug body.errors
                def msg
                g.eachError(bean: body){

                    msg << g.message(error: it) << ';'

                }

                throw new BusinessException('行：'+row+','+msg)



            }
            _bodys<< body
        }

        yzmtdService.save(yzmtdhInstance,_bodys)


       def data=[:]

        render ([remoteMessage : message(code: 'default.created.message', args: [message(code: 'yzmtdh.label', default: 'Yzmtdh'), yzmtdhInstance.billno])] as JSON)


    }



    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def yzmtdhInstance = Yzmtdh.get(id)
        if (!yzmtdhInstance) {

            render ([remoteMessage : message(code: 'default.not.found.message', args: [message(code: 'yzmtdh.label', default: 'Yzmtdh'), id])] as JSON)

            return;
        }

        [yzmtdhInstance: yzmtdhInstance,pageId:_pageId]
    }

    def show(String id) {
        def yzmtdhInstance = Yzmtdh.get(id)
        if (!yzmtdhInstance) {

            render ([remoteMessage :message(code: 'default.not.found.message', args: [message(code: 'yzmtdh.label', default: 'Yzmtdh'), id])] as JSON)

            return;
        }

        [yzmtdhInstance: yzmtdhInstance,pageId:_pageId]
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {


        yzmtdService.delete(id)
        render ([remoteMessage: '删除成功!'] as JSON)

    }
    def createDistribute(String hz,String hw,String headId){
        if(headId){
            def head=Yzmtdh.get(headId)
            yzmtdService.deleteMx(head)
        }
        def data= Ycrkmx.executeQuery('from Ycrkmx where crklx=0 and invmandoc.id=? and hz.id=? and (fxsl-lockNum-hxsl)>0',[hw,hz])


        def json=pubActionscriptService.runScript('YZMTD','queryCanDistribute',[data:data],1,null)


        render view: 'distribute',model: [data:json ,pageId: _pageId,custname:BdCumandoc.get(hz)?.pkCubasdoc?.custname]
    }
    def createQuery(){

        render(view: 'query',model:  [pageId:_pageId])
    }

    /**
     * 查询
     * @return
     */
    def query(){

        def yzmtdhInstanceLs
        def yzmtdhInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(Yzmtdh.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(Yzmtdh.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            yzmtdhInstanceTotal = cc.count()

            yzmtdhInstanceLs = ch.list(params,"billno",'desc') //TODO
        }else if (params.id){
            def yzmtdhInstanceInstance= Yzmtdh.get(params.id)
            def json= [rows: [yzmtdhInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(Yzmtdh.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(Yzmtdh.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            yzmtdhInstanceTotal = cc.count()

            yzmtdhInstanceLs = ch.list(params,"billno",'desc')//TODO
        }



        def dt=pubActionscriptService.runScript('YZMTD','query',[data:yzmtdhInstanceLs],1,null)

        def json= [rows: dt, total: yzmtdhInstanceTotal]
        render json as JSON
    }






    def queryBody(String id){
     def data=   Yzmtdb.executeQuery('from Yzmtdb where head.id=?',[id])

     def rt= pubActionscriptService.runScript('YZMTD','queryBody',[data:data],1,null)

     render  ([rows:rt] as JSON)
    }


    def check(String id){
        yzmtdService.check(id)
        render ([remoteMessage: '审核成功！'] as JSON)
    }


    def uncheck(String id){
        yzmtdService.uncheck(id)
        render ([remoteMessage: '弃审成功！'] as JSON)

    }

}
