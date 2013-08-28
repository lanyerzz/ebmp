package com.app.ywms.ck.gbd




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.billtype.PubBilltype
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import com.app.ywms.ck.fhtzd.Yfhtzd
import com.app.ywms.ck.fhtzd.Yfhtzdb
import com.app.ywms.ck.zmtd.Yzmtdb
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class YoutGbdController {
    //注册pageId   UUID 去除“-”
    def billTypeCode='GBC'
    def  _pageId=billTypeCode
    def  ref_pageId=billTypeCode+'Ref'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def youtGbdService
    def index() {
        [pageId:_pageId,billTypeCode:billTypeCode]
    }


    /**
     * 进入添加页面
     * @return
     */
    def create(String keys,String businessKey,String sourceBillTypeCode) {
        YoutGbd instance
        if(sourceBillTypeCode){
            instance= pubActionscriptService.runChangeScript(sourceBillTypeCode,billTypeCode,[data:keys.split(','),'businessKey':businessKey])

        }else {
            instance= new YoutGbd(params)

        }
        if(businessKey){
            instance.businessType=PubBusinessType.get(businessKey);
        }

        instance.billdate=new Date()
        instance.billTypeCode=billTypeCode
        instance.billtype=PubBilltype.findByBilltypecode(billTypeCode)
        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)
        instance.maker=springSecurityService.currentUser
        instance.makeDate=new Date()


       def bodys= this.transBodys(instance.bodys)
        [youtGbdInstance: instance,pageId:_pageId,bodys:bodys]
    }


    private transBodys( bodys){

        def json=[]
        bodys.each {
            def row=it.part([defaultPart: true])
            Yfhtzdb tzd= Yfhtzdb.get(it.sourceBid)
            if(it.outnum!=0)
                row.max=tzd.td.bcsy-tzd.td.hxsl+it.outnum
            else
                row.max=tzd.td.bcsy-tzd.td.hxsl+tzd.bcsy
            json<<row
        }

        return  json
    }


    def save(){

        JSONObject head = JSON.parse(params.head)



        def bodys = JSON.parse(params.bodys)



        YoutGbd youtGbdInstance

        if(head.id){//update
            youtGbdInstance=YoutGbd.get(head.id)
            bindData(youtGbdInstance,head)


        }else{//save
            youtGbdInstance=new YoutGbd(head)
        }

//
        if (!youtGbdInstance.validate()) {
            def _errors=[]
            g.eachError(bean: youtGbdInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }


            def json=[validateerrors:_errors]

            render json as JSON
            return
        }


        if(bodys == null){
            throw new BusinessException('表体数据不能为空!')
        }



        int row=0
        bodys?.each {
            def body = new YoutGbdDetail(it)
//            bindData(body,it)
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
            youtGbdInstance.addToBodys( body)
        }




        youtGbdService.save(youtGbdInstance)

        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'youtGbd.label', default: 'YoutGbd'), youtGbdInstance.billno])
        render data as JSON
    }





    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def youtGbdInstance = YoutGbd.get(id)
        if (!youtGbdInstance) {
            def data=[:]
            data.remoteMessage =message(code: 'default.not.found.message', args: [message(code: 'youtGbd.label', default: 'YoutGbd'), id])

            render data as JSON
        }

        [youtGbdInstance: youtGbdInstance,pageId:_pageId]
    }

    def show(String id) {
        def youtGbdInstance = YoutGbd.get(id)
        if (!youtGbdInstance) {
            def data=[:]
            data.remoteMessage =message(code: 'default.not.found.message', args: [message(code: 'youtGbd.label', default: 'YoutGbd'), id])

            render data as JSON
        }

        [youtGbdInstance: youtGbdInstance,pageId:_pageId]
    }


    def queryBody(String headId){
      def ls=  YoutGbdDetail.executeQuery('from YoutGbdDetail where head.id=?',[headId])
      def json=  transBodys(ls)

        render json as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {

        youtGbdService.delete(id)
        def rt=[remoteMessage:'删除成功！']
        render rt as JSON

    }

    def createQuery(){
        render(view: 'query',model:  [pageId:_pageId,billTypeCode:billTypeCode])
    }

    /**
     * 查询
     * @return
     */
    def query(){

        def youtGbdInstanceLs
        def youtGbdInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(YoutGbd.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(YoutGbd.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            youtGbdInstanceTotal = cc.count()

            youtGbdInstanceLs = ch.list(params,"billno",'desc') //TODO
        }else if (params.id){
            def youtGbdInstanceInstance= YoutGbd.get(params.id)
            def json= [rows: [youtGbdInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(YoutGbd.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(YoutGbd.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            youtGbdInstanceTotal = cc.count()

            youtGbdInstanceLs = ch.list(params,"billno",'desc')//TODO
        }





        def data = []
        youtGbdInstanceLs?.each {
            def row=it.part([defaultPart:true])
            row['cph']=it.tzd.ccm
            row['hw']=it.tzd.hw.name
            row['invspec']=it.tzd.hw.pkInvbasdoc.invspec
            row['invtype']=it.tzd.hw.pkInvbasdoc.invtype
            row['thdw']=it.tzd?.thdw?.pkCubasdoc?.custname
            row['tzsl']=it.tzd?.tzsl
            data << row
        }

        def json= [rows: data, total: youtGbdInstanceTotal]
        render json as JSON
    }



    def refPage(String businessKey){
        [pageId:ref_pageId,handler:params.handler,'businessKey':businessKey]
    }

    def check(String id){

        youtGbdService.check(id)
        def rt=[remoteMessage:'审核成功！']
        render rt as JSON
    }

    /**
     * 弃审
     * @param id
     */
    def uncheck(String id){

        youtGbdService.uncheck(id)
        def rt = [remoteMessage:'弃审成功！',data:[checker:[userRealName:''],'checkDate':'']]
        render rt as JSON
    }




}
