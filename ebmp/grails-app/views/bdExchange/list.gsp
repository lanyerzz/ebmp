
<%@ page import="com.app.bd.exchange.BdExchange" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdExchange.label', default: 'BdExchange')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bdExchange" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bdExchange" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="bdExchange.currtypeOne.label" default="Currtype One" /></th>
					
						<th><g:message code="bdExchange.currtypeTwo.label" default="Currtype Two" /></th>
					
						<g:sortableColumn property="year" title="${message(code: 'bdExchange.year.label', default: 'Year')}" />
					
						<th><g:message code="bdExchange.bdCorp.label" default="Bd Corp" /></th>
					
						<g:sortableColumn property="checkDate" title="${message(code: 'bdExchange.checkDate.label', default: 'Check Date')}" />
					
						<th><g:message code="bdExchange.checker.label" default="Checker" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bdExchangeInstanceList}" status="i" var="bdExchangeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bdExchangeInstance.id}">${fieldValue(bean: bdExchangeInstance, field: "currtypeOne")}</g:link></td>
					
						<td>${fieldValue(bean: bdExchangeInstance, field: "currtypeTwo")}</td>
					
						<td>${fieldValue(bean: bdExchangeInstance, field: "year")}</td>
					
						<td>${fieldValue(bean: bdExchangeInstance, field: "bdCorp")}</td>
					
						<td><g:formatDate date="${bdExchangeInstance.checkDate}" /></td>
					
						<td>${fieldValue(bean: bdExchangeInstance, field: "checker")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bdExchangeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
