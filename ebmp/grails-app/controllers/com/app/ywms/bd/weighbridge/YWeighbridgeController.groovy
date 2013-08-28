package com.app.ywms.bd.weighbridge




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YWeighbridgeController {
    //注册pageId   UUID 去除“-”
    def static _pageId='YWeighbridge'
    def static ref_pageId='YWeighbridgeRef'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }



    /**
     * 进入添加页面
     * @return
     */
    def create(String businessKey) {
        def instance= new YWeighbridge(params)

        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)

        [YWeighbridgeInstance: instance,pageId:_pageId]
    }



    def save(){







        YWeighbridge YWeighbridgeInstance

        if(params.id){//update
            YWeighbridgeInstance=YWeighbridge.get(params.id)
            bindData(YWeighbridgeInstance,params)


        }else{//save
            YWeighbridgeInstance=new YWeighbridge(params)
        }

//
        if (!YWeighbridgeInstance.validate()) {
            def _errors=[]
            g.eachError(bean: YWeighbridgeInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }


            def json=[validateerrors:_errors]

            render json as JSON
            return
        }





        YWeighbridgeInstance.save()
        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'YWeighbridge.label', default: 'YWeighbridge'), YWeighbridgeInstance.id])
        render data as JSON
    }


    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def YWeighbridgeInstance = YWeighbridge.get(id)
        if (!YWeighbridgeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'YWeighbridge.label', default: 'YWeighbridge'), id])
            redirect(action: "list")
            return
        }

        [YWeighbridgeInstance: YWeighbridgeInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def YWeighbridgeInstance = YWeighbridge.get(id)
        if (!YWeighbridgeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'YWeighbridge.label', default: 'YWeighbridge'), id])

        }

        [YWeighbridgeInstance: YWeighbridgeInstance,pageId:_pageId]
    }



    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def YWeighbridgeInstance = YWeighbridge.get(id)
        if (!YWeighbridgeInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        YWeighbridgeInstance.delete(flush: true)
        render id

    }


    /**
     * 查询
     * @return
     */
    def query(){

        def YWeighbridgeInstanceLs
        def YWeighbridgeInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(YWeighbridge.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(YWeighbridge.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            YWeighbridgeInstanceTotal = cc.count()

            YWeighbridgeInstanceLs = ch.list(params,"code") //TODO
        }else if (params.q!=null){//TODO 需要修改JSON中的字段
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'field1','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'field2','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(YWeighbridge.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(YWeighbridge.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            YWeighbridgeInstanceTotal = cc.count()

            YWeighbridgeInstanceLs = ch.list(params,"code")//TODO

        }else if (params.id){
            def YWeighbridgeInstanceInstance= YWeighbridge.get(params.id)
            def json= [rows: [YWeighbridgeInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(YWeighbridge.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(YWeighbridge.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            YWeighbridgeInstanceTotal = cc.count()

            YWeighbridgeInstanceLs = ch.list(params,"code")//TODO
        }





        def data = []
        YWeighbridgeInstanceLs?.each {
            data << it.part([defaultPart:true])
        }

        def json= [rows: data, total: YWeighbridgeInstanceTotal]
        render json as JSON
    }



}
