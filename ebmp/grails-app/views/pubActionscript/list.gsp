
<%@ page import="com.app.pub.actionscript.PubActionscript" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubActionscript.label', default: 'PubActionscript')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pubActionscript" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pubActionscript" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="scriptCode" title="${message(code: 'pubActionscript.scriptCode.label', default: 'Script Code')}" />
					
						<g:sortableColumn property="scriptName" title="${message(code: 'pubActionscript.scriptName.label', default: 'Script Name')}" />
					
						<g:sortableColumn property="path" title="${message(code: 'pubActionscript.path.label', default: 'Path')}" />
					
						<g:sortableColumn property="actionType" title="${message(code: 'pubActionscript.actionType.label', default: 'Action Type')}" />
					
						<th><g:message code="pubActionscript.pubBilltype.label" default="Pub Billtype" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'pubActionscript.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pubActionscriptInstanceList}" status="i" var="pubActionscriptInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pubActionscriptInstance.id}">${fieldValue(bean: pubActionscriptInstance, field: "scriptCode")}</g:link></td>
					
						<td>${fieldValue(bean: pubActionscriptInstance, field: "scriptName")}</td>
					
						<td>${fieldValue(bean: pubActionscriptInstance, field: "path")}</td>
					
						<td>${fieldValue(bean: pubActionscriptInstance, field: "actionType")}</td>
					
						<td>${fieldValue(bean: pubActionscriptInstance, field: "pubBilltype")}</td>
					
						<td><g:formatDate date="${pubActionscriptInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pubActionscriptInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
