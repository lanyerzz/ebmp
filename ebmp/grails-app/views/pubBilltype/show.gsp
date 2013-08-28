
<%@ page import="com.app.pub.billtype.PubBilltype" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubBilltype.label', default: 'PubBilltype')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pubBilltype" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pubBilltype" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pubBilltype">
			
				<g:if test="${pubBilltypeInstance?.billtypecode}">
				<li class="fieldcontain">
					<span id="billtypecode-label" class="property-label"><g:message code="pubBilltype.billtypecode.label" default="Billtypecode" /></span>
					
						<span class="property-value" aria-labelledby="billtypecode-label"><g:fieldValue bean="${pubBilltypeInstance}" field="billtypecode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBilltypeInstance?.billtypename}">
				<li class="fieldcontain">
					<span id="billtypename-label" class="property-label"><g:message code="pubBilltype.billtypename.label" default="Billtypename" /></span>
					
						<span class="property-value" aria-labelledby="billtypename-label"><g:fieldValue bean="${pubBilltypeInstance}" field="billtypename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBilltypeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="pubBilltype.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pubBilltypeInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBilltypeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="pubBilltype.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${pubBilltypeInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pubBilltypeInstance?.id}" />
					<g:link class="edit" action="edit" id="${pubBilltypeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
