
<%@ page import="com.app.bd.cumandoc.BdCumandoc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdCumandoc.label', default: 'BdCumandoc')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bdCumandoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bdCumandoc" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cmneCode" title="${message(code: 'bdCumandoc.cmneCode.label', default: 'Cmne Code')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bdCumandoc.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="iscustomer" title="${message(code: 'bdCumandoc.iscustomer.label', default: 'Iscustomer')}" />
					
						<g:sortableColumn property="isvender" title="${message(code: 'bdCumandoc.isvender.label', default: 'Isvender')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'bdCumandoc.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="linkMan" title="${message(code: 'bdCumandoc.linkMan.label', default: 'Link Man')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bdCumandocInstanceList}" status="i" var="bdCumandocInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bdCumandocInstance.id}">${fieldValue(bean: bdCumandocInstance, field: "cmneCode")}</g:link></td>
					
						<td><g:formatDate date="${bdCumandocInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${bdCumandocInstance.iscustomer}" /></td>
					
						<td><g:formatBoolean boolean="${bdCumandocInstance.isvender}" /></td>
					
						<td><g:formatDate date="${bdCumandocInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: bdCumandocInstance, field: "linkMan")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bdCumandocInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
