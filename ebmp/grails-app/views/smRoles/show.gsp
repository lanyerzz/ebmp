
<%@ page import="com.app.sm.roles.SmRoles" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'smRoles.label', default: 'SmRoles')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-smRoles" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-smRoles" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list smRoles">
			
				<g:if test="${smRolesInstance?.roleCode}">
				<li class="fieldcontain">
					<span id="roleCode-label" class="property-label"><g:message code="smRoles.roleCode.label" default="Role Code" /></span>
					
						<span class="property-value" aria-labelledby="roleCode-label"><g:fieldValue bean="${smRolesInstance}" field="roleCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smRolesInstance?.roleName}">
				<li class="fieldcontain">
					<span id="roleName-label" class="property-label"><g:message code="smRoles.roleName.label" default="Role Name" /></span>
					
						<span class="property-value" aria-labelledby="roleName-label"><g:fieldValue bean="${smRolesInstance}" field="roleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smRolesInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="smRoles.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${smRolesInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smRolesInstance?.corp}">
				<li class="fieldcontain">
					<span id="corp-label" class="property-label"><g:message code="smRoles.corp.label" default="Corp" /></span>
					
						<g:each in="${smRolesInstance.corp}" var="c">
						<span class="property-value" aria-labelledby="corp-label"><g:link controller="bdCorp" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${smRolesInstance?.function}">
				<li class="fieldcontain">
					<span id="function-label" class="property-label"><g:message code="smRoles.function.label" default="Function" /></span>
					
						<g:each in="${smRolesInstance.function}" var="f">
						<span class="property-value" aria-labelledby="function-label"><g:link controller="smFunction" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${smRolesInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="smRoles.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${smRolesInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smRolesInstance?.partialFunction}">
				<li class="fieldcontain">
					<span id="partialFunction-label" class="property-label"><g:message code="smRoles.partialFunction.label" default="Partial Function" /></span>
					
						<g:each in="${smRolesInstance.partialFunction}" var="p">
						<span class="property-value" aria-labelledby="partialFunction-label"><g:link controller="smFunction" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${smRolesInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="smRoles.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${smRolesInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${smRolesInstance?.id}" />
					<g:link class="edit" action="edit" id="${smRolesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
