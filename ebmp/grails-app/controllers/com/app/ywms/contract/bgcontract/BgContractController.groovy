package com.app.ywms.contract.bgcontract

import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.util.CriteriaHelper
import com.app.ywms.contract.BaseContract
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID

class BgContractController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BgContract'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def billGenNoService

    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bgContractInstanceList: BaseContract.list(params), bgContractInstanceTotal: BaseContract.count()]
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
        model:[bgContractInstance: ht,pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {

        def bgContractInstance = new BaseContract(params)
        def loginCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(loginCorp)
        def loginUser = springSecurityService.currentUser
        def pubBilltype = PubBilltype.findByBilltypecode('C1')
        if (!pubBilltype){
            throw new BusinessException('请先定义此单据类型')
        }

        bgContractInstance.pubBilltype = pubBilltype
        if(!bgContractInstance.contractNo)
            bgContractInstance.contractNo=billGenNoService.getNo('C1',corp)
        bgContractInstance.pkCorp = corp
        bgContractInstance.maker = loginUser
        bgContractInstance.makeDate = new Date()
        if (!bgContractInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bgContractInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }


            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bgContractInstance.part()

        data['bdCumandoc.pkCubasdoc.custname'] = bgContractInstance?.bdCumandoc?.pkCubasdoc?.custname
        data['bdInvmandoc.pkInvbasdoc.invname'] = bgContractInstance?.bdInvmandoc?.pkInvbasdoc?.invname


        data['maker.userRealName'] = bgContractInstance?.maker?.userRealName
        data['checker.userRealName'] = bgContractInstance?.checker?.userRealName
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'BaseContract.label', default: 'BaseContract'), bgContractInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bgContractInstance = BaseContract.get(id)
        if (!bgContractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'BaseContract.label', default: 'BaseContract'), id])
            redirect(action: "list")
            return
        }

        [bgContractInstance: bgContractInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bgContractInstance = BaseContract.get(id)
        if (!bgContractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'BaseContract.label', default: 'BaseContract'), id])

        }

        [bgContractInstance: bgContractInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bgContractInstance = BaseContract.get(id)
        if (!bgContractInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'BaseContract.label', default: '功能节点')])]
            render json as JSON
            return
        }


        if(bgContractInstance.checker!=null){
            throw new BusinessException('合同已经签字，不能修改！')
        }

        if (version != null) {
            if (bgContractInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'BaseContract.label', default: 'BaseContract')] as Object[],
                        "Another user has updated this BaseContract while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }

        bgContractInstance.properties = params

        if (!bgContractInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bgContractInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'BaseContract.label', default: 'BaseContract'), bgContractInstance.id])
        def data= bgContractInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bgContractInstance = BaseContract.get(id)
        if (!bgContractInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bgContractInstance.delete(flush: true)
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
        def bgContractInstanceLs
        def bgContractInstanceTotal
        def pubBilltype = PubBilltype.findByBilltypecode('C1')
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pubBilltype',pubBilltype))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            CriteriaHelper cc = new CriteriaHelper(BaseContract.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pubBilltype', pubBilltype))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            bgContractInstanceTotal = cc.count()

            bgContractInstanceLs = ch.list(params,"contractNo")
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
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.criteria.add(Restrictions.eq('pubBilltype', pubBilltype))
            CriteriaHelper cc = new CriteriaHelper(BaseContract.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.criteria.add(Restrictions.eq('pubBilltype', pubBilltype))
            bgContractInstanceTotal = cc.count()

            bgContractInstanceLs = ch.list(params,"contractNo")

        }else if (params.id){
            def bgContractInstanceInstance= BaseContract.get(params.id)
            def json= [rows: [bgContractInstanceInstance], total: BaseContract.count()]
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
            bgContractInstanceTotal = cc.count()

            bgContractInstanceLs = ch.list(params,"contractNo")
        }





        def data = []
        bgContractInstanceLs?.each {
            Map row = it.part([defaultPart:true])
            data << row
        }

        def json= [rows: data, total: bgContractInstanceTotal]
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
