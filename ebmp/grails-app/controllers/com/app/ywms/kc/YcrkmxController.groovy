package com.app.ywms.kc

import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

class YcrkmxController {
    //注册pageId   UUID 去除“-”

    def billTypeCode='YCRKMX'
    def  _pageId=billTypeCode?:"03f913fa67604e83bd09cbfe9c61ad46"
    def  ref_pageId=_pageId+'Ref'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def index() {
        [pageId:_pageId,billTypeCode:billTypeCode]
    }



    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId,billTypeCode:billTypeCode])
    }

    /**
     * 查询
     * @return
     */
    def query(){

        def ycrkmxInstanceLs
        def ycrkmxInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse(params.queryParams)

            CriteriaHelper ch = new CriteriaHelper(Ycrkmx.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(Ycrkmx.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))



            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
            ycrkmxInstanceTotal = query.countQuery.count()

            ycrkmxInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO

        }else if (params.id){
            def ycrkmxInstanceInstance= Ycrkmx.get(params.id)
            def json= [rows: [ycrkmxInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(Ycrkmx.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(Ycrkmx.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))


            def query= pubActionscriptService.runScript(billTypeCode,'query',[listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
            ycrkmxInstanceTotal = query.countQuery.count()

            ycrkmxInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }





        def data = []
        ycrkmxInstanceLs?.each {
            def row=it.part([defaultPart:true])

            data << row
        }

        def json= [rows: data, total: ycrkmxInstanceTotal]
        render json as JSON
    }


    def follow(String id){
        [id:id,pageId:_pageId]
    }

    def queryFollowData(String id,String rootId){




        if(id){
          def ls=  Ycrkmx.findAll {
                eq('sourceMx.id',id)
            }

            def jsons=[]

            ls?.each {
                jsons<< transJSON(it)
            }
            render jsons as  JSON

        }else{
         def mx=   Ycrkmx.get(rootId)
         def jsons=[]
            jsons<<transJSON(mx)
         render jsons  as JSON
        }
    }

    private transJSON(Ycrkmx mx){
        def json
        if(mx.crklx==0){
            json= [id:mx.id,text:"[入库-${mx?.billdate?.format('yyyy-MM-dd')}]${mx.hz.pkCubasdoc.custname}-合同号:[${mx.ht.contractNo}]-批次号:[${mx.pc}]-入库数:${mx.insl}-损耗数:${mx.shl}-锁定量:${mx.lockNum}-执行量:${mx.hxsl}",state:'closed']
        }else{
            if(mx.kh)
                json= [id:mx.id,text:"[出库-${mx?.billdate?.format('yyyy-MM-dd')}]-客户对象:${mx.kh.pkCubasdoc.custname}-出库数:${mx.outsl}",state:'closed']
            else
                json= [id:mx.id,text:"[出库-${mx?.billdate?.format('yyyy-MM-dd')}]-出库数:${mx.outsl}",state:'closed']
        }

        return json
    }


    private crklx=[0:"入库",1:"出库"]


    def refPage(String businessKey){
        params.page_id=ref_pageId
        params.billTypeCode=billTypeCode
        return params
    }



}
