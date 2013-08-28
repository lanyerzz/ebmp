
<%@ page import="com.app.tm.templetallot.TmTempletallot" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tmTempletallot.label', default: 'TmTempletallot')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tmTempletallot" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tmTempletallot" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tmTempletallot">
			
				<g:if test="${tmTempletallotInstance?.function}">
				<li class="fieldcontain">
					<span id="function-label" class="property-label"><g:message code="tmTempletallot.function.label" default="Function" /></span>
					
						<span class="property-value" aria-labelledby="function-label"><g:link controller="smFunction" action="show" id="${tmTempletallotInstance?.function?.id}">${tmTempletallotInstance?.function?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletallotInstance?.templetType}">
				<li class="fieldcontain">
					<span id="templetType-label" class="property-label"><g:message code="tmTempletallot.templetType.label" default="Templet Type" /></span>
					
						<span class="property-value" aria-labelledby="templetType-label"><g:fieldValue bean="${tmTempletallotInstance}" field="templetType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletallotInstance?.tmTemplet}">
				<li class="fieldcontain">
					<span id="tmTemplet-label" class="property-label"><g:message code="tmTempletallot.tmTemplet.label" default="Tm Templet" /></span>
					
						<span class="property-value" aria-labelledby="tmTemplet-label"><g:link controller="tmTemplet" action="show" id="${tmTempletallotInstance?.tmTemplet?.id}">${tmTempletallotInstance?.tmTemplet?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletallotInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="tmTempletallot.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${tmTempletallotInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletallotInstance?.corp}">
				<li class="fieldcontain">
					<span id="corp-label" class="property-label"><g:message code="tmTempletallot.corp.label" default="Corp" /></span>
					
						<span class="property-value" aria-labelledby="corp-label"><g:link controller="bdCorp" action="show" id="${tmTempletallotInstance?.corp?.id}">${tmTempletallotInstance?.corp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletallotInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="tmTempletallot.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${tmTempletallotInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletallotInstance?.isDefault}">
				<li class="fieldcontain">
					<span id="isDefault-label" class="property-label"><g:message code="tmTempletallot.isDefault.label" default="Is Default" /></span>
					
						<span class="property-value" aria-labelledby="isDefault-label"><g:formatBoolean boolean="${tmTempletallotInstance?.isDefault}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletallotInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="tmTempletallot.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${tmTempletallotInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletallotInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="tmTempletallot.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:link controller="smRoles" action="show" id="${tmTempletallotInstance?.role?.id}">${tmTempletallotInstance?.role?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tmTempletallotInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="tmTempletallot.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="smUser" action="show" id="${tmTempletallotInstance?.user?.id}">${tmTempletallotInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tmTempletallotInstance?.id}" />
					<g:link class="edit" action="edit" id="${tmTempletallotInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
