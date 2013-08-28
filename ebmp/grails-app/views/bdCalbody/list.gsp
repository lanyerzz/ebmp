
<%@ page import="com.app.bd.calbody.BdCalbody" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdCalbody.label', default: 'BdCalbody')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bdCalbody" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bdCalbody" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'bdCalbody.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'bdCalbody.name.label', default: 'Name')}" />
					
						<th><g:message code="bdCalbody.areacl.label" default="Areacl" /></th>
					
						<th><g:message code="bdCalbody.bdCorp.label" default="Bd Corp" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bdCalbody.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'bdCalbody.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bdCalbodyInstanceList}" status="i" var="bdCalbodyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bdCalbodyInstance.id}">${fieldValue(bean: bdCalbodyInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: bdCalbodyInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: bdCalbodyInstance, field: "areacl")}</td>
					
						<td>${fieldValue(bean: bdCalbodyInstance, field: "bdCorp")}</td>
					
						<td><g:formatDate date="${bdCalbodyInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${bdCalbodyInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bdCalbodyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
