package com.app.ywms.contract

import com.app.pub.billtype.PubBilltype
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID

class BaseContractController {
    //注册pageId   UUID 去除“-”
    def static _pageId = 'BaseContract'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        [pageId: _pageId]
    }

    /**
     * 查询
     * @return
     */
    def query() {

        def baseContractInstanceLs
        def baseContractInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        def pubbilltype = PubBilltype.findByBilltypecode('C4')
        if (params.queryParams) {
            def json = JSON.parse(URLDecoder.decode(params.queryParams, 'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(), json)
            ch.criteria.add(Restrictions.not(Restrictions.eq('pubBilltype',pubbilltype)))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.criteria.add(Restrictions.isNotNull('checker'))
            def cc = new CriteriaHelper(BaseContract.createCriteria(), json)
            cc.criteria.add(Restrictions.not(Restrictions.eq('pubBilltype',pubbilltype)))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.criteria.add(Restrictions.isNotNull('checker'))
            baseContractInstanceTotal = cc.count()

            baseContractInstanceLs = ch.list(params, "contractNo")
        } else if (params.q != null) {
            def sjson = """{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'contractNo','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'contrantNo2','value':'${params.q}'}
                                    ]
                        }"""


            def json = JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(), json)
            ch.criteria.add(Restrictions.not(Restrictions.eq('pubBilltype',pubbilltype)))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.criteria.add(Restrictions.isNotNull('checker'))
            def cc = new CriteriaHelper(BaseContract.createCriteria(), json)
            cc.criteria.add(Restrictions.not(Restrictions.eq('pubBilltype',pubbilltype)))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.criteria.add(Restrictions.isNotNull('checker'))
            baseContractInstanceTotal = cc.count()

            baseContractInstanceLs = ch.list(params, "contractNo")

        } else if (params.id) {
            def baseContractInstanceInstance = BaseContract.get(params.id)
            def json = [rows: [baseContractInstanceInstance], total: 1]
            render json as JSON
            return;
        } else {

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria())
            ch.criteria.add(Restrictions.not(Restrictions.eq('pubBilltype',pubbilltype)))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.criteria.add(Restrictions.isNotNull('checker'))
            def cc = new CriteriaHelper(BaseContract.createCriteria())
            cc.criteria.add(Restrictions.not(Restrictions.eq('pubBilltype',pubbilltype)))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.criteria.add(Restrictions.isNotNull('checker'))
            baseContractInstanceTotal = cc.count()

            baseContractInstanceLs = ch.list(params, "contractNo")
        }





        def data = []
        baseContractInstanceLs?.each {
            data << it.part()
        }

        def json = [rows: data, total: baseContractInstanceTotal]
        render json as JSON
    }


    def queryC4() {





        def baseContractInstanceLs
        def baseContractInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        def pubbilltype = PubBilltype.findByBilltypecode('C4')
        if (params.queryParams) {
            def json = JSON.parse(URLDecoder.decode(params.queryParams, 'utf-8'))
            def extendParam=JSON.parse(URLDecoder.decode(params.extendParam,'utf-8'))
            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(), json)
            ch.code(extendParam)
            ch.criteria.add(Restrictions.eq('pubBilltype',pubbilltype))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.criteria.add(Restrictions.isNotNull('checker'))
            def cc = new CriteriaHelper(BaseContract.createCriteria(), json)
            cc.code(extendParam)
            cc.criteria.add(Restrictions.eq('pubBilltype',pubbilltype))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.criteria.add(Restrictions.isNotNull('checker'))
            baseContractInstanceTotal = cc.count()

            baseContractInstanceLs = ch.list(params, "contractNo")
        } else if (params.q != null) {
            def sjson = """{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'contractNo','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'contractNo2','value':'${params.q}'}

                                    ]
                        }"""


            def json = JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(), json)
            def extendParam=JSON.parse(URLDecoder.decode(params.extendParam,'utf-8'))
            ch.code(extendParam)
            ch.criteria.add(Restrictions.eq('pubBilltype',pubbilltype))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.criteria.add(Restrictions.isNotNull('checker'))
            def cc = new CriteriaHelper(BaseContract.createCriteria(), json)
            cc.code(extendParam)
            cc.criteria.add(Restrictions.eq('pubBilltype',pubbilltype))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.criteria.add(Restrictions.isNotNull('checker'))
            baseContractInstanceTotal = cc.count()

            baseContractInstanceLs = ch.list(params, "contractNo")

        } else if (params.id) {
            def baseContractInstanceInstance = BaseContract.get(params.id)
            def json = [rows: [baseContractInstanceInstance], total: 1]
            render json as JSON
            return;
        } else {
            def extendParam=JSON.parse(URLDecoder.decode(params.extendParam,'utf-8'))
            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria())
            ch.code(extendParam)
            ch.criteria.add(Restrictions.eq('pubBilltype',pubbilltype))
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.criteria.add(Restrictions.isNotNull('checker'))
            def cc = new CriteriaHelper(BaseContract.createCriteria())
            cc.code(extendParam)
            cc.criteria.add(Restrictions.eq('pubBilltype',pubbilltype))
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.criteria.add(Restrictions.isNotNull('checker'))
            baseContractInstanceTotal = cc.count()

            baseContractInstanceLs = ch.list(params, "contractNo")
        }





        def data = []
        baseContractInstanceLs?.each {
            data << it.part()
        }

        def json = [rows: data, total: baseContractInstanceTotal]
        render json as JSON
    }



    def queryAll() {

        def baseContractInstanceLs
        def baseContractInstanceTotal
        def corp = springSecurityService.authentication.loginCorp

        if (params.queryParams) {
            def json = JSON.parse(URLDecoder.decode(params.queryParams, 'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(), json)

            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.criteria.add(Restrictions.isNotNull('checker'))
            def cc = new CriteriaHelper(BaseContract.createCriteria(), json)

            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.criteria.add(Restrictions.isNotNull('checker'))
            baseContractInstanceTotal = cc.count()

            baseContractInstanceLs = ch.list(params, "contractNo")
        } else if (params.q != null) {
            def sjson = """{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'contractNo','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'contrantNo2','value':'${params.q}'}
                                    ]
                        }"""


            def json = JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria(), json)

            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.criteria.add(Restrictions.isNotNull('checker'))
            def cc = new CriteriaHelper(BaseContract.createCriteria(), json)

            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.criteria.add(Restrictions.isNotNull('checker'))
            baseContractInstanceTotal = cc.count()

            baseContractInstanceLs = ch.list(params, "contractNo")

        } else if (params.id) {
            def baseContractInstanceInstance = BaseContract.get(params.id)
            def json = [rows: [baseContractInstanceInstance], total: 1]
            render json as JSON
            return;
        } else {

            CriteriaHelper ch = new CriteriaHelper(BaseContract.createCriteria())

            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            ch.criteria.add(Restrictions.isNotNull('checker'))
            def cc = new CriteriaHelper(BaseContract.createCriteria())

            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            cc.criteria.add(Restrictions.isNotNull('checker'))
            baseContractInstanceTotal = cc.count()

            baseContractInstanceLs = ch.list(params, "contractNo")
        }





        def data = []
        baseContractInstanceLs?.each {
            data << it.part([defaultPart:true])
        }

        def json = [rows: data, total: baseContractInstanceTotal]
        render json as JSON
    }

}
