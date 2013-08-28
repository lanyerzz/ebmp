
<%@ page import="com.app.bd.calbody.BdCalbody" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdCalbody.label', default: 'BdCalbody')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdCalbody" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdCalbody" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdCalbody">
			
				<g:if test="${bdCalbodyInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="bdCalbody.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${bdCalbodyInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCalbodyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bdCalbody.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bdCalbodyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCalbodyInstance?.areacl}">
				<li class="fieldcontain">
					<span id="areacl-label" class="property-label"><g:message code="bdCalbody.areacl.label" default="Areacl" /></span>
					
						<span class="property-value" aria-labelledby="areacl-label"><g:link controller="bdAreacl" action="show" id="${bdCalbodyInstance?.areacl?.id}">${bdCalbodyInstance?.areacl?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCalbodyInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="bdCalbody.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${bdCalbodyInstance?.bdCorp?.id}">${bdCalbodyInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCalbodyInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdCalbody.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdCalbodyInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCalbodyInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdCalbody.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdCalbodyInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCalbodyInstance?.sealFlag}">
				<li class="fieldcontain">
					<span id="sealFlag-label" class="property-label"><g:message code="bdCalbody.sealFlag.label" default="Seal Flag" /></span>
					
						<span class="property-value" aria-labelledby="sealFlag-label"><g:formatBoolean boolean="${bdCalbodyInstance?.sealFlag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCalbodyInstance?.vnote}">
				<li class="fieldcontain">
					<span id="vnote-label" class="property-label"><g:message code="bdCalbody.vnote.label" default="Vnote" /></span>
					
						<span class="property-value" aria-labelledby="vnote-label"><g:fieldValue bean="${bdCalbodyInstance}" field="vnote"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdCalbodyInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdCalbodyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
