
<%@ page import="com.app.pub.actionscript.PubActionscript" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubActionscript.label', default: 'PubActionscript')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pubActionscript" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pubActionscript" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pubActionscript">
			
				<g:if test="${pubActionscriptInstance?.scriptCode}">
				<li class="fieldcontain">
					<span id="scriptCode-label" class="property-label"><g:message code="pubActionscript.scriptCode.label" default="Script Code" /></span>
					
						<span class="property-value" aria-labelledby="scriptCode-label"><g:fieldValue bean="${pubActionscriptInstance}" field="scriptCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubActionscriptInstance?.scriptName}">
				<li class="fieldcontain">
					<span id="scriptName-label" class="property-label"><g:message code="pubActionscript.scriptName.label" default="Script Name" /></span>
					
						<span class="property-value" aria-labelledby="scriptName-label"><g:fieldValue bean="${pubActionscriptInstance}" field="scriptName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubActionscriptInstance?.path}">
				<li class="fieldcontain">
					<span id="path-label" class="property-label"><g:message code="pubActionscript.path.label" default="Path" /></span>
					
						<span class="property-value" aria-labelledby="path-label"><g:fieldValue bean="${pubActionscriptInstance}" field="path"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubActionscriptInstance?.actionType}">
				<li class="fieldcontain">
					<span id="actionType-label" class="property-label"><g:message code="pubActionscript.actionType.label" default="Action Type" /></span>
					
						<span class="property-value" aria-labelledby="actionType-label"><g:fieldValue bean="${pubActionscriptInstance}" field="actionType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubActionscriptInstance?.pubBilltype}">
				<li class="fieldcontain">
					<span id="pubBilltype-label" class="property-label"><g:message code="pubActionscript.pubBilltype.label" default="Pub Billtype" /></span>
					
						<span class="property-value" aria-labelledby="pubBilltype-label"><g:link controller="pubBilltype" action="show" id="${pubActionscriptInstance?.pubBilltype?.id}">${pubActionscriptInstance?.pubBilltype?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubActionscriptInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="pubActionscript.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pubActionscriptInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubActionscriptInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="pubActionscript.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${pubActionscriptInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pubActionscriptInstance?.id}" />
					<g:link class="edit" action="edit" id="${pubActionscriptInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
