
<%@ page import="com.app.pub.billnorule.PubBillnorule" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubBillnorule.label', default: 'PubBillnorule')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pubBillnorule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pubBillnorule" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pubBillnorule">
			
				<g:if test="${pubBillnoruleInstance?.pubbilltype}">
				<li class="fieldcontain">
					<span id="pubbilltype-label" class="property-label"><g:message code="pubBillnorule.pubbilltype.label" default="Pubbilltype" /></span>
					
						<span class="property-value" aria-labelledby="pubbilltype-label"><g:link controller="pubBilltype" action="show" id="${pubBillnoruleInstance?.pubbilltype?.id}">${pubBillnoruleInstance?.pubbilltype?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBillnoruleInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="pubBillnorule.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${pubBillnoruleInstance?.bdCorp?.id}">${pubBillnoruleInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBillnoruleInstance?.bdate}">
				<li class="fieldcontain">
					<span id="bdate-label" class="property-label"><g:message code="pubBillnorule.bdate.label" default="Bdate" /></span>
					
						<span class="property-value" aria-labelledby="bdate-label"><g:formatBoolean boolean="${pubBillnoruleInstance?.bdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBillnoruleInstance?.cleanByDay}">
				<li class="fieldcontain">
					<span id="cleanByDay-label" class="property-label"><g:message code="pubBillnorule.cleanByDay.label" default="Clean By Day" /></span>
					
						<span class="property-value" aria-labelledby="cleanByDay-label"><g:formatBoolean boolean="${pubBillnoruleInstance?.cleanByDay}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBillnoruleInstance?.currentNo}">
				<li class="fieldcontain">
					<span id="currentNo-label" class="property-label"><g:message code="pubBillnorule.currentNo.label" default="Current No" /></span>
					
						<span class="property-value" aria-labelledby="currentNo-label"><g:fieldValue bean="${pubBillnoruleInstance}" field="currentNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBillnoruleInstance?.currentNoDate}">
				<li class="fieldcontain">
					<span id="currentNoDate-label" class="property-label"><g:message code="pubBillnorule.currentNoDate.label" default="Current No Date" /></span>
					
						<span class="property-value" aria-labelledby="currentNoDate-label"><g:formatDate date="${pubBillnoruleInstance?.currentNoDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBillnoruleInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="pubBillnorule.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pubBillnoruleInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBillnoruleInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="pubBillnorule.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${pubBillnoruleInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBillnoruleInstance?.nolength}">
				<li class="fieldcontain">
					<span id="nolength-label" class="property-label"><g:message code="pubBillnorule.nolength.label" default="Nolength" /></span>
					
						<span class="property-value" aria-labelledby="nolength-label"><g:fieldValue bean="${pubBillnoruleInstance}" field="nolength"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubBillnoruleInstance?.subcode}">
				<li class="fieldcontain">
					<span id="subcode-label" class="property-label"><g:message code="pubBillnorule.subcode.label" default="Subcode" /></span>
					
						<span class="property-value" aria-labelledby="subcode-label"><g:fieldValue bean="${pubBillnoruleInstance}" field="subcode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pubBillnoruleInstance?.id}" />
					<g:link class="edit" action="edit" id="${pubBillnoruleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
