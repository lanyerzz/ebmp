
<%@ page import="com.app.bd.psnbasdoc.BdPsnbasdoc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdPsnbasdoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdPsnbasdoc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdPsnbasdoc">
			
				<g:if test="${bdPsnbasdocInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bdPsnbasdoc.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.sex}">
				<li class="fieldcontain">
					<span id="sex-label" class="property-label"><g:message code="bdPsnbasdoc.sex.label" default="Sex" /></span>
					
						<span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="sex"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.birthdate}">
				<li class="fieldcontain">
					<span id="birthdate-label" class="property-label"><g:message code="bdPsnbasdoc.birthdate.label" default="Birthdate" /></span>
					
						<span class="property-value" aria-labelledby="birthdate-label"><g:formatDate date="${bdPsnbasdocInstance?.birthdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.shenfenzhenghao}">
				<li class="fieldcontain">
					<span id="shenfenzhenghao-label" class="property-label"><g:message code="bdPsnbasdoc.shenfenzhenghao.label" default="Shenfenzhenghao" /></span>
					
						<span class="property-value" aria-labelledby="shenfenzhenghao-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="shenfenzhenghao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.addr}">
				<li class="fieldcontain">
					<span id="addr-label" class="property-label"><g:message code="bdPsnbasdoc.addr.label" default="Addr" /></span>
					
						<span class="property-value" aria-labelledby="addr-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="addr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="bdPsnbasdoc.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${bdPsnbasdocInstance?.bdCorp?.id}">${bdPsnbasdocInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdPsnbasdoc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdPsnbasdocInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="bdPsnbasdoc.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.homephone}">
				<li class="fieldcontain">
					<span id="homephone-label" class="property-label"><g:message code="bdPsnbasdoc.homephone.label" default="Homephone" /></span>
					
						<span class="property-value" aria-labelledby="homephone-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="homephone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.joinworkdate}">
				<li class="fieldcontain">
					<span id="joinworkdate-label" class="property-label"><g:message code="bdPsnbasdoc.joinworkdate.label" default="Joinworkdate" /></span>
					
						<span class="property-value" aria-labelledby="joinworkdate-label"><g:formatDate date="${bdPsnbasdocInstance?.joinworkdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdPsnbasdoc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdPsnbasdocInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.mobile}">
				<li class="fieldcontain">
					<span id="mobile-label" class="property-label"><g:message code="bdPsnbasdoc.mobile.label" default="Mobile" /></span>
					
						<span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="mobile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.officephone}">
				<li class="fieldcontain">
					<span id="officephone-label" class="property-label"><g:message code="bdPsnbasdoc.officephone.label" default="Officephone" /></span>
					
						<span class="property-value" aria-labelledby="officephone-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="officephone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.postalcode}">
				<li class="fieldcontain">
					<span id="postalcode-label" class="property-label"><g:message code="bdPsnbasdoc.postalcode.label" default="Postalcode" /></span>
					
						<span class="property-value" aria-labelledby="postalcode-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="postalcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.ssnum}">
				<li class="fieldcontain">
					<span id="ssnum-label" class="property-label"><g:message code="bdPsnbasdoc.ssnum.label" default="Ssnum" /></span>
					
						<span class="property-value" aria-labelledby="ssnum-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="ssnum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsnbasdocInstance?.usedname}">
				<li class="fieldcontain">
					<span id="usedname-label" class="property-label"><g:message code="bdPsnbasdoc.usedname.label" default="Usedname" /></span>
					
						<span class="property-value" aria-labelledby="usedname-label"><g:fieldValue bean="${bdPsnbasdocInstance}" field="usedname"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdPsnbasdocInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdPsnbasdocInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
