
<%@ page import="com.app.bd.banktype.BdBanktype" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdBanktype.label', default: 'BdBanktype')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdBanktype" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdBanktype" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdBanktype">
			
				<g:if test="${bdBanktypeInstance?.banktypecode}">
				<li class="fieldcontain">
					<span id="banktypecode-label" class="property-label"><g:message code="bdBanktype.banktypecode.label" default="Banktypecode" /></span>
					
						<span class="property-value" aria-labelledby="banktypecode-label"><g:fieldValue bean="${bdBanktypeInstance}" field="banktypecode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBanktypeInstance?.banktypename}">
				<li class="fieldcontain">
					<span id="banktypename-label" class="property-label"><g:message code="bdBanktype.banktypename.label" default="Banktypename" /></span>
					
						<span class="property-value" aria-labelledby="banktypename-label"><g:fieldValue bean="${bdBanktypeInstance}" field="banktypename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBanktypeInstance?.amcode}">
				<li class="fieldcontain">
					<span id="amcode-label" class="property-label"><g:message code="bdBanktype.amcode.label" default="Amcode" /></span>
					
						<span class="property-value" aria-labelledby="amcode-label"><g:fieldValue bean="${bdBanktypeInstance}" field="amcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBanktypeInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="bdBanktype.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:fieldValue bean="${bdBanktypeInstance}" field="createtime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBanktypeInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="bdBanktype.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="smUser" action="show" id="${bdBanktypeInstance?.creator?.id}">${bdBanktypeInstance?.creator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBanktypeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdBanktype.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdBanktypeInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBanktypeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdBanktype.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdBanktypeInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBanktypeInstance?.modifier}">
				<li class="fieldcontain">
					<span id="modifier-label" class="property-label"><g:message code="bdBanktype.modifier.label" default="Modifier" /></span>
					
						<span class="property-value" aria-labelledby="modifier-label"><g:link controller="smUser" action="show" id="${bdBanktypeInstance?.modifier?.id}">${bdBanktypeInstance?.modifier?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBanktypeInstance?.sealflag}">
				<li class="fieldcontain">
					<span id="sealflag-label" class="property-label"><g:message code="bdBanktype.sealflag.label" default="Sealflag" /></span>
					
						<span class="property-value" aria-labelledby="sealflag-label"><g:formatBoolean boolean="${bdBanktypeInstance?.sealflag}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdBanktypeInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdBanktypeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
