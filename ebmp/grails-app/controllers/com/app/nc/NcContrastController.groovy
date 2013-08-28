package com.app.nc




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import grails.web.JSONBuilder
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions


class NcContrastController {
    //注册pageId   UUID 去除“-”

    def billTypeCode = ''
    def _pageId = billTypeCode ?: "c90db6bec61f46c8bfb8a4b20a1d6ceb"
    def ref_pageId = _pageId + 'Ref'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        [pageId: _pageId, billTypeCode: billTypeCode]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String keys, String businessKey, String sourceBillTypeCode) {
        def instance =new NcContrast()
        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)
        [ncContrastInstance: instance, pageId: _pageId]
    }



    def save() {


        NcContrast ncContrastInstance

        if (params.id) {//update
            ncContrastInstance = NcContrast.get(params.id)
            bindData(ncContrastInstance, params)


        } else {//save
            ncContrastInstance = new NcContrast(params)
        }

//
        if (!ncContrastInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: ncContrastInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }


            def json = [validateerrors: _errors]

            render json as JSON
            return
        }




        def data = [:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'ncContrast.label', default: 'NcContrast')])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def ncContrastInstance = NcContrast.get(id)
        if (!ncContrastInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ncContrast.label', default: 'NcContrast'), id])
            redirect(action: "list")
            return
        }

        [ncContrastInstance: ncContrastInstance, pageId: _pageId]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def ncContrastInstance = NcContrast.get(id)
        if (!ncContrastInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ncContrast.label', default: 'NcContrast'), id])

        }

        [ncContrastInstance: ncContrastInstance, pageId: _pageId]
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def ncContrastInstance = NcContrast.get(id)
        if (!ncContrastInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        ncContrastInstance.delete(flush: true)
        render id

    }

    def createQuery() {
        render(view: 'query', model: [pageId: _pageId, billTypeCode: billTypeCode])
    }

    /**
     * 查询
     * @return
     */
    def query() {

        def ncContrastInstanceLs
        def ncContrastInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams) {
            def json = JSON.parse(params.queryParams, 'utf-8')

            CriteriaHelper ch = new CriteriaHelper(NcContrast.createCriteria(), json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc = new CriteriaHelper(NcContrast.createCriteria(), json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            ncContrastInstanceTotal = cc.count()
            ncContrastInstanceLs = ch.list(params, "type", 'desc') //TODO

//            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
//            ncContrastInstanceTotal = query.countQuery.count()
//
//            ncContrastInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO

        }  else if (params.id) {
            def ncContrastInstanceInstance = NcContrast.get(params.id)
            def json = [rows: [ncContrastInstanceInstance], total: 1]
            render json as JSON
            return;
        } else {

            CriteriaHelper ch = new CriteriaHelper(NcContrast.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc = new CriteriaHelper(NcContrast.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            ncContrastInstanceTotal = cc.count()

            ncContrastInstanceLs = ch.list(params, "type", 'desc')//TODO

            //def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
//            ncContrastInstanceTotal = query.countQuery.count()
//
//            ncContrastInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }





        def data = []
        ncContrastInstanceLs?.each {
            data << it.part([defaultPart: true])
        }

        def json = [rows: data, total: ncContrastInstanceTotal]
        render json as JSON
    }

    /**
     * 子表查询
     */
//    def queryBody(String headId,String targetBill){
//
//
//        // def bodys = YxhjhdB.findAllWhere(['head.id':headId])
//        def dt= pubActionscriptService.runScript(billTypeCode,'queryBody',[headId:headId,criteria:new CriteriaHelper(YxhjhdB.createCriteria()),targetBill:targetBill],0,null)
//        def data=[data:dt]
//        def rt= pubActionscriptService.runScript(billTypeCode,'queryBody',data,1,null)
//        def json= [rows: rt]
//        render json as JSON
//    }

    def refPage(String businessKey) {
        params.page_id = ref_pageId
        params.billTypeCode = billTypeCode
        return params
    }

    def check(String id) {
        def user = springSecurityService.currentUser
        def instance = NcContrast.get(id)
        if (instance.checker != null) {
            throw new BusinessException('单据已经是审核状态！')
        }

        instance.checker = user
        instance.checkDate = new Date()
        instance.save()
        def rt = [remoteMessage: '审核成功！', data: [checker: [userRealName: instance.checker.userRealName], 'checkDate': instance.checkDate]]
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id) {
        def instance = NcContrast.get(id)
        if (instance.checker == null) {
            throw new BusinessException('单据未被审核，弃审动作失败！')
        }

        instance.checker = null
        instance.checkDate = null
        instance.save()
        def rt = [remoteMessage: '弃审成功！', data: [checker: [userRealName: ''], 'checkDate': '']]
        render rt as JSON
    }

}
