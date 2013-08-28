package com.app.security.filter

import org.springframework.security.core.AuthenticationException;

class ValidateCodeAuthenticationException extends AuthenticationException{
	public ValidateCodeAuthenticationException(){
		super();
	}
	public ValidateCodeAuthenticationException(String msg){
		super(msg);
		
	}

	
	
}


