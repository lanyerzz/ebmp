<%@ page import="com.app.ywms.contract.BaseContract" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lszlContract.label', default: 'LszlContract')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-lszlContract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-lszlContract" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="signDate" title="${message(code: 'lszlContract.signDate.label', default: 'Sign Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'lszlContract.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="yjdgrq" title="${message(code: 'lszlContract.yjdgrq.label', default: 'Yjdgrq')}" />
					
						<g:sortableColumn property="zdrq" title="${message(code: 'lszlContract.zdrq.label', default: 'Zdrq')}" />
					
						<g:sortableColumn property="shrq" title="${message(code: 'lszlContract.shrq.label', default: 'Shrq')}" />
					
						<g:sortableColumn property="azqlj" title="${message(code: 'lszlContract.azqlj.label', default: 'Azqlj')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${lszlContractInstanceList}" status="i" var="lszlContractInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${lszlContractInstance.id}">${fieldValue(bean: lszlContractInstance, field: "signDate")}</g:link></td>
					
						<td><g:formatDate date="${lszlContractInstance.endDate}" /></td>
					
						<td><g:formatDate date="${lszlContractInstance.yjdgrq}" /></td>
					
						<td><g:formatDate date="${lszlContractInstance.zdrq}" /></td>
					
						<td><g:formatDate date="${lszlContractInstance.shrq}" /></td>
					
						<td><g:formatBoolean boolean="${lszlContractInstance.azqlj}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${lszlContractInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
