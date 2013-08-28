/* Copyright 2006-2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.codehaus.groovy.grails.plugins.springsecurity

import com.app.sm.roles.SmRolesCorpFunction
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.codehaus.groovy.grails.commons.GrailsApplication
/**
 * Helper methods in Groovy.
 *
 * @author <a href='mailto:burt@burtbeckwith.com'>Burt Beckwith</a>
 */
class ReflectionUtils {

	// set at startup
	static GrailsApplication application

	private ReflectionUtils() {
		// static only
	}

	static getConfigProperty(String name) {
		def value = SpringSecurityUtils.securityConfig
		for (String part in name.split('\\.')) {
			value = value."$part"
		}
		value
	}

	static void setConfigProperty(String name, value) {
		def config = SpringSecurityUtils.securityConfig
		def parts = name.split('\\.') as List
		name = parts.remove(parts.size() - 1)

		for (String part in parts) {
			config = config."$part"
		}

		config."$name" = value
	}

	static String getRoleAuthority(role) {
		lookupPropertyValue role, 'authority.nameField'
	}

	static String getRequestmapUrl(requestmap) {
		lookupPropertyValue requestmap, 'requestMap.urlField'
	}

	static String getRequestmapConfigAttribute(requestmap) {
		lookupPropertyValue requestmap, 'requestMap.configAttributeField'
	}

	static List loadAllRequestmaps() {
		String requestMapClassName = SpringSecurityUtils.securityConfig.requestMap.className
		def Requestmap = getApplication().getClassForName(requestMapClassName)
		if (!Requestmap) {
			throw new IllegalStateException(
					'Cannot load Requestmaps, "requestMap.className" property is not set')
		}
		def rtMap=[]//Requestmap.listAll()
		def interceptUrlMap= SpringSecurityUtils.securityConfig.interceptUrlMap
		
		interceptUrlMap.each {k,v->
		
			def f=Requestmap.newInstance()
			f.url=k
			def cg=''
			v.each {
				cg+=( it)
			}
			f.configAttribute=cg
			rtMap <<  f
		}
		
		def requestmap=Requestmap.executeQuery(" from SmFunction where url is not null  and url <> '' ")

       if( requestmap.configAttribute){
           requestmap.each {
              // println 'url map........................................'+it
               def ca=''
               def roles=  SmRolesCorpFunction.executeQuery('select sc.smRoles.roleCode,sc.bdCorp.id  from SmRolesCorpFunction sc where sc.smFunction.id=?',[it.id])
               //def roles=Requestmap.executeQuery('select r.roleCode,c.id from SmRoles r left join r.corp c left join r.function f  where f.id=?',[it.id])
               // println it.url+':'+it.id+':'+SmRolesCorpFunction.countBySmFunction(it)
               roles?.each {
                  // println 'url map........................................'+it[0]+'_'+it[1]+','
                   ca+=(it[0]+'_'+it[1]+',')
               }
//               ca = ca?:'IS_AUTHENTICATED_FULLY'
               ca = ca?:'ROLE_NOROLE'
               it.configAttribute=ca
               rtMap << it
           }
       }


		return rtMap
	}

	static List asList(o) { o ? o as List : [] }

	static ConfigObject getSecurityConfig() { getApplication().config.grails.plugins.springsecurity }
	static void setSecurityConfig(ConfigObject c) { getApplication().config.grails.plugins.springsecurity = c }

	static Map<String, List<String>> splitMap(Map<String, Object> m) {
		Map<String, List<String>> split = [:]
		m.each { String key, value ->
			if (value instanceof List<?> || value.getClass().array) {
				split[key] = value*.toString()
			}
			else { // String/GString
				split[key] = [value.toString()]
			}
		}
		split
	}

	private static lookupPropertyValue(o, String name) {
		o."${getConfigProperty(name)}"
	}

	private static GrailsApplication getApplication() {
		if (!application) {
			application = ApplicationHolder.application
		}
		application
	}
}
