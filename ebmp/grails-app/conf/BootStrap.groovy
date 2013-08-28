import grails.converters.JSON
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.codehaus.groovy.grails.orm.hibernate.support.ClosureEventTriggeringInterceptor as Events

import java.sql.Timestamp

class BootStrap {
    def grailsApplication

    def excludedProps = [
            Events.ONLOAD_EVENT,
            Events.BEFORE_DELETE_EVENT,
            Events.AFTER_DELETE_EVENT,
            Events.BEFORE_INSERT_EVENT,
            Events.AFTER_INSERT_EVENT,
            Events.BEFORE_UPDATE_EVENT,
            Events.AFTER_UPDATE_EVENT
    ]
    def init = { servletContext ->
        UsernamePasswordAuthenticationToken.metaClass.loginCorp=''
        JSON.registerObjectMarshaller(Date) {
            return it.getTime().toString()
        }


        grailsApplication.domainClasses.each{ domainClass ->

            domainClass.metaClass.part = part.curry(domainClass)
        }
    }
    def destroy = {
    }

    def part= { domainClass, m ->
        def map= [:]

        if(m==null){
            //全部

            def props= domainClass.persistentProperties.findAll().collect { return it.name }
            props<< 'id'
            props<< 'version'
            props.each{
                def v=delegate."${it}"
                if(v!=null){

                    if(v instanceof Timestamp){
                        map[it]= delegate."${it}"
                    }else if (v instanceof Boolean){
                        map[it]= delegate."${it}".toString()
                    }else if (v instanceof String){
                        map[it]= delegate."${it}"
                    }else if (v instanceof Number){
                        map[it]= delegate."${it}"
                    }else if (v instanceof Date){
                        map[it]= delegate."${it}"
                    }
                    else{
                        map["${it}.id"]=delegate."${it}".id
                    }



                }

            }

        }else if(m.'defaultPart'==true){
            def props= domainClass.persistentProperties.findAll().collect { return it.name }
            props<< 'id'
            props<< 'version'
            props.each{
                def v=delegate."${it}"
                if(v!=null){

                    if(v instanceof Timestamp){
                        map[it]= delegate."${it}"
                    }else if (v instanceof Boolean){
                        map[it]= delegate."${it}".toString()
                    }else if (v instanceof String){
                        map[it]= delegate."${it}"
                    }else if (v instanceof Number){
                        map[it]= delegate."${it}"
                    }else if (v instanceof Date){
                        map[it]= delegate."${it}"
                    }else if(v?.metaClass.respondsTo(v,'defaultPart')){
                        map[it]= delegate."${it}".defaultPart()
                    }
                    else{
                        map["${it}.id"]=delegate."${it}".id
                    }



                }

            }
        }else	if(m.'include'){//包含

            m.'include'.each{
                map[it]= delegate."${it}"
            }

        }else if(m.'exclude'){//不包含
            def props= domainClass.persistentProperties.findAll().collect { return it.name }
            props<< 'id'
            props<< 'version'
            props.each{
                //	println it
                //	println m.'exclude'.contains(it)
                if(!m.'exclude'.contains(it) && delegate."${it}"!=null){


                        map[it]= delegate."${it}"


                }
            }
        }
        return map
    }
}
