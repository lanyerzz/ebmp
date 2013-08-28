<%@ page import="com.app.ywms.contract.BaseContract" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lszlContract.label', default: 'LszlContract')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lszlContract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lszlContract" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lszlContract">
			
				<g:if test="${lszlContractInstance?.signDate}">
				<li class="fieldcontain">
					<span id="signDate-label" class="property-label"><g:message code="lszlContract.signDate.label" default="Sign Date" /></span>
					
						<span class="property-value" aria-labelledby="signDate-label"><g:formatDate date="${lszlContractInstance?.signDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="lszlContract.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${lszlContractInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.yjdgrq}">
				<li class="fieldcontain">
					<span id="yjdgrq-label" class="property-label"><g:message code="lszlContract.yjdgrq.label" default="Yjdgrq" /></span>
					
						<span class="property-value" aria-labelledby="yjdgrq-label"><g:formatDate date="${lszlContractInstance?.yjdgrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.zdrq}">
				<li class="fieldcontain">
					<span id="zdrq-label" class="property-label"><g:message code="lszlContract.zdrq.label" default="Zdrq" /></span>
					
						<span class="property-value" aria-labelledby="zdrq-label"><g:formatDate date="${lszlContractInstance?.zdrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.shrq}">
				<li class="fieldcontain">
					<span id="shrq-label" class="property-label"><g:message code="lszlContract.shrq.label" default="Shrq" /></span>
					
						<span class="property-value" aria-labelledby="shrq-label"><g:formatDate date="${lszlContractInstance?.shrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.azqlj}">
				<li class="fieldcontain">
					<span id="azqlj-label" class="property-label"><g:message code="lszlContract.azqlj.label" default="Azqlj" /></span>
					
						<span class="property-value" aria-labelledby="azqlj-label"><g:formatBoolean boolean="${lszlContractInstance?.azqlj}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.bdCumandoc}">
				<li class="fieldcontain">
					<span id="bdCumandoc-label" class="property-label"><g:message code="lszlContract.bdCumandoc.label" default="Bd Cumandoc" /></span>
					
						<span class="property-value" aria-labelledby="bdCumandoc-label"><g:link controller="bdCumandoc" action="show" id="${lszlContractInstance?.bdCumandoc?.id}">${lszlContractInstance?.bdCumandoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.bdInvmandoc}">
				<li class="fieldcontain">
					<span id="bdInvmandoc-label" class="property-label"><g:message code="lszlContract.bdInvmandoc.label" default="Bd Invmandoc" /></span>
					
						<span class="property-value" aria-labelledby="bdInvmandoc-label"><g:link controller="bdInvmandoc" action="show" id="${lszlContractInstance?.bdInvmandoc?.id}">${lszlContractInstance?.bdInvmandoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.bdlgt}">
				<li class="fieldcontain">
					<span id="bdlgt-label" class="property-label"><g:message code="lszlContract.bdlgt.label" default="Bdlgt" /></span>
					
						<span class="property-value" aria-labelledby="bdlgt-label"><g:fieldValue bean="${lszlContractInstance}" field="bdlgt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.bgsh}">
				<li class="fieldcontain">
					<span id="bgsh-label" class="property-label"><g:message code="lszlContract.bgsh.label" default="Bgsh" /></span>
					
						<span class="property-value" aria-labelledby="bgsh-label"><g:fieldValue bean="${lszlContractInstance}" field="bgsh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.bz}">
				<li class="fieldcontain">
					<span id="bz-label" class="property-label"><g:message code="lszlContract.bz.label" default="Bz" /></span>
					
						<span class="property-value" aria-labelledby="bz-label"><g:fieldValue bean="${lszlContractInstance}" field="bz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.ccdj}">
				<li class="fieldcontain">
					<span id="ccdj-label" class="property-label"><g:message code="lszlContract.ccdj.label" default="Ccdj" /></span>
					
						<span class="property-value" aria-labelledby="ccdj-label"><g:fieldValue bean="${lszlContractInstance}" field="ccdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.ccfjsfs}">
				<li class="fieldcontain">
					<span id="ccfjsfs-label" class="property-label"><g:message code="lszlContract.ccfjsfs.label" default="Ccfjsfs" /></span>
					
						<span class="property-value" aria-labelledby="ccfjsfs-label"><g:fieldValue bean="${lszlContractInstance}" field="ccfjsfs"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.ccfzq}">
				<li class="fieldcontain">
					<span id="ccfzq-label" class="property-label"><g:message code="lszlContract.ccfzq.label" default="Ccfzq" /></span>
					
						<span class="property-value" aria-labelledby="ccfzq-label"><g:fieldValue bean="${lszlContractInstance}" field="ccfzq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.cczq}">
				<li class="fieldcontain">
					<span id="cczq-label" class="property-label"><g:message code="lszlContract.cczq.label" default="Cczq" /></span>
					
						<span class="property-value" aria-labelledby="cczq-label"><g:fieldValue bean="${lszlContractInstance}" field="cczq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.checkType}">
				<li class="fieldcontain">
					<span id="checkType-label" class="property-label"><g:message code="lszlContract.checkType.label" default="Check Type" /></span>
					
						<span class="property-value" aria-labelledby="checkType-label"><g:fieldValue bean="${lszlContractInstance}" field="checkType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.cm}">
				<li class="fieldcontain">
					<span id="cm-label" class="property-label"><g:message code="lszlContract.cm.label" default="Cm" /></span>
					
						<span class="property-value" aria-labelledby="cm-label"><g:fieldValue bean="${lszlContractInstance}" field="cm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.contractNo}">
				<li class="fieldcontain">
					<span id="contractNo-label" class="property-label"><g:message code="lszlContract.contractNo.label" default="Contract No" /></span>
					
						<span class="property-value" aria-labelledby="contractNo-label"><g:fieldValue bean="${lszlContractInstance}" field="contractNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.contractescribe}">
				<li class="fieldcontain">
					<span id="contractescribe-label" class="property-label"><g:message code="lszlContract.contractescribe.label" default="Contractescribe" /></span>
					
						<span class="property-value" aria-labelledby="contractescribe-label"><g:fieldValue bean="${lszlContractInstance}" field="contractescribe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.contrantNo2}">
				<li class="fieldcontain">
					<span id="contrantNo2-label" class="property-label"><g:message code="lszlContract.contrantNo2.label" default="Contrant No2" /></span>
					
						<span class="property-value" aria-labelledby="contrantNo2-label"><g:fieldValue bean="${lszlContractInstance}" field="contrantNo2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.cqdj}">
				<li class="fieldcontain">
					<span id="cqdj-label" class="property-label"><g:message code="lszlContract.cqdj.label" default="Cqdj" /></span>
					
						<span class="property-value" aria-labelledby="cqdj-label"><g:fieldValue bean="${lszlContractInstance}" field="cqdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.cqhlj}">
				<li class="fieldcontain">
					<span id="cqhlj-label" class="property-label"><g:message code="lszlContract.cqhlj.label" default="Cqhlj" /></span>
					
						<span class="property-value" aria-labelledby="cqhlj-label"><g:fieldValue bean="${lszlContractInstance}" field="cqhlj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.cszq}">
				<li class="fieldcontain">
					<span id="cszq-label" class="property-label"><g:message code="lszlContract.cszq.label" default="Cszq" /></span>
					
						<span class="property-value" aria-labelledby="cszq-label"><g:fieldValue bean="${lszlContractInstance}" field="cszq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="lszlContract.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${lszlContractInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.dffstdcz}">
				<li class="fieldcontain">
					<span id="dffstdcz-label" class="property-label"><g:message code="lszlContract.dffstdcz.label" default="Dffstdcz" /></span>
					
						<span class="property-value" aria-labelledby="dffstdcz-label"><g:fieldValue bean="${lszlContractInstance}" field="dffstdcz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.dffstdemail}">
				<li class="fieldcontain">
					<span id="dffstdemail-label" class="property-label"><g:message code="lszlContract.dffstdemail.label" default="Dffstdemail" /></span>
					
						<span class="property-value" aria-labelledby="dffstdemail-label"><g:fieldValue bean="${lszlContractInstance}" field="dffstdemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.dflxdh}">
				<li class="fieldcontain">
					<span id="dflxdh-label" class="property-label"><g:message code="lszlContract.dflxdh.label" default="Dflxdh" /></span>
					
						<span class="property-value" aria-labelledby="dflxdh-label"><g:fieldValue bean="${lszlContractInstance}" field="dflxdh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.dflxr}">
				<li class="fieldcontain">
					<span id="dflxr-label" class="property-label"><g:message code="lszlContract.dflxr.label" default="Dflxr" /></span>
					
						<span class="property-value" aria-labelledby="dflxr-label"><g:fieldValue bean="${lszlContractInstance}" field="dflxr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.dlgt}">
				<li class="fieldcontain">
					<span id="dlgt-label" class="property-label"><g:message code="lszlContract.dlgt.label" default="Dlgt" /></span>
					
						<span class="property-value" aria-labelledby="dlgt-label"><g:fieldValue bean="${lszlContractInstance}" field="dlgt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.fkr}">
				<li class="fieldcontain">
					<span id="fkr-label" class="property-label"><g:message code="lszlContract.fkr.label" default="Fkr" /></span>
					
						<span class="property-value" aria-labelledby="fkr-label"><g:fieldValue bean="${lszlContractInstance}" field="fkr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.gh}">
				<li class="fieldcontain">
					<span id="gh-label" class="property-label"><g:message code="lszlContract.gh.label" default="Gh" /></span>
					
						<span class="property-value" aria-labelledby="gh-label"><g:fieldValue bean="${lszlContractInstance}" field="gh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.htsl}">
				<li class="fieldcontain">
					<span id="htsl-label" class="property-label"><g:message code="lszlContract.htsl.label" default="Htsl" /></span>
					
						<span class="property-value" aria-labelledby="htsl-label"><g:fieldValue bean="${lszlContractInstance}" field="htsl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.jjtk}">
				<li class="fieldcontain">
					<span id="jjtk-label" class="property-label"><g:message code="lszlContract.jjtk.label" default="Jjtk" /></span>
					
						<span class="property-value" aria-labelledby="jjtk-label"><g:fieldValue bean="${lszlContractInstance}" field="jjtk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="lszlContract.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${lszlContractInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.lybzj}">
				<li class="fieldcontain">
					<span id="lybzj-label" class="property-label"><g:message code="lszlContract.lybzj.label" default="Lybzj" /></span>
					
						<span class="property-value" aria-labelledby="lybzj-label"><g:fieldValue bean="${lszlContractInstance}" field="lybzj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.mcqfsl}">
				<li class="fieldcontain">
					<span id="mcqfsl-label" class="property-label"><g:message code="lszlContract.mcqfsl.label" default="Mcqfsl" /></span>
					
						<span class="property-value" aria-labelledby="mcqfsl-label"><g:fieldValue bean="${lszlContractInstance}" field="mcqfsl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.mcsts}">
				<li class="fieldcontain">
					<span id="mcsts-label" class="property-label"><g:message code="lszlContract.mcsts.label" default="Mcsts" /></span>
					
						<span class="property-value" aria-labelledby="mcsts-label"><g:fieldValue bean="${lszlContractInstance}" field="mcsts"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.mtsyf}">
				<li class="fieldcontain">
					<span id="mtsyf-label" class="property-label"><g:message code="lszlContract.mtsyf.label" default="Mtsyf" /></span>
					
						<span class="property-value" aria-labelledby="mtsyf-label"><g:fieldValue bean="${lszlContractInstance}" field="mtsyf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.myfs}">
				<li class="fieldcontain">
					<span id="myfs-label" class="property-label"><g:message code="lszlContract.myfs.label" default="Myfs" /></span>
					
						<span class="property-value" aria-labelledby="myfs-label"><g:fieldValue bean="${lszlContractInstance}" field="myfs"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.rkszddrjfcs}">
				<li class="fieldcontain">
					<span id="rkszddrjfcs-label" class="property-label"><g:message code="lszlContract.rkszddrjfcs.label" default="Rkszddrjfcs" /></span>
					
						<span class="property-value" aria-labelledby="rkszddrjfcs-label"><g:formatBoolean boolean="${lszlContractInstance?.rkszddrjfcs}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.shr}">
				<li class="fieldcontain">
					<span id="shr-label" class="property-label"><g:message code="lszlContract.shr.label" default="Shr" /></span>
					
						<span class="property-value" aria-labelledby="shr-label"><g:link controller="smUser" action="show" id="${lszlContractInstance?.shr?.id}">${lszlContractInstance?.shr?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.signAddress}">
				<li class="fieldcontain">
					<span id="signAddress-label" class="property-label"><g:message code="lszlContract.signAddress.label" default="Sign Address" /></span>
					
						<span class="property-value" aria-labelledby="signAddress-label"><g:fieldValue bean="${lszlContractInstance}" field="signAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.ssbaf}">
				<li class="fieldcontain">
					<span id="ssbaf-label" class="property-label"><g:message code="lszlContract.ssbaf.label" default="Ssbaf" /></span>
					
						<span class="property-value" aria-labelledby="ssbaf-label"><g:fieldValue bean="${lszlContractInstance}" field="ssbaf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.wfjsczh}">
				<li class="fieldcontain">
					<span id="wfjsczh-label" class="property-label"><g:message code="lszlContract.wfjsczh.label" default="Wfjsczh" /></span>
					
						<span class="property-value" aria-labelledby="wfjsczh-label"><g:fieldValue bean="${lszlContractInstance}" field="wfjsczh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.wfjsemail}">
				<li class="fieldcontain">
					<span id="wfjsemail-label" class="property-label"><g:message code="lszlContract.wfjsemail.label" default="Wfjsemail" /></span>
					
						<span class="property-value" aria-labelledby="wfjsemail-label"><g:fieldValue bean="${lszlContractInstance}" field="wfjsemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.wflxdh}">
				<li class="fieldcontain">
					<span id="wflxdh-label" class="property-label"><g:message code="lszlContract.wflxdh.label" default="Wflxdh" /></span>
					
						<span class="property-value" aria-labelledby="wflxdh-label"><g:fieldValue bean="${lszlContractInstance}" field="wflxdh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.wflxr}">
				<li class="fieldcontain">
					<span id="wflxr-label" class="property-label"><g:message code="lszlContract.wflxr.label" default="Wflxr" /></span>
					
						<span class="property-value" aria-labelledby="wflxr-label"><g:fieldValue bean="${lszlContractInstance}" field="wflxr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.zdr}">
				<li class="fieldcontain">
					<span id="zdr-label" class="property-label"><g:message code="lszlContract.zdr.label" default="Zdr" /></span>
					
						<span class="property-value" aria-labelledby="zdr-label"><g:link controller="smUser" action="show" id="${lszlContractInstance?.zdr?.id}">${lszlContractInstance?.zdr?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.zgtj}">
				<li class="fieldcontain">
					<span id="zgtj-label" class="property-label"><g:message code="lszlContract.zgtj.label" default="Zgtj" /></span>
					
						<span class="property-value" aria-labelledby="zgtj-label"><g:fieldValue bean="${lszlContractInstance}" field="zgtj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.zxdj}">
				<li class="fieldcontain">
					<span id="zxdj-label" class="property-label"><g:message code="lszlContract.zxdj.label" default="Zxdj" /></span>
					
						<span class="property-value" aria-labelledby="zxdj-label"><g:fieldValue bean="${lszlContractInstance}" field="zxdj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.zxjl}">
				<li class="fieldcontain">
					<span id="zxjl-label" class="property-label"><g:message code="lszlContract.zxjl.label" default="Zxjl" /></span>
					
						<span class="property-value" aria-labelledby="zxjl-label"><g:fieldValue bean="${lszlContractInstance}" field="zxjl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lszlContractInstance?.zxsh}">
				<li class="fieldcontain">
					<span id="zxsh-label" class="property-label"><g:message code="lszlContract.zxsh.label" default="Zxsh" /></span>
					
						<span class="property-value" aria-labelledby="zxsh-label"><g:fieldValue bean="${lszlContractInstance}" field="zxsh"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${lszlContractInstance?.id}" />
					<g:link class="edit" action="edit" id="${lszlContractInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
