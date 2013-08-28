
<%@ page import="com.app.sm.user.SmUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'smUser.label', default: 'SmUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-smUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-smUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list smUser">
			
				<g:if test="${smUserInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="smUser.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${smUserInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="smUser.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${smUserInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.ableTime}">
				<li class="fieldcontain">
					<span id="ableTime-label" class="property-label"><g:message code="smUser.ableTime.label" default="Able Time" /></span>
					
						<span class="property-value" aria-labelledby="ableTime-label"><g:fieldValue bean="${smUserInstance}" field="ableTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="smUser.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${smUserInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="smUser.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${smUserInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="smUser.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${smUserInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.busType}">
				<li class="fieldcontain">
					<span id="busType-label" class="property-label"><g:message code="smUser.busType.label" default="Bus Type" /></span>
					
						<span class="property-value" aria-labelledby="busType-label"><g:fieldValue bean="${smUserInstance}" field="busType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="smUser.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${smUserInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.disableTime}">
				<li class="fieldcontain">
					<span id="disableTime-label" class="property-label"><g:message code="smUser.disableTime.label" default="Disable Time" /></span>
					
						<span class="property-value" aria-labelledby="disableTime-label"><g:fieldValue bean="${smUserInstance}" field="disableTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="smUser.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${smUserInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="smUser.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${smUserInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="smUser.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${smUserInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="smUser.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${smUserInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.linkTel}">
				<li class="fieldcontain">
					<span id="linkTel-label" class="property-label"><g:message code="smUser.linkTel.label" default="Link Tel" /></span>
					
						<span class="property-value" aria-labelledby="linkTel-label"><g:fieldValue bean="${smUserInstance}" field="linkTel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.linkTel1}">
				<li class="fieldcontain">
					<span id="linkTel1-label" class="property-label"><g:message code="smUser.linkTel1.label" default="Link Tel1" /></span>
					
						<span class="property-value" aria-labelledby="linkTel1-label"><g:fieldValue bean="${smUserInstance}" field="linkTel1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.linkTel2}">
				<li class="fieldcontain">
					<span id="linkTel2-label" class="property-label"><g:message code="smUser.linkTel2.label" default="Link Tel2" /></span>
					
						<span class="property-value" aria-labelledby="linkTel2-label"><g:fieldValue bean="${smUserInstance}" field="linkTel2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="smUser.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${smUserInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.userRealName}">
				<li class="fieldcontain">
					<span id="userRealName-label" class="property-label"><g:message code="smUser.userRealName.label" default="User Real Name" /></span>
					
						<span class="property-value" aria-labelledby="userRealName-label"><g:fieldValue bean="${smUserInstance}" field="userRealName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smUserInstance?.userenabled}">
				<li class="fieldcontain">
					<span id="userenabled-label" class="property-label"><g:message code="smUser.userenabled.label" default="Userenabled" /></span>
					
						<span class="property-value" aria-labelledby="userenabled-label"><g:formatBoolean boolean="${smUserInstance?.userenabled}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${smUserInstance?.id}" />
					<g:link class="edit" action="edit" id="${smUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
