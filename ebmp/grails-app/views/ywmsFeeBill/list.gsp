
<%@ page import="com.app.ywms.settle.fee.YwmsFeeBill" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ywmsFeeBill.label', default: 'YwmsFeeBill')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ywmsFeeBill" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ywmsFeeBill" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="billdate" title="${message(code: 'ywmsFeeBill.billdate.label', default: 'Billdate')}" />
					
						<th><g:message code="ywmsFeeBill.feeType.label" default="Fee Type" /></th>
					
						<g:sortableColumn property="jsrq" title="${message(code: 'ywmsFeeBill.jsrq.label', default: 'Jsrq')}" />
					
						<g:sortableColumn property="dj" title="${message(code: 'ywmsFeeBill.dj.label', default: 'Dj')}" />
					
						<g:sortableColumn property="yfsl" title="${message(code: 'ywmsFeeBill.yfsl.label', default: 'Yfsl')}" />
					
						<g:sortableColumn property="yfje" title="${message(code: 'ywmsFeeBill.yfje.label', default: 'Yfje')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ywmsFeeBillInstanceList}" status="i" var="ywmsFeeBillInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ywmsFeeBillInstance.id}">${fieldValue(bean: ywmsFeeBillInstance, field: "billdate")}</g:link></td>
					
						<td>${fieldValue(bean: ywmsFeeBillInstance, field: "feeType")}</td>
					
						<td><g:formatDate date="${ywmsFeeBillInstance.jsrq}" /></td>
					
						<td>${fieldValue(bean: ywmsFeeBillInstance, field: "dj")}</td>
					
						<td>${fieldValue(bean: ywmsFeeBillInstance, field: "yfsl")}</td>
					
						<td>${fieldValue(bean: ywmsFeeBillInstance, field: "yfje")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ywmsFeeBillInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
