package com.app.ic.report

import com.app.ic.handnum.IcOnhandnum
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

class IcBalanceReportController {
    def springSecurityService
    def static _pageId = 'IcBalanceReport'
    def index() {
        [pageId:_pageId]
    }

    def query(){
        println('fdsafdsafdsafdsa')
        println params
        def _loginCorp=springSecurityService.authentication.loginCorp

        CriteriaHelper ch
        CriteriaHelper cc




        if(params.queryParams){
            def jsobj = JSON.parse(params.queryParams)
            ch = new CriteriaHelper(IcOnhandnum.createCriteria(),jsobj)
            ch.add(Restrictions.eq('corp.id', _loginCorp))
            cc = new CriteriaHelper(IcOnhandnum.createCriteria(),jsobj)
            cc.add(Restrictions.eq('corp.id', _loginCorp))

        }else{
            ch = new CriteriaHelper(IcOnhandnum.createCriteria())
            ch.add(Restrictions.eq('corp.id', _loginCorp))
            cc = new CriteriaHelper(IcOnhandnum.createCriteria())
            cc.add(Restrictions.eq('corp.id', _loginCorp))
        }


        def handnums = ch.list(params, 'id')

        def jsons=[]
        handnums?.each {
            jsons << it.part(defaultPart:true)
        }



        def json = [rows: jsons, total: cc.count()]
        render json as JSON
    }


}
