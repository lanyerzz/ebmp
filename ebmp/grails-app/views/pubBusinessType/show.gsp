
<%@ page import="com.app.pub.businesstype.PubBusinessType" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubBusinessType.label', default: 'PubBusinessType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pubBusinessType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pubBusinessType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pubBusinessType">
			
				<g:if test="${pubBusinessTypeInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="pubBusinessType.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${pubBusinessTypeInstance?.bdCorp?.id}">${pubBusinessTypeInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBusinessTypeInstance?.bills}">
				<li class="fieldcontain">
					<span id="bills-label" class="property-label"><g:message code="pubBusinessType.bills.label" default="Bills" /></span>
					
						<g:each in="${pubBusinessTypeInstance.bills}" var="b">
						<span class="property-value" aria-labelledby="bills-label"><g:link controller="pubBusinessBill" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${pubBusinessTypeInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="pubBusinessType.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${pubBusinessTypeInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBusinessTypeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="pubBusinessType.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pubBusinessTypeInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBusinessTypeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="pubBusinessType.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${pubBusinessTypeInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBusinessTypeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="pubBusinessType.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${pubBusinessTypeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pubBusinessTypeInstance?.id}" />
					<g:link class="edit" action="edit" id="${pubBusinessTypeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
