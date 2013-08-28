<%@ page import="com.app.ywms.contract.BaseContract" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hqzrContract.label', default: 'HqzrContract')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hqzrContract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hqzrContract" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hqzrContract">
			
				<g:if test="${hqzrContractInstance?.signDate}">
				<li class="fieldcontain">
					<span id="signDate-label" class="property-label"><g:message code="hqzrContract.signDate.label" default="Sign Date" /></span>
					
						<span class="property-value" aria-labelledby="signDate-label"><g:formatDate date="${hqzrContractInstance?.signDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="hqzrContract.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${hqzrContractInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.cqrq}">
				<li class="fieldcontain">
					<span id="cqrq-label" class="property-label"><g:message code="hqzrContract.cqrq.label" default="Cqrq" /></span>
					
						<span class="property-value" aria-labelledby="cqrq-label"><g:formatDate date="${hqzrContractInstance?.cqrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.bgshqsrq}">
				<li class="fieldcontain">
					<span id="bgshqsrq-label" class="property-label"><g:message code="hqzrContract.bgshqsrq.label" default="Bgshqsrq" /></span>
					
						<span class="property-value" aria-labelledby="bgshqsrq-label"><g:formatDate date="${hqzrContractInstance?.bgshqsrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.zdrq}">
				<li class="fieldcontain">
					<span id="zdrq-label" class="property-label"><g:message code="hqzrContract.zdrq.label" default="Zdrq" /></span>
					
						<span class="property-value" aria-labelledby="zdrq-label"><g:formatDate date="${hqzrContractInstance?.zdrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.shrq}">
				<li class="fieldcontain">
					<span id="shrq-label" class="property-label"><g:message code="hqzrContract.shrq.label" default="Shrq" /></span>
					
						<span class="property-value" aria-labelledby="shrq-label"><g:formatDate date="${hqzrContractInstance?.shrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.azqlj}">
				<li class="fieldcontain">
					<span id="azqlj-label" class="property-label"><g:message code="hqzrContract.azqlj.label" default="Azqlj" /></span>
					
						<span class="property-value" aria-labelledby="azqlj-label"><g:formatBoolean boolean="${hqzrContractInstance?.azqlj}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.bdlgt}">
				<li class="fieldcontain">
					<span id="bdlgt-label" class="property-label"><g:message code="hqzrContract.bdlgt.label" default="Bdlgt" /></span>
					
						<span class="property-value" aria-labelledby="bdlgt-label"><g:fieldValue bean="${hqzrContractInstance}" field="bdlgt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.bgsh}">
				<li class="fieldcontain">
					<span id="bgsh-label" class="property-label"><g:message code="hqzrContract.bgsh.label" default="Bgsh" /></span>
					
						<span class="property-value" aria-labelledby="bgsh-label"><g:fieldValue bean="${hqzrContractInstance}" field="bgsh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.bz}">
				<li class="fieldcontain">
					<span id="bz-label" class="property-label"><g:message code="hqzrContract.bz.label" default="Bz" /></span>
					
						<span class="property-value" aria-labelledby="bz-label"><g:fieldValue bean="${hqzrContractInstance}" field="bz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.ccfjsfs}">
				<li class="fieldcontain">
					<span id="ccfjsfs-label" class="property-label"><g:message code="hqzrContract.ccfjsfs.label" default="Ccfjsfs" /></span>
					
						<span class="property-value" aria-labelledby="ccfjsfs-label"><g:fieldValue bean="${hqzrContractInstance}" field="ccfjsfs"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.ccfzq}">
				<li class="fieldcontain">
					<span id="ccfzq-label" class="property-label"><g:message code="hqzrContract.ccfzq.label" default="Ccfzq" /></span>
					
						<span class="property-value" aria-labelledby="ccfzq-label"><g:fieldValue bean="${hqzrContractInstance}" field="ccfzq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.cczq}">
				<li class="fieldcontain">
					<span id="cczq-label" class="property-label"><g:message code="hqzrContract.cczq.label" default="Cczq" /></span>
					
						<span class="property-value" aria-labelledby="cczq-label"><g:fieldValue bean="${hqzrContractInstance}" field="cczq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.cm}">
				<li class="fieldcontain">
					<span id="cm-label" class="property-label"><g:message code="hqzrContract.cm.label" default="Cm" /></span>
					
						<span class="property-value" aria-labelledby="cm-label"><g:fieldValue bean="${hqzrContractInstance}" field="cm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.contractNo}">
				<li class="fieldcontain">
					<span id="contractNo-label" class="property-label"><g:message code="hqzrContract.contractNo.label" default="Contract No" /></span>
					
						<span class="property-value" aria-labelledby="contractNo-label"><g:fieldValue bean="${hqzrContractInstance}" field="contractNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.contractescribe}">
				<li class="fieldcontain">
					<span id="contractescribe-label" class="property-label"><g:message code="hqzrContract.contractescribe.label" default="Contractescribe" /></span>
					
						<span class="property-value" aria-labelledby="contractescribe-label"><g:fieldValue bean="${hqzrContractInstance}" field="contractescribe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.contrantNo2}">
				<li class="fieldcontain">
					<span id="contrantNo2-label" class="property-label"><g:message code="hqzrContract.contrantNo2.label" default="Contrant No2" /></span>
					
						<span class="property-value" aria-labelledby="contrantNo2-label"><g:fieldValue bean="${hqzrContractInstance}" field="contrantNo2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.cqccf}">
				<li class="fieldcontain">
					<span id="cqccf-label" class="property-label"><g:message code="hqzrContract.cqccf.label" default="Cqccf" /></span>
					
						<span class="property-value" aria-labelledby="cqccf-label"><g:fieldValue bean="${hqzrContractInstance}" field="cqccf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.cqhlj}">
				<li class="fieldcontain">
					<span id="cqhlj-label" class="property-label"><g:message code="hqzrContract.cqhlj.label" default="Cqhlj" /></span>
					
						<span class="property-value" aria-labelledby="cqhlj-label"><g:fieldValue bean="${hqzrContractInstance}" field="cqhlj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.cqjfcl}">
				<li class="fieldcontain">
					<span id="cqjfcl-label" class="property-label"><g:message code="hqzrContract.cqjfcl.label" default="Cqjfcl" /></span>
					
						<span class="property-value" aria-labelledby="cqjfcl-label"><g:fieldValue bean="${hqzrContractInstance}" field="cqjfcl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.cszq}">
				<li class="fieldcontain">
					<span id="cszq-label" class="property-label"><g:message code="hqzrContract.cszq.label" default="Cszq" /></span>
					
						<span class="property-value" aria-labelledby="cszq-label"><g:fieldValue bean="${hqzrContractInstance}" field="cszq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="hqzrContract.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${hqzrContractInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.dffstdcz}">
				<li class="fieldcontain">
					<span id="dffstdcz-label" class="property-label"><g:message code="hqzrContract.dffstdcz.label" default="Dffstdcz" /></span>
					
						<span class="property-value" aria-labelledby="dffstdcz-label"><g:fieldValue bean="${hqzrContractInstance}" field="dffstdcz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.dffstdemail}">
				<li class="fieldcontain">
					<span id="dffstdemail-label" class="property-label"><g:message code="hqzrContract.dffstdemail.label" default="Dffstdemail" /></span>
					
						<span class="property-value" aria-labelledby="dffstdemail-label"><g:fieldValue bean="${hqzrContractInstance}" field="dffstdemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.dflxdh}">
				<li class="fieldcontain">
					<span id="dflxdh-label" class="property-label"><g:message code="hqzrContract.dflxdh.label" default="Dflxdh" /></span>
					
						<span class="property-value" aria-labelledby="dflxdh-label"><g:fieldValue bean="${hqzrContractInstance}" field="dflxdh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.dflxr}">
				<li class="fieldcontain">
					<span id="dflxr-label" class="property-label"><g:message code="hqzrContract.dflxr.label" default="Dflxr" /></span>
					
						<span class="property-value" aria-labelledby="dflxr-label"><g:fieldValue bean="${hqzrContractInstance}" field="dflxr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.dlgt}">
				<li class="fieldcontain">
					<span id="dlgt-label" class="property-label"><g:message code="hqzrContract.dlgt.label" default="Dlgt" /></span>
					
						<span class="property-value" aria-labelledby="dlgt-label"><g:fieldValue bean="${hqzrContractInstance}" field="dlgt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.dpczx}">
				<li class="fieldcontain">
					<span id="dpczx-label" class="property-label"><g:message code="hqzrContract.dpczx.label" default="Dpczx" /></span>
					
						<span class="property-value" aria-labelledby="dpczx-label"><g:formatBoolean boolean="${hqzrContractInstance?.dpczx}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.fkr}">
				<li class="fieldcontain">
					<span id="fkr-label" class="property-label"><g:message code="hqzrContract.fkr.label" default="Fkr" /></span>
					
						<span class="property-value" aria-labelledby="fkr-label"><g:fieldValue bean="${hqzrContractInstance}" field="fkr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.gh}">
				<li class="fieldcontain">
					<span id="gh-label" class="property-label"><g:message code="hqzrContract.gh.label" default="Gh" /></span>
					
						<span class="property-value" aria-labelledby="gh-label"><g:fieldValue bean="${hqzrContractInstance}" field="gh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.gsht}">
				<li class="fieldcontain">
					<span id="gsht-label" class="property-label"><g:message code="hqzrContract.gsht.label" default="Gsht" /></span>
					
						<span class="property-value" aria-labelledby="gsht-label"><g:formatBoolean boolean="${hqzrContractInstance?.gsht}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.htsl}">
				<li class="fieldcontain">
					<span id="htsl-label" class="property-label"><g:message code="hqzrContract.htsl.label" default="Htsl" /></span>
					
						<span class="property-value" aria-labelledby="htsl-label"><g:fieldValue bean="${hqzrContractInstance}" field="htsl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.httk}">
				<li class="fieldcontain">
					<span id="httk-label" class="property-label"><g:message code="hqzrContract.httk.label" default="Httk" /></span>
					
						<span class="property-value" aria-labelledby="httk-label"><g:fieldValue bean="${hqzrContractInstance}" field="httk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.hw}">
				<li class="fieldcontain">
					<span id="hw-label" class="property-label"><g:message code="hqzrContract.hw.label" default="Hw" /></span>
					
						<span class="property-value" aria-labelledby="hw-label"><g:link controller="bdInvmandoc" action="show" id="${hqzrContractInstance?.hw?.id}">${hqzrContractInstance?.hw?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.hz}">
				<li class="fieldcontain">
					<span id="hz-label" class="property-label"><g:message code="hqzrContract.hz.label" default="Hz" /></span>
					
						<span class="property-value" aria-labelledby="hz-label"><g:link controller="bdCumandoc" action="show" id="${hqzrContractInstance?.hz?.id}">${hqzrContractInstance?.hz?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.hzcdcqf}">
				<li class="fieldcontain">
					<span id="hzcdcqf-label" class="property-label"><g:message code="hqzrContract.hzcdcqf.label" default="Hzcdcqf" /></span>
					
						<span class="property-value" aria-labelledby="hzcdcqf-label"><g:formatBoolean boolean="${hqzrContractInstance?.hzcdcqf}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.jgf}">
				<li class="fieldcontain">
					<span id="jgf-label" class="property-label"><g:message code="hqzrContract.jgf.label" default="Jgf" /></span>
					
						<span class="property-value" aria-labelledby="jgf-label"><g:fieldValue bean="${hqzrContractInstance}" field="jgf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.jgfzff}">
				<li class="fieldcontain">
					<span id="jgfzff-label" class="property-label"><g:message code="hqzrContract.jgfzff.label" default="Jgfzff" /></span>
					
						<span class="property-value" aria-labelledby="jgfzff-label"><g:fieldValue bean="${hqzrContractInstance}" field="jgfzff"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.jgtk}">
				<li class="fieldcontain">
					<span id="jgtk-label" class="property-label"><g:message code="hqzrContract.jgtk.label" default="Jgtk" /></span>
					
						<span class="property-value" aria-labelledby="jgtk-label"><g:fieldValue bean="${hqzrContractInstance}" field="jgtk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="hqzrContract.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${hqzrContractInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.lzfdj}">
				<li class="fieldcontain">
					<span id="lzfdj-label" class="property-label"><g:message code="hqzrContract.lzfdj.label" default="Lzfdj" /></span>
					
						<span class="property-value" aria-labelledby="lzfdj-label"><g:fieldValue bean="${hqzrContractInstance}" field="lzfdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.mcqfsl}">
				<li class="fieldcontain">
					<span id="mcqfsl-label" class="property-label"><g:message code="hqzrContract.mcqfsl.label" default="Mcqfsl" /></span>
					
						<span class="property-value" aria-labelledby="mcqfsl-label"><g:fieldValue bean="${hqzrContractInstance}" field="mcqfsl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.mtsyf}">
				<li class="fieldcontain">
					<span id="mtsyf-label" class="property-label"><g:message code="hqzrContract.mtsyf.label" default="Mtsyf" /></span>
					
						<span class="property-value" aria-labelledby="mtsyf-label"><g:fieldValue bean="${hqzrContractInstance}" field="mtsyf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.shr}">
				<li class="fieldcontain">
					<span id="shr-label" class="property-label"><g:message code="hqzrContract.shr.label" default="Shr" /></span>
					
						<span class="property-value" aria-labelledby="shr-label"><g:link controller="smUser" action="show" id="${hqzrContractInstance?.shr?.id}">${hqzrContractInstance?.shr?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.signAddress}">
				<li class="fieldcontain">
					<span id="signAddress-label" class="property-label"><g:message code="hqzrContract.signAddress.label" default="Sign Address" /></span>
					
						<span class="property-value" aria-labelledby="signAddress-label"><g:fieldValue bean="${hqzrContractInstance}" field="signAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.slysfs}">
				<li class="fieldcontain">
					<span id="slysfs-label" class="property-label"><g:message code="hqzrContract.slysfs.label" default="Slysfs" /></span>
					
						<span class="property-value" aria-labelledby="slysfs-label"><g:fieldValue bean="${hqzrContractInstance}" field="slysfs"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.wfjsczh}">
				<li class="fieldcontain">
					<span id="wfjsczh-label" class="property-label"><g:message code="hqzrContract.wfjsczh.label" default="Wfjsczh" /></span>
					
						<span class="property-value" aria-labelledby="wfjsczh-label"><g:fieldValue bean="${hqzrContractInstance}" field="wfjsczh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.wfjsemail}">
				<li class="fieldcontain">
					<span id="wfjsemail-label" class="property-label"><g:message code="hqzrContract.wfjsemail.label" default="Wfjsemail" /></span>
					
						<span class="property-value" aria-labelledby="wfjsemail-label"><g:fieldValue bean="${hqzrContractInstance}" field="wfjsemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.wflxdh}">
				<li class="fieldcontain">
					<span id="wflxdh-label" class="property-label"><g:message code="hqzrContract.wflxdh.label" default="Wflxdh" /></span>
					
						<span class="property-value" aria-labelledby="wflxdh-label"><g:fieldValue bean="${hqzrContractInstance}" field="wflxdh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.wflxr}">
				<li class="fieldcontain">
					<span id="wflxr-label" class="property-label"><g:message code="hqzrContract.wflxr.label" default="Wflxr" /></span>
					
						<span class="property-value" aria-labelledby="wflxr-label"><g:fieldValue bean="${hqzrContractInstance}" field="wflxr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.zcf}">
				<li class="fieldcontain">
					<span id="zcf-label" class="property-label"><g:message code="hqzrContract.zcf.label" default="Zcf" /></span>
					
						<span class="property-value" aria-labelledby="zcf-label"><g:link controller="bdCumandoc" action="show" id="${hqzrContractInstance?.zcf?.id}">${hqzrContractInstance?.zcf?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.zdr}">
				<li class="fieldcontain">
					<span id="zdr-label" class="property-label"><g:message code="hqzrContract.zdr.label" default="Zdr" /></span>
					
						<span class="property-value" aria-labelledby="zdr-label"><g:link controller="smUser" action="show" id="${hqzrContractInstance?.zdr?.id}">${hqzrContractInstance?.zdr?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.zdsf}">
				<li class="fieldcontain">
					<span id="zdsf-label" class="property-label"><g:message code="hqzrContract.zdsf.label" default="Zdsf" /></span>
					
						<span class="property-value" aria-labelledby="zdsf-label"><g:fieldValue bean="${hqzrContractInstance}" field="zdsf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.zlzb}">
				<li class="fieldcontain">
					<span id="zlzb-label" class="property-label"><g:message code="hqzrContract.zlzb.label" default="Zlzb" /></span>
					
						<span class="property-value" aria-labelledby="zlzb-label"><g:fieldValue bean="${hqzrContractInstance}" field="zlzb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.zxccbgfdj}">
				<li class="fieldcontain">
					<span id="zxccbgfdj-label" class="property-label"><g:message code="hqzrContract.zxccbgfdj.label" default="Zxccbgfdj" /></span>
					
						<span class="property-value" aria-labelledby="zxccbgfdj-label"><g:fieldValue bean="${hqzrContractInstance}" field="zxccbgfdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.zxccbgzff}">
				<li class="fieldcontain">
					<span id="zxccbgzff-label" class="property-label"><g:message code="hqzrContract.zxccbgzff.label" default="Zxccbgzff" /></span>
					
						<span class="property-value" aria-labelledby="zxccbgzff-label"><g:fieldValue bean="${hqzrContractInstance}" field="zxccbgzff"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.zxjl}">
				<li class="fieldcontain">
					<span id="zxjl-label" class="property-label"><g:message code="hqzrContract.zxjl.label" default="Zxjl" /></span>
					
						<span class="property-value" aria-labelledby="zxjl-label"><g:fieldValue bean="${hqzrContractInstance}" field="zxjl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hqzrContractInstance?.zxsh}">
				<li class="fieldcontain">
					<span id="zxsh-label" class="property-label"><g:message code="hqzrContract.zxsh.label" default="Zxsh" /></span>
					
						<span class="property-value" aria-labelledby="zxsh-label"><g:fieldValue bean="${hqzrContractInstance}" field="zxsh"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${hqzrContractInstance?.id}" />
					<g:link class="edit" action="edit" id="${hqzrContractInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
