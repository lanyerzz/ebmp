package com.app.ywms.settle.feetype




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import grails.web.JSONBuilder
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID

class YwmsFeeTypeController {
    //注册pageId   UUID 去除“-”

    def billTypeCode = ''
    def _pageId = billTypeCode ?: "a8db761d7a5c4752adf5b91e64ab03ac"
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
    def create(String pid) {
        def instance
       if(pid){
           instance=new YwmsFeeType()
           instance.pid=pid
       }else {
           instance=new YwmsFeeType()
       }


        [ywmsFeeTypeInstance: instance, pageId: _pageId]
    }



    def save() {
        JSONObject head = JSON.parse(URLDecoder.decode(params.head, 'utf-8'))



        def bodys = JSON.parse(URLDecoder.decode(params.bodys, 'utf-8'))


        YwmsFeeType ywmsFeeTypeInstance

        if (head.id) {//update
            ywmsFeeTypeInstance = YwmsFeeType.get(head.id)
            bindData(ywmsFeeTypeInstance, head)


        } else {//save
            ywmsFeeTypeInstance = new YwmsFeeType(head)
        }

//
        if (!ywmsFeeTypeInstance.validate()) {
            def _errors = []
            g.eachError(bean: ywmsFeeTypeInstance) {
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
                def body = ywmsFeeTypeInstance.findOrCreateById(it.id)
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
                    ywmsFeeTypeInstance.addToBodys(body);
                }

            }


        }

        ywmsFeeTypeInstanceService.save(ywmsFeeTypeInstance, _delKey)

        def data = [:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'ywmsFeeType.label', default: 'YwmsFeeType'), ywmsFeeTypeInstance.billno])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def ywmsFeeTypeInstance = YwmsFeeType.get(id)
        if (!ywmsFeeTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ywmsFeeType.label', default: 'YwmsFeeType'), id])
            redirect(action: "list")
            return
        }

        [ywmsFeeTypeInstance: ywmsFeeTypeInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def ywmsFeeTypeInstance = YwmsFeeType.get(id)
        if (!ywmsFeeTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ywmsFeeType.label', default: 'YwmsFeeType'), id])

        }

        [ywmsFeeTypeInstance: ywmsFeeTypeInstance, pageId: _pageId]
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def ywmsFeeTypeInstance = YwmsFeeType.get(id)
        if (!ywmsFeeTypeInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        ywmsFeeTypeInstance.delete(flush: true)
        render id

    }

    def createQuery() {
        render(view: 'query', model: [pageId: _pageId, billTypeCode: billTypeCode])
    }

    /**
     * 查询
     * @return
     */
    def query(String id) {
        List ls
        if (id){
            ls = YwmsFeeType.findAllByPid(id,[sort:'code'])
        }else{
            ls = YwmsFeeType.findAllByPid('0',[sort:'areaclcode'])
        }
        def data = []
        ls?.each {

            Map row = it.part()
            if (YwmsFeeType.countByPid(it.id)!=0){
                row.state = 'closed'
            }
            data << row
        }

        render data as JSON

    }



    def refPage(String businessKey) {
        params.page_id = ref_pageId
        params.billTypeCode = billTypeCode
        return params
    }

    def check(String id) {
        def user = springSecurityService.currentUser
        def instance = YwmsFeeType.get(id)
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
        def instance = YwmsFeeType.get(id)
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
