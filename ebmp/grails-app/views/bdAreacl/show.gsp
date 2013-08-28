
<%@ page import="com.app.bd.areacl.BdAreacl" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdAreacl.label', default: 'BdAreacl')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdAreacl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdAreacl" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdAreacl">
			
				<g:if test="${bdAreaclInstance?.areaclcode}">
				<li class="fieldcontain">
					<span id="areaclcode-label" class="property-label"><g:message code="bdAreacl.areaclcode.label" default="Areaclcode" /></span>
					
						<span class="property-value" aria-labelledby="areaclcode-label"><g:fieldValue bean="${bdAreaclInstance}" field="areaclcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.areaclname}">
				<li class="fieldcontain">
					<span id="areaclname-label" class="property-label"><g:message code="bdAreacl.areaclname.label" default="Areaclname" /></span>
					
						<span class="property-value" aria-labelledby="areaclname-label"><g:fieldValue bean="${bdAreaclInstance}" field="areaclname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdAreacl.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdAreaclInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.def1}">
				<li class="fieldcontain">
					<span id="def1-label" class="property-label"><g:message code="bdAreacl.def1.label" default="Def1" /></span>
					
						<span class="property-value" aria-labelledby="def1-label"><g:fieldValue bean="${bdAreaclInstance}" field="def1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.def2}">
				<li class="fieldcontain">
					<span id="def2-label" class="property-label"><g:message code="bdAreacl.def2.label" default="Def2" /></span>
					
						<span class="property-value" aria-labelledby="def2-label"><g:fieldValue bean="${bdAreaclInstance}" field="def2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.def3}">
				<li class="fieldcontain">
					<span id="def3-label" class="property-label"><g:message code="bdAreacl.def3.label" default="Def3" /></span>
					
						<span class="property-value" aria-labelledby="def3-label"><g:fieldValue bean="${bdAreaclInstance}" field="def3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.def4}">
				<li class="fieldcontain">
					<span id="def4-label" class="property-label"><g:message code="bdAreacl.def4.label" default="Def4" /></span>
					
						<span class="property-value" aria-labelledby="def4-label"><g:fieldValue bean="${bdAreaclInstance}" field="def4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.def5}">
				<li class="fieldcontain">
					<span id="def5-label" class="property-label"><g:message code="bdAreacl.def5.label" default="Def5" /></span>
					
						<span class="property-value" aria-labelledby="def5-label"><g:fieldValue bean="${bdAreaclInstance}" field="def5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdAreacl.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdAreaclInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.mnecode}">
				<li class="fieldcontain">
					<span id="mnecode-label" class="property-label"><g:message code="bdAreacl.mnecode.label" default="Mnecode" /></span>
					
						<span class="property-value" aria-labelledby="mnecode-label"><g:fieldValue bean="${bdAreaclInstance}" field="mnecode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.pid}">
				<li class="fieldcontain">
					<span id="pid-label" class="property-label"><g:message code="bdAreacl.pid.label" default="Pid" /></span>
					
						<span class="property-value" aria-labelledby="pid-label"><g:fieldValue bean="${bdAreaclInstance}" field="pid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdAreaclInstance?.pkCorp}">
				<li class="fieldcontain">
					<span id="pkCorp-label" class="property-label"><g:message code="bdAreacl.pkCorp.label" default="Pk Corp" /></span>
					
						<span class="property-value" aria-labelledby="pkCorp-label"><g:link controller="bdCorp" action="show" id="${bdAreaclInstance?.pkCorp?.id}">${bdAreaclInstance?.pkCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdAreaclInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdAreaclInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
