
<%@ page import="com.app.ywms.contract.BaseContract" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bgContract.label', default: 'BgContract')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bgContract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bgContract" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="zgksrq" title="${message(code: 'bgContract.zgksrq.label', default: 'Zgksrq')}" />
					
						<g:sortableColumn property="zgjsrq" title="${message(code: 'bgContract.zgjsrq.label', default: 'Zgjsrq')}" />
					
						<g:sortableColumn property="zdrq" title="${message(code: 'bgContract.zdrq.label', default: 'Zdrq')}" />
					
						<g:sortableColumn property="shrq" title="${message(code: 'bgContract.shrq.label', default: 'Shrq')}" />
					
						<g:sortableColumn property="azqlj" title="${message(code: 'bgContract.azqlj.label', default: 'Azqlj')}" />
					
						<th><g:message code="bgContract.bdCumandoc.label" default="Bd Cumandoc" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bgContractInstanceList}" status="i" var="bgContractInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bgContractInstance.id}">${fieldValue(bean: bgContractInstance, field: "zgksrq")}</g:link></td>
					
						<td><g:formatDate date="${bgContractInstance.zgjsrq}" /></td>
					
						<td><g:formatDate date="${bgContractInstance.zdrq}" /></td>
					
						<td><g:formatDate date="${bgContractInstance.shrq}" /></td>
					
						<td><g:formatBoolean boolean="${bgContractInstance.azqlj}" /></td>
					
						<td>${fieldValue(bean: bgContractInstance, field: "bdCumandoc")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bgContractInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
