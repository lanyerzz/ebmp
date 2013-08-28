
<%@ page import="com.app.bd.corp.BdCorp" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdCorp.label', default: 'BdCorp')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdCorp" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdCorp" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdCorp">
			
				<g:if test="${bdCorpInstance?.unitCode}">
				<li class="fieldcontain">
					<span id="unitCode-label" class="property-label"><g:message code="bdCorp.unitCode.label" default="Unit Code" /></span>
					
						<span class="property-value" aria-labelledby="unitCode-label"><g:fieldValue bean="${bdCorpInstance}" field="unitCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="bdCorp.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${bdCorpInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.unitName}">
				<li class="fieldcontain">
					<span id="unitName-label" class="property-label"><g:message code="bdCorp.unitName.label" default="Unit Name" /></span>
					
						<span class="property-value" aria-labelledby="unitName-label"><g:fieldValue bean="${bdCorpInstance}" field="unitName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.begindate}">
				<li class="fieldcontain">
					<span id="begindate-label" class="property-label"><g:message code="bdCorp.begindate.label" default="Begindate" /></span>
					
						<span class="property-value" aria-labelledby="begindate-label"><g:formatDate date="${bdCorpInstance?.begindate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.enddate}">
				<li class="fieldcontain">
					<span id="enddate-label" class="property-label"><g:message code="bdCorp.enddate.label" default="Enddate" /></span>
					
						<span class="property-value" aria-labelledby="enddate-label"><g:formatDate date="${bdCorpInstance?.enddate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.briefintro}">
				<li class="fieldcontain">
					<span id="briefintro-label" class="property-label"><g:message code="bdCorp.briefintro.label" default="Briefintro" /></span>
					
						<span class="property-value" aria-labelledby="briefintro-label"><g:fieldValue bean="${bdCorpInstance}" field="briefintro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.currencyType}">
				<li class="fieldcontain">
					<span id="currencyType-label" class="property-label"><g:message code="bdCorp.currencyType.label" default="Currency Type" /></span>
					
						<span class="property-value" aria-labelledby="currencyType-label"><g:link controller="bdCurrtype" action="show" id="${bdCorpInstance?.currencyType?.id}">${bdCorpInstance?.currencyType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdCorp.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdCorpInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.fathercorp}">
				<li class="fieldcontain">
					<span id="fathercorp-label" class="property-label"><g:message code="bdCorp.fathercorp.label" default="Fathercorp" /></span>
					
						<span class="property-value" aria-labelledby="fathercorp-label"><g:fieldValue bean="${bdCorpInstance}" field="fathercorp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.fax1}">
				<li class="fieldcontain">
					<span id="fax1-label" class="property-label"><g:message code="bdCorp.fax1.label" default="Fax1" /></span>
					
						<span class="property-value" aria-labelledby="fax1-label"><g:fieldValue bean="${bdCorpInstance}" field="fax1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.fax2}">
				<li class="fieldcontain">
					<span id="fax2-label" class="property-label"><g:message code="bdCorp.fax2.label" default="Fax2" /></span>
					
						<span class="property-value" aria-labelledby="fax2-label"><g:fieldValue bean="${bdCorpInstance}" field="fax2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.foreignname}">
				<li class="fieldcontain">
					<span id="foreignname-label" class="property-label"><g:message code="bdCorp.foreignname.label" default="Foreignname" /></span>
					
						<span class="property-value" aria-labelledby="foreignname-label"><g:fieldValue bean="${bdCorpInstance}" field="foreignname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.ishasaccount}">
				<li class="fieldcontain">
					<span id="ishasaccount-label" class="property-label"><g:message code="bdCorp.ishasaccount.label" default="Ishasaccount" /></span>
					
						<span class="property-value" aria-labelledby="ishasaccount-label"><g:formatBoolean boolean="${bdCorpInstance?.ishasaccount}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.isseal}">
				<li class="fieldcontain">
					<span id="isseal-label" class="property-label"><g:message code="bdCorp.isseal.label" default="Isseal" /></span>
					
						<span class="property-value" aria-labelledby="isseal-label"><g:formatBoolean boolean="${bdCorpInstance?.isseal}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdCorp.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdCorpInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="bdCorp.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${bdCorpInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.phone1}">
				<li class="fieldcontain">
					<span id="phone1-label" class="property-label"><g:message code="bdCorp.phone1.label" default="Phone1" /></span>
					
						<span class="property-value" aria-labelledby="phone1-label"><g:fieldValue bean="${bdCorpInstance}" field="phone1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.phone2}">
				<li class="fieldcontain">
					<span id="phone2-label" class="property-label"><g:message code="bdCorp.phone2.label" default="Phone2" /></span>
					
						<span class="property-value" aria-labelledby="phone2-label"><g:fieldValue bean="${bdCorpInstance}" field="phone2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.phone3}">
				<li class="fieldcontain">
					<span id="phone3-label" class="property-label"><g:message code="bdCorp.phone3.label" default="Phone3" /></span>
					
						<span class="property-value" aria-labelledby="phone3-label"><g:fieldValue bean="${bdCorpInstance}" field="phone3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.unitshortname}">
				<li class="fieldcontain">
					<span id="unitshortname-label" class="property-label"><g:message code="bdCorp.unitshortname.label" default="Unitshortname" /></span>
					
						<span class="property-value" aria-labelledby="unitshortname-label"><g:fieldValue bean="${bdCorpInstance}" field="unitshortname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdCorpInstance?.zipCode}">
				<li class="fieldcontain">
					<span id="zipCode-label" class="property-label"><g:message code="bdCorp.zipCode.label" default="Zip Code" /></span>
					
						<span class="property-value" aria-labelledby="zipCode-label"><g:fieldValue bean="${bdCorpInstance}" field="zipCode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdCorpInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdCorpInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
