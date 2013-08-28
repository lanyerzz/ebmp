// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }


grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
        xml: ['text/xml', 'application/xml'],
        text: 'text/plain',
        js: 'text/javascript',
        rss: 'application/rss+xml',
        atom: 'application/atom+xml',
        css: 'text/css',
        csv: 'text/csv',
        all: '*/*',
        json: ['application/json','text/json'],
        form: 'application/x-www-form-urlencoded',
        multipartForm: 'multipart/form-data'
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']


// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
//grails.converters.json.date = "javascript"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// enable query caching by default
grails.hibernate.cache.queries = true

// set per-environment serverURL stem for creating absolute links
environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
            'org.codehaus.groovy.grails.web.pages', //  GSP
            'org.codehaus.groovy.grails.web.sitemesh', //  layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping', // URL mapping
            'org.codehaus.groovy.grails.commons', // core / classloading
            'org.codehaus.groovy.grails.plugins', // plugins
            'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'
}

grails.gorm.default.mapping = {

    id type:String,length:32,generator:'uuid.hex'

}
grails.gorm.default.constraints = {
    '*'(nullable: true,scale: 8)
}
grails.date.formats = "yyyy-MM-dd'T'HH:mm:ss"
grails.gorm.failOnError=true
//log4j.logger.org.springframework.security='off,stdout'


// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.app.sm.user.SmUser'
grails.plugins.springsecurity.userLookup.usernamePropertyName='username'
grails.plugins.springsecurity.userLookup.enabledPropertyName = 'userenabled'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.app.sm.user.SmUserSmRoles'
grails.plugins.springsecurity.authority.className = 'com.app.sm.roles.SmRoles'
grails.plugins.springsecurity.authority.nameField='roleCode'
grails.plugins.springsecurity.requestMap.className = 'com.app.sm.function.SmFunction'
grails.plugins.springsecurity.securityConfigType = 'Requestmap'
grails.plugins.springsecurity.active = true

grails.plugins.springsecurity.successHandler.alwaysUseDefault = true

grails.plugins.springsecurity.password.algorithm = 'SHA-256'
grails.plugins.springsecurity.password.encodeHashAsBase64 = false
grails.plugins.springsecurity.password.bcrypt.logrounds = 10


//grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/?gwt.codesvr=127.0.0.1:9997'
grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/'

grails.plugins.springsecurity.rejectIfNoRule = false
grails.plugins.springsecurity.interceptUrlMap = [
        '/**' :['IS_AUTHENTICATED_FULLY'],
        '/css/main.css': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/css/**':       ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/js/**':        ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/applet/**':     ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/images/**':    ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/login/**':     ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/logout/**':    ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/gwt/**':       ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/corpRef/**':['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/bdCorp/query':['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/captcha/**':	['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/smFunction/**':['IS_AUTHENTICATED_FULLY'],
        '/smUser/**':['IS_AUTHENTICATED_FULLY'],
        '/smRole/**':['IS_AUTHENTICATED_FULLY'],
        '/services/**':['IS_AUTHENTICATED_ANONYMOUSLY']



]



//activiti {
//    processEngineName = "activiti-engine-default"
//    databaseType = "postgres"
//    deploymentName = ebmp
//	deploymentResources = ["classpath*:/bpmn/**/autodeploy.*.bpmn*.xml"]
////    deploymentResources = ["file:./grails-app/conf/**/*.bpmn*.xml",
////            "file:./grails-app/conf/**/*.png",
////            "file:./src/taskforms/**/*.form"]
//    jobExecutorActivate = false
//    mailServerHost = "smtp.163.com"
//    mailServerPort = "25"
//    mailServerUsername = "lanyerzz"
//    mailServerPassword = "xinabcdli"
//    mailServerDefaultFrom = "lanyerzz@163.com"
//    history = "audit" // "none", "activity", "audit" or "full"
//    sessionUsernameKey = "username"
//    useFormKey = true
//}
//
//environments {
//    development {
//        activiti {
//            processEngineName = "activiti-engine-dev"
//            databaseSchemaUpdate = true // true, false or "create-drop"
//        }
//    }
//    test {
//        activiti {
//            processEngineName = "activiti-engine-test"
//            databaseSchemaUpdate = true
//            mailServerPort = "5025"
//        }
//    }
//    production {
//        activiti {
//            processEngineName = "activiti-engine-prod"
//            databaseSchemaUpdate = false
//            jobExecutorActivate = true
//        }
//    }
//}

