
<%@ page import="com.app.ywms.bd.berthage.YBerthage" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'YBerthage.label', default: 'YBerthage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-YBerthage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-YBerthage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list YBerthage">
			
				<g:if test="${YBerthageInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="YBerthage.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${YBerthageInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="YBerthage.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${YBerthageInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="YBerthage.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${YBerthageInstance?.bdCorp?.id}">${YBerthageInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="YBerthage.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${YBerthageInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.describe}">
				<li class="fieldcontain">
					<span id="describe-label" class="property-label"><g:message code="YBerthage.describe.label" default="Describe" /></span>
					
						<span class="property-value" aria-labelledby="describe-label"><g:fieldValue bean="${YBerthageInstance}" field="describe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.isuse}">
				<li class="fieldcontain">
					<span id="isuse-label" class="property-label"><g:message code="YBerthage.isuse.label" default="Isuse" /></span>
					
						<span class="property-value" aria-labelledby="isuse-label"><g:formatBoolean boolean="${YBerthageInstance?.isuse}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.jswz}">
				<li class="fieldcontain">
					<span id="jswz-label" class="property-label"><g:message code="YBerthage.jswz.label" default="Jswz" /></span>
					
						<span class="property-value" aria-labelledby="jswz-label"><g:fieldValue bean="${YBerthageInstance}" field="jswz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.kswz}">
				<li class="fieldcontain">
					<span id="kswz-label" class="property-label"><g:message code="YBerthage.kswz.label" default="Kswz" /></span>
					
						<span class="property-value" aria-labelledby="kswz-label"><g:fieldValue bean="${YBerthageInstance}" field="kswz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="YBerthage.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${YBerthageInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.zdss}">
				<li class="fieldcontain">
					<span id="zdss-label" class="property-label"><g:message code="YBerthage.zdss.label" default="Zdss" /></span>
					
						<span class="property-value" aria-labelledby="zdss-label"><g:fieldValue bean="${YBerthageInstance}" field="zdss"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.zdtbdw}">
				<li class="fieldcontain">
					<span id="zdtbdw-label" class="property-label"><g:message code="YBerthage.zdtbdw.label" default="Zdtbdw" /></span>
					
						<span class="property-value" aria-labelledby="zdtbdw-label"><g:fieldValue bean="${YBerthageInstance}" field="zdtbdw"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBerthageInstance?.zxss}">
				<li class="fieldcontain">
					<span id="zxss-label" class="property-label"><g:message code="YBerthage.zxss.label" default="Zxss" /></span>
					
						<span class="property-value" aria-labelledby="zxss-label"><g:fieldValue bean="${YBerthageInstance}" field="zxss"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${YBerthageInstance?.id}" />
					<g:link class="edit" action="edit" id="${YBerthageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
