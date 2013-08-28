
<%@ page import="com.app.bd.purorg.BdPurorg" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdPurorg.label', default: 'BdPurorg')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdPurorg" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdPurorg" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdPurorg">
			
				<g:if test="${bdPurorgInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="bdPurorg.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${bdPurorgInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bdPurorg.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bdPurorgInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdPurorg.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdPurorgInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.def1}">
				<li class="fieldcontain">
					<span id="def1-label" class="property-label"><g:message code="bdPurorg.def1.label" default="Def1" /></span>
					
						<span class="property-value" aria-labelledby="def1-label"><g:fieldValue bean="${bdPurorgInstance}" field="def1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.def2}">
				<li class="fieldcontain">
					<span id="def2-label" class="property-label"><g:message code="bdPurorg.def2.label" default="Def2" /></span>
					
						<span class="property-value" aria-labelledby="def2-label"><g:fieldValue bean="${bdPurorgInstance}" field="def2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.def3}">
				<li class="fieldcontain">
					<span id="def3-label" class="property-label"><g:message code="bdPurorg.def3.label" default="Def3" /></span>
					
						<span class="property-value" aria-labelledby="def3-label"><g:fieldValue bean="${bdPurorgInstance}" field="def3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.def4}">
				<li class="fieldcontain">
					<span id="def4-label" class="property-label"><g:message code="bdPurorg.def4.label" default="Def4" /></span>
					
						<span class="property-value" aria-labelledby="def4-label"><g:fieldValue bean="${bdPurorgInstance}" field="def4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.def5}">
				<li class="fieldcontain">
					<span id="def5-label" class="property-label"><g:message code="bdPurorg.def5.label" default="Def5" /></span>
					
						<span class="property-value" aria-labelledby="def5-label"><g:fieldValue bean="${bdPurorgInstance}" field="def5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdPurorg.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdPurorgInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="bdPurorg.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${bdPurorgInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.ownercorp}">
				<li class="fieldcontain">
					<span id="ownercorp-label" class="property-label"><g:message code="bdPurorg.ownercorp.label" default="Ownercorp" /></span>
					
						<span class="property-value" aria-labelledby="ownercorp-label"><g:link controller="bdCorp" action="show" id="${bdPurorgInstance?.ownercorp?.id}">${bdPurorgInstance?.ownercorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPurorgInstance?.sealflag}">
				<li class="fieldcontain">
					<span id="sealflag-label" class="property-label"><g:message code="bdPurorg.sealflag.label" default="Sealflag" /></span>
					
						<span class="property-value" aria-labelledby="sealflag-label"><g:formatBoolean boolean="${bdPurorgInstance?.sealflag}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdPurorgInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdPurorgInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
