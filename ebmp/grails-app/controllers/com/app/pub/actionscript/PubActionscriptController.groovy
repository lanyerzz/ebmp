package com.app.pub.actionscript

import com.app.pub.billtype.PubBilltype
import org.springframework.dao.DataIntegrityViolationException


import com.app.exception.BusinessException
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class PubActionscriptController {
    //注册pageId   UUID 去除“-”
    def static _pageId=randomUUID().toString().replaceAll('-','')
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def pubActionscriptService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pubActionscriptInstanceList: PubActionscript.list(params), pubActionscriptInstanceTotal: PubActionscript.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create() {
        [pubActionscriptInstance: new PubActionscript(params),pageId:_pageId]
    }

    def batch(){
        [pageId:_pageId]
    }

    def batchSave(){
        println params
        def billtype=PubBilltype.get( params['pubBilltype.id'])


        def path=billtype.billtypecode+'/rule/'

        if(params.beforeCreate=='on'){
           _save(billtype,path,'beforeCreate.groovy','beforeCreate','create',0,'')
        }

        if(params.afterCreate=='on'){

            _save(billtype,path,'afterCreate.groovy','afterCreate','create',1,'')

        }
        if(params.beforeQuery=='on'){
            _save(billtype,path,'beforeQuery.groovy','beforeQuery','query',0,"""
    import org.hibernate.criterion.Restrictions

def listQuery=binding.getVariable('listQuery')
def countQuery=binding.getVariable('countQuery')
def targetBill=binding.getVariable('targetBill')
def loginCorp=binding.getVariable('loginCorp')
def loginUser=binding.getVariable('loginUser')

if(targetBill=='xxxxx'){

}else {
    listQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
    countQuery.criteria.add(Restrictions.eq('bdCorp.id', loginCorp))
}

binding.setVariable('returnValue',[listQuery:listQuery,countQuery:countQuery])
    """)

        }
        if(params.afterQuery=='on'){
            _save(billtype,path,'afterQuery.groovy','afterQuery','query',1,'')
        }
        if(params.beforeSave=='on'){
            _save(billtype,path,'beforeSave.groovy','beforeSave','save',0,"""
import com.app.exception.BusinessException


def data=binding.getVariable('data')
//进行保存前处理

if(data.isAttached()){


    data.bodys.each{body->

        if (body.sourceBillCode=='xxxxx'){//来源是船舶到港单


        }
        binding.setVariable('returnValue',data);
    }


}else
    binding.setVariable('returnValue',data);
""")
        }
        if(params.afterSave=='on'){
            _save(billtype,path,'afterSave.groovy','afterSave','save',1,"""
import com.app.exception.BusinessException

def data=binding.getVariable('data')
//进行保存后处理
//def sourceBill=binding.getVariable('sourceBill')

data.bodys.each{

    if (it.sourceBillCode=='xxxx'){//来源是货源计划


        if(source.closed)
            throw new BusinessException('上游单据已经关闭！')

        source.closed=true
        source.save()
    }
}
binding.setVariable('returnValue',data);
""")
        }
        if(params.beforeDelete=='on'){
            _save(billtype,path,'beforeDelete.groovy','beforeDelete','delete',0,'')
        }
        if(params.afterDelete=='on'){
            _save(billtype,path,'afterDelete.groovy','afterDelete','delete',1,'')
        }
        if(params.beforeCheck=='on'){
            _save(billtype,path,'beforeCheck.groovy','beforeCheck','check',0,'')
        }
        if(params.afterCheck=='on'){
            _save(billtype,path,'afterCheck.groovy','afterCheck','check',1,'')
        }
        if(params.beforeUnCheck=='on'){
            _save(billtype,path,'beforeUnCheck.groovy','beforeUnCheck','uncheck',0,'')
        }
        if(params.afterUnCheck=='on'){
            _save(billtype,path,'afterUnCheck.groovy','afterUnCheck','uncheck',1,'')
        }

        if(params.beforeQueryBody=='on'){
            _save(billtype,path,'beforeQueryBody.groovy','beforeQueryBody','queryBody',0,"""
            import com.app.util.CriteriaHelper
import org.hibernate.criterion.Restrictions


def headId= binding.getVariable('headId')
CriteriaHelper criteria=binding.getVariable('criteria')
def targetBill=binding.getVariable('targetBill')



def returnValue= criteria.criteria.add(Restrictions.eq('head.id',headId)).list()
binding.setVariable('returnValue',returnValue)
        """)
        }

        if(params.afterQueryBody=='on'){
            _save(billtype,path,'afterQueryBody.groovy','afterQueryBody','queryBody',1,"""
            def data=binding.getVariable('data')
    def rtdata=[]
    data.each {

        def mp=it.part([defaultPart:true])
        rtdata<<mp
    }

    binding.setVariable('returnValue',rtdata)
        """)
        }

        def json=[:]
        json.remoteMessage='操作成功！'
        render json as JSON
    }

    private void _save(billtype,path,filename,scriptName,scriptCode,at,content){
        def pubActionscriptInstance = new PubActionscript()
        pubActionscriptInstance.pubBilltype=billtype
        pubActionscriptInstance.path=path+filename
        pubActionscriptInstance.actionType=at
        pubActionscriptInstance.scriptName=scriptName
        pubActionscriptInstance.scriptCode=scriptCode

        if (!pubActionscriptInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubActionscriptInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }


            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        pubActionscriptService.saveScript(pubActionscriptInstance.id,content,servletContext.getRealPath(""))
    }

/**
 * 保存
 * @return
 */
    def save() {
        def pubActionscriptInstance = new PubActionscript(params)

        def path=pubActionscriptInstance.pubBilltype.billtypecode+'/rule/'
        pubActionscriptInstance.path=path
        if (!pubActionscriptInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubActionscriptInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
//            def err=     g.renderErrors(bean: smFunctionInstance)
//            println err

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        def data=[:]
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'pubActionscript.label', default: 'PubActionscript'), pubActionscriptInstance.id])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def pubActionscriptInstance = PubActionscript.get(id)
        if (!pubActionscriptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubActionscript.label', default: 'PubActionscript'), id])
            redirect(action: "list")
            return
        }

        [pubActionscriptInstance: pubActionscriptInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def pubActionscriptInstance = PubActionscript.get(id)
        if (!pubActionscriptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubActionscript.label', default: 'PubActionscript'), id])

        }

        [pubActionscriptInstance: pubActionscriptInstance,pageId:_pageId]
    }


    /**
     * 更新
     * @param id
     * @param version
     * @return
     */
    def update(String id, Long version) {
        println params
        def pubActionscriptInstance = PubActionscript.get(id)
        if (!pubActionscriptInstance) {

            def json= [remoteErrors: message(code: 'default.not.found.message', args: [message(code: 'pubActionscript.label')])]
            render json as JSON
            return
        }

        if (version != null) {
            if (pubActionscriptInstance.version > version) {
                def msg= message("version", "default.optimistic.locking.failure",
                        [message(code: 'pubActionscript.label', default: 'PubActionscript')] as Object[],
                        "Another user has updated this PubActionscript while you were editing")
                def json=[remoteErrors:msg]
                render json as JSON
                return
            }
        }

        pubActionscriptInstance.properties = params

        if (!pubActionscriptInstance.save(flush: true)) {
            def _errors=[]
            g.eachError(bean: pubActionscriptInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }
            def json=[validateerrors: _errors]
            render  json as JSON
        }

        def data=[:]
        def message = message(code: 'default.updated.message', args: [message(code: 'pubActionscript.label', default: 'PubActionscript'), pubActionscriptInstance.id])

        data.remoteMessage=message
        render data as JSON
    }


    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {
        def pubActionscriptInstance = PubActionscript.get(id)
        if (!pubActionscriptInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        pubActionscriptInstance.delete(flush: true)
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

        def pubActionscriptInstanceLs
        def pubActionscriptInstanceTotal
        def corp = springSecurityService.authentication.loginCorp
        if (params.queryParams){
            def json=JSON.parse( URLDecoder.decode(params.queryParams,'utf-8'))

            CriteriaHelper ch = new CriteriaHelper(PubActionscript.createCriteria(),json)
            def cc=new CriteriaHelper(PubActionscript.createCriteria(),json)
            pubActionscriptInstanceTotal = cc.count()

            pubActionscriptInstanceLs = ch.list(params,"scriptCode")
        }else if (params.q!=null){
            def sjson="""{'operator':'or',
                        'criterias':[
                                    {'operator':'contains','fieldName':'scriptCode','value':'${params.q}'},
                                    {'operator':'contains','fieldName':'scriptName','value':'${params.q}'}
                                    ]
                        }"""


            def json=JSON.parse(sjson);

            CriteriaHelper ch = new CriteriaHelper(PubActionscript.createCriteria(),json)
            def cc=new CriteriaHelper(PubActionscript.createCriteria(),json)
            pubActionscriptInstanceTotal = cc.count()

            pubActionscriptInstanceLs = ch.list(params,"scriptCode")

        }else if (params.id){
            def pubActionscriptInstanceInstance= PubActionscript.get(params.id)
            def json= [rows: [pubActionscriptInstanceInstance], total: 1]
            render json as JSON
            return;
        }
        else{

            CriteriaHelper ch = new CriteriaHelper(PubActionscript.createCriteria())
            def cc=new CriteriaHelper(PubActionscript.createCriteria())
            pubActionscriptInstanceTotal = cc.count()

            pubActionscriptInstanceLs = ch.list(params,"scriptCode")
        }





        def data = []
        pubActionscriptInstanceLs?.each {
            Map row = it.part()
            row['pubBilltype.billtypename'] = it?.pubBilltype?.billtypename
            data << row
        }

        def json= [rows: data, total: pubActionscriptInstanceTotal]
        render json as JSON
    }

    /**
     * 编辑脚本文件
     * @param id
     */
    def editScript(String id){
       def sc= pubActionscriptService.getScriptFile(id,servletContext.getRealPath(""))
        ['id':id,script:sc,pageId:_pageId]

    }

    /**
     * 保存脚本文件
     * @param id
     * @return
     */
    def saveScript(String id){

         pubActionscriptService.saveScript(id,params.scriptFile)
        def rt=[remoteMessage:'保存完成！']
        render rt  as JSON
    }

}
