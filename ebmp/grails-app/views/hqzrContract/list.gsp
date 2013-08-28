<%@ page import="com.app.ywms.contract.BaseContract" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hqzrContract.label', default: 'HqzrContract')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hqzrContract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hqzrContract" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="signDate" title="${message(code: 'hqzrContract.signDate.label', default: 'Sign Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'hqzrContract.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="cqrq" title="${message(code: 'hqzrContract.cqrq.label', default: 'Cqrq')}" />
					
						<g:sortableColumn property="bgshqsrq" title="${message(code: 'hqzrContract.bgshqsrq.label', default: 'Bgshqsrq')}" />
					
						<g:sortableColumn property="zdrq" title="${message(code: 'hqzrContract.zdrq.label', default: 'Zdrq')}" />
					
						<g:sortableColumn property="shrq" title="${message(code: 'hqzrContract.shrq.label', default: 'Shrq')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hqzrContractInstanceList}" status="i" var="hqzrContractInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hqzrContractInstance.id}">${fieldValue(bean: hqzrContractInstance, field: "signDate")}</g:link></td>
					
						<td><g:formatDate date="${hqzrContractInstance.endDate}" /></td>
					
						<td><g:formatDate date="${hqzrContractInstance.cqrq}" /></td>
					
						<td><g:formatDate date="${hqzrContractInstance.bgshqsrq}" /></td>
					
						<td><g:formatDate date="${hqzrContractInstance.zdrq}" /></td>
					
						<td><g:formatDate date="${hqzrContractInstance.shrq}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hqzrContractInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
