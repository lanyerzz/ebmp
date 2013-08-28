package com.app.ywms.rk.hyjh

import com.app.bd.corp.BdCorp
import com.app.pub.businesstype.PubBusinessType
import com.app.sm.user.SmUser
import org.codehaus.groovy.grails.web.json.JSONObject
import org.grails.datastore.mapping.query.api.Criteria
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YhyjhController {

    //注册pageId   UUID 去除“-”
    def static _pageId='Yhyjh'
    def billTypeCode='YHYJH'
    def static ref_pageId='YhyjhRef'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def yhyjhService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [yhyjhInstanceList: Yhyjh.list(params), yhyjhInstanceTotal: Yhyjh.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String businessKey) {

        def pkCorp = springSecurityService.authentication.loginCorp

        def corp = BdCorp.get(pkCorp)
        def yhyjhInstance = new Yhyjh();
        def businessType= PubBusinessType.get(businessKey)
        yhyjhInstance.businessCode=businessType.code
        yhyjhInstance.businessType=businessType
        yhyjhInstance.maker=springSecurityService.currentUser
        yhyjhInstance.billdate=new Date()
        yhyjhInstance.makeDate=new Date()
        yhyjhInstance.bdCorp = corp
        [yhyjhInstance: yhyjhInstance,pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        println params
        def yhyjhInstance = null;
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        JSONObject head = JSON.parse( URLDecoder.decode(params.head,'utf-8'))

        def bodys = JSON.parse( URLDecoder.decode(params.body,'utf-8'))
        if (head.id){
            yhyjhInstance = Yhyjh.get(head.id)

            if (yhyjhInstance.checker!=null){
                throw new BusinessException( '单据已经是审核状态,不能修改！')
            }
            bindData(yhyjhInstance,head)
        }else{
            yhyjhInstance = new Yhyjh(head)
            yhyjhInstance.bdCorp = corp
        }

        if(bodys == null){
            throw new BusinessException('表体数据不能为空')
        }

        def keys=[]
        if(yhyjhInstance.bodys){
            yhyjhInstance.bodys.each { keys << it.id }
        }

        bodys?.each {

            def _id=it.id?:'none'
            def body = YhyjhB.findOrCreateById(_id)

            keys.remove(body.id)

            bindData(body,it)
         if(!body.validate()){

                log.debug body.errors
            }
            yhyjhInstance.addToBodys(body)
        }

        if(!yhyjhInstance.validate()){
            def _errors=""
            g.eachError(bean: yhyjhInstance){

                _errors +=   g.message(error: it)
            }

            def json=[remoteErrors: _errors]

            render json as JSON
            return
        }
        yhyjhService.save(yhyjhInstance,keys)
        def rt=pubActionscriptService.runScript('YHYJH','query',[data: yhyjhInstance],servletContext.getRealPath(""),1,null)
        def json=[rows: rt]
        //def data=yhyjhInstance.part()
        json.remoteMessage = message(code: 'default.created.message', args: [message(code: 'yhyjh.label', default: 'Yhyjh'), yhyjhInstance.id])


        render json as JSON


    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def yhyjhInstance = Yhyjh.get(id)
        if (!yhyjhInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yhyjh.label', default: 'Yhyjh'), id])
            redirect(action: "list")
            return
        }

        [yhyjhInstance: yhyjhInstance,pageId:_pageId]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def yhyjhInstance = Yhyjh.get(id)

        if(yhyjhInstance.checker)
            throw new BusinessException('单据已经审核,不允许修改!')

        if (!yhyjhInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yhyjh.label', default: 'Yhyjh'), id])

        }

        [yhyjhInstance: yhyjhInstance,pageId:_pageId]
    }




    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def yhyjhInstance = Yhyjh.get(id)
        if (!yhyjhInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        if (yhyjhInstance.checker!=null){
            throw new BusinessException( '单据已经是审核状态,不能删除！')

        }
        yhyjhInstance.delete(flush: true)
        render id

    }

    def createQuery(){
        if (params.refQuery=='true')
            render(view: 'query',model:  [pageId:ref_pageId])
        else
            render(view: 'query',model:  [pageId:_pageId])
    }




    /**
     * 查询
     * @return
     */
    def query(){



        def yhyjhInstanceLs
        def yhyjhInstanceTotal
        def corp = springSecurityService.authentication.loginCorp


        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(Yhyjh.createCriteria(),json)

            def cc=new CriteriaHelper(Yhyjh.createCriteria(),json)


            def query= pubActionscriptService.runScript('YHYJH','query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser(),params:params],0,null)



            yhyjhInstanceTotal = query.countQuery.count()

            yhyjhInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }else if (params.id){
            def yhyjhInstanceInstance= Yhyjh.get(params.id)
            yhyjhInstanceLs=[yhyjhInstanceInstance]
            yhyjhInstanceTotal=1
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(Yhyjh.createCriteria())

            def cc=new CriteriaHelper(Yhyjh.createCriteria())


            def query= pubActionscriptService.runScript('YHYJH','query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser(),params:params],0,null)

            yhyjhInstanceTotal = query.countQuery.count()

           yhyjhInstanceLs = query.listQuery.list(params,"billno",'desc')//TODO
        }


        def rt= pubActionscriptService.runScript('YHYJH','query',[data:yhyjhInstanceLs],1,null)


        def json= [rows: rt, total: yhyjhInstanceTotal]
        render json as JSON
    }


    def queryBody(String headId,String targetBill){
        def  c= new CriteriaHelper(YhyjhB.createCriteria())
      def bodys= pubActionscriptService.runScript('YHYJH','queryBody',[criteria:c,'headId':headId,'targetBill':targetBill],servletContext.getRealPath(""),0,null)

      def data=[data:bodys,type:'default']
      def rt= pubActionscriptService.runScript('YHYJH','queryBody',data,servletContext.getRealPath(""),1,null)


        def json= [rows: rt]

        render json as JSON

    }


    def check(String id){
        Yhyjh h= Yhyjh.get(id)
        if (h.checker!=null){
            throw new BusinessException( '单据已经是审核状态！')

        }


        h.checker=springSecurityService.currentUser
        h.checkDate=new Date()

        h.save()
        def rt=[remoteMessage:'审核成功！',data:[checker:[userRealName:h.checker.userRealName],'checkDate':h.checkDate]]
        render rt as JSON
    }

    def uncheck(String id){
        Yhyjh h= Yhyjh.get(id)
        if (h.checker==null){
            throw new BusinessException('单据未被审核，弃审动作失败！')

        }
        def isExec = false;
        def list = YhyjhB.countByHeadAndClosed(h,true)
        if (list>0) isExec = true;
        if(isExec){
            throw new BusinessException('单据已被执行，无法弃审!')
        }

        h.checker=null
        h.checkDate=null

        h.save()
        def rt=[remoteMessage:'弃审成功！',data:[checker:[userRealName:''],'checkDate':'']]
        render rt as JSON
    }

    def refPage(String businessKey){
        params.page_id=ref_pageId
        params.billTypeCode=billTypeCode
        return params
    }




}
