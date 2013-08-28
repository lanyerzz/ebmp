package com.app.sm.userinterface


import grails.converters.JSON;


class SmUserinterfaceController {
	def springSecurityService
	def smUserinterfaceService
	def query(){
		def data = smUserinterfaceService.query()
        def json=[]
        data.each {
            json<<[id:it.function.id,text:it.function.funName,attributes:[url:"${createLink(controller:it.function.smcontroller ,action:it.function.smaction)}/${it.function.id}"]]

        }

        render json as JSON
				
	}
	
	def save(){
		def params = params
		def sui = smUserinterfaceService.save(params)
       def json=[id:sui.function.id,text:sui.function.funName,attributes:[url:"${createLink(controller:sui.function.smcontroller ,action:sui.function.smaction)}"]]

        render json as JSON
	}
	
	def delete(){
		def _id = params.id
		smUserinterfaceService.deleteByFunction(_id)
		render params.id
		
		
	}
	
	
}
