
<%@ page import="com.app.ywms.bd.cddw.YCddw" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'YCddw.label', default: 'YCddw')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-YCddw" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-YCddw" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list YCddw">
			
				<g:if test="${YCddwInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="YCddw.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${YCddwInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="YCddw.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${YCddwInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.makedate}">
				<li class="fieldcontain">
					<span id="makedate-label" class="property-label"><g:message code="YCddw.makedate.label" default="Makedate" /></span>
					
						<span class="property-value" aria-labelledby="makedate-label"><g:formatDate date="${YCddwInstance?.makedate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.account}">
				<li class="fieldcontain">
					<span id="account-label" class="property-label"><g:message code="YCddw.account.label" default="Account" /></span>
					
						<span class="property-value" aria-labelledby="account-label"><g:fieldValue bean="${YCddwInstance}" field="account"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="YCddw.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${YCddwInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.bdCumandoc}">
				<li class="fieldcontain">
					<span id="bdCumandoc-label" class="property-label"><g:message code="YCddw.bdCumandoc.label" default="Bd Cumandoc" /></span>
					
						<span class="property-value" aria-labelledby="bdCumandoc-label"><g:link controller="bdCumandoc" action="show" id="${YCddwInstance?.bdCumandoc?.id}">${YCddwInstance?.bdCumandoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.blockUp}">
				<li class="fieldcontain">
					<span id="blockUp-label" class="property-label"><g:message code="YCddw.blockUp.label" default="Block Up" /></span>
					
						<span class="property-value" aria-labelledby="blockUp-label"><g:formatBoolean boolean="${YCddwInstance?.blockUp}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="YCddw.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${YCddwInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="YCddw.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${YCddwInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.fax}">
				<li class="fieldcontain">
					<span id="fax-label" class="property-label"><g:message code="YCddw.fax.label" default="Fax" /></span>
					
						<span class="property-value" aria-labelledby="fax-label"><g:fieldValue bean="${YCddwInstance}" field="fax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.frdb}">
				<li class="fieldcontain">
					<span id="frdb-label" class="property-label"><g:message code="YCddw.frdb.label" default="Frdb" /></span>
					
						<span class="property-value" aria-labelledby="frdb-label"><g:fieldValue bean="${YCddwInstance}" field="frdb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.khyh}">
				<li class="fieldcontain">
					<span id="khyh-label" class="property-label"><g:message code="YCddw.khyh.label" default="Khyh" /></span>
					
						<span class="property-value" aria-labelledby="khyh-label"><g:fieldValue bean="${YCddwInstance}" field="khyh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="YCddw.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${YCddwInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.linkman}">
				<li class="fieldcontain">
					<span id="linkman-label" class="property-label"><g:message code="YCddw.linkman.label" default="Linkman" /></span>
					
						<span class="property-value" aria-labelledby="linkman-label"><g:fieldValue bean="${YCddwInstance}" field="linkman"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.linktel}">
				<li class="fieldcontain">
					<span id="linktel-label" class="property-label"><g:message code="YCddw.linktel.label" default="Linktel" /></span>
					
						<span class="property-value" aria-labelledby="linktel-label"><g:fieldValue bean="${YCddwInstance}" field="linktel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.maker}">
				<li class="fieldcontain">
					<span id="maker-label" class="property-label"><g:message code="YCddw.maker.label" default="Maker" /></span>
					
						<span class="property-value" aria-labelledby="maker-label"><g:link controller="smUser" action="show" id="${YCddwInstance?.maker?.id}">${YCddwInstance?.maker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="YCddw.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${YCddwInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.swdjh}">
				<li class="fieldcontain">
					<span id="swdjh-label" class="property-label"><g:message code="YCddw.swdjh.label" default="Swdjh" /></span>
					
						<span class="property-value" aria-labelledby="swdjh-label"><g:fieldValue bean="${YCddwInstance}" field="swdjh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="YCddw.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${YCddwInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.yyzz}">
				<li class="fieldcontain">
					<span id="yyzz-label" class="property-label"><g:message code="YCddw.yyzz.label" default="Yyzz" /></span>
					
						<span class="property-value" aria-labelledby="yyzz-label"><g:fieldValue bean="${YCddwInstance}" field="yyzz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.zjf}">
				<li class="fieldcontain">
					<span id="zjf-label" class="property-label"><g:message code="YCddw.zjf.label" default="Zjf" /></span>
					
						<span class="property-value" aria-labelledby="zjf-label"><g:fieldValue bean="${YCddwInstance}" field="zjf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${YCddwInstance?.zzjgdmz}">
				<li class="fieldcontain">
					<span id="zzjgdmz-label" class="property-label"><g:message code="YCddw.zzjgdmz.label" default="Zzjgdmz" /></span>
					
						<span class="property-value" aria-labelledby="zzjgdmz-label"><g:fieldValue bean="${YCddwInstance}" field="zzjgdmz"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${YCddwInstance?.id}" />
					<g:link class="edit" action="edit" id="${YCddwInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
