package com.app.ywms.contract.lszlcontract

import com.app.bd.corp.BdCorp
import com.app.pub.billtype.PubBilltype
import com.app.ywms.contract.BaseContract
import org.hibernate.criterion.Restrictions
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import static java.util.UUID.randomUUID
class LszlContractController {
    //注册pageId   UUID 去除“-”
    def static _pageId='LszlContract'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def billGenNoService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [lszlContractInstanceList: BaseContract.list(params), lszlContractInstanceTotal: BaseContract.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        def ht=  new BaseContract()
        ht.makeDate=new Date()
        ht.maker=springSecurityService.currentUser
        ht.pkCorp=BdCorp.get(springSecurityService.authentication.loginCorp)
        [lszlContractInstance: ht,pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def lszlContractInstance = new BaseContract(params)
        def loginCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(loginCorp)
        def loginUser = springSecurityService.currentUser
        PubBilltype pubBilltype = PubBilltype.findByBilltypecode('C3')
        if (!pubBilltype){
            throw new BusinessException('请先定义此单据类型')
        }
        if(!lszlContractInstance.contractNo)
            lszlContractInstance.contractNo=billGenNoService.getNo('C3',corp)
        lszlContractInstance.pubBilltype = pubBilltype
        lszlContractInstance.pkCorp = corp
        lszlContractInstance.maker = loginUser
        lszlContractInstance.makeDate = new Date()
        if (!lszlContractInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: lszlContractInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=lszlContractInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'lszlContract.label', default: 'BaseContract'), lszlContractInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def lszlContractInstance = BaseContract.get(id)
        if (!lszlContractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lszlContract.label', default: 'BaseContract'), id])
            redirect(action: "list")
            return
        }

        [lszlContractInstance: lszlContractInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def lszlContractInstance = BaseContract.get(id)
        if (!lszlContractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lszlContract.label', default: 'BaseContract'), id])

        }

        [lszlContractInstance: lszlContractInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def lszlContractInstance = BaseContract.get(id)
        if (!lszlContractInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'lszlContract.label', default: '功能节点')])]
            render json as JSON
            return
        }


        if(lszlContractInstance.checker!=null){
            throw new BusinessException('合同已经签字，不能修改！')
        }

        if (version != null) {
            if (lszlContractInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'lszlContract.label', default: 'BaseContract')] as Object[],
                        "Another user has updated this BaseContract while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        lszlContractInstance.properties = params

        if (!lszlContractInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: lszlContractInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'lszlContract.label', default: 'BaseContract'), lszlContractInstance.id])
        def data= lszlContractInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def lszlContractInstance = BaseContract.get(id)
        if (!lszlContractInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        lszlContractInstance.delete(flush: true)
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
        def corp = springSecurityService.authentication.loginCorp
        def lszlContractInstanceLs
        def lszlContractInstanceTotal
        def pubBilltype = PubBilltype.findByBilltypecode('C3')
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pubBilltype', pubBilltype))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            CriteriaHelper cc = new CriteriaHelper(BaseContract.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pubBilltype', pubBilltype))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            lszlContractInstanceTotal = cc .count()

            lszlContractInstanceLs = ch.list(params,"contractNo")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'contractNo','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'contrantNo2','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'pubBilltype','value':'${pubBilltype}'},
                                    {'operator':'contains','fieldName':'pkCorp.id','value':'${corp}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pubBilltype', pubBilltype))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            CriteriaHelper cc = new CriteriaHelper(BaseContract.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pubBilltype', pubBilltype))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            lszlContractInstanceTotal = cc .count()

            lszlContractInstanceLs = ch.list(params,"contractNo")

        }else if (params.id){
            def lszlContractInstanceInstance= BaseContract.get(params.id)
            def json= [rows: [lszlContractInstanceInstance], total: BaseContract.count()]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria())
            ch.criteria.add(Restrictions.eq('pubBilltype', pubBilltype))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            CriteriaHelper cc = new CriteriaHelper(BaseContract.createCriteria())
            cc.criteria.add(Restrictions.eq('pubBilltype', pubBilltype))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            lszlContractInstanceTotal = cc .count()

            lszlContractInstanceLs = ch.list(params,"contractNo")
        }





        def data = []
        lszlContractInstanceLs?.each {
            Map row = it.part([defaultPart:true])

            data << row
        }

        def json= [rows: data, total: lszlContractInstanceTotal]
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
