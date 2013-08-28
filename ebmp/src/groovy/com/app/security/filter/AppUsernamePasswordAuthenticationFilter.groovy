package com.app.security.filter

import grails.plugins.springsecurity.SpringSecurityService
import org.codehaus.groovy.grails.plugins.springsecurity.GormUserDetailsService

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException
import org.codehaus.groovy.grails.plugins.springsecurity.SecurityRequestHolder as SRH

class AppUsernamePasswordAuthenticationFilter extends org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter{

	//transient springSecurityService
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request,
	HttpServletResponse response) throws AuthenticationException {

		this.checkValidateCode(request);
		String username = obtainUsername(request);
        String corpid=request.getParameter('loginCorp.id');
        GormUserDetailsService.userLoginCorp.put(username,corpid);
		Authentication rt= super.attemptAuthentication(request, response);
	
		if(rt){
			
			rt.loginCorp=corpid;
			
		}
        SRH.set(request,response)

		return rt;
	}
	protected void checkValidateCode(HttpServletRequest request) {
		
		
		
		String sessionValidateCode = request.getSession().getAttribute("validateCode");
		request.getSession().setAttribute("validateCode","");
		if(sessionValidateCode==null) throw new ValidateCodeAuthenticationException(messages.getMessage('validateCode.notEquals', '验证码错误'));
		String validateCodeParameter =request.getParameter("validateCode")
		if (!validateCodeParameter || sessionValidateCode.toUpperCase() != validateCodeParameter.toUpperCase()) {
			
			throw new ValidateCodeAuthenticationException(messages.getMessage('validateCode.notEquals', '验证码错误'));
		}
	}
	
	
	
	
}
