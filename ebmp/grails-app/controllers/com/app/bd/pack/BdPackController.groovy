package com.app.bd.pack




import com.app.bd.corp.BdCorp
import com.app.exception.BusinessException
import com.app.pub.businesstype.PubBusinessType
import com.app.util.CriteriaHelper
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.criterion.Restrictions

import static java.util.UUID.randomUUID
class BdPackController {
    //注册pageId   UUID 去除“-”
    def static _pageId='BdPack'
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bdPackInstanceList: BdPack.list(params), bdPackInstanceTotal: BdPack.count()]
    }

    /**
     * 进入添加页面
     * @return
     */
    def create(String pid) {
        def instance= new BdPack(params)
        instance.pid=pid?:'0'
        instance.bdCorp=BdCorp.get(springSecurityService.authentication.loginCorp)

        [bdPackInstance: instance,pageId:_pageId]
    }




/**
 * 保存
 * @return
 */
    def save() {

         JSONObject head = JSON.parse( URLDecoder.decode(params.head,'utf-8'))
        def bodys = JSON.parse( URLDecoder.decode(params.bodys,'utf-8'))

        println URLDecoder.decode(params.bodys,'utf-8')
        BdPack bdPackInstance
        if(head.id){//update
             bdPackInstance=BdPack.get(head.id)
            bindData(bdPackInstance,head)

        }else{//save
             bdPackInstance = new BdPack(head)

        }


        if (!bdPackInstance.validate()) {
            def _errors=[]
            g.eachError(bean: bdPackInstance){
                println it
                _errors << [ field:it.field,  message:g.message(error: it)]

            }

            def json=[validateerrors:_errors]

            render json as JSON
            return
        }

        int row=0
        bodys?.each {
            row ++

            if(it.isDeleted){
                def _id=it.id

               def b =bdPackInstance.bodys.find {it.id==_id}
                bdPackInstance.removeFromBodys(b)
            }else{
                def body=BdPackInfo.findOrCreateById(it.id?:'none')

                bindData(body,it)

                if(!body.validate()){
                    def msg
                    g.eachError(bean: body){

                        msg << g.message(error: it)
                        println msg
                    }

                    throw new BusinessException('行：'+row+','+msg)
                }

                bdPackInstance.addToBodys(body)
            }
            }




        bdPackInstance.save()

        def data=bdPackInstance.part()
        data.remoteMessage = message(code: 'default.created.message', args: [message(code: 'bdPack.label', default: 'BdPack'), bdPackInstance.code])
        render data as JSON
    }

    /**
     * 显示
     * @param id
     * @return
     */
    def show(String id) {
        def bdPackInstance = BdPack.get(id)
        if (!bdPackInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPack.label', default: 'BdPack'), id])
            redirect(action: "list")
            return
        }

        [bdPackInstance: bdPackInstance]
    }


    /**
     * 进入编辑页面
     * @param id
     * @return
     */
    def edit(String id) {
        def bdPackInstance = BdPack.get(id)
        if (!bdPackInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bdPack.label', default: 'BdPack'), id])

        }

        [bdPackInstance: bdPackInstance,pageId:_pageId]
    }




    /**
     * 删除
     * @param id
     * @return
     */
    def delete(String id) {

        def count=BdPack.countByPid(id)
        if(count){
            throw new BusinessException('存在子节点，不允许删除！')
        }

        def bdPackInstance = BdPack.get(id)
        if (!bdPackInstance) {
            throw new BusinessException('未找到要删除的数据!')
        }
        bdPackInstance.delete(flush: true)
        render id

    }





    def queryTree(String id){
        if(id){
          def data=  BdPack.findAllByPid(id,[sort:'code'])

            def json=[]

            data?.each {
                def row= it.part([defaultPart:true])

                if (BdPack.countBypid(it.id)!=0){
                    row.state = 'closed'
                }

                json<< row
            }

            render json as JSON
            return
        }else{
            def data=  BdPack.findAllByPid('0',[sort:'code'])
            def json=[]

            data?.each {
                def row= it.part([defaultPart:true])

                if (BdPack.countBypid(it.id)!=0){
                    row.state = 'closed'
                }

                json<< row
            }

            render json as JSON
            return
        }
    }


    def queryBody(String id){
       def data= BdPackInfo.executeQuery("from BdPackInfo where head.id=?",[id])

        def json=[]
        data?.each {
            json<<it.part([defaultPart: true])
        }

        render ([rows:json] as JSON)
    }

}
