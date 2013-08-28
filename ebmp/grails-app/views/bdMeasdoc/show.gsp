
<%@ page import="com.app.bd.measdoc.BdMeasdoc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdMeasdoc.label', default: 'BdMeasdoc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdMeasdoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdMeasdoc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdMeasdoc">
			
				<g:if test="${bdMeasdocInstance?.shortname}">
				<li class="fieldcontain">
					<span id="shortname-label" class="property-label"><g:message code="bdMeasdoc.shortname.label" default="Shortname" /></span>
					
						<span class="property-value" aria-labelledby="shortname-label"><g:fieldValue bean="${bdMeasdocInstance}" field="shortname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdMeasdocInstance?.measname}">
				<li class="fieldcontain">
					<span id="measname-label" class="property-label"><g:message code="bdMeasdoc.measname.label" default="Measname" /></span>
					
						<span class="property-value" aria-labelledby="measname-label"><g:fieldValue bean="${bdMeasdocInstance}" field="measname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdMeasdocInstance?.basecodeflag}">
				<li class="fieldcontain">
					<span id="basecodeflag-label" class="property-label"><g:message code="bdMeasdoc.basecodeflag.label" default="Basecodeflag" /></span>
					
						<span class="property-value" aria-labelledby="basecodeflag-label"><g:formatBoolean boolean="${bdMeasdocInstance?.basecodeflag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdMeasdocInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdMeasdoc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdMeasdocInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdMeasdocInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdMeasdoc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdMeasdocInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdMeasdocInstance?.oppdimen}">
				<li class="fieldcontain">
					<span id="oppdimen-label" class="property-label"><g:message code="bdMeasdoc.oppdimen.label" default="Oppdimen" /></span>
					
						<span class="property-value" aria-labelledby="oppdimen-label"><g:fieldValue bean="${bdMeasdocInstance}" field="oppdimen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdMeasdocInstance?.scalefactor}">
				<li class="fieldcontain">
					<span id="scalefactor-label" class="property-label"><g:message code="bdMeasdoc.scalefactor.label" default="Scalefactor" /></span>
					
						<span class="property-value" aria-labelledby="scalefactor-label"><g:fieldValue bean="${bdMeasdocInstance}" field="scalefactor"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdMeasdocInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdMeasdocInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
