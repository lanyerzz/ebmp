
<%@ page import="com.app.bd.stordoc.BdStordoc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdStordoc.label', default: 'BdStordoc')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bdStordoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bdStordoc" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'bdStordoc.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'bdStordoc.name.label', default: 'Name')}" />
					
						<th><g:message code="bdStordoc.bdCorp.label" default="Bd Corp" /></th>
					
						<th><g:message code="bdStordoc.calbody.label" default="Calbody" /></th>
					
						<g:sortableColumn property="checkDate" title="${message(code: 'bdStordoc.checkDate.label', default: 'Check Date')}" />
					
						<th><g:message code="bdStordoc.checker.label" default="Checker" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bdStordocInstanceList}" status="i" var="bdStordocInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bdStordocInstance.id}">${fieldValue(bean: bdStordocInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: bdStordocInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: bdStordocInstance, field: "bdCorp")}</td>
					
						<td>${fieldValue(bean: bdStordocInstance, field: "calbody")}</td>
					
						<td><g:formatDate date="${bdStordocInstance.checkDate}" /></td>
					
						<td>${fieldValue(bean: bdStordocInstance, field: "checker")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bdStordocInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
