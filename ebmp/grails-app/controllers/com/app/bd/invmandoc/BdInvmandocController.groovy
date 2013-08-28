package com.app.bd.invmandoc

import com.app.bd.corp.BdCorp
import com.app.bd.invcl.BdInvcl
import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import grails.web.JSONBuilder
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID

/**
 *
 */
class BdInvmandocController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdInvmandoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdInvmandocInstanceList: BdInvmandoc.list(params), bdInvmandocInstanceTotal: BdInvmandoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {

        [bdInvmandocInstance: new BdInvmandoc(params),pageId:_pageId]
    }

    /**
     * 保存
     * @return
     */
    def save() {

        def bdInvmandocInstance = new BdInvmandoc(params)
        if (!bdInvmandocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdInvmandocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdInvmandocInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdInvmandoc.label', default: 'BdInvmandoc'), bdInvmandocInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdInvmandocInstance = BdInvmandoc.get(id)
        if (!bdInvmandocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdInvmandoc.label', default: 'BdInvmandoc'), id])
            redirect(action: "list")
            return
        }

        [bdInvmandocInstance: bdInvmandocInstance]
    }

    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdInvmandocInstance = BdInvmandoc.get(id)
        if (!bdInvmandocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdInvmandoc.label', default: 'BdInvmandoc'), id])

        }

        [bdInvmandocInstance: bdInvmandocInstance,pageId:_pageId]
    }

    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {

        def bdInvmandocInstance = BdInvmandoc.get(id)
        if (!bdInvmandocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdInvmandoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdInvmandocInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                          [message(code: 'bdInvmandoc.label', default: 'BdInvmandoc')] as Object[],
                          "Another user has updated this BdInvmandoc while you were editing")
                def josn=[remoteErrors:msg]
                render josn as JSON
                return
            }
        }
        def modifier = springSecurityService.currentUser
        params.modifier = modifier
        bdInvmandocInstance.properties = params

        if (!bdInvmandocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdInvmandocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdInvmandoc.label', default: 'BdInvmandoc'), bdInvmandocInstance.id])
        def data= bdInvmandocInstance.part()
        data.remoteMessage=message
        render data as JSON
    }

    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdInvmandocInstance = BdInvmandoc.get(id)
        if (!bdInvmandocInstance) {
           throw new BusinessException('未找到要删除的数据!')
        }
        bdInvmandocInstance.delete(flush: true)
        render id

    }

    /**
     * 查询存货分类
     * @param id
     * @return
     */
    def queryTree(String id){
        List bdInvclInstances
        if (id){
            bdInvclInstances = BdInvcl.findAllByPid(id,[sort:'invclassCode'])
        }else{
            bdInvclInstances = BdInvcl.findAllByPid('0',[sort:'invclassCode'])
        }
        def data = []
        bdInvclInstances?.each {
            def row = [:]
            row = [id:it.id,text:it.invclassName]
            if (BdInvcl.countByPid(it.id)!=0){
                row.state = 'closed'
            }
            data << row
        }
        render data as JSON

    }

    def query(String pkInvcl){
        def data = []
        def corp = springSecurityService.authentication.loginCorp
        if (pkInvcl){
            List bdInvmandocInstances
            bdInvmandocInstances = BdInvmandoc.findAll('from BdInvmandoc as b where b.pkCorp.id=? and b.pkInvbasdoc.pkInvcl.id=?',[corp,pkInvcl],CriteriaHelper.pageMap(params))
            bdInvmandocInstances?.each {
                Map row = it.part([defaultPart:true])
                row['pkInvbasdoc'] = it.pkInvbasdoc?.part([defaultPart: true])
                data << row

            }
            int count=BdInvmandoc.executeQuery('select count(*) from BdInvmandoc as b where b.pkCorp.id=? and b.pkInvbasdoc.pkInvcl.id=?',[corp,pkInvcl])[0]

            def json=[rows:data,count:count]
            render data as JSON
        }else{
            render data as JSON
        }
    }


    def query1(){

        def corp = springSecurityService.authentication.loginCorp
        def datas
        def count
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdInvmandoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc = new CriteriaHelper(BdInvmandoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
             count=cc.count()

            datas = ch.list(params,"pkInvbasdoc.invcode")
        }else if (params.q!=null){
            JSONBuilder json=new  JSONBuilder()
            json.build {
                or{
                    criterias{[
                            {operator:'operator'
                                fieldName:'pkInvbasdoc.invcode'
                                value:params.q
                            },
                            {operator:'operator'
                                fieldName:'pkInvbasdoc.invname'
                                value:params.q
                            }

                            ]
                    }
                }
            }



            //def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdInvmandoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            def cc = new CriteriaHelper(BdInvmandoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('pkCorp.id', corp))
            count=cc.count()
            datas = ch.list(params,"pkInvbasdoc.invcode")

        }else if (params.id){

            def invmandoc= BdInvmandoc.get(params.id)
  
            count=1
            datas=[invmandoc]

        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdInvmandoc.createCriteria())
            ch.criteria.add(Restrictions.eq('pkCorp.id', corp))
            count = new CriteriaHelper(BdInvmandoc.createCriteria()).count()

            datas = ch.list(params,"pkInvbasdoc.invcode")
        }



        //执行动作后脚本
        def dt=[data:datas,type:'default']
       def data= pubActionscriptService.runScript('INVM','query1',dt,1,null)
        //println data
        def json= [rows: data, total: count]
       render json as JSON
    }

}
