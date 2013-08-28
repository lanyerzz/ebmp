package com.app.ywms.settle.fee




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID

class YwmsFeeBillController {
    //注册pageId   UUID 去除“-”

    def billTypeCode = ''
    def _pageId = billTypeCode ?: "5646d80fb900495ea675a967cbead2e7"
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
        def instance
        if (sourceBillTypeCode) {
            instance = pubActionscriptService.runChangeScript(sourceBillTypeCode, billTypeCode, [data: keys.split(','), 'businessKey': businessKey])
        } else {
            instance = new YwmsFeeBill(params)

        }

        if (businessKey) {
            instance.businessType = PubBusinessType.get(businessKey);
        }
        instance.billdate = new Date()
        instance.billTypeCode = billTypeCode
        instance.billtype = PubBilltype.findByBilltypecode(billTypeCode)
        instance.bdCorp = BdCorp.get(springSecurityService.authentication.loginCorp)
        instance.maker = springSecurityService.currentUser
        instance.makeDate = new Date()
        [ywmsFeeBillInstance: instance, pageId: _pageId]
    }



    def save() {
        JSONObject head = JSON.parse(URLDecoder.decode(params.head, 'utf-8'))



        def bodys = JSON.parse(URLDecoder.decode(params.bodys, 'utf-8'))


        YwmsFeeBill ywmsFeeBillInstance

        if (head.id) {//update
            ywmsFeeBillInstance = YwmsFeeBill.get(head.id)
            bindData(ywmsFeeBillInstance, head)


        } else {//save
            ywmsFeeBillInstance = new YwmsFeeBill(head)
        }

//
        if (!ywmsFeeBillInstance.validate()) {
            def _errors = []
            g.eachError(bean: ywmsFeeBillInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }


            def json = [validateerrors: _errors]

            render json as JSON
            return
        }





        if (bodys == null) {
            throw new BusinessException('表体数据不能为空!')
        }

        // def _bodys=[]
        def _delKey = []
        int row = 0
        bodys?.each {

            if (it.isDeleted) {
                _delKey << it.id
            } else {
                def body = ywmsFeeBillInstance.findOrCreateById(it.id)
                bindData(body, it)
                row++
                if (!body.validate()) {

                    log.debug body.errors
                    def msg = ""
                    g.eachError(bean: body) {

                        msg += g.message(error: it)
                        msg += ';'
                    }

                    throw new BusinessException('行：' + row + ',' + msg)


                }
                if (!body.id) {
                    ywmsFeeBillInstance.addToBodys(body);
                }

            }


        }

        ywmsFeeBillInstanceService.save(ywmsFeeBillInstance, _delKey)

        def data = [:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'ywmsFeeBill.label', default: 'YwmsFeeBill'), ywmsFeeBillInstance.billno])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def ywmsFeeBillInstance = YwmsFeeBill.get(id)
        if (!ywmsFeeBillInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ywmsFeeBill.label', default: 'YwmsFeeBill'), id])
            redirect(action: "list")
            return
        }

        [ywmsFeeBillInstance: ywmsFeeBillInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def ywmsFeeBillInstance = YwmsFeeBill.get(id)
        if (!ywmsFeeBillInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ywmsFeeBill.label', default: 'YwmsFeeBill'), id])

        }

        [ywmsFeeBillInstance: ywmsFeeBillInstance, pageId: _pageId]
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def ywmsFeeBillInstance = YwmsFeeBill.get(id)
        if (!ywmsFeeBillInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        ywmsFeeBillInstance.delete(flush: true)
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

        def ywmsFeeBillInstanceLs
        def ywmsFeeBillInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams) {
            def json = JSON.parse(URLDecoder.decode(params.queryParams, 'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(YwmsFeeBill.createCriteria(), json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc = new CriteriaHelper(YwmsFeeBill.createCriteria(), json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            ywmsFeeBillInstanceTotal = cc.count()
            ywmsFeeBillInstanceLs = ch.list(params, "billno", 'desc') //TODO

//            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
//            ywmsFeeBillInstanceTotal = query.countQuery.count()
//
//            ywmsFeeBillInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO

        } else if (params.q != null) {//TODO 需要修改JSON中的字段
            jb.or {
                criterias[
                        {
                            operator: 'operator'
                            fieldName: 'code'
                            value: '${params.q}'
                        },
                        {
                            operator: 'operator'
                            fieldName: 'code'
                            value: '${params.q}'
                        }

                        ]
            }


            def json = JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(YwmsFeeBill.createCriteria(), json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc = new CriteriaHelper(YwmsFeeBill.createCriteria(), json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            ywmsFeeBillInstanceTotal = cc.count()

            ywmsFeeBillInstanceLs = ch.list(params, "billno", 'desc')//TODO

        } else if (params.id) {
            def ywmsFeeBillInstanceInstance = YwmsFeeBill.get(params.id)
            def json = [rows: [ywmsFeeBillInstanceInstance], total: 1]
            render json as JSON
            return;
        } else {

            CriteriaHelper ch = new CriteriaHelper(YwmsFeeBill.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc = new CriteriaHelper(YwmsFeeBill.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            ywmsFeeBillInstanceTotal = cc.count()

            ywmsFeeBillInstanceLs = ch.list(params, "billno", 'desc')//TODO

            //def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
//            ywmsFeeBillInstanceTotal = query.countQuery.count()
//
//            ywmsFeeBillInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }





        def data = []
        ywmsFeeBillInstanceLs?.each {
            data << it.part([defaultPart: true])
        }

        def json = [rows: data, total: ywmsFeeBillInstanceTotal]
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
        def instance = YwmsFeeBill.get(id)
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
        def instance = YwmsFeeBill.get(id)
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
