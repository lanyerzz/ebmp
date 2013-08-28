package com.app.bd.psnbasdoc

import com.app.bd.corp.BdCorp
import com.app.bd.deptdoc.BdDeptdoc
import com.app.bd.psndoc.BdPsndoc
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class BdPsnbasdocController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdPsnbasdoc'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdPsnbasdocInstanceList: BdPsnbasdoc.list(params), bdPsnbasdocInstanceTotal: BdPsnbasdoc.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [bdPsnbasdocInstance: new BdPsnbasdoc(params),pageId:_pageId]
    }

/**
 * 保存
 * @return
 */
    def save() {
        def pkCorp = springSecurityService.authentication.loginCorp
        def corp = BdCorp.get(pkCorp)
        def bdPsnbasdocInstance = new BdPsnbasdoc(params)
        bdPsnbasdocInstance.bdCorp = corp
        if (!bdPsnbasdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdPsnbasdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=bdPsnbasdocInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc'), bdPsnbasdocInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdPsnbasdocInstance = BdPsnbasdoc.get(id)
        if (!bdPsnbasdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc'), id])
            redirect(action: "list")
            return
        }

        [bdPsnbasdocInstance: bdPsnbasdocInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdPsnbasdocInstance = BdPsnbasdoc.get(id)
        if (!bdPsnbasdocInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc'), id])

        }

        [bdPsnbasdocInstance: bdPsnbasdocInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        def bdPsnbasdocInstance = BdPsnbasdoc.get(id)
        if (!bdPsnbasdocInstance) {

            def json= [validateerrors: message(code: 'default.not.found.message', args: [message(code: 'bdPsnbasdoc.label', default: '功能节点')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (bdPsnbasdocInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc')] as Object[],
                        "Another user has updated this BdPsnbasdoc while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        bdPsnbasdocInstance.properties = params

        if (!bdPsnbasdocInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: bdPsnbasdocInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }
        def message = message(code: 'default.updated.message', args: [message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc'), bdPsnbasdocInstance.id])
        def data= bdPsnbasdocInstance.part()
        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def bdPsnbasdocInstance = BdPsnbasdoc.get(id)
        if (!bdPsnbasdocInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdPsnbasdocInstance.delete(flush: true)
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

        def bdPsnbasdocInstanceLs
        def bdPsnbasdocInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(BdPsnbasdoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdPsnbasdoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdPsnbasdocInstanceTotal = cc.count()

            bdPsnbasdocInstanceLs = ch.list(params,"name")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'name','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'shenfenzhenghao','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(BdPsnbasdoc.createCriteria(),json)
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdPsnbasdoc.createCriteria(),json)
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdPsnbasdocInstanceTotal = cc.count()

            bdPsnbasdocInstanceLs = ch.list(params,"name")

        }else if (params.id){
            def bdPsnbasdocInstanceInstance= BdPsnbasdoc.get(params.id)
            def json= [rows: [bdPsnbasdocInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(BdPsnbasdoc.createCriteria())
            ch.criteria.add(Restrictions.eq('bdCorp.id', corp))
            def cc=new CriteriaHelper(BdPsnbasdoc.createCriteria())
            cc.criteria.add(Restrictions.eq('bdCorp.id', corp))
            bdPsnbasdocInstanceTotal = cc.count()

            bdPsnbasdocInstanceLs = ch.list(params,"name")
        }





        def data = []
        bdPsnbasdocInstanceLs?.each {
            Map row = it.part()
            row['bdCorp.unitName'] = it?.bdCorp?.unitName
            data << row
        }
        def json= [rows: data, total: bdPsnbasdocInstanceTotal]
        render json as JSON
    }

    def openAllotDlg(String basId){

        def ls= BdDeptdoc.listOrderByDeptCode()
        def father = [:]
        ls?.each{
            if(father[it.fatherId]){
                father[it.fatherId] << it.part()
            }else{
                father[it.fatherId] = []
                father[it.fatherId] << it.part()
            }
        }
        if(basId){
            def psnbasdoc = BdPsnbasdoc.get(basId)
            def psndocs = BdPsndoc.findAllByBdPsnbasdoc(psnbasdoc)
            def keys = new TreeSet<String>()

            psndocs.each {

                keys.add(it?.bdDeptdoc.id)
            }
            def f = father['0']
            def data = []
            loadDept(father,f,data,keys,null)
            render view: 'allotDlg',model: [data:data,pageId:_pageId]
        }else{
            def f = father['0']

            def data = []
            loadDeptNoId(father,f,data)

            render view: 'allotDlg',model: [data:data,pageId:_pageId]
        }


    }

    def loadDept(map,f,data,keys,parent){
        f?.each{
            def node =  [id:it?.id,text:it?.deptName,checked:keys?.contains(it?.id),children:[]]

            data << node
            if (parent)
                parent.checked=false
            loadDept(map,map[node?.id],node.children,keys,node)
        }
    }
    def loadDeptNoId(map,f,data){
        f?.each{
            def node =  [id:it?.id,text:it?.deptName,children:[]]
            data << node
            loadDeptNoId(map,map[node?.id],node.children)
        }
    }

    def linkPsnbasdoc(){
        def _id = params.basId
        String key = params.key
        def keys = key.split('[,]')
        BdPsnbasdoc psnbasdoc = BdPsnbasdoc.get(_id)
        BdPsndoc.executeQuery('delete from BdPsndocBdDeptdoc as bb where bb.bdPsndoc.id = (select id from BdPsndoc psn where psn.bdPsnbasdoc.id=?)',[psnbasdoc.id])
        for(i in 0..<key.size()){
            BdPsndoc.findOrSaveWhere(bdDeptdoc: it)
        }


    }

}
