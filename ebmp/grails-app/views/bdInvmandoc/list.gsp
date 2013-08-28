
<%@ page import="com.app.bd.invmandoc.BdInvmandoc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdInvmandoc.label', default: 'BdInvmandoc')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bdInvmandoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bdInvmandoc" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="accFlag" title="${message(code: 'bdInvmandoc.accFlag.label', default: 'Acc Flag')}" />
					
						<g:sortableColumn property="cinvmneCode" title="${message(code: 'bdInvmandoc.cinvmneCode.label', default: 'Cinvmne Code')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bdInvmandoc.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="keepWasteRate" title="${message(code: 'bdInvmandoc.keepWasteRate.label', default: 'Keep Waste Rate')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'bdInvmandoc.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="lowestPrice" title="${message(code: 'bdInvmandoc.lowestPrice.label', default: 'Lowest Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bdInvmandocInstanceList}" status="i" var="bdInvmandocInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bdInvmandocInstance.id}">${fieldValue(bean: bdInvmandocInstance, field: "accFlag")}</g:link></td>
					
						<td>${fieldValue(bean: bdInvmandocInstance, field: "cinvmneCode")}</td>
					
						<td><g:formatDate date="${bdInvmandocInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: bdInvmandocInstance, field: "keepWasteRate")}</td>
					
						<td><g:formatDate date="${bdInvmandocInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: bdInvmandocInstance, field: "lowestPrice")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bdInvmandocInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
