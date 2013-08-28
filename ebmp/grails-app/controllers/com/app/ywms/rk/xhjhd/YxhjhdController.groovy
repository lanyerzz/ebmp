package com.app.ywms.rk.xhjhd

import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YxhjhdController {
    static transactional = true
    //注册pageId   UUID 去除“-”
    def static _pageId='Yxhjhd'
    def billTypeCode='YXHJHD'
    def static ref_pageId='YxhjhdRef'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def yxhjhdService
    def pubActionscriptService

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
            instance= new Yxhjhd(params)

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




        [yxhjhdInstance: instance,pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def maker = springSecurityService.currentUser
        def yxhjhdInstance = null
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        JSONObject head = JSON.parse( params.head)
        def bodys = JSON.parse(params.bodys)

        println URLDecoder.decode(params.bodys,'utf-8')

        if (head.id){
            yxhjhdInstance = Yxhjhd.get(head.id)

            bindData(yxhjhdInstance,head)
        }else{
            yxhjhdInstance = new Yxhjhd(head)
            yxhjhdInstance.bdCorp = corp
            yxhjhdInstance.maker = maker
            yxhjhdInstance.makeDate = new Date()
        }
        def yxhjhdBInstance = bodys
        if(yxhjhdBInstance == null){
            throw new BusinessException('表体数据不能为空')
        }
        def keys=[]
        if(yxhjhdInstance.bodys){
            yxhjhdInstance.bodys.each { keys << it.id }
        }

        yxhjhdBInstance?.each {

            def _id=it.id?:'none'
            YxhjhdB body = YxhjhdB.findOrCreateById(_id)

            keys.remove(body.id)

            bindData(body, it)
            if(!body.validate()){

                println body.errors
            }
            yxhjhdInstance.addToBodys(body)
        }
        if(!yxhjhdInstance.validate()){
            def _errors=""
            g.eachError(bean: yxhjhdInstance){

                _errors +=   g.message(error: it)
            }

            def json=[remoteErrors: _errors]

            render json as JSON
            return
        }
        def json = yxhjhdService.save(yxhjhdInstance,keys)
        def rt=[:]
        rt.remoteMessage= message(code: 'default.created.message', args: [message(code: 'yxhjhd.label', default: 'Yxhjhd'), yxhjhdInstance.billno])
        rt.id=yxhjhdInstance.id
        rt.rows=json
        render rt as JSON

    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def yxhjhdInstance = Yxhjhd.get(id)
        if (!yxhjhdInstance) {
            render ([remoteErrors:message(code: 'default.not.found.message', args: [message(code: 'yxhjhd.label', default: 'Yxhjhd'), id])]) as JSON
            return
        }

        [yxhjhdInstance: yxhjhdInstance,pageId:_pageId]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def yxhjhdInstance = Yxhjhd.get(id)
        if (!yxhjhdInstance) {

            render ([remoteErrors:message(code: 'default.not.found.message', args: [message(code: 'yxhjhd.label', default: 'Yxhjhd'), id])]) as JSON
            return
        }

        [yxhjhdInstance: yxhjhdInstance,pageId:_pageId]
    }




    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {

        yxhjhdService.delete(id)
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

        def yxhjhdInstanceLs
        def yxhjhdInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(Yxhjhd.createCriteria(),json)
            def cc=new CriteriaHelper(Yxhjhd.createCriteria(),json)
            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser(),params:params],0,null)
            yxhjhdInstanceTotal = query.countQuery.count()

            yxhjhdInstanceLs = query.listQuery.list(params,"billno")
        }else if (params.id){
            def yxhjhdInstanceInstance= Yxhjhd.get(params.id)
            def json= [rows: [yxhjhdInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(Yxhjhd.createCriteria())
            def cc=new CriteriaHelper(Yxhjhd.createCriteria())
            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser(),params:params],0,null)
            yxhjhdInstanceTotal = query.countQuery.count()

            yxhjhdInstanceLs = query.listQuery.list(params,"billno")
        }





