import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils;



// Place your Spring DSL code here
def conf = SpringSecurityUtils.securityConfig
if (!conf || !conf.active) {
	return
}
beans = {
	customPropertyEditorRegistrar(com.app.core.beans.CustomPropertyEditorRegistrar)
	authenticationProcessingFilter(com.app.security.filter.AppUsernamePasswordAuthenticationFilter){
		authenticationManager = ref('authenticationManager')
		sessionAuthenticationStrategy = ref('sessionAuthenticationStrategy')
		authenticationSuccessHandler = ref('authenticationSuccessHandler')
		authenticationFailureHandler = ref('authenticationFailureHandler')
		rememberMeServices = ref('rememberMeServices')
		authenticationDetailsSource = ref('authenticationDetailsSource')
		filterProcessesUrl = conf.apf.filterProcessesUrl // '/j_spring_security_check'
		usernameParameter = conf.apf.usernameParameter // j_username
		passwordParameter = conf.apf.passwordParameter // j_password
		continueChainBeforeSuccessfulAuthentication = conf.apf.continueChainBeforeSuccessfulAuthentication // false
		allowSessionCreation = conf.apf.allowSessionCreation // true
		postOnly = conf.apf.postOnly // true
	}
}
