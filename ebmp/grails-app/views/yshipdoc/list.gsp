
<%@ page import="com.app.ywms.bd.shipdoc.Yshipdoc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'yshipdoc.label', default: 'Yshipdoc')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-yshipdoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-yshipdoc" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="buildYear" title="${message(code: 'yshipdoc.buildYear.label', default: 'Build Year')}" />
					
						<g:sortableColumn property="makedate" title="${message(code: 'yshipdoc.makedate.label', default: 'Makedate')}" />
					
						<g:sortableColumn property="shipname" title="${message(code: 'yshipdoc.shipname.label', default: 'Shipname')}" />
					
						<g:sortableColumn property="badj" title="${message(code: 'yshipdoc.badj.label', default: 'Badj')}" />
					
						<g:sortableColumn property="basm" title="${message(code: 'yshipdoc.basm.label', default: 'Basm')}" />
					
						<g:sortableColumn property="bazsh" title="${message(code: 'yshipdoc.bazsh.label', default: 'Bazsh')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${yshipdocInstanceList}" status="i" var="yshipdocInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${yshipdocInstance.id}">${fieldValue(bean: yshipdocInstance, field: "buildYear")}</g:link></td>
					
						<td><g:formatDate date="${yshipdocInstance.makedate}" /></td>
					
						<td>${fieldValue(bean: yshipdocInstance, field: "shipname")}</td>
					
						<td>${fieldValue(bean: yshipdocInstance, field: "badj")}</td>
					
						<td>${fieldValue(bean: yshipdocInstance, field: "basm")}</td>
					
						<td>${fieldValue(bean: yshipdocInstance, field: "bazsh")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${yshipdocInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
