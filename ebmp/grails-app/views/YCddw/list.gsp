
<%@ page import="com.app.ywms.bd.cddw.YCddw" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'YCddw.label', default: 'YCddw')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-YCddw" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-YCddw" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'YCddw.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'YCddw.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="makedate" title="${message(code: 'YCddw.makedate.label', default: 'Makedate')}" />
					
						<g:sortableColumn property="account" title="${message(code: 'YCddw.account.label', default: 'Account')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'YCddw.address.label', default: 'Address')}" />
					
						<th><g:message code="YCddw.bdCumandoc.label" default="Bd Cumandoc" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${YCddwInstanceList}" status="i" var="YCddwInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${YCddwInstance.id}">${fieldValue(bean: YCddwInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: YCddwInstance, field: "name")}</td>
					
						<td><g:formatDate date="${YCddwInstance.makedate}" /></td>
					
						<td>${fieldValue(bean: YCddwInstance, field: "account")}</td>
					
						<td>${fieldValue(bean: YCddwInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: YCddwInstance, field: "bdCumandoc")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${YCddwInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
