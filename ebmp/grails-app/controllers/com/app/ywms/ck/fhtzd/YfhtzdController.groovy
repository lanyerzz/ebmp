package com.app.ywms.ck.fhtzd




import com.app.bd.corp.BdCorp
import com.app.bd.invmandoc.BdInvmandoc
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import com.app.ywms.kc.Ycrkmx
import com.app.ywms.kc.Yonhandnum
import com.app.ywms.rk.xhjhd.Yxhjhd
import com.app.ywms.rk.xhqrd.Yxhqrd
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.grails.datastore.mapping.query.Projections
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YfhtzdController {
    //注册pageId   UUID 去除“-”
    def billTypeCode='FH'
    def  _pageId=billTypeCode
    def  ref_pageId=billTypeCode+'Ref'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def yzmtdService
    def yfhtzdService
    def yonhandnumService

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
            instance= pubActionscriptService.runChangeScript(sourceBillTypeCode,billTypeCode,[data:keys,'businessKey':businessKey])
        }else {
             instance= new Yfhtzd(params)
            instance.businessType=PubBusinessType.get(businessKey);
        }

        instance.billTypeCode=billTypeCode
        instance.billtype=PubBilltype.findByBilltypecode(billTypeCode)

        instance.billdate=new Date()
        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)
        instance.maker=springSecurityService.currentUser
        instance.makeDate=new Date()
        [yfhtzdInstance: instance,pageId:_pageId]
    }



    def save(){
        JSONObject head = JSON.parse( URLDecoder.decode(params.head,'utf-8'))



        def mx = JSON.parse( URLDecoder.decode(params.mx,'utf-8'))


        Yfhtzd yfhtzdInstance

        if(head.id){//update
            yfhtzdInstance=Yfhtzd.get(head.id)
            bindData(yfhtzdInstance,head)


        }else{//save
            yfhtzdInstance=new Yfhtzd(head)
        }

//
        if (!yfhtzdInstance.validate()) {
            def _errors=[]
            g.eachError(bean: yfhtzdInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }


            def json=[validateerrors:_errors]

            render json as JSON
            return
        }





        if(mx==null){
            throw new BusinessException('明细数据不能为空!')
        }


         def _bodys=[]

        int row=0
        mx?.each {


                def body =  new Yfhtzdb()
                bindData(body,it)

                row++
                if(!body.validate()){

                    log.debug body.errors
                    def msg=""
                    g.eachError(bean: body){

                        msg += g.message(error: it)
                        msg +=  ';'
                    }

                    throw new BusinessException('行：'+row+','+msg)



                }
              _bodys<< body

        }




        yfhtzdService.save(yfhtzdInstance,_bodys)

        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'yfhtzd.label', default: 'Yfhtzd'), yfhtzdInstance.billno])
        render data as JSON
    }




    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def yfhtzdInstance = Yfhtzd.get(id)
        if (!yfhtzdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yfhtzd.label', default: 'Yfhtzd'), id])

        }

        [yfhtzdInstance: yfhtzdInstance,pageId:_pageId]
    }


    def show(String id) {
        def yfhtzdInstance = Yfhtzd.get(id)
        if (!yfhtzdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yfhtzd.label', default: 'Yfhtzd'), id])

        }

        [yfhtzdInstance: yfhtzdInstance,pageId:_pageId]
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {

        yfhtzdService.delete(id)
        render id

    }

    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId,billtypecode:billTypeCode])
    }


    /**
     * 查询
     * @return
     */
    def query(){
        println '0-0-0-0-0-'
        println(params)
        def yfhtzdInstanceLs
        def yfhtzdInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(Yfhtzd.createCriteria(),json)

            def cc=new CriteriaHelper(Yfhtzd.createCriteria(),json)


            def query= pubActionscriptService.runScript(billTypeCode,'query',[params:params,listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
            yfhtzdInstanceTotal = query.countQuery.count()

            yfhtzdInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO

        }else if (params.id){
            def yfhtzdInstanceInstance= Yfhtzd.get(params.id)
            def json= [rows: [yfhtzdInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(Yfhtzd.createCriteria())

            def cc=new CriteriaHelper(Yfhtzd.createCriteria())

            def query= pubActionscriptService.runScript(billTypeCode,'query',[params:params,listQuery:ch,countQuery:cc,targetBill:params.targetBill,loginCorp:corp,loginUser:springSecurityService.getCurrentUser()],0,null)
            yfhtzdInstanceTotal = query.countQuery.count()

            yfhtzdInstanceLs = query.listQuery.list(params,"billno",'desc') //TODO
        }





        def data = []
        yfhtzdInstanceLs?.each {
            data << it.part([defaultPart:true])
        }

        def json= [rows: data, total: yfhtzdInstanceTotal]
        render json as JSON
    }


    /**
     * 子表查询
     */
    def queryBody(String headId,String targetBill){


        // def bodys = YxhjhdB.findAllWhere(['head.id':headId])
        def dt= pubActionscriptService.runScript(billTypeCode,'queryBody',[headId:headId,criteria:new CriteriaHelper(Yfhtzdb.createCriteria()),targetBill:targetBill],0,null)
        def data=[data:dt]
        def rt= pubActionscriptService.runScript(billTypeCode,'queryBody',data,1,null)
        def json= [rows: rt]
        render json as JSON
    }

    def refPage(String businessKey){

        params.page_id=ref_pageId
        params.billTypeCode=billTypeCode
        return params
    }

    def check(String id){
        yfhtzdService.check(id)
        def rt=[remoteMessage:'审核成功！']
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id){
        yfhtzdService.uncheck(id)
        def rt = [remoteMessage:'弃审成功！']
        render rt as JSON
    }

    def refMX(String hw,String thdw,String headId,String businessType){


        if(headId){
            yfhtzdService.deleteMX(Yfhtzd.get(headId));
        }


      def list=  yzmtdService.queryCanUse(thdw,hw,businessType);
        def data=[]
        list?.each {
          // def qrd=  Yxhqrd.get(it.rk.sourceBid)
            def row=['billno':it.head.billno,'khtdh':it.head.khtdh,'hc':it.rk.hc,'hth':it.rk.ht.contractNo,'pc':it.rk.pc?:'',
            'max':it.bcsy-it.hxsl,
            'bcsy':0,'td.id':it.id,
            'gh':it.rk.gh.code
            ]

            data<< row
        }


        [data:data,pageId:_pageId]
    }


//    def refGH(String hw){
//
//        def corp=springSecurityService.authentication.loginCorp
//
//
//        def list =Yonhandnum.executeQuery("""select hd.gh.id as id,hd.gh.code as code, sum(sl) as sl,sum(lockNum) as lockNum from Yonhandnum hd
//where hd.bdCorp.id=? and hd.invmandoc.id=? group by hd.gh.id,hd.gh.code""",[corp,hw])
//
//        def data=[]
//        list?.each {
//            def row=[id:it[0],code:it[1],sl:it[2],lockNum:it[3]?:0,jhs:0,kyl:it[2]?:0-it[3]?:0]
//            data<<row
//        }
//
//
//
//        [data:data,pageId: _pageId]
//
//
//    }


    /**
     * 查询可以入库的车
     */
    def queryCanInCar(){
        def list=  Yfhtzd.createCriteria().list {
            or {
                eq('closed',false)
                isNull('closed')
            }
            ge('yxrq',new Date())
            isNotNull('checker')
            eq('bdCorp.id',springSecurityService.authentication.loginCorp)

            order('dateCreated')
        }
        def data=[]
        list?.each {
            data<< [id:it.id,carNo:it.ccm,zzjh:it.zzjh]
        }
        render view: 'jh', model: [data:data,pageId: _pageId]
    }

    def saveCarState(String keys){
        def cars=[]
        def _keys=keys.split(',')
        _keys?.each {
            println it
            def fhtzd=  Yfhtzd.get(it)
            fhtzd.zzjh=true
            fhtzd.save()

            cars<< fhtzd.ccm
        }

        render view: 'carNumFormate',model:  [remoteMessage:'叫号完成',cars:cars]

    }

    /**
     * 查找正在入库的车辆
     * @param keys
     * @return
     */
    def queryCarIning(String keys){
        def list=  Yfhtzd.createCriteria().list {

            not {
                eq('closed',true)
            }
            eq('zzjh',true)
            ge('yxrq',new Date())
            isNotNull('checker')
            eq('bdCorp.id',springSecurityService.authentication.loginCorp)

            order('dateCreated')
        }
        def data=[]
        list?.each {
            data<< it.ccm
        }

        render view: 'carNumFormate',model:  [remoteMessage:'叫号完成',cars:data]

    }

    /**
     * 打开单据
     */
    def openBIll(String id){
      yfhtzdService.openBill(id)
      render 'ok'
    }

    def closeBill(String id){
        yfhtzdService.closeBill(id)
        render 'ok'
    }


}
