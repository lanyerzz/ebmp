
<%@ page import="com.app.bd.invcl.BdInvcl" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdInvcl.label', default: 'BdInvcl')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdInvcl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdInvcl" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdInvcl">
			
				<g:if test="${bdInvclInstance?.invclassCode}">
				<li class="fieldcontain">
					<span id="invclassCode-label" class="property-label"><g:message code="bdInvcl.invclassCode.label" default="Invclass Code" /></span>
					
						<span class="property-value" aria-labelledby="invclassCode-label"><g:fieldValue bean="${bdInvclInstance}" field="invclassCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvclInstance?.invclassName}">
				<li class="fieldcontain">
					<span id="invclassName-label" class="property-label"><g:message code="bdInvcl.invclassName.label" default="Invclass Name" /></span>
					
						<span class="property-value" aria-labelledby="invclassName-label"><g:fieldValue bean="${bdInvclInstance}" field="invclassName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvclInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdInvcl.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdInvclInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvclInstance?.endFlag}">
				<li class="fieldcontain">
					<span id="endFlag-label" class="property-label"><g:message code="bdInvcl.endFlag.label" default="End Flag" /></span>
					
						<span class="property-value" aria-labelledby="endFlag-label"><g:formatBoolean boolean="${bdInvclInstance?.endFlag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvclInstance?.forinvName}">
				<li class="fieldcontain">
					<span id="forinvName-label" class="property-label"><g:message code="bdInvcl.forinvName.label" default="Forinv Name" /></span>
					
						<span class="property-value" aria-labelledby="forinvName-label"><g:fieldValue bean="${bdInvclInstance}" field="forinvName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvclInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdInvcl.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdInvclInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvclInstance?.pid}">
				<li class="fieldcontain">
					<span id="pid-label" class="property-label"><g:message code="bdInvcl.pid.label" default="Pid" /></span>
					
						<span class="property-value" aria-labelledby="pid-label"><g:fieldValue bean="${bdInvclInstance}" field="pid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvclInstance?.pkCorp}">
				<li class="fieldcontain">
					<span id="pkCorp-label" class="property-label"><g:message code="bdInvcl.pkCorp.label" default="Pk Corp" /></span>
					
						<span class="property-value" aria-labelledby="pkCorp-label"><g:link controller="bdCorp" action="show" id="${bdInvclInstance?.pkCorp?.id}">${bdInvclInstance?.pkCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvclInstance?.sealFlag}">
				<li class="fieldcontain">
					<span id="sealFlag-label" class="property-label"><g:message code="bdInvcl.sealFlag.label" default="Seal Flag" /></span>
					
						<span class="property-value" aria-labelledby="sealFlag-label"><g:formatBoolean boolean="${bdInvclInstance?.sealFlag}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdInvclInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdInvclInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
