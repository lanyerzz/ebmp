
<%@ page import="com.app.ywms.settle.fee.YwmsFeeBill" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ywmsFeeBill.label', default: 'YwmsFeeBill')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ywmsFeeBill" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ywmsFeeBill" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ywmsFeeBill">
			
				<g:if test="${ywmsFeeBillInstance?.billdate}">
				<li class="fieldcontain">
					<span id="billdate-label" class="property-label"><g:message code="ywmsFeeBill.billdate.label" default="Billdate" /></span>
					
						<span class="property-value" aria-labelledby="billdate-label"><g:formatDate date="${ywmsFeeBillInstance?.billdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.feeType}">
				<li class="fieldcontain">
					<span id="feeType-label" class="property-label"><g:message code="ywmsFeeBill.feeType.label" default="Fee Type" /></span>
					
						<span class="property-value" aria-labelledby="feeType-label"><g:link controller="ywmsFeeType" action="show" id="${ywmsFeeBillInstance?.feeType?.id}">${ywmsFeeBillInstance?.feeType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.jsrq}">
				<li class="fieldcontain">
					<span id="jsrq-label" class="property-label"><g:message code="ywmsFeeBill.jsrq.label" default="Jsrq" /></span>
					
						<span class="property-value" aria-labelledby="jsrq-label"><g:formatDate date="${ywmsFeeBillInstance?.jsrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.dj}">
				<li class="fieldcontain">
					<span id="dj-label" class="property-label"><g:message code="ywmsFeeBill.dj.label" default="Dj" /></span>
					
						<span class="property-value" aria-labelledby="dj-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="dj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.yfsl}">
				<li class="fieldcontain">
					<span id="yfsl-label" class="property-label"><g:message code="ywmsFeeBill.yfsl.label" default="Yfsl" /></span>
					
						<span class="property-value" aria-labelledby="yfsl-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="yfsl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.yfje}">
				<li class="fieldcontain">
					<span id="yfje-label" class="property-label"><g:message code="ywmsFeeBill.yfje.label" default="Yfje" /></span>
					
						<span class="property-value" aria-labelledby="yfje-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="yfje"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.fkdw}">
				<li class="fieldcontain">
					<span id="fkdw-label" class="property-label"><g:message code="ywmsFeeBill.fkdw.label" default="Fkdw" /></span>
					
						<span class="property-value" aria-labelledby="fkdw-label"><g:link controller="bdCumandoc" action="show" id="${ywmsFeeBillInstance?.fkdw?.id}">${ywmsFeeBillInstance?.fkdw?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="ywmsFeeBill.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${ywmsFeeBillInstance?.bdCorp?.id}">${ywmsFeeBillInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.bg}">
				<li class="fieldcontain">
					<span id="bg-label" class="property-label"><g:message code="ywmsFeeBill.bg.label" default="Bg" /></span>
					
						<span class="property-value" aria-labelledby="bg-label"><g:formatBoolean boolean="${ywmsFeeBillInstance?.bg}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.bght}">
				<li class="fieldcontain">
					<span id="bght-label" class="property-label"><g:message code="ywmsFeeBill.bght.label" default="Bght" /></span>
					
						<span class="property-value" aria-labelledby="bght-label"><g:link controller="baseContract" action="show" id="${ywmsFeeBillInstance?.bght?.id}">${ywmsFeeBillInstance?.bght?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.billTypeCode}">
				<li class="fieldcontain">
					<span id="billTypeCode-label" class="property-label"><g:message code="ywmsFeeBill.billTypeCode.label" default="Bill Type Code" /></span>
					
						<span class="property-value" aria-labelledby="billTypeCode-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="billTypeCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.billno}">
				<li class="fieldcontain">
					<span id="billno-label" class="property-label"><g:message code="ywmsFeeBill.billno.label" default="Billno" /></span>
					
						<span class="property-value" aria-labelledby="billno-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="billno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.billtype}">
				<li class="fieldcontain">
					<span id="billtype-label" class="property-label"><g:message code="ywmsFeeBill.billtype.label" default="Billtype" /></span>
					
						<span class="property-value" aria-labelledby="billtype-label"><g:link controller="pubBilltype" action="show" id="${ywmsFeeBillInstance?.billtype?.id}">${ywmsFeeBillInstance?.billtype?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.businessType}">
				<li class="fieldcontain">
					<span id="businessType-label" class="property-label"><g:message code="ywmsFeeBill.businessType.label" default="Business Type" /></span>
					
						<span class="property-value" aria-labelledby="businessType-label"><g:link controller="pubBusinessType" action="show" id="${ywmsFeeBillInstance?.businessType?.id}">${ywmsFeeBillInstance?.businessType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.checkDate}">
				<li class="fieldcontain">
					<span id="checkDate-label" class="property-label"><g:message code="ywmsFeeBill.checkDate.label" default="Check Date" /></span>
					
						<span class="property-value" aria-labelledby="checkDate-label"><g:formatDate date="${ywmsFeeBillInstance?.checkDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.checker}">
				<li class="fieldcontain">
					<span id="checker-label" class="property-label"><g:message code="ywmsFeeBill.checker.label" default="Checker" /></span>
					
						<span class="property-value" aria-labelledby="checker-label"><g:link controller="smUser" action="show" id="${ywmsFeeBillInstance?.checker?.id}">${ywmsFeeBillInstance?.checker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="ywmsFeeBill.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ywmsFeeBillInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.djlj}">
				<li class="fieldcontain">
					<span id="djlj-label" class="property-label"><g:message code="ywmsFeeBill.djlj.label" default="Djlj" /></span>
					
						<span class="property-value" aria-labelledby="djlj-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="djlj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.hw}">
				<li class="fieldcontain">
					<span id="hw-label" class="property-label"><g:message code="ywmsFeeBill.hw.label" default="Hw" /></span>
					
						<span class="property-value" aria-labelledby="hw-label"><g:link controller="bdInvmandoc" action="show" id="${ywmsFeeBillInstance?.hw?.id}">${ywmsFeeBillInstance?.hw?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.hz}">
				<li class="fieldcontain">
					<span id="hz-label" class="property-label"><g:message code="ywmsFeeBill.hz.label" default="Hz" /></span>
					
						<span class="property-value" aria-labelledby="hz-label"><g:link controller="bdCumandoc" action="show" id="${ywmsFeeBillInstance?.hz?.id}">${ywmsFeeBillInstance?.hz?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.je}">
				<li class="fieldcontain">
					<span id="je-label" class="property-label"><g:message code="ywmsFeeBill.je.label" default="Je" /></span>
					
						<span class="property-value" aria-labelledby="je-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="je"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.jssl}">
				<li class="fieldcontain">
					<span id="jssl-label" class="property-label"><g:message code="ywmsFeeBill.jssl.label" default="Jssl" /></span>
					
						<span class="property-value" aria-labelledby="jssl-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="jssl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="ywmsFeeBill.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${ywmsFeeBillInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.makeDate}">
				<li class="fieldcontain">
					<span id="makeDate-label" class="property-label"><g:message code="ywmsFeeBill.makeDate.label" default="Make Date" /></span>
					
						<span class="property-value" aria-labelledby="makeDate-label"><g:formatDate date="${ywmsFeeBillInstance?.makeDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.maker}">
				<li class="fieldcontain">
					<span id="maker-label" class="property-label"><g:message code="ywmsFeeBill.maker.label" default="Maker" /></span>
					
						<span class="property-value" aria-labelledby="maker-label"><g:link controller="smUser" action="show" id="${ywmsFeeBillInstance?.maker?.id}">${ywmsFeeBillInstance?.maker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.vnote}">
				<li class="fieldcontain">
					<span id="vnote-label" class="property-label"><g:message code="ywmsFeeBill.vnote.label" default="Vnote" /></span>
					
						<span class="property-value" aria-labelledby="vnote-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="vnote"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.xgywdh}">
				<li class="fieldcontain">
					<span id="xgywdh-label" class="property-label"><g:message code="ywmsFeeBill.xgywdh.label" default="Xgywdh" /></span>
					
						<span class="property-value" aria-labelledby="xgywdh-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="xgywdh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.ywsl}">
				<li class="fieldcontain">
					<span id="ywsl-label" class="property-label"><g:message code="ywmsFeeBill.ywsl.label" default="Ywsl" /></span>
					
						<span class="property-value" aria-labelledby="ywsl-label"><g:fieldValue bean="${ywmsFeeBillInstance}" field="ywsl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ywmsFeeBillInstance?.yxhqrd}">
				<li class="fieldcontain">
					<span id="yxhqrd-label" class="property-label"><g:message code="ywmsFeeBill.yxhqrd.label" default="Yxhqrd" /></span>
					
						<span class="property-value" aria-labelledby="yxhqrd-label"><g:link controller="yxhqrd" action="show" id="${ywmsFeeBillInstance?.yxhqrd?.id}">${ywmsFeeBillInstance?.yxhqrd?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ywmsFeeBillInstance?.id}" />
					<g:link class="edit" action="edit" id="${ywmsFeeBillInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
