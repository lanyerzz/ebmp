
<%@ page import="com.app.bd.qwsz.BdQwsz" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdQwsz.label', default: 'BdQwsz')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdQwsz" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdQwsz" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdQwsz">
			
				<g:if test="${bdQwszInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="bdQwsz.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${bdQwszInstance?.bdCorp?.id}">${bdQwszInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdQwszInstance?.bdInvmandoc}">
				<li class="fieldcontain">
					<span id="bdInvmandoc-label" class="property-label"><g:message code="bdQwsz.bdInvmandoc.label" default="Bd Invmandoc" /></span>
					
						<span class="property-value" aria-labelledby="bdInvmandoc-label"><g:link controller="bdInvmandoc" action="show" id="${bdQwszInstance?.bdInvmandoc?.id}">${bdQwszInstance?.bdInvmandoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdQwszInstance?.canUse}">
				<li class="fieldcontain">
					<span id="canUse-label" class="property-label"><g:message code="bdQwsz.canUse.label" default="Can Use" /></span>
					
						<span class="property-value" aria-labelledby="canUse-label"><g:formatBoolean boolean="${bdQwszInstance?.canUse}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdQwszInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="bdQwsz.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${bdQwszInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdQwszInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdQwsz.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdQwszInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdQwszInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdQwsz.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdQwszInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdQwszInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bdQwsz.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bdQwszInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdQwszInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="bdQwsz.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${bdQwszInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdQwszInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="bdQwsz.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${bdQwszInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdQwszInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdQwszInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
