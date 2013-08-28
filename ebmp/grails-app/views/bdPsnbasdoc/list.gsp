
<%@ page import="com.app.bd.psnbasdoc.BdPsnbasdoc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bdPsnbasdoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bdPsnbasdoc" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'bdPsnbasdoc.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="sex" title="${message(code: 'bdPsnbasdoc.sex.label', default: 'Sex')}" />
					
						<g:sortableColumn property="birthdate" title="${message(code: 'bdPsnbasdoc.birthdate.label', default: 'Birthdate')}" />
					
						<g:sortableColumn property="shenfenzhenghao" title="${message(code: 'bdPsnbasdoc.shenfenzhenghao.label', default: 'Shenfenzhenghao')}" />
					
						<g:sortableColumn property="addr" title="${message(code: 'bdPsnbasdoc.addr.label', default: 'Addr')}" />
					
						<th><g:message code="bdPsnbasdoc.bdCorp.label" default="Bd Corp" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bdPsnbasdocInstanceList}" status="i" var="bdPsnbasdocInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bdPsnbasdocInstance.id}">${fieldValue(bean: bdPsnbasdocInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: bdPsnbasdocInstance, field: "sex")}</td>
					
						<td><g:formatDate date="${bdPsnbasdocInstance.birthdate}" /></td>
					
						<td>${fieldValue(bean: bdPsnbasdocInstance, field: "shenfenzhenghao")}</td>
					
						<td>${fieldValue(bean: bdPsnbasdocInstance, field: "addr")}</td>
					
						<td>${fieldValue(bean: bdPsnbasdocInstance, field: "bdCorp")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bdPsnbasdocInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
