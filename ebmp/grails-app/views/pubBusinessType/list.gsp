
<%@ page import="com.app.pub.businesstype.PubBusinessType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubBusinessType.label', default: 'PubBusinessType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pubBusinessType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pubBusinessType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="pubBusinessType.bdCorp.label" default="Bd Corp" /></th>
					
						<g:sortableColumn property="code" title="${message(code: 'pubBusinessType.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'pubBusinessType.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'pubBusinessType.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'pubBusinessType.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pubBusinessTypeInstanceList}" status="i" var="pubBusinessTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pubBusinessTypeInstance.id}">${fieldValue(bean: pubBusinessTypeInstance, field: "bdCorp")}</g:link></td>
					
						<td>${fieldValue(bean: pubBusinessTypeInstance, field: "code")}</td>
					
						<td><g:formatDate date="${pubBusinessTypeInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${pubBusinessTypeInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: pubBusinessTypeInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pubBusinessTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
