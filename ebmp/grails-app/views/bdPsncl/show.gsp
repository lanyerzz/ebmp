
<%@ page import="com.app.bd.psncl.BdPsncl" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdPsncl.label', default: 'BdPsncl')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdPsncl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdPsncl" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdPsncl">
			
				<g:if test="${bdPsnclInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="bdPsncl.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${bdPsnclInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnclInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bdPsncl.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bdPsnclInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnclInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="bdPsncl.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${bdPsnclInstance?.bdCorp?.id}">${bdPsnclInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnclInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdPsncl.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdPsnclInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnclInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdPsncl.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdPsnclInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnclInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="bdPsncl.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${bdPsnclInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnclInstance?.pid}">
				<li class="fieldcontain">
					<span id="pid-label" class="property-label"><g:message code="bdPsncl.pid.label" default="Pid" /></span>
					
						<span class="property-value" aria-labelledby="pid-label"><g:fieldValue bean="${bdPsnclInstance}" field="pid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnclInstance?.psnclscope}">
				<li class="fieldcontain">
					<span id="psnclscope-label" class="property-label"><g:message code="bdPsncl.psnclscope.label" default="Psnclscope" /></span>
					
						<span class="property-value" aria-labelledby="psnclscope-label"><g:fieldValue bean="${bdPsnclInstance}" field="psnclscope"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnclInstance?.sealflag}">
				<li class="fieldcontain">
					<span id="sealflag-label" class="property-label"><g:message code="bdPsncl.sealflag.label" default="Sealflag" /></span>
					
						<span class="property-value" aria-labelledby="sealflag-label"><g:formatBoolean boolean="${bdPsnclInstance?.sealflag}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdPsnclInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdPsnclInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
