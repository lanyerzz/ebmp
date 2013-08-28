
<%@ page import="com.app.ywms.bd.tank.YBdTank" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'YBdTank.label', default: 'YBdTank')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-YBdTank" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-YBdTank" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list YBdTank">
			
				<g:if test="${YBdTankInstance?.aqrj}">
				<li class="fieldcontain">
					<span id="aqrj-label" class="property-label"><g:message code="YBdTank.aqrj.label" default="Aqrj" /></span>
					
						<span class="property-value" aria-labelledby="aqrj-label"><g:fieldValue bean="${YBdTankInstance}" field="aqrj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.bcrj}">
				<li class="fieldcontain">
					<span id="bcrj-label" class="property-label"><g:message code="YBdTank.bcrj.label" default="Bcrj" /></span>
					
						<span class="property-value" aria-labelledby="bcrj-label"><g:fieldValue bean="${YBdTankInstance}" field="bcrj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.bdInvmandoc}">
				<li class="fieldcontain">
					<span id="bdInvmandoc-label" class="property-label"><g:message code="YBdTank.bdInvmandoc.label" default="Bd Invmandoc" /></span>
					
						<span class="property-value" aria-labelledby="bdInvmandoc-label"><g:link controller="bdInvmandoc" action="show" id="${YBdTankInstance?.bdInvmandoc?.id}">${YBdTankInstance?.bdInvmandoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.bg}">
				<li class="fieldcontain">
					<span id="bg-label" class="property-label"><g:message code="YBdTank.bg.label" default="Bg" /></span>
					
						<span class="property-value" aria-labelledby="bg-label"><g:formatBoolean boolean="${YBdTankInstance?.bg}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.bonded}">
				<li class="fieldcontain">
					<span id="bonded-label" class="property-label"><g:message code="YBdTank.bonded.label" default="Bonded" /></span>
					
						<span class="property-value" aria-labelledby="bonded-label"><g:formatBoolean boolean="${YBdTankInstance?.bonded}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.bw}">
				<li class="fieldcontain">
					<span id="bw-label" class="property-label"><g:message code="YBdTank.bw.label" default="Bw" /></span>
					
						<span class="property-value" aria-labelledby="bw-label"><g:formatBoolean boolean="${YBdTankInstance?.bw}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="YBdTank.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${YBdTankInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.code2}">
				<li class="fieldcontain">
					<span id="code2-label" class="property-label"><g:message code="YBdTank.code2.label" default="Code2" /></span>
					
						<span class="property-value" aria-labelledby="code2-label"><g:fieldValue bean="${YBdTankInstance}" field="code2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="YBdTank.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${YBdTankInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.describe}">
				<li class="fieldcontain">
					<span id="describe-label" class="property-label"><g:message code="YBdTank.describe.label" default="Describe" /></span>
					
						<span class="property-value" aria-labelledby="describe-label"><g:fieldValue bean="${YBdTankInstance}" field="describe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.gd}">
				<li class="fieldcontain">
					<span id="gd-label" class="property-label"><g:message code="YBdTank.gd.label" default="Gd" /></span>
					
						<span class="property-value" aria-labelledby="gd-label"><g:fieldValue bean="${YBdTankInstance}" field="gd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.gd1}">
				<li class="fieldcontain">
					<span id="gd1-label" class="property-label"><g:message code="YBdTank.gd1.label" default="Gd1" /></span>
					
						<span class="property-value" aria-labelledby="gd1-label"><g:fieldValue bean="${YBdTankInstance}" field="gd1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.gd2}">
				<li class="fieldcontain">
					<span id="gd2-label" class="property-label"><g:message code="YBdTank.gd2.label" default="Gd2" /></span>
					
						<span class="property-value" aria-labelledby="gd2-label"><g:fieldValue bean="${YBdTankInstance}" field="gd2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.gdsl}">
				<li class="fieldcontain">
					<span id="gdsl-label" class="property-label"><g:message code="YBdTank.gdsl.label" default="Gdsl" /></span>
					
						<span class="property-value" aria-labelledby="gdsl-label"><g:fieldValue bean="${YBdTankInstance}" field="gdsl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.gllx}">
				<li class="fieldcontain">
					<span id="gllx-label" class="property-label"><g:message code="YBdTank.gllx.label" default="Gllx" /></span>
					
						<span class="property-value" aria-labelledby="gllx-label"><g:fieldValue bean="${YBdTankInstance}" field="gllx"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.glsm}">
				<li class="fieldcontain">
					<span id="glsm-label" class="property-label"><g:message code="YBdTank.glsm.label" default="Glsm" /></span>
					
						<span class="property-value" aria-labelledby="glsm-label"><g:fieldValue bean="${YBdTankInstance}" field="glsm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.jygs}">
				<li class="fieldcontain">
					<span id="jygs-label" class="property-label"><g:message code="YBdTank.jygs.label" default="Jygs" /></span>
					
						<span class="property-value" aria-labelledby="jygs-label"><g:fieldValue bean="${YBdTankInstance}" field="jygs"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.jyrq}">
				<li class="fieldcontain">
					<span id="jyrq-label" class="property-label"><g:message code="YBdTank.jyrq.label" default="Jyrq" /></span>
					
						<span class="property-value" aria-labelledby="jyrq-label"><g:formatDate date="${YBdTankInstance?.jyrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.jysm}">
				<li class="fieldcontain">
					<span id="jysm-label" class="property-label"><g:message code="YBdTank.jysm.label" default="Jysm" /></span>
					
						<span class="property-value" aria-labelledby="jysm-label"><g:fieldValue bean="${YBdTankInstance}" field="jysm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.jyyj}">
				<li class="fieldcontain">
					<span id="jyyj-label" class="property-label"><g:message code="YBdTank.jyyj.label" default="Jyyj" /></span>
					
						<span class="property-value" aria-labelledby="jyyj-label"><g:fieldValue bean="${YBdTankInstance}" field="jyyj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.jyzsbh}">
				<li class="fieldcontain">
					<span id="jyzsbh-label" class="property-label"><g:message code="YBdTank.jyzsbh.label" default="Jyzsbh" /></span>
					
						<span class="property-value" aria-labelledby="jyzsbh-label"><g:fieldValue bean="${YBdTankInstance}" field="jyzsbh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="YBdTank.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${YBdTankInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.rxhz}">
				<li class="fieldcontain">
					<span id="rxhz-label" class="property-label"><g:message code="YBdTank.rxhz.label" default="Rxhz" /></span>
					
						<span class="property-value" aria-labelledby="rxhz-label"><g:formatBoolean boolean="${YBdTankInstance?.rxhz}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.xuni}">
				<li class="fieldcontain">
					<span id="xuni-label" class="property-label"><g:message code="YBdTank.xuni.label" default="Xuni" /></span>
					
						<span class="property-value" aria-labelledby="xuni-label"><g:formatBoolean boolean="${YBdTankInstance?.xuni}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.yxrq}">
				<li class="fieldcontain">
					<span id="yxrq-label" class="property-label"><g:message code="YBdTank.yxrq.label" default="Yxrq" /></span>
					
						<span class="property-value" aria-labelledby="yxrq-label"><g:formatDate date="${YBdTankInstance?.yxrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.zgzf}">
				<li class="fieldcontain">
					<span id="zgzf-label" class="property-label"><g:message code="YBdTank.zgzf.label" default="Zgzf" /></span>
					
						<span class="property-value" aria-labelledby="zgzf-label"><g:formatBoolean boolean="${YBdTankInstance?.zgzf}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.zhijing}">
				<li class="fieldcontain">
					<span id="zhijing-label" class="property-label"><g:message code="YBdTank.zhijing.label" default="Zhijing" /></span>
					
						<span class="property-value" aria-labelledby="zhijing-label"><g:fieldValue bean="${YBdTankInstance}" field="zhijing"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YBdTankInstance?.zzgq}">
				<li class="fieldcontain">
					<span id="zzgq-label" class="property-label"><g:message code="YBdTank.zzgq.label" default="Zzgq" /></span>
					
						<span class="property-value" aria-labelledby="zzgq-label"><g:formatBoolean boolean="${YBdTankInstance?.zzgq}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${YBdTankInstance?.id}" />
					<g:link class="edit" action="edit" id="${YBdTankInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
