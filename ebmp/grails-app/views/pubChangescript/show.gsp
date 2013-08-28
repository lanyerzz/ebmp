
<%@ page import="com.app.pub.change.PubChangescript" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubChangescript.label', default: 'PubChangescript')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pubChangescript" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pubChangescript" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pubChangescript">
			
				<g:if test="${pubChangescriptInstance?.changeFrom}">
				<li class="fieldcontain">
					<span id="changeFrom-label" class="property-label"><g:message code="pubChangescript.changeFrom.label" default="Change From" /></span>
					
						<span class="property-value" aria-labelledby="changeFrom-label"><g:link controller="pubBilltype" action="show" id="${pubChangescriptInstance?.changeFrom?.id}">${pubChangescriptInstance?.changeFrom?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubChangescriptInstance?.changeTo}">
				<li class="fieldcontain">
					<span id="changeTo-label" class="property-label"><g:message code="pubChangescript.changeTo.label" default="Change To" /></span>
					
						<span class="property-value" aria-labelledby="changeTo-label"><g:link controller="pubBilltype" action="show" id="${pubChangescriptInstance?.changeTo?.id}">${pubChangescriptInstance?.changeTo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubChangescriptInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="pubChangescript.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pubChangescriptInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubChangescriptInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="pubChangescript.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${pubChangescriptInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubChangescriptInstance?.path}">
				<li class="fieldcontain">
					<span id="path-label" class="property-label"><g:message code="pubChangescript.path.label" default="Path" /></span>
					
						<span class="property-value" aria-labelledby="path-label"><g:fieldValue bean="${pubChangescriptInstance}" field="path"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pubChangescriptInstance?.id}" />
					<g:link class="edit" action="edit" id="${pubChangescriptInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
