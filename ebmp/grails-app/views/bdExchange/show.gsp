
<%@ page import="com.app.bd.exchange.BdExchange" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdExchange.label', default: 'BdExchange')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdExchange" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdExchange" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdExchange">
			
				<g:if test="${bdExchangeInstance?.currtypeOne}">
				<li class="fieldcontain">
					<span id="currtypeOne-label" class="property-label"><g:message code="bdExchange.currtypeOne.label" default="Currtype One" /></span>
					
						<span class="property-value" aria-labelledby="currtypeOne-label"><g:link controller="bdCurrtype" action="show" id="${bdExchangeInstance?.currtypeOne?.id}">${bdExchangeInstance?.currtypeOne?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdExchangeInstance?.currtypeTwo}">
				<li class="fieldcontain">
					<span id="currtypeTwo-label" class="property-label"><g:message code="bdExchange.currtypeTwo.label" default="Currtype Two" /></span>
					
						<span class="property-value" aria-labelledby="currtypeTwo-label"><g:link controller="bdCurrtype" action="show" id="${bdExchangeInstance?.currtypeTwo?.id}">${bdExchangeInstance?.currtypeTwo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdExchangeInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="bdExchange.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${bdExchangeInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdExchangeInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="bdExchange.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${bdExchangeInstance?.bdCorp?.id}">${bdExchangeInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdExchangeInstance?.checkDate}">
				<li class="fieldcontain">
					<span id="checkDate-label" class="property-label"><g:message code="bdExchange.checkDate.label" default="Check Date" /></span>
					
						<span class="property-value" aria-labelledby="checkDate-label"><g:formatDate date="${bdExchangeInstance?.checkDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdExchangeInstance?.checker}">
				<li class="fieldcontain">
					<span id="checker-label" class="property-label"><g:message code="bdExchange.checker.label" default="Checker" /></span>
					
						<span class="property-value" aria-labelledby="checker-label"><g:link controller="smUser" action="show" id="${bdExchangeInstance?.checker?.id}">${bdExchangeInstance?.checker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdExchangeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdExchange.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdExchangeInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdExchangeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdExchange.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdExchangeInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdExchangeInstance?.makeDate}">
				<li class="fieldcontain">
					<span id="makeDate-label" class="property-label"><g:message code="bdExchange.makeDate.label" default="Make Date" /></span>
					
						<span class="property-value" aria-labelledby="makeDate-label"><g:formatDate date="${bdExchangeInstance?.makeDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdExchangeInstance?.maker}">
				<li class="fieldcontain">
					<span id="maker-label" class="property-label"><g:message code="bdExchange.maker.label" default="Maker" /></span>
					
						<span class="property-value" aria-labelledby="maker-label"><g:link controller="smUser" action="show" id="${bdExchangeInstance?.maker?.id}">${bdExchangeInstance?.maker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdExchangeInstance?.month}">
				<li class="fieldcontain">
					<span id="month-label" class="property-label"><g:message code="bdExchange.month.label" default="Month" /></span>
					
						<span class="property-value" aria-labelledby="month-label"><g:fieldValue bean="${bdExchangeInstance}" field="month"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdExchangeInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdExchangeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
