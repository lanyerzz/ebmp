package com.app.sm.distribution


import com.app.sm.function.SmFunction
import com.app.sm.roles.SmRoles
import com.app.sm.roles.SmRolesCorpFunction
import grails.converters.JSON

import static java.util.UUID.randomUUID

class SmDistributionController {
    def static _pageId=randomUUID().toString().replaceAll('-','')
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        [pageId:_pageId]
    }

    def list(){
        [pageId:_pageId]
    }

    /**
     *
     */
    def loadRoleAndCorp(String id){

        if(!id){//加载角色
           def ls= SmRoles.listOrderByRoleCode()
            def data=[]
            ls.each {
                def node =  [id:it?.id,text:it?.roleName,state:'closed']
               data<<node
            }
            render data as JSON
            return
        }else{//加载角色下的公司
            def role=SmRoles.get(id)
            if (!role){
                def json=[remoteErrors:'指定的角色未找到！']
                render json as JSON
                return
            }
            def data=[]
            role?.corp?.each {
                def node =  [id:it?.id,text:it?.unitName]
                data<<node
            }
            render data as JSON
            return

        }
    }



    def loadFunction(map,f,data,keys,parent){
        f?.each{
            def node =  [id:it?.id,text:it?.funName,checked:keys?.contains(it?.id),children:[]]

            data << node
            if (parent)
                parent.checked=false
            loadFunction(map,map[node?.id],node.children,keys,node)
        }
    }
    def loadFunctionNoId(map,f,data){
        f?.each{
            def node =  [id:it?.id,text:it?.funName,children:[]]
            data << node
            loadFunctionNoId(map,map[node?.id],node.children)
        }
    }

    def queryFunction(){
        println params
        def corpid=params.corpid
        def roleid=params.roleid
        //def ps=SmRolesCorpFunction.list(['bdCorp.id':corpid,'smRoles.id':roleid])

        def functions = SmFunction.listOrderByFunCode()
        def fatherfunctions = [:]
        functions.each {
            if(fatherfunctions[it.parentId]){
                fatherfunctions[it.parentId] << it.part()
            }else{
                fatherfunctions[it.parentId] = []
                fatherfunctions[it.parentId] << it.part()
            }
        }

        if (roleid){

            def rf = SmRolesCorpFunction.executeQuery('from SmRolesCorpFunction where smRoles.id=? and bdCorp.id=?',[roleid,corpid])

            def keys = new TreeSet<String>()

            rf.each {

                keys.add(it?.smFunction.id)
            }

            def f = fatherfunctions['0']
            def data = []
            loadFunction(fatherfunctions,f,data,keys,null)

            render data as JSON
        }else{
            def f = fatherfunctions['0']

            def data = []
            loadFunctionNoId(fatherfunctions,f,data)

            render data as JSON
        }



    }


    def linkFunction(){

        def _id = params.roleid
        String key = params.key
        def keys = key.split('[,]')
        SmRoles role = SmRoles.get(_id)
        SmRolesCorpFunction.executeUpdate('delete SmRolesCorpFunction sr where sr.smRoles.id=? and sr.bdCorp.id=?',[_id,params.corpid])
        for(i in 0..<keys.size()){

            role.addToFunction(['bdCorp.id':params.corpid,'smFunction.id':keys[i],'smRoles.id':params.roleid])
        }
        role.save(flush: true)

        springSecurityService.clearCachedRequestmaps()
        def data = [remoteMessage:'分配成功！']
        render data as JSON
    }
}
