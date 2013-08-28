
<%@ page import="com.app.bd.currtype.BdCurrtype" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdCurrtype.label', default: 'BdCurrtype')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdCurrtype" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdCurrtype" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdCurrtype">
			
				<g:if test="${bdCurrtypeInstance?.currtypecode}">
				<li class="fieldcontain">
					<span id="currtypecode-label" class="property-label"><g:message code="bdCurrtype.currtypecode.label" default="Currtypecode" /></span>
					
						<span class="property-value" aria-labelledby="currtypecode-label"><g:fieldValue bean="${bdCurrtypeInstance}" field="currtypecode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCurrtypeInstance?.currtypename}">
				<li class="fieldcontain">
					<span id="currtypename-label" class="property-label"><g:message code="bdCurrtype.currtypename.label" default="Currtypename" /></span>
					
						<span class="property-value" aria-labelledby="currtypename-label"><g:fieldValue bean="${bdCurrtypeInstance}" field="currtypename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCurrtypeInstance?.currtypesign}">
				<li class="fieldcontain">
					<span id="currtypesign-label" class="property-label"><g:message code="bdCurrtype.currtypesign.label" default="Currtypesign" /></span>
					
						<span class="property-value" aria-labelledby="currtypesign-label"><g:fieldValue bean="${bdCurrtypeInstance}" field="currtypesign"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCurrtypeInstance?.currbusidigit}">
				<li class="fieldcontain">
					<span id="currbusidigit-label" class="property-label"><g:message code="bdCurrtype.currbusidigit.label" default="Currbusidigit" /></span>
					
						<span class="property-value" aria-labelledby="currbusidigit-label"><g:fieldValue bean="${bdCurrtypeInstance}" field="currbusidigit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCurrtypeInstance?.currdigit}">
				<li class="fieldcontain">
					<span id="currdigit-label" class="property-label"><g:message code="bdCurrtype.currdigit.label" default="Currdigit" /></span>
					
						<span class="property-value" aria-labelledby="currdigit-label"><g:fieldValue bean="${bdCurrtypeInstance}" field="currdigit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCurrtypeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdCurrtype.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdCurrtypeInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCurrtypeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdCurrtype.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdCurrtypeInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdCurrtypeInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdCurrtypeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
