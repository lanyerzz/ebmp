
<%@ page import="com.app.tm.templetallot.TmTempletallot" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tmTempletallot.label', default: 'TmTempletallot')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tmTempletallot" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tmTempletallot" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="tmTempletallot.function.label" default="Function" /></th>
					
						<g:sortableColumn property="templetType" title="${message(code: 'tmTempletallot.templetType.label', default: 'Templet Type')}" />
					
						<th><g:message code="tmTempletallot.tmTemplet.label" default="Tm Templet" /></th>
					
						<g:sortableColumn property="code" title="${message(code: 'tmTempletallot.code.label', default: 'Code')}" />
					
						<th><g:message code="tmTempletallot.corp.label" default="Corp" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'tmTempletallot.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tmTempletallotInstanceList}" status="i" var="tmTempletallotInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tmTempletallotInstance.id}">${fieldValue(bean: tmTempletallotInstance, field: "function")}</g:link></td>
					
						<td>${fieldValue(bean: tmTempletallotInstance, field: "templetType")}</td>
					
						<td>${fieldValue(bean: tmTempletallotInstance, field: "tmTemplet")}</td>
					
						<td>${fieldValue(bean: tmTempletallotInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: tmTempletallotInstance, field: "corp")}</td>
					
						<td><g:formatDate date="${tmTempletallotInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tmTempletallotInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
