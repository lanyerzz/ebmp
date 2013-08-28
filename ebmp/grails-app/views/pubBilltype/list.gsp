
<%@ page import="com.app.pub.billtype.PubBilltype" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubBilltype.label', default: 'PubBilltype')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pubBilltype" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pubBilltype" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="billtypecode" title="${message(code: 'pubBilltype.billtypecode.label', default: 'Billtypecode')}" />
					
						<g:sortableColumn property="billtypename" title="${message(code: 'pubBilltype.billtypename.label', default: 'Billtypename')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'pubBilltype.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'pubBilltype.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pubBilltypeInstanceList}" status="i" var="pubBilltypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pubBilltypeInstance.id}">${fieldValue(bean: pubBilltypeInstance, field: "billtypecode")}</g:link></td>
					
						<td>${fieldValue(bean: pubBilltypeInstance, field: "billtypename")}</td>
					
						<td><g:formatDate date="${pubBilltypeInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${pubBilltypeInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pubBilltypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
