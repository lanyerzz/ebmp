
<%@ page import="com.app.bd.deptdoc.BdDeptdoc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdDeptdoc.label', default: 'BdDeptdoc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdDeptdoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdDeptdoc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdDeptdoc">
			
				<g:if test="${bdDeptdocInstance?.deptCode}">
				<li class="fieldcontain">
					<span id="deptCode-label" class="property-label"><g:message code="bdDeptdoc.deptCode.label" default="Dept Code" /></span>
					
						<span class="property-value" aria-labelledby="deptCode-label"><g:fieldValue bean="${bdDeptdocInstance}" field="deptCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.deptName}">
				<li class="fieldcontain">
					<span id="deptName-label" class="property-label"><g:message code="bdDeptdoc.deptName.label" default="Dept Name" /></span>
					
						<span class="property-value" aria-labelledby="deptName-label"><g:fieldValue bean="${bdDeptdocInstance}" field="deptName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.addr}">
				<li class="fieldcontain">
					<span id="addr-label" class="property-label"><g:message code="bdDeptdoc.addr.label" default="Addr" /></span>
					
						<span class="property-value" aria-labelledby="addr-label"><g:fieldValue bean="${bdDeptdocInstance}" field="addr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.canceled}">
				<li class="fieldcontain">
					<span id="canceled-label" class="property-label"><g:message code="bdDeptdoc.canceled.label" default="Canceled" /></span>
					
						<span class="property-value" aria-labelledby="canceled-label"><g:formatBoolean boolean="${bdDeptdocInstance?.canceled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.corp}">
				<li class="fieldcontain">
					<span id="corp-label" class="property-label"><g:message code="bdDeptdoc.corp.label" default="Corp" /></span>
					
						<span class="property-value" aria-labelledby="corp-label"><g:link controller="bdCorp" action="show" id="${bdDeptdocInstance?.corp?.id}">${bdDeptdocInstance?.corp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdDeptdoc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdDeptdocInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.def1}">
				<li class="fieldcontain">
					<span id="def1-label" class="property-label"><g:message code="bdDeptdoc.def1.label" default="Def1" /></span>
					
						<span class="property-value" aria-labelledby="def1-label"><g:fieldValue bean="${bdDeptdocInstance}" field="def1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.def2}">
				<li class="fieldcontain">
					<span id="def2-label" class="property-label"><g:message code="bdDeptdoc.def2.label" default="Def2" /></span>
					
						<span class="property-value" aria-labelledby="def2-label"><g:fieldValue bean="${bdDeptdocInstance}" field="def2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.def3}">
				<li class="fieldcontain">
					<span id="def3-label" class="property-label"><g:message code="bdDeptdoc.def3.label" default="Def3" /></span>
					
						<span class="property-value" aria-labelledby="def3-label"><g:fieldValue bean="${bdDeptdocInstance}" field="def3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.def4}">
				<li class="fieldcontain">
					<span id="def4-label" class="property-label"><g:message code="bdDeptdoc.def4.label" default="Def4" /></span>
					
						<span class="property-value" aria-labelledby="def4-label"><g:fieldValue bean="${bdDeptdocInstance}" field="def4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.def5}">
				<li class="fieldcontain">
					<span id="def5-label" class="property-label"><g:message code="bdDeptdoc.def5.label" default="Def5" /></span>
					
						<span class="property-value" aria-labelledby="def5-label"><g:fieldValue bean="${bdDeptdocInstance}" field="def5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.fatheId}">
				<li class="fieldcontain">
					<span id="fatheId-label" class="property-label"><g:message code="bdDeptdoc.fatheId.label" default="Fathe Id" /></span>
					
						<span class="property-value" aria-labelledby="fatheId-label"><g:fieldValue bean="${bdDeptdocInstance}" field="fatheId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdDeptdoc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdDeptdocInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="bdDeptdoc.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${bdDeptdocInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="bdDeptdoc.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${bdDeptdocInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdDeptdocInstance?.remcode}">
				<li class="fieldcontain">
					<span id="remcode-label" class="property-label"><g:message code="bdDeptdoc.remcode.label" default="Remcode" /></span>
					
						<span class="property-value" aria-labelledby="remcode-label"><g:fieldValue bean="${bdDeptdocInstance}" field="remcode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdDeptdocInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdDeptdocInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
