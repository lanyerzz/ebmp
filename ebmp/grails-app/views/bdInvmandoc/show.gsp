
<%@ page import="com.app.bd.invmandoc.BdInvmandoc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdInvmandoc.label', default: 'BdInvmandoc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdInvmandoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdInvmandoc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdInvmandoc">
			
				<g:if test="${bdInvmandocInstance?.accFlag}">
				<li class="fieldcontain">
					<span id="accFlag-label" class="property-label"><g:message code="bdInvmandoc.accFlag.label" default="Acc Flag" /></span>
					
						<span class="property-value" aria-labelledby="accFlag-label"><g:formatBoolean boolean="${bdInvmandocInstance?.accFlag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.cinvmneCode}">
				<li class="fieldcontain">
					<span id="cinvmneCode-label" class="property-label"><g:message code="bdInvmandoc.cinvmneCode.label" default="Cinvmne Code" /></span>
					
						<span class="property-value" aria-labelledby="cinvmneCode-label"><g:fieldValue bean="${bdInvmandocInstance}" field="cinvmneCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdInvmandoc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdInvmandocInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.keepWasteRate}">
				<li class="fieldcontain">
					<span id="keepWasteRate-label" class="property-label"><g:message code="bdInvmandoc.keepWasteRate.label" default="Keep Waste Rate" /></span>
					
						<span class="property-value" aria-labelledby="keepWasteRate-label"><g:fieldValue bean="${bdInvmandocInstance}" field="keepWasteRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdInvmandoc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdInvmandocInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.lowestPrice}">
				<li class="fieldcontain">
					<span id="lowestPrice-label" class="property-label"><g:message code="bdInvmandoc.lowestPrice.label" default="Lowest Price" /></span>
					
						<span class="property-value" aria-labelledby="lowestPrice-label"><g:fieldValue bean="${bdInvmandocInstance}" field="lowestPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.mantaxItem}">
				<li class="fieldcontain">
					<span id="mantaxItem-label" class="property-label"><g:message code="bdInvmandoc.mantaxItem.label" default="Mantax Item" /></span>
					
						<span class="property-value" aria-labelledby="mantaxItem-label"><g:fieldValue bean="${bdInvmandocInstance}" field="mantaxItem"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.maxPrice}">
				<li class="fieldcontain">
					<span id="maxPrice-label" class="property-label"><g:message code="bdInvmandoc.maxPrice.label" default="Max Price" /></span>
					
						<span class="property-value" aria-labelledby="maxPrice-label"><g:fieldValue bean="${bdInvmandocInstance}" field="maxPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="bdInvmandoc.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${bdInvmandocInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.modifier}">
				<li class="fieldcontain">
					<span id="modifier-label" class="property-label"><g:message code="bdInvmandoc.modifier.label" default="Modifier" /></span>
					
						<span class="property-value" aria-labelledby="modifier-label"><g:link controller="smUser" action="show" id="${bdInvmandocInstance?.modifier?.id}">${bdInvmandocInstance?.modifier?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.negAllowed}">
				<li class="fieldcontain">
					<span id="negAllowed-label" class="property-label"><g:message code="bdInvmandoc.negAllowed.label" default="Neg Allowed" /></span>
					
						<span class="property-value" aria-labelledby="negAllowed-label"><g:formatBoolean boolean="${bdInvmandocInstance?.negAllowed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.outPriority}">
				<li class="fieldcontain">
					<span id="outPriority-label" class="property-label"><g:message code="bdInvmandoc.outPriority.label" default="Out Priority" /></span>
					
						<span class="property-value" aria-labelledby="outPriority-label"><g:fieldValue bean="${bdInvmandocInstance}" field="outPriority"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.outTrackIn}">
				<li class="fieldcontain">
					<span id="outTrackIn-label" class="property-label"><g:message code="bdInvmandoc.outTrackIn.label" default="Out Track In" /></span>
					
						<span class="property-value" aria-labelledby="outTrackIn-label"><g:formatBoolean boolean="${bdInvmandocInstance?.outTrackIn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.pkCorp}">
				<li class="fieldcontain">
					<span id="pkCorp-label" class="property-label"><g:message code="bdInvmandoc.pkCorp.label" default="Pk Corp" /></span>
					
						<span class="property-value" aria-labelledby="pkCorp-label"><g:link controller="bdCorp" action="show" id="${bdInvmandocInstance?.pkCorp?.id}">${bdInvmandocInstance?.pkCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.pkInvbasdoc}">
				<li class="fieldcontain">
					<span id="pkInvbasdoc-label" class="property-label"><g:message code="bdInvmandoc.pkInvbasdoc.label" default="Pk Invbasdoc" /></span>
					
						<span class="property-value" aria-labelledby="pkInvbasdoc-label"><g:link controller="bdInvbasdoc" action="show" id="${bdInvmandocInstance?.pkInvbasdoc?.id}">${bdInvmandocInstance?.pkInvbasdoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.prodArea}">
				<li class="fieldcontain">
					<span id="prodArea-label" class="property-label"><g:message code="bdInvmandoc.prodArea.label" default="Prod Area" /></span>
					
						<span class="property-value" aria-labelledby="prodArea-label"><g:fieldValue bean="${bdInvmandocInstance}" field="prodArea"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.qualityDayNum}">
				<li class="fieldcontain">
					<span id="qualityDayNum-label" class="property-label"><g:message code="bdInvmandoc.qualityDayNum.label" default="Quality Day Num" /></span>
					
						<span class="property-value" aria-labelledby="qualityDayNum-label"><g:fieldValue bean="${bdInvmandocInstance}" field="qualityDayNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.qualityManFlag}">
				<li class="fieldcontain">
					<span id="qualityManFlag-label" class="property-label"><g:message code="bdInvmandoc.qualityManFlag.label" default="Quality Man Flag" /></span>
					
						<span class="property-value" aria-labelledby="qualityManFlag-label"><g:formatBoolean boolean="${bdInvmandocInstance?.qualityManFlag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.qualityPeriodUnit}">
				<li class="fieldcontain">
					<span id="qualityPeriodUnit-label" class="property-label"><g:message code="bdInvmandoc.qualityPeriodUnit.label" default="Quality Period Unit" /></span>
					
						<span class="property-value" aria-labelledby="qualityPeriodUnit-label"><g:fieldValue bean="${bdInvmandocInstance}" field="qualityPeriodUnit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.recurrentchkcyc}">
				<li class="fieldcontain">
					<span id="recurrentchkcyc-label" class="property-label"><g:message code="bdInvmandoc.recurrentchkcyc.label" default="Recurrentchkcyc" /></span>
					
						<span class="property-value" aria-labelledby="recurrentchkcyc-label"><g:fieldValue bean="${bdInvmandocInstance}" field="recurrentchkcyc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.refSalePrice}">
				<li class="fieldcontain">
					<span id="refSalePrice-label" class="property-label"><g:message code="bdInvmandoc.refSalePrice.label" default="Ref Sale Price" /></span>
					
						<span class="property-value" aria-labelledby="refSalePrice-label"><g:fieldValue bean="${bdInvmandocInstance}" field="refSalePrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.sealFlag}">
				<li class="fieldcontain">
					<span id="sealFlag-label" class="property-label"><g:message code="bdInvmandoc.sealFlag.label" default="Seal Flag" /></span>
					
						<span class="property-value" aria-labelledby="sealFlag-label"><g:formatBoolean boolean="${bdInvmandocInstance?.sealFlag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.serialManaFlag}">
				<li class="fieldcontain">
					<span id="serialManaFlag-label" class="property-label"><g:message code="bdInvmandoc.serialManaFlag.label" default="Serial Mana Flag" /></span>
					
						<span class="property-value" aria-labelledby="serialManaFlag-label"><g:formatBoolean boolean="${bdInvmandocInstance?.serialManaFlag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvmandocInstance?.wholemanaflag}">
				<li class="fieldcontain">
					<span id="wholemanaflag-label" class="property-label"><g:message code="bdInvmandoc.wholemanaflag.label" default="Wholemanaflag" /></span>
					
						<span class="property-value" aria-labelledby="wholemanaflag-label"><g:formatBoolean boolean="${bdInvmandocInstance?.wholemanaflag}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdInvmandocInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdInvmandocInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