//        def data = []
//        yxhjhdInstanceLs?.each {
//            Map row = it.part()
//            row['businessType.name'] = it?.businessType?.name
//            row['shipdoc.shipname'] = it?.shipdoc?.shipname
//            row['cddw.pkCubasdoc.custname'] = it?.cddw?.pkCubasdoc?.custname
//            row['maker.userRealName'] = it?.maker?.userRealName
//            row['checker.userRealName'] = it?.checker?.userRealName
//            row['bdCorp.unitName'] = it?.bdCorp?.unitName
//            data << row
//        }
        def rt= pubActionscriptService.runScript(billTypeCode,'query',[data:yxhjhdInstanceLs],1,null)
        def json= [rows: rt, total: yxhjhdInstanceTotal]
        render json as JSON
    }
    /**
     * 子表查询
     */
    def queryBody(String headId,String targetBill){


       // def bodys = YxhjhdB.findAllWhere(['head.id':headId])
       def dt= pubActionscriptService.runScript(billTypeCode,'queryBody',[headId:headId,criteria:new CriteriaHelper(YxhjhdB.createCriteria()),targetBill:targetBill],0,null)
        def data=[data:dt,type:'default']
        def rt= pubActionscriptService.runScript(billTypeCode,'queryBody',data,1,null)
        def json= [rows: rt]
        render json as JSON
    }

    def refPage(String businessKey){
        [pageId:ref_pageId,handler:params.handler,'businessKey':businessKey,billTypeCode:billTypeCode]
    }


    def check(String id){
        def user = springSecurityService.currentUser
        def yxhjhdInstance = Yxhjhd.get(id)
        if(yxhjhdInstance.checker!=null){
            throw new BusinessException('单据已经是审核状态！')
        }

        yxhjhdInstance.checker = user
        yxhjhdInstance.checkDate = new Date()
        yxhjhdInstance.save()
        def rt=[remoteMessage:'审核成功！']
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id){
        def yxhjhdInstance = Yxhjhd.get(id)
        if(yxhjhdInstance.checker==null){
            throw new BusinessException('单据未被审核，弃审动作失败！')
        }
        def isExec = false
        def list = YxhjhdB.countByHeadAndClosed(yxhjhdInstance,true)
        if (list>0) isExec = true;
        if(isExec){
            throw new BusinessException('单据已被执行，无法弃审!')
        }
        yxhjhdInstance.checker = null
        yxhjhdInstance.checkDate = null
        yxhjhdInstance.save()
        def rt = [remoteMessage:'弃审成功！']
        render rt as JSON
    }

    def saveGH(String id,String ghs){
        println params
        if(!params.ghs){
            throw new BusinessException('罐号信息不能为空!')
        }
        def obj=JSON.parse(ghs)
        YxhjhdbBGh.executeUpdate('delete from YxhjhdbBGh where head.id=? ',[id])
        YxhjhdB b=YxhjhdB.get(id)
        obj.each {

            YxhjhdbBGh gh=new YxhjhdbBGh(it);
            gh.head=b
            if(!gh.save(flush: true)){
                log.error(gh.errors)
            }
        }

        def rt = [remoteMessage:'罐号分配成功！']
        render rt as JSON
    }

    def showGH(String id){

        print params

       def  b=YxhjhdB.get(id)
        if( b.head.checker){
            throw new BusinessException('单据已经审核,不允许分配罐号')
        }

        def ghs= YxhjhdbBGh.findAll {
            eq('head.id',id)
        }
        def json=ghs*.part([defaultPart: true]) as JSON
        render(view: 'gh',model:[yxhjhdb:b , ghs:json,pageId:_pageId] )
    }

    def queryGH(String headId){

       def ghs= YxhjhdbBGh.findAll {
            eq('head.id',headId)
        }
        def json= [rows: ghs*.part([defaultPart:true])]
        render json as JSON

    }

}
