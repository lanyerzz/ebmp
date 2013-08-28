package com.app.sv.sm

import com.app.bd.corp.BdCorp
import com.app.dto.TDTO
import com.app.exception.BusinessException
import com.app.sm.function.SmFunction
import com.app.sm.userinterface.SmUserinterface

class SmUserinterfaceService {
	def springSecurityService
	def query(){
		def loginCorp = springSecurityService.getAuthentication().loginCorp
		def loginUser = springSecurityService.currentUser.id
		def sf = SmUserinterface.findAllWhere('corp.id':loginCorp,'user.id':loginUser)

		return sf
	}
	
	def save(params){
		def functionId = params.functionId
		def loginCorp = springSecurityService.getAuthentication().loginCorp
		def loginUser = springSecurityService.currentUser
		SmUserinterface sui =  new SmUserinterface()
		sui.user=loginUser
        def corp=new BdCorp()
        corp.id=loginCorp
		sui.corp=BdCorp.get(loginCorp)

		sui.function=SmFunction.get(functionId)


		if(sui.validate()){
			sui.save()
			return sui
		}else{
			throw new BusinessException('节点已经存在自定义菜单中!')
		}
	}
   
	def deleteByFunction(_id){

        def loginCorp = springSecurityService.getAuthentication().loginCorp
        def loginUser = springSecurityService.currentUser.id

		def user= SmUserinterface.findWhere('corp.id':loginCorp,'user.id':loginUser,'function.id':_id)

		user?.delete()
	}
}
