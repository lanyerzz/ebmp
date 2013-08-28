
<%@ page import="com.app.tm.templet.TmTemplet" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tmTemplet.label', default: 'TmTemplet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tmTemplet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tmTemplet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tmTemplet">
			
				<g:if test="${tmTempletInstance?.templetCode}">
				<li class="fieldcontain">
					<span id="templetCode-label" class="property-label"><g:message code="tmTemplet.templetCode.label" default="Templet Code" /></span>
					
						<span class="property-value" aria-labelledby="templetCode-label"><g:fieldValue bean="${tmTempletInstance}" field="templetCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletInstance?.templetName}">
				<li class="fieldcontain">
					<span id="templetName-label" class="property-label"><g:message code="tmTemplet.templetName.label" default="Templet Name" /></span>
					
						<span class="property-value" aria-labelledby="templetName-label"><g:fieldValue bean="${tmTempletInstance}" field="templetName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletInstance?.corp}">
				<li class="fieldcontain">
					<span id="corp-label" class="property-label"><g:message code="tmTemplet.corp.label" default="Corp" /></span>
					
						<span class="property-value" aria-labelledby="corp-label"><g:link controller="bdCorp" action="show" id="${tmTempletInstance?.corp?.id}">${tmTempletInstance?.corp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="tmTemplet.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${tmTempletInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="tmTemplet.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${tmTempletInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletInstance?.templetPath}">
				<li class="fieldcontain">
					<span id="templetPath-label" class="property-label"><g:message code="tmTemplet.templetPath.label" default="Templet Path" /></span>
					
						<span class="property-value" aria-labelledby="templetPath-label"><g:fieldValue bean="${tmTempletInstance}" field="templetPath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletInstance?.templetType}">
				<li class="fieldcontain">
					<span id="templetType-label" class="property-label"><g:message code="tmTemplet.templetType.label" default="Templet Type" /></span>
					
						<span class="property-value" aria-labelledby="templetType-label"><g:fieldValue bean="${tmTempletInstance}" field="templetType"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tmTempletInstance?.id}" />
					<g:link class="edit" action="edit" id="${tmTempletInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
