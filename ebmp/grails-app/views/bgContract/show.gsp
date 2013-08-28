<%@ page import="com.app.ywms.contract.BaseContract" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bgContract.label', default: 'BgContract')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bgContract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bgContract" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bgContract">
			
				<g:if test="${bgContractInstance?.zgksrq}">
				<li class="fieldcontain">
					<span id="zgksrq-label" class="property-label"><g:message code="bgContract.zgksrq.label" default="Zgksrq" /></span>
					
						<span class="property-value" aria-labelledby="zgksrq-label"><g:formatDate date="${bgContractInstance?.zgksrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.zgjsrq}">
				<li class="fieldcontain">
					<span id="zgjsrq-label" class="property-label"><g:message code="bgContract.zgjsrq.label" default="Zgjsrq" /></span>
					
						<span class="property-value" aria-labelledby="zgjsrq-label"><g:formatDate date="${bgContractInstance?.zgjsrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.zdrq}">
				<li class="fieldcontain">
					<span id="zdrq-label" class="property-label"><g:message code="bgContract.zdrq.label" default="Zdrq" /></span>
					
						<span class="property-value" aria-labelledby="zdrq-label"><g:formatDate date="${bgContractInstance?.zdrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.shrq}">
				<li class="fieldcontain">
					<span id="shrq-label" class="property-label"><g:message code="bgContract.shrq.label" default="Shrq" /></span>
					
						<span class="property-value" aria-labelledby="shrq-label"><g:formatDate date="${bgContractInstance?.shrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.azqlj}">
				<li class="fieldcontain">
					<span id="azqlj-label" class="property-label"><g:message code="bgContract.azqlj.label" default="Azqlj" /></span>
					
						<span class="property-value" aria-labelledby="azqlj-label"><g:formatBoolean boolean="${bgContractInstance?.azqlj}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.bdCumandoc}">
				<li class="fieldcontain">
					<span id="bdCumandoc-label" class="property-label"><g:message code="bgContract.bdCumandoc.label" default="Bd Cumandoc" /></span>
					
						<span class="property-value" aria-labelledby="bdCumandoc-label"><g:link controller="bdCumandoc" action="show" id="${bgContractInstance?.bdCumandoc?.id}">${bgContractInstance?.bdCumandoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.bdInvmandoc}">
				<li class="fieldcontain">
					<span id="bdInvmandoc-label" class="property-label"><g:message code="bgContract.bdInvmandoc.label" default="Bd Invmandoc" /></span>
					
						<span class="property-value" aria-labelledby="bdInvmandoc-label"><g:link controller="bdInvmandoc" action="show" id="${bgContractInstance?.bdInvmandoc?.id}">${bgContractInstance?.bdInvmandoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.bdlgt}">
				<li class="fieldcontain">
					<span id="bdlgt-label" class="property-label"><g:message code="bgContract.bdlgt.label" default="Bdlgt" /></span>
					
						<span class="property-value" aria-labelledby="bdlgt-label"><g:fieldValue bean="${bgContractInstance}" field="bdlgt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.bgsh}">
				<li class="fieldcontain">
					<span id="bgsh-label" class="property-label"><g:message code="bgContract.bgsh.label" default="Bgsh" /></span>
					
						<span class="property-value" aria-labelledby="bgsh-label"><g:fieldValue bean="${bgContractInstance}" field="bgsh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.bz}">
				<li class="fieldcontain">
					<span id="bz-label" class="property-label"><g:message code="bgContract.bz.label" default="Bz" /></span>
					
						<span class="property-value" aria-labelledby="bz-label"><g:fieldValue bean="${bgContractInstance}" field="bz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.ccdj}">
				<li class="fieldcontain">
					<span id="ccdj-label" class="property-label"><g:message code="bgContract.ccdj.label" default="Ccdj" /></span>
					
						<span class="property-value" aria-labelledby="ccdj-label"><g:fieldValue bean="${bgContractInstance}" field="ccdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.ccfjsfs}">
				<li class="fieldcontain">
					<span id="ccfjsfs-label" class="property-label"><g:message code="bgContract.ccfjsfs.label" default="Ccfjsfs" /></span>
					
						<span class="property-value" aria-labelledby="ccfjsfs-label"><g:fieldValue bean="${bgContractInstance}" field="ccfjsfs"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.ccfzq}">
				<li class="fieldcontain">
					<span id="ccfzq-label" class="property-label"><g:message code="bgContract.ccfzq.label" default="Ccfzq" /></span>
					
						<span class="property-value" aria-labelledby="ccfzq-label"><g:fieldValue bean="${bgContractInstance}" field="ccfzq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.cczq}">
				<li class="fieldcontain">
					<span id="cczq-label" class="property-label"><g:message code="bgContract.cczq.label" default="Cczq" /></span>
					
						<span class="property-value" aria-labelledby="cczq-label"><g:fieldValue bean="${bgContractInstance}" field="cczq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.checkType}">
				<li class="fieldcontain">
					<span id="checkType-label" class="property-label"><g:message code="bgContract.checkType.label" default="Check Type" /></span>
					
						<span class="property-value" aria-labelledby="checkType-label"><g:fieldValue bean="${bgContractInstance}" field="checkType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.clhcqdj}">
				<li class="fieldcontain">
					<span id="clhcqdj-label" class="property-label"><g:message code="bgContract.clhcqdj.label" default="Clhcqdj" /></span>
					
						<span class="property-value" aria-labelledby="clhcqdj-label"><g:fieldValue bean="${bgContractInstance}" field="clhcqdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.clhdj}">
				<li class="fieldcontain">
					<span id="clhdj-label" class="property-label"><g:message code="bgContract.clhdj.label" default="Clhdj" /></span>
					
						<span class="property-value" aria-labelledby="clhdj-label"><g:fieldValue bean="${bgContractInstance}" field="clhdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.contractNo}">
				<li class="fieldcontain">
					<span id="contractNo-label" class="property-label"><g:message code="bgContract.contractNo.label" default="Contract No" /></span>
					
						<span class="property-value" aria-labelledby="contractNo-label"><g:fieldValue bean="${bgContractInstance}" field="contractNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.contractescribe}">
				<li class="fieldcontain">
					<span id="contractescribe-label" class="property-label"><g:message code="bgContract.contractescribe.label" default="Contractescribe" /></span>
					
						<span class="property-value" aria-labelledby="contractescribe-label"><g:fieldValue bean="${bgContractInstance}" field="contractescribe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.contrantNo2}">
				<li class="fieldcontain">
					<span id="contrantNo2-label" class="property-label"><g:message code="bgContract.contrantNo2.label" default="Contrant No2" /></span>
					
						<span class="property-value" aria-labelledby="contrantNo2-label"><g:fieldValue bean="${bgContractInstance}" field="contrantNo2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.cqdj}">
				<li class="fieldcontain">
					<span id="cqdj-label" class="property-label"><g:message code="bgContract.cqdj.label" default="Cqdj" /></span>
					
						<span class="property-value" aria-labelledby="cqdj-label"><g:fieldValue bean="${bgContractInstance}" field="cqdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.cqhlj}">
				<li class="fieldcontain">
					<span id="cqhlj-label" class="property-label"><g:message code="bgContract.cqhlj.label" default="Cqhlj" /></span>
					
						<span class="property-value" aria-labelledby="cqhlj-label"><g:fieldValue bean="${bgContractInstance}" field="cqhlj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.cszq}">
				<li class="fieldcontain">
					<span id="cszq-label" class="property-label"><g:message code="bgContract.cszq.label" default="Cszq" /></span>
					
						<span class="property-value" aria-labelledby="cszq-label"><g:fieldValue bean="${bgContractInstance}" field="cszq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bgContract.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bgContractInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.dffstdcz}">
				<li class="fieldcontain">
					<span id="dffstdcz-label" class="property-label"><g:message code="bgContract.dffstdcz.label" default="Dffstdcz" /></span>
					
						<span class="property-value" aria-labelledby="dffstdcz-label"><g:fieldValue bean="${bgContractInstance}" field="dffstdcz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.dffstdemail}">
				<li class="fieldcontain">
					<span id="dffstdemail-label" class="property-label"><g:message code="bgContract.dffstdemail.label" default="Dffstdemail" /></span>
					
						<span class="property-value" aria-labelledby="dffstdemail-label"><g:fieldValue bean="${bgContractInstance}" field="dffstdemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.dflxdh}">
				<li class="fieldcontain">
					<span id="dflxdh-label" class="property-label"><g:message code="bgContract.dflxdh.label" default="Dflxdh" /></span>
					
						<span class="property-value" aria-labelledby="dflxdh-label"><g:fieldValue bean="${bgContractInstance}" field="dflxdh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.dflxr}">
				<li class="fieldcontain">
					<span id="dflxr-label" class="property-label"><g:message code="bgContract.dflxr.label" default="Dflxr" /></span>
					
						<span class="property-value" aria-labelledby="dflxr-label"><g:fieldValue bean="${bgContractInstance}" field="dflxr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.dlgt}">
				<li class="fieldcontain">
					<span id="dlgt-label" class="property-label"><g:message code="bgContract.dlgt.label" default="Dlgt" /></span>
					
						<span class="property-value" aria-labelledby="dlgt-label"><g:fieldValue bean="${bgContractInstance}" field="dlgt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.fbzjts}">
				<li class="fieldcontain">
					<span id="fbzjts-label" class="property-label"><g:message code="bgContract.fbzjts.label" default="Fbzjts" /></span>
					
						<span class="property-value" aria-labelledby="fbzjts-label"><g:fieldValue bean="${bgContractInstance}" field="fbzjts"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.fkr}">
				<li class="fieldcontain">
					<span id="fkr-label" class="property-label"><g:message code="bgContract.fkr.label" default="Fkr" /></span>
					
						<span class="property-value" aria-labelledby="fkr-label"><g:fieldValue bean="${bgContractInstance}" field="fkr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.jjtk}">
				<li class="fieldcontain">
					<span id="jjtk-label" class="property-label"><g:message code="bgContract.jjtk.label" default="Jjtk" /></span>
					
						<span class="property-value" aria-labelledby="jjtk-label"><g:fieldValue bean="${bgContractInstance}" field="jjtk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bgContract.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bgContractInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.lybzj}">
				<li class="fieldcontain">
					<span id="lybzj-label" class="property-label"><g:message code="bgContract.lybzj.label" default="Lybzj" /></span>
					
						<span class="property-value" aria-labelledby="lybzj-label"><g:fieldValue bean="${bgContractInstance}" field="lybzj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.mcqfsl}">
				<li class="fieldcontain">
					<span id="mcqfsl-label" class="property-label"><g:message code="bgContract.mcqfsl.label" default="Mcqfsl" /></span>
					
						<span class="property-value" aria-labelledby="mcqfsl-label"><g:fieldValue bean="${bgContractInstance}" field="mcqfsl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.mcsts}">
				<li class="fieldcontain">
					<span id="mcsts-label" class="property-label"><g:message code="bgContract.mcsts.label" default="Mcsts" /></span>
					
						<span class="property-value" aria-labelledby="mcsts-label"><g:fieldValue bean="${bgContractInstance}" field="mcsts"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.mtsyf}">
				<li class="fieldcontain">
					<span id="mtsyf-label" class="property-label"><g:message code="bgContract.mtsyf.label" default="Mtsyf" /></span>
					
						<span class="property-value" aria-labelledby="mtsyf-label"><g:fieldValue bean="${bgContractInstance}" field="mtsyf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.myfs}">
				<li class="fieldcontain">
					<span id="myfs-label" class="property-label"><g:message code="bgContract.myfs.label" default="Myfs" /></span>
					
						<span class="property-value" aria-labelledby="myfs-label"><g:fieldValue bean="${bgContractInstance}" field="myfs"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.rksx}">
				<li class="fieldcontain">
					<span id="rksx-label" class="property-label"><g:message code="bgContract.rksx.label" default="Rksx" /></span>
					
						<span class="property-value" aria-labelledby="rksx-label"><g:fieldValue bean="${bgContractInstance}" field="rksx"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.rkszddrjfcs}">
				<li class="fieldcontain">
					<span id="rkszddrjfcs-label" class="property-label"><g:message code="bgContract.rkszddrjfcs.label" default="Rkszddrjfcs" /></span>
					
						<span class="property-value" aria-labelledby="rkszddrjfcs-label"><g:formatBoolean boolean="${bgContractInstance?.rkszddrjfcs}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.shr}">
				<li class="fieldcontain">
					<span id="shr-label" class="property-label"><g:message code="bgContract.shr.label" default="Shr" /></span>
					
						<span class="property-value" aria-labelledby="shr-label"><g:link controller="smUser" action="show" id="${bgContractInstance?.shr?.id}">${bgContractInstance?.shr?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.signAddress}">
				<li class="fieldcontain">
					<span id="signAddress-label" class="property-label"><g:message code="bgContract.signAddress.label" default="Sign Address" /></span>
					
						<span class="property-value" aria-labelledby="signAddress-label"><g:fieldValue bean="${bgContractInstance}" field="signAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.signDate}">
				<li class="fieldcontain">
					<span id="signDate-label" class="property-label"><g:message code="bgContract.signDate.label" default="Sign Date" /></span>
					
						<span class="property-value" aria-labelledby="signDate-label"><g:fieldValue bean="${bgContractInstance}" field="signDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.ssbaf}">
				<li class="fieldcontain">
					<span id="ssbaf-label" class="property-label"><g:message code="bgContract.ssbaf.label" default="Ssbaf" /></span>
					
						<span class="property-value" aria-labelledby="ssbaf-label"><g:fieldValue bean="${bgContractInstance}" field="ssbaf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.wfjsczh}">
				<li class="fieldcontain">
					<span id="wfjsczh-label" class="property-label"><g:message code="bgContract.wfjsczh.label" default="Wfjsczh" /></span>
					
						<span class="property-value" aria-labelledby="wfjsczh-label"><g:fieldValue bean="${bgContractInstance}" field="wfjsczh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.wfjsemail}">
				<li class="fieldcontain">
					<span id="wfjsemail-label" class="property-label"><g:message code="bgContract.wfjsemail.label" default="Wfjsemail" /></span>
					
						<span class="property-value" aria-labelledby="wfjsemail-label"><g:fieldValue bean="${bgContractInstance}" field="wfjsemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.wflxdh}">
				<li class="fieldcontain">
					<span id="wflxdh-label" class="property-label"><g:message code="bgContract.wflxdh.label" default="Wflxdh" /></span>
					
						<span class="property-value" aria-labelledby="wflxdh-label"><g:fieldValue bean="${bgContractInstance}" field="wflxdh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.wflxr}">
				<li class="fieldcontain">
					<span id="wflxr-label" class="property-label"><g:message code="bgContract.wflxr.label" default="Wflxr" /></span>
					
						<span class="property-value" aria-labelledby="wflxr-label"><g:fieldValue bean="${bgContractInstance}" field="wflxr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.zdr}">
				<li class="fieldcontain">
					<span id="zdr-label" class="property-label"><g:message code="bgContract.zdr.label" default="Zdr" /></span>
					
						<span class="property-value" aria-labelledby="zdr-label"><g:link controller="smUser" action="show" id="${bgContractInstance?.zdr?.id}">${bgContractInstance?.zdr?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.zgdj}">
				<li class="fieldcontain">
					<span id="zgdj-label" class="property-label"><g:message code="bgContract.zgdj.label" default="Zgdj" /></span>
					
						<span class="property-value" aria-labelledby="zgdj-label"><g:fieldValue bean="${bgContractInstance}" field="zgdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.zgsl}">
				<li class="fieldcontain">
					<span id="zgsl-label" class="property-label"><g:message code="bgContract.zgsl.label" default="Zgsl" /></span>
					
						<span class="property-value" aria-labelledby="zgsl-label"><g:fieldValue bean="${bgContractInstance}" field="zgsl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.zgtj}">
				<li class="fieldcontain">
					<span id="zgtj-label" class="property-label"><g:message code="bgContract.zgtj.label" default="Zgtj" /></span>
					
						<span class="property-value" aria-labelledby="zgtj-label"><g:fieldValue bean="${bgContractInstance}" field="zgtj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.zxdj}">
				<li class="fieldcontain">
					<span id="zxdj-label" class="property-label"><g:message code="bgContract.zxdj.label" default="Zxdj" /></span>
					
						<span class="property-value" aria-labelledby="zxdj-label"><g:fieldValue bean="${bgContractInstance}" field="zxdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.zxjl}">
				<li class="fieldcontain">
					<span id="zxjl-label" class="property-label"><g:message code="bgContract.zxjl.label" default="Zxjl" /></span>
					
						<span class="property-value" aria-labelledby="zxjl-label"><g:fieldValue bean="${bgContractInstance}" field="zxjl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.zxsh}">
				<li class="fieldcontain">
					<span id="zxsh-label" class="property-label"><g:message code="bgContract.zxsh.label" default="Zxsh" /></span>
					
						<span class="property-value" aria-labelledby="zxsh-label"><g:fieldValue bean="${bgContractInstance}" field="zxsh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bgContractInstance?.zygh}">
				<li class="fieldcontain">
					<span id="zygh-label" class="property-label"><g:message code="bgContract.zygh.label" default="Zygh" /></span>
					
						<span class="property-value" aria-labelledby="zygh-label"><g:fieldValue bean="${bgContractInstance}" field="zygh"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bgContractInstance?.id}" />
					<g:link class="edit" action="edit" id="${bgContractInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
