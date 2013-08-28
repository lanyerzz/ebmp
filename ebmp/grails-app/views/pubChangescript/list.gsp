
<%@ page import="com.app.pub.change.PubChangescript" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubChangescript.label', default: 'PubChangescript')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pubChangescript" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pubChangescript" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="pubChangescript.changeFrom.label" default="Change From" /></th>
					
						<th><g:message code="pubChangescript.changeTo.label" default="Change To" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'pubChangescript.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'pubChangescript.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="path" title="${message(code: 'pubChangescript.path.label', default: 'Path')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pubChangescriptInstanceList}" status="i" var="pubChangescriptInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pubChangescriptInstance.id}">${fieldValue(bean: pubChangescriptInstance, field: "changeFrom")}</g:link></td>
					
						<td>${fieldValue(bean: pubChangescriptInstance, field: "changeTo")}</td>
					
						<td><g:formatDate date="${pubChangescriptInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${pubChangescriptInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: pubChangescriptInstance, field: "path")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pubChangescriptInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
