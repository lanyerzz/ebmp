
<%@ page import="com.app.bd.areacl.BdAreacl" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdAreacl.label', default: 'BdAreacl')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bdAreacl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bdAreacl" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="areaclcode" title="${message(code: 'bdAreacl.areaclcode.label', default: 'Areaclcode')}" />
					
						<g:sortableColumn property="areaclname" title="${message(code: 'bdAreacl.areaclname.label', default: 'Areaclname')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bdAreacl.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="def1" title="${message(code: 'bdAreacl.def1.label', default: 'Def1')}" />
					
						<g:sortableColumn property="def2" title="${message(code: 'bdAreacl.def2.label', default: 'Def2')}" />
					
						<g:sortableColumn property="def3" title="${message(code: 'bdAreacl.def3.label', default: 'Def3')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bdAreaclInstanceList}" status="i" var="bdAreaclInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bdAreaclInstance.id}">${fieldValue(bean: bdAreaclInstance, field: "areaclcode")}</g:link></td>
					
						<td>${fieldValue(bean: bdAreaclInstance, field: "areaclname")}</td>
					
						<td><g:formatDate date="${bdAreaclInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: bdAreaclInstance, field: "def1")}</td>
					
						<td>${fieldValue(bean: bdAreaclInstance, field: "def2")}</td>
					
						<td>${fieldValue(bean: bdAreaclInstance, field: "def3")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bdAreaclInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
