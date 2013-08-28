
<%@ page import="com.app.tm.templet.TmTemplet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tmTemplet.label', default: 'TmTemplet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tmTemplet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tmTemplet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="templetCode" title="${message(code: 'tmTemplet.templetCode.label', default: 'Templet Code')}" />
					
						<g:sortableColumn property="templetName" title="${message(code: 'tmTemplet.templetName.label', default: 'Templet Name')}" />
					
						<th><g:message code="tmTemplet.corp.label" default="Corp" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'tmTemplet.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'tmTemplet.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="templetPath" title="${message(code: 'tmTemplet.templetPath.label', default: 'Templet Path')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tmTempletInstanceList}" status="i" var="tmTempletInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tmTempletInstance.id}">${fieldValue(bean: tmTempletInstance, field: "templetCode")}</g:link></td>
					
						<td>${fieldValue(bean: tmTempletInstance, field: "templetName")}</td>
					
						<td>${fieldValue(bean: tmTempletInstance, field: "corp")}</td>
					
						<td><g:formatDate date="${tmTempletInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${tmTempletInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: tmTempletInstance, field: "templetPath")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tmTempletInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
