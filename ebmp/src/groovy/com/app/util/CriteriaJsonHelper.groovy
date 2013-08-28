package com.app.util

import org.codehaus.groovy.grails.web.json.JSONElement
import org.codehaus.groovy.grails.web.json.JSONObject;

import grails.converters.JSON

class CriteriaJsonHelper {


    //[_componentId:isc_UIListGrid_1, _operationType:fetch, isc_dataFormat:json, _startRow:0, pkInvbasdoc.invcode:ddddd, pkInvbasdoc:[invcode:ddddd], _endRow:75,
    // _dataSource:isc_UIRestDataSource_1_1, _textMatchStyle:substring, isc_metaDataPrefix:_, action:query, controller:bdInvmandoc]
public static def toCriteriaJson( param,ep){
	
	if(param.jsonData) { 
	 def json=	JSON.parse(param.jsonData)
		addCriteriaJson(json,ep)
		return json
		}else if(param.criteria){
			def json= JSON.parse("{criteria:${param.criteria},operator:${param.operator}}")
			addCriteriaJson(json,ep)
			return json
		}else{
			def json= JSON.parse("{criteria:[],operator:and}")
			addCriteriaJson(json,ep)
			return json
		}
	
	
	
}

//{"fieldName":"pkInvbasdoc/pkInvcl.id","operator":"equals","value":"xx"}
public static def addCriteriaJson(json,ep){
	def criteria
		if(json.criteria instanceof org.codehaus.groovy.grails.web.json.JSONObject){
			criteria=[]
			criteria <<json.criteria
		}else{
		criteria=json.criteria
		}
	
	ep?.each {
		JSONObject obj=new JSONObject()
		obj.fieldName=it.fieldName
		obj.value=it.value
		obj.operator=it.operator?:'equals'
		
		criteria << obj
	}
	json.criteria=criteria
	}



}
