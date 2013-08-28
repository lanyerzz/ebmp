
<%@ page import="com.app.bd.carsinfo.BdCarsinfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdCarsinfo.label', default: 'BdCarsinfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdCarsinfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdCarsinfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdCarsinfo">
			
				<g:if test="${bdCarsinfoInstance?.carCode}">
				<li class="fieldcontain">
					<span id="carCode-label" class="property-label"><g:message code="bdCarsinfo.carCode.label" default="Car Code" /></span>
					
						<span class="property-value" aria-labelledby="carCode-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="carCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.carNo}">
				<li class="fieldcontain">
					<span id="carNo-label" class="property-label"><g:message code="bdCarsinfo.carNo.label" default="Car No" /></span>
					
						<span class="property-value" aria-labelledby="carNo-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="carNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.yszjyxq}">
				<li class="fieldcontain">
					<span id="yszjyxq-label" class="property-label"><g:message code="bdCarsinfo.yszjyxq.label" default="Yszjyxq" /></span>
					
						<span class="property-value" aria-labelledby="yszjyxq-label"><g:formatDate date="${bdCarsinfoInstance?.yszjyxq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.ylrqyxq}">
				<li class="fieldcontain">
					<span id="ylrqyxq-label" class="property-label"><g:message code="bdCarsinfo.ylrqyxq.label" default="Ylrqyxq" /></span>
					
						<span class="property-value" aria-labelledby="ylrqyxq-label"><g:formatDate date="${bdCarsinfoInstance?.ylrqyxq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.approvedLoading}">
				<li class="fieldcontain">
					<span id="approvedLoading-label" class="property-label"><g:message code="bdCarsinfo.approvedLoading.label" default="Approved Loading" /></span>
					
						<span class="property-value" aria-labelledby="approvedLoading-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="approvedLoading"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.carOwner}">
				<li class="fieldcontain">
					<span id="carOwner-label" class="property-label"><g:message code="bdCarsinfo.carOwner.label" default="Car Owner" /></span>
					
						<span class="property-value" aria-labelledby="carOwner-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="carOwner"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.carOwnerId}">
				<li class="fieldcontain">
					<span id="carOwnerId-label" class="property-label"><g:message code="bdCarsinfo.carOwnerId.label" default="Car Owner Id" /></span>
					
						<span class="property-value" aria-labelledby="carOwnerId-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="carOwnerId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.carType}">
				<li class="fieldcontain">
					<span id="carType-label" class="property-label"><g:message code="bdCarsinfo.carType.label" default="Car Type" /></span>
					
						<span class="property-value" aria-labelledby="carType-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="carType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.carrier}">
				<li class="fieldcontain">
					<span id="carrier-label" class="property-label"><g:message code="bdCarsinfo.carrier.label" default="Carrier" /></span>
					
						<span class="property-value" aria-labelledby="carrier-label"><g:link controller="bdCumandoc" action="show" id="${bdCarsinfoInstance?.carrier?.id}">${bdCarsinfoInstance?.carrier?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.clqsdw}">
				<li class="fieldcontain">
					<span id="clqsdw-label" class="property-label"><g:message code="bdCarsinfo.clqsdw.label" default="Clqsdw" /></span>
					
						<span class="property-value" aria-labelledby="clqsdw-label"><g:link controller="bdCumandoc" action="show" id="${bdCarsinfoInstance?.clqsdw?.id}">${bdCarsinfoInstance?.clqsdw?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdCarsinfo.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdCarsinfoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.deadweight}">
				<li class="fieldcontain">
					<span id="deadweight-label" class="property-label"><g:message code="bdCarsinfo.deadweight.label" default="Deadweight" /></span>
					
						<span class="property-value" aria-labelledby="deadweight-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="deadweight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.isLoadlimit}">
				<li class="fieldcontain">
					<span id="isLoadlimit-label" class="property-label"><g:message code="bdCarsinfo.isLoadlimit.label" default="Is Loadlimit" /></span>
					
						<span class="property-value" aria-labelledby="isLoadlimit-label"><g:formatBoolean boolean="${bdCarsinfoInstance?.isLoadlimit}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdCarsinfo.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdCarsinfoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.linkMan}">
				<li class="fieldcontain">
					<span id="linkMan-label" class="property-label"><g:message code="bdCarsinfo.linkMan.label" default="Link Man" /></span>
					
						<span class="property-value" aria-labelledby="linkMan-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="linkMan"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.linkPhone}">
				<li class="fieldcontain">
					<span id="linkPhone-label" class="property-label"><g:message code="bdCarsinfo.linkPhone.label" default="Link Phone" /></span>
					
						<span class="property-value" aria-labelledby="linkPhone-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="linkPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="bdCarsinfo.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.ylrqzNo}">
				<li class="fieldcontain">
					<span id="ylrqzNo-label" class="property-label"><g:message code="bdCarsinfo.ylrqzNo.label" default="Ylrqz No" /></span>
					
						<span class="property-value" aria-labelledby="ylrqzNo-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="ylrqzNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCarsinfoInstance?.yszjCode}">
				<li class="fieldcontain">
					<span id="yszjCode-label" class="property-label"><g:message code="bdCarsinfo.yszjCode.label" default="Yszj Code" /></span>
					
						<span class="property-value" aria-labelledby="yszjCode-label"><g:fieldValue bean="${bdCarsinfoInstance}" field="yszjCode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdCarsinfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdCarsinfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
