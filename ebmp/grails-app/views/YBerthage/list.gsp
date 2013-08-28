
<%@ page import="com.app.ywms.bd.berthage.YBerthage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'YBerthage.label', default: 'YBerthage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-YBerthage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-YBerthage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'YBerthage.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'YBerthage.name.label', default: 'Name')}" />
					
						<th><g:message code="YBerthage.bdCorp.label" default="Bd Corp" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'YBerthage.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="describe" title="${message(code: 'YBerthage.describe.label', default: 'Describe')}" />
					
						<g:sortableColumn property="isuse" title="${message(code: 'YBerthage.isuse.label', default: 'Isuse')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${YBerthageInstanceList}" status="i" var="YBerthageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${YBerthageInstance.id}">${fieldValue(bean: YBerthageInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: YBerthageInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: YBerthageInstance, field: "bdCorp")}</td>
					
						<td><g:formatDate date="${YBerthageInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: YBerthageInstance, field: "describe")}</td>
					
						<td><g:formatBoolean boolean="${YBerthageInstance.isuse}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${YBerthageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
