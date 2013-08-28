package com.app.util
import org.codehaus.groovy.grails.web.json.JSONArray;
import org.codehaus.groovy.grails.web.json.JSONObject;

import grails.converters.JSON;
class XJSON {
	public static def parseJSONObject(Map params,json){


        while (true){
            if (params.operator){
                json=[operator:params.operator,criterias:[]];
                params.remove(params.operator)
                parseJSONObject(params,json)
            }else{

            }

        }
	
			return json
			
	}
	

}
