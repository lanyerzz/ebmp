<%@ page import="org.codehaus.groovy.grails.web.errors.GrailsWrappedRuntimeException;com.app.exception.BusinessException;java.lang.Exception" %>
<%
    if(exception!=null){
        response.setHeader("errors",URLEncoder.encode(exception.getMessage(), "utf-8"));

//        exception.printStackTrace()
            out.write(exception.getMessage());

    }

%>