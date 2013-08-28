
<%@ page import="com.app.bd.pack.BdPack" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdPack.label', default: 'BdPack')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdPack" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdPack" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdPack">
			
				<g:if test="${bdPackInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="bdPack.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${bdPackInstance?.bdCorp?.id}">${bdPackInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPackInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="bdPack.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${bdPackInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPackInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdPack.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdPackInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPackInstance?.invbasdoc}">
				<li class="fieldcontain">
					<span id="invbasdoc-label" class="property-label"><g:message code="bdPack.invbasdoc.label" default="Invbasdoc" /></span>
					
						<span class="property-value" aria-labelledby="invbasdoc-label"><g:link controller="bdInvbasdoc" action="show" id="${bdPackInstance?.invbasdoc?.id}">${bdPackInstance?.invbasdoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPackInstance?.invcl}">
				<li class="fieldcontain">
					<span id="invcl-label" class="property-label"><g:message code="bdPack.invcl.label" default="Invcl" /></span>
					
						<span class="property-value" aria-labelledby="invcl-label"><g:link controller="bdInvcl" action="show" id="${bdPackInstance?.invcl?.id}">${bdPackInstance?.invcl?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPackInstance?.invmandoc}">
				<li class="fieldcontain">
					<span id="invmandoc-label" class="property-label"><g:message code="bdPack.invmandoc.label" default="Invmandoc" /></span>
					
						<span class="property-value" aria-labelledby="invmandoc-label"><g:link controller="bdInvmandoc" action="show" id="${bdPackInstance?.invmandoc?.id}">${bdPackInstance?.invmandoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPackInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdPack.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdPackInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPackInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bdPack.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bdPackInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPackInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="bdPack.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${bdPackInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPackInstance?.pid}">
				<li class="fieldcontain">
					<span id="pid-label" class="property-label"><g:message code="bdPack.pid.label" default="Pid" /></span>
					
						<span class="property-value" aria-labelledby="pid-label"><g:fieldValue bean="${bdPackInstance}" field="pid"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdPackInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdPackInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
