
<%@ page import="com.app.bd.pack.BdPack" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdPack.label', default: 'BdPack')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bdPack" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bdPack" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="bdPack.bdCorp.label" default="Bd Corp" /></th>
					
						<g:sortableColumn property="code" title="${message(code: 'bdPack.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bdPack.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="bdPack.invbasdoc.label" default="Invbasdoc" /></th>
					
						<th><g:message code="bdPack.invcl.label" default="Invcl" /></th>
					
						<th><g:message code="bdPack.invmandoc.label" default="Invmandoc" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bdPackInstanceList}" status="i" var="bdPackInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bdPackInstance.id}">${fieldValue(bean: bdPackInstance, field: "bdCorp")}</g:link></td>
					
						<td>${fieldValue(bean: bdPackInstance, field: "code")}</td>
					
						<td><g:formatDate date="${bdPackInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: bdPackInstance, field: "invbasdoc")}</td>
					
						<td>${fieldValue(bean: bdPackInstance, field: "invcl")}</td>
					
						<td>${fieldValue(bean: bdPackInstance, field: "invmandoc")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bdPackInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
