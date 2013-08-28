package com.app.ywms.contract.blcontract

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.util.CriteriaHelper
import com.app.ywms.contract.BaseContract
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID

class BlContractController {
    //注册pageId   UUID 去除“-”
    def static _pageId = 'BlContract'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def billGenNoService
    def index() {
        [pageId: _pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [blContractInstanceList: BaseContract.list(params), blContractInstanceTotal: BaseContract.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
      def ht=  new BaseContract(params)
        ht.makeDate=new Date()
        ht.maker=springSecurityService.currentUser
        ht.pkCorp=BdCorp.get(springSecurityService.authentication.loginCorp)
        [blContractInstance: ht, pageId: _pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def blContractInstance = new BaseContract(params)
        def loginUser = springSecurityService.currentUser
        def loginCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(loginCorp)
        PubBilltype pubBilltype = PubBilltype.findByBilltypecode('C2')
        if (!pubBilltype){
            throw new BusinessException('请先定义此单据类型')
        }

        if(!blContractInstance.contractNo)
            blContractInstance.contractNo=billGenNoService.getNo('C2',corp)
        blContractInstance.pubBilltype = pubBilltype
        blContractInstance.pkCorp = corp
        blContractInstance.maker = loginUser
        blContractInstance.makeDate = new Date()
        if (!blContractInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: blContractInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json = [validateerrors: _errors]

            render json as JSON
            return
        }

        def data = blContractInstance.part()
        data['bdCumandoc.pkCubasdoc.custname'] = blContractInstance?.bdCumandoc?.pkCubasdoc?.custname
        data['bdInvmandoc.pkInvbasdoc.invname'] = blContractInstance?.bdInvmandoc?.pkInvbasdoc?.invname
        data['maker.userRealName'] = blContractInstance?.maker?.userRealName
        data['checker.userRealName'] = blContractInstance?.checker?.userRealName
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'blContract.label', default: 'BaseContract'), blContractInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def blContractInstance = BaseContract.get(id)
        if (!blContractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blContract.label', default: 'BaseContract'), id])
            redirect(action: "list")
            return
        }

        [blContractInstance: blContractInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def blContractInstance = BaseContract.get(id)
        if (!blContractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blContract.label', default: 'BaseContract'), id])

        }

        [blContractInstance: blContractInstance, pageId: _pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def blContractInstance = BaseContract.get(id)
        if (!blContractInstance) {

            def json = [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'blContract.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if(blContractInstance.checker!=null){
            throw new BusinessException('合同已经签字，不能修改！')
        }


        if (version != null) {
            if (blContractInstance.version > version) {
                def msg = message("version", "default.optimistic.locking.failure",
                        [message(code: 'blContract.label', default: 'BaseContract')] as Object[],
                        "Another user has updated this BaseContract while you were editing")
                def json = [remoteErrors: msg]
                render json as JSON
                return
            }
        }

        blContractInstance.properties = params

        if (!blContractInstance.save(flush: true)) {
            def _errors = []
            g.eachError(bean: blContractInstance) {
                println it
                _errors << [field: it.field, message: g.message(error: it)]

            }
            def json = [validateerrors: _errors]
            render json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'blContract.label', default: 'BaseContract'), blContractInstance.id])
        def data = blContractInstance.part()
        data.remoteMessage = message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def blContractInstance = BaseContract.get(id)
        if (!blContractInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        blContractInstance.delete(flush: true)
        render id

    }

    def createQuery() {
        render(view: 'query', model: [pageId: _pageId])
    }

    /**
     * 查询
     * @return
     */
    def query() {
        def corp = springSecurityService.authentication.loginCorp
        def blContractInstanceLs
        def blContractInstanceTotal
        def pubBilltype = PubBilltype.findByBilltypecode('C2')
        if (params.queryParams) {
            def json = JSON.parse(URLDecoder.decode(params.queryParams, 'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pubBilltype',pubBilltype))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            CriteriaHelper cc = new CriteriaHelper(BaseContract.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pubBilltype',pubBilltype))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            blContractInstanceTotal = cc.count()

            blContractInstanceLs = ch.list(params, "contractNo")
        } else if (params.q != null) {
            def sjson = """{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'contractNo','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'contrantNo2','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'pubBilltype','value':'${pubBilltype}'},
                                    {'operator':'contains','fieldName':'pkCorp.id','value':'${corp}'}
                                    ]
                        }"""


            def json = JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pubBilltype',pubBilltype))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            CriteriaHelper cc = new CriteriaHelper(BaseContract.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pubBilltype',pubBilltype))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            blContractInstanceTotal = cc.count()

            blContractInstanceLs = ch.list(params, "contractNo")

        } else if (params.id) {
            def blContractInstanceInstance = BaseContract.get(params.id)
            def json = [rows: [blContractInstanceInstance], total: BaseContract.count()]
            render json as JSON
            return;
        } else {

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria())
            ch.criteria.add(Restrictions.eq('pubBilltype',pubBilltype))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            CriteriaHelper cc = new CriteriaHelper(BaseContract.createCriteria())
            cc.criteria.add(Restrictions.eq('pubBilltype',pubBilltype))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            blContractInstanceTotal = cc.count()

            blContractInstanceLs = ch.list(params, "contractNo")
        }





        def data = []
        blContractInstanceLs?.each {
            Map row = it.part([defaultPart:true])

            data << row
        }

        def json = [rows: data, total: blContractInstanceTotal]
        render json as JSON
    }


    def check(String id){
        def ht= BaseContract.get(id)
        if(!ht){
            throw new BusinessException('未找到指定合同！')
        }
        if(ht.checker!=null) throw new BusinessException('单据已经签字！')
        ht.checker=springSecurityService.currentUser
        ht.checkDate=new Date()
        ht.save()
        def rt=[remoteMessage:'签字成功！',data:[checker: [userRealName:ht.checker.userRealName],'checkDate':ht.checkDate]]
        render rt as JSON
    }

    def uncheck(String id){
        def ht= BaseContract.get(id)
        if(!ht){
            throw new BusinessException('未找到指定合同！')
        }

        ht.checker=null
        ht.checkDate=null
        ht.save()
        def rt=[remoteMessage:'取消签字成功！',data:[checker:[userRealName:''],'checkDate':'']]
        render rt as JSON
    }
}
