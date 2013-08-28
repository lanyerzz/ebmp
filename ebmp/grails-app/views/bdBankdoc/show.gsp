
<%@ page import="com.app.bd.bankdoc.BdBankdoc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdBankdoc.label', default: 'BdBankdoc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdBankdoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdBankdoc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdBankdoc">
			
				<g:if test="${bdBankdocInstance?.bankdoccode}">
				<li class="fieldcontain">
					<span id="bankdoccode-label" class="property-label"><g:message code="bdBankdoc.bankdoccode.label" default="Bankdoccode" /></span>
					
						<span class="property-value" aria-labelledby="bankdoccode-label"><g:fieldValue bean="${bdBankdocInstance}" field="bankdoccode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.bankdocname}">
				<li class="fieldcontain">
					<span id="bankdocname-label" class="property-label"><g:message code="bdBankdoc.bankdocname.label" default="Bankdocname" /></span>
					
						<span class="property-value" aria-labelledby="bankdocname-label"><g:fieldValue bean="${bdBankdocInstance}" field="bankdocname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="bdBankdoc.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${bdBankdocInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.amcode}">
				<li class="fieldcontain">
					<span id="amcode-label" class="property-label"><g:message code="bdBankdoc.amcode.label" default="Amcode" /></span>
					
						<span class="property-value" aria-labelledby="amcode-label"><g:fieldValue bean="${bdBankdocInstance}" field="amcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.banktype}">
				<li class="fieldcontain">
					<span id="banktype-label" class="property-label"><g:message code="bdBankdoc.banktype.label" default="Banktype" /></span>
					
						<span class="property-value" aria-labelledby="banktype-label"><g:link controller="bdBanktype" action="show" id="${bdBankdocInstance?.banktype?.id}">${bdBankdocInstance?.banktype?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="bdBankdoc.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${bdBankdocInstance?.bdCorp?.id}">${bdBankdocInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="bdBankdoc.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="smUser" action="show" id="${bdBankdocInstance?.creator?.id}">${bdBankdocInstance?.creator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.linkman1}">
				<li class="fieldcontain">
					<span id="linkman1-label" class="property-label"><g:message code="bdBankdoc.linkman1.label" default="Linkman1" /></span>
					
						<span class="property-value" aria-labelledby="linkman1-label"><g:fieldValue bean="${bdBankdocInstance}" field="linkman1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.linkman2}">
				<li class="fieldcontain">
					<span id="linkman2-label" class="property-label"><g:message code="bdBankdoc.linkman2.label" default="Linkman2" /></span>
					
						<span class="property-value" aria-labelledby="linkman2-label"><g:fieldValue bean="${bdBankdocInstance}" field="linkman2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.linkman3}">
				<li class="fieldcontain">
					<span id="linkman3-label" class="property-label"><g:message code="bdBankdoc.linkman3.label" default="Linkman3" /></span>
					
						<span class="property-value" aria-labelledby="linkman3-label"><g:fieldValue bean="${bdBankdocInstance}" field="linkman3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.modifier}">
				<li class="fieldcontain">
					<span id="modifier-label" class="property-label"><g:message code="bdBankdoc.modifier.label" default="Modifier" /></span>
					
						<span class="property-value" aria-labelledby="modifier-label"><g:link controller="smUser" action="show" id="${bdBankdocInstance?.modifier?.id}">${bdBankdocInstance?.modifier?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.phone1}">
				<li class="fieldcontain">
					<span id="phone1-label" class="property-label"><g:message code="bdBankdoc.phone1.label" default="Phone1" /></span>
					
						<span class="property-value" aria-labelledby="phone1-label"><g:fieldValue bean="${bdBankdocInstance}" field="phone1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.phone2}">
				<li class="fieldcontain">
					<span id="phone2-label" class="property-label"><g:message code="bdBankdoc.phone2.label" default="Phone2" /></span>
					
						<span class="property-value" aria-labelledby="phone2-label"><g:fieldValue bean="${bdBankdocInstance}" field="phone2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.phone3}">
				<li class="fieldcontain">
					<span id="phone3-label" class="property-label"><g:message code="bdBankdoc.phone3.label" default="Phone3" /></span>
					
						<span class="property-value" aria-labelledby="phone3-label"><g:fieldValue bean="${bdBankdocInstance}" field="phone3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.pid}">
				<li class="fieldcontain">
					<span id="pid-label" class="property-label"><g:message code="bdBankdoc.pid.label" default="Pid" /></span>
					
						<span class="property-value" aria-labelledby="pid-label"><g:fieldValue bean="${bdBankdocInstance}" field="pid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.sealflag}">
				<li class="fieldcontain">
					<span id="sealflag-label" class="property-label"><g:message code="bdBankdoc.sealflag.label" default="Sealflag" /></span>
					
						<span class="property-value" aria-labelledby="sealflag-label"><g:formatBoolean boolean="${bdBankdocInstance?.sealflag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdBankdocInstance?.shortname}">
				<li class="fieldcontain">
					<span id="shortname-label" class="property-label"><g:message code="bdBankdoc.shortname.label" default="Shortname" /></span>
					
						<span class="property-value" aria-labelledby="shortname-label"><g:fieldValue bean="${bdBankdocInstance}" field="shortname"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdBankdocInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdBankdocInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
