package com.app.ywms.rk.cbdgd

import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import org.codehaus.groovy.grails.web.json.JSONObject



import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID

class YcbdgdController {
    static transactional = true
    //注册pageId   UUID 去除“-”
    String billTypeCode='YCBDGD'
    def static _pageId = 'Ycbdgd'
    def static ref_pageId = 'YcbdgdRef'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def ycbdgdService
    def pubActionscriptService

    def index() {
        [pageId: _pageId,billTypeCode:billTypeCode]
    }


    /**
     * 进入添加页面
     * @return
     */
    def create(String keys,String sourceBillTypeCode,String businessKey) {
        def key= keys?.split(',')

        def vo= pubActionscriptService.runChangeScript(sourceBillTypeCode,billTypeCode,[data:key,'businessKey':businessKey])
        def dt = [data:vo.bodys,type: 'default']
        def data = pubActionscriptService.runScript(billTypeCode,'create',dt,1,null)

        def pkCorp = springSecurityService.authentication.loginCorp

        def corp = BdCorp.get(pkCorp)

        if(sourceBillTypeCode){
            vo.sourceBillTypeCode=sourceBillTypeCode
            vo.sourceBillType=PubBilltype.findByBilltypecode(sourceBillTypeCode)
        }
        def businessType= PubBusinessType.get(businessKey)
        vo.businessCode=businessType.code
        vo.businessType=businessType
        vo.maker=springSecurityService.currentUser
        vo.billdate=new Date()
        vo.makeDate=new Date()
        vo.bdCorp = corp

        [ycbdgdInstance: vo, pageId: _pageId,bodys:data]
    }

/**
 * 保存
 * @return
 */
    def save() {



        def maker = springSecurityService.currentUser
        def ycbdgdInstance = null
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        JSONObject head = JSON.parse( URLDecoder.decode(params.head,'utf-8'))
        def bodys = JSON.parse( URLDecoder.decode(params.bodys,'utf-8'))

        if (head.id){
            ycbdgdInstance = Ycbdgd.get(head.id)


            if (ycbdgdInstance.checker!=null){
                throw new BusinessException( '单据已经是审核状态,不能修改！')
            }
           pubActionscriptService.runScript('YCBDGD','save',[data: ycbdgdInstance],0,null)

            bindData(ycbdgdInstance,head)
        }else{
            ycbdgdInstance = new Ycbdgd(head)

            ycbdgdInstance.bdCorp = corp
            ycbdgdInstance.maker = maker
            ycbdgdInstance.makeDate = new Date()
        }
        def yhyjhbInstances = bodys
        if(yhyjhbInstances == null){
            throw new BusinessException('表体数据不能为空')
        }

        def keys=[]
        if(ycbdgdInstance.bodys){
            ycbdgdInstance.bodys.each { keys << it.id }
        }

        yhyjhbInstances?.each {

            def _id=it.id?:'none'
            YcbdgdB body = YcbdgdB.findOrCreateById(_id)

            keys.remove(body.id)
            println it
            bindData( body, it)
            if(!body.validate()){

                log.info body.errors
                println body.errors

                return
            }
            ycbdgdInstance.addToBodys(body)
        }

        if(!ycbdgdInstance.validate()){
            println 'xxxxxxxxxxxxxxxxx'
            println ycbdgdInstance.errors
            def _errors=[]
            g.eachError(bean: ycbdgdInstance){

                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

       def json= ycbdgdService.save(ycbdgdInstance,keys)




        def rt=[:]
        rt.remoteMessage= message(code: 'default.created.message', args: [message(code: 'ycbdgd.label', default: 'Ycbdgd'), ycbdgdInstance.billno])
        rt.rows=json
        render rt as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def ycbdgdInstance = Ycbdgd.get(id)
        if (!ycbdgdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ycbdgd.label', default: 'Ycbdgd'), id])
            redirect(action: "list")
            return
        }

        [ycbdgdInstance: ycbdgdInstance,pageId: _pageId]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def ycbdgdInstance = Ycbdgd.get(id)

        if(ycbdgdInstance.checker){
            throw new BusinessException('单据已经审核,不允许修改!')
        }

        if (!ycbdgdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ycbdgd.label', default: 'Ycbdgd'), id])

        }

        [ycbdgdInstance: ycbdgdInstance, pageId: _pageId]
    }



    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        ycbdgdService.delete(id)
        render id

    }

    def createQuery() {
        render(view: 'query',model:  [pageId:_pageId,billTypeCode:billTypeCode])
    }

    /**
     * 查询
     * @return
     */
    def query() {

        def ycbdgdInstanceLs
        def ycbdgdInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams) {
            def json = JSON.parse(URLDecoder.decode(params.queryParams, 'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(Ycbdgd.createCriteria(), json)
            def cc = new CriteriaHelper(Ycbdgd.createCriteria(), json)
            def query= pubActionscriptService.runScript('YCBDGD','query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser(),params:params],0,null)
            ycbdgdInstanceTotal = query.countQuery.count()

            ycbdgdInstanceLs = query.listQuery.list(params, "billno")
        }  else if (params.id) {
            def ycbdgdInstanceInstance = Ycbdgd.get(params.id)
            def json = [rows: [ycbdgdInstanceInstance], total: 1]
            render json as JSON
            return;
        } else {

            CriteriaHelper ch = new CriteriaHelper(Ycbdgd.createCriteria())
            def cc = new CriteriaHelper(Ycbdgd.createCriteria())
            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser(),params:params],0,null)
            ycbdgdInstanceTotal = query.countQuery.count()

            ycbdgdInstanceLs = query.listQuery.list(params, "billno")
        }


        def dt = [data:ycbdgdInstanceLs,type:'default']
//        def data=  pubActionscriptService.runScript('INVM','query1',dt,servletContext.getRealPath(""),1,null)
        def data = pubActionscriptService.runScript(billTypeCode,'query',dt,1,null)
        def json = [rows: data, total: ycbdgdInstanceTotal]

        println data
        render json as JSON
    }


    def queryBody(String headId,String targetBill){
        def  c= new CriteriaHelper(YcbdgdB.createCriteria())
        def bodys= pubActionscriptService.runScript(billTypeCode,'queryBody',[criteria:c,'headId':headId,'targetBill':targetBill],0,null)
        def dt = [data:bodys,type: 'default']
        def data = pubActionscriptService.runScript(billTypeCode,'queryBody',dt,1,null)
        def json = [rows: data]
        render json as JSON
    }

    /**
     * 审核
     * @param id
     */
    def check(String id){
        def user = springSecurityService.currentUser
        def ycbdgdInstance = Ycbdgd.get(id)
        if(ycbdgdInstance.checker!=null){
            throw new BusinessException('单据已经是审核状态！')
        }

        ycbdgdInstance.checker = user
        ycbdgdInstance.checkDate = new Date()
        ycbdgdInstance.save()
        def rt=[remoteMessage:'审核成功！',data:[checker:[userRealName:ycbdgdInstance.checker.userRealName],'checkDate':ycbdgdInstance.checkDate]]
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id){
        def ycbdgdInstance = Ycbdgd.get(id)
        if(ycbdgdInstance.checker==null){
            throw new BusinessException('单据未被审核，弃审动作失败！')
        }
        def isExec = false
        def list = YcbdgdB.countByHeadAndClosed(ycbdgdInstance,true)
        if (list>0) isExec = true;
        if(isExec){
            throw new BusinessException('单据已被执行，无法弃审!')
        }
        ycbdgdInstance.checker = null
        ycbdgdInstance.checkDate = null
        ycbdgdInstance.save()
        def rt = [remoteMessage:'弃审成功！',data:[checker:[userRealName:''],'checkDate':'']]
        render rt as JSON
    }

    def refPage(String businessKey){

        params.page_id=ref_pageId
        params.billTypeCode=billTypeCode
        return params
    }
}
