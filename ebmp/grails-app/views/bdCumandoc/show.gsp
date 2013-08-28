
<%@ page import="com.app.bd.cumandoc.BdCumandoc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdCumandoc.label', default: 'BdCumandoc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdCumandoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdCumandoc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdCumandoc">
			
				<g:if test="${bdCumandocInstance?.cmneCode}">
				<li class="fieldcontain">
					<span id="cmneCode-label" class="property-label"><g:message code="bdCumandoc.cmneCode.label" default="Cmne Code" /></span>
					
						<span class="property-value" aria-labelledby="cmneCode-label"><g:fieldValue bean="${bdCumandocInstance}" field="cmneCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCumandocInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdCumandoc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdCumandocInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCumandocInstance?.iscustomer}">
				<li class="fieldcontain">
					<span id="iscustomer-label" class="property-label"><g:message code="bdCumandoc.iscustomer.label" default="Iscustomer" /></span>
					
						<span class="property-value" aria-labelledby="iscustomer-label"><g:formatBoolean boolean="${bdCumandocInstance?.iscustomer}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCumandocInstance?.isvender}">
				<li class="fieldcontain">
					<span id="isvender-label" class="property-label"><g:message code="bdCumandoc.isvender.label" default="Isvender" /></span>
					
						<span class="property-value" aria-labelledby="isvender-label"><g:formatBoolean boolean="${bdCumandocInstance?.isvender}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCumandocInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdCumandoc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdCumandocInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCumandocInstance?.linkMan}">
				<li class="fieldcontain">
					<span id="linkMan-label" class="property-label"><g:message code="bdCumandoc.linkMan.label" default="Link Man" /></span>
					
						<span class="property-value" aria-labelledby="linkMan-label"><g:fieldValue bean="${bdCumandocInstance}" field="linkMan"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCumandocInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="bdCumandoc.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${bdCumandocInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCumandocInstance?.mobilePhone}">
				<li class="fieldcontain">
					<span id="mobilePhone-label" class="property-label"><g:message code="bdCumandoc.mobilePhone.label" default="Mobile Phone" /></span>
					
						<span class="property-value" aria-labelledby="mobilePhone-label"><g:fieldValue bean="${bdCumandocInstance}" field="mobilePhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCumandocInstance?.pkCorp}">
				<li class="fieldcontain">
					<span id="pkCorp-label" class="property-label"><g:message code="bdCumandoc.pkCorp.label" default="Pk Corp" /></span>
					
						<span class="property-value" aria-labelledby="pkCorp-label"><g:link controller="bdCorp" action="show" id="${bdCumandocInstance?.pkCorp?.id}">${bdCumandocInstance?.pkCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCumandocInstance?.pkCubasdoc}">
				<li class="fieldcontain">
					<span id="pkCubasdoc-label" class="property-label"><g:message code="bdCumandoc.pkCubasdoc.label" default="Pk Cubasdoc" /></span>
					
						<span class="property-value" aria-labelledby="pkCubasdoc-label"><g:link controller="bdCubasdoc" action="show" id="${bdCumandocInstance?.pkCubasdoc?.id}">${bdCumandocInstance?.pkCubasdoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCumandocInstance?.sealFlag}">
				<li class="fieldcontain">
					<span id="sealFlag-label" class="property-label"><g:message code="bdCumandoc.sealFlag.label" default="Seal Flag" /></span>
					
						<span class="property-value" aria-labelledby="sealFlag-label"><g:formatBoolean boolean="${bdCumandocInstance?.sealFlag}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdCumandocInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdCumandocInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
