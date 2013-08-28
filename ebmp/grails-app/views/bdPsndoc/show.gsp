
<%@ page import="com.app.bd.psndoc.BdPsndoc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdPsndoc.label', default: 'BdPsndoc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdPsndoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdPsndoc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdPsndoc">
			
				<g:if test="${bdPsndocInstance?.psncode}">
				<li class="fieldcontain">
					<span id="psncode-label" class="property-label"><g:message code="bdPsndoc.psncode.label" default="Psncode" /></span>
					
						<span class="property-value" aria-labelledby="psncode-label"><g:fieldValue bean="${bdPsndocInstance}" field="psncode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.psnname}">
				<li class="fieldcontain">
					<span id="psnname-label" class="property-label"><g:message code="bdPsndoc.psnname.label" default="Psnname" /></span>
					
						<span class="property-value" aria-labelledby="psnname-label"><g:fieldValue bean="${bdPsndocInstance}" field="psnname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.amcode}">
				<li class="fieldcontain">
					<span id="amcode-label" class="property-label"><g:message code="bdPsndoc.amcode.label" default="Amcode" /></span>
					
						<span class="property-value" aria-labelledby="amcode-label"><g:fieldValue bean="${bdPsndocInstance}" field="amcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.bdCorp}">
				<li class="fieldcontain">
					<span id="bdCorp-label" class="property-label"><g:message code="bdPsndoc.bdCorp.label" default="Bd Corp" /></span>
					
						<span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show" id="${bdPsndocInstance?.bdCorp?.id}">${bdPsndocInstance?.bdCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.bdDeptdoc}">
				<li class="fieldcontain">
					<span id="bdDeptdoc-label" class="property-label"><g:message code="bdPsndoc.bdDeptdoc.label" default="Bd Deptdoc" /></span>
					
						<span class="property-value" aria-labelledby="bdDeptdoc-label"><g:link controller="bdDeptdoc" action="show" id="${bdPsndocInstance?.bdDeptdoc?.id}">${bdPsndocInstance?.bdDeptdoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.bdPsnbasdoc}">
				<li class="fieldcontain">
					<span id="bdPsnbasdoc-label" class="property-label"><g:message code="bdPsndoc.bdPsnbasdoc.label" default="Bd Psnbasdoc" /></span>
					
						<span class="property-value" aria-labelledby="bdPsnbasdoc-label"><g:link controller="bdPsnbasdoc" action="show" id="${bdPsndocInstance?.bdPsnbasdoc?.id}">${bdPsndocInstance?.bdPsnbasdoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.bdPsncl}">
				<li class="fieldcontain">
					<span id="bdPsncl-label" class="property-label"><g:message code="bdPsndoc.bdPsncl.label" default="Bd Psncl" /></span>
					
						<span class="property-value" aria-labelledby="bdPsncl-label"><g:link controller="bdPsncl" action="show" id="${bdPsndocInstance?.bdPsncl?.id}">${bdPsndocInstance?.bdPsncl?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.clerkcode}">
				<li class="fieldcontain">
					<span id="clerkcode-label" class="property-label"><g:message code="bdPsndoc.clerkcode.label" default="Clerkcode" /></span>
					
						<span class="property-value" aria-labelledby="clerkcode-label"><g:fieldValue bean="${bdPsndocInstance}" field="clerkcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.clerkflag}">
				<li class="fieldcontain">
					<span id="clerkflag-label" class="property-label"><g:message code="bdPsndoc.clerkflag.label" default="Clerkflag" /></span>
					
						<span class="property-value" aria-labelledby="clerkflag-label"><g:formatBoolean boolean="${bdPsndocInstance?.clerkflag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdPsndoc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdPsndocInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.indocflag}">
				<li class="fieldcontain">
					<span id="indocflag-label" class="property-label"><g:message code="bdPsndoc.indocflag.label" default="Indocflag" /></span>
					
						<span class="property-value" aria-labelledby="indocflag-label"><g:formatBoolean boolean="${bdPsndocInstance?.indocflag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.indutydate}">
				<li class="fieldcontain">
					<span id="indutydate-label" class="property-label"><g:message code="bdPsndoc.indutydate.label" default="Indutydate" /></span>
					
						<span class="property-value" aria-labelledby="indutydate-label"><g:formatDate date="${bdPsndocInstance?.indutydate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.innercode}">
				<li class="fieldcontain">
					<span id="innercode-label" class="property-label"><g:message code="bdPsndoc.innercode.label" default="Innercode" /></span>
					
						<span class="property-value" aria-labelledby="innercode-label"><g:fieldValue bean="${bdPsndocInstance}" field="innercode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.jobrank}">
				<li class="fieldcontain">
					<span id="jobrank-label" class="property-label"><g:message code="bdPsndoc.jobrank.label" default="Jobrank" /></span>
					
						<span class="property-value" aria-labelledby="jobrank-label"><g:fieldValue bean="${bdPsndocInstance}" field="jobrank"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.jobseries}">
				<li class="fieldcontain">
					<span id="jobseries-label" class="property-label"><g:message code="bdPsndoc.jobseries.label" default="Jobseries" /></span>
					
						<span class="property-value" aria-labelledby="jobseries-label"><g:fieldValue bean="${bdPsndocInstance}" field="jobseries"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdPsndoc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdPsndocInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.maxinnercode}">
				<li class="fieldcontain">
					<span id="maxinnercode-label" class="property-label"><g:message code="bdPsndoc.maxinnercode.label" default="Maxinnercode" /></span>
					
						<span class="property-value" aria-labelledby="maxinnercode-label"><g:fieldValue bean="${bdPsndocInstance}" field="maxinnercode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.outdutydate}">
				<li class="fieldcontain">
					<span id="outdutydate-label" class="property-label"><g:message code="bdPsndoc.outdutydate.label" default="Outdutydate" /></span>
					
						<span class="property-value" aria-labelledby="outdutydate-label"><g:formatDate date="${bdPsndocInstance?.outdutydate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.psnclscope}">
				<li class="fieldcontain">
					<span id="psnclscope-label" class="property-label"><g:message code="bdPsndoc.psnclscope.label" default="Psnclscope" /></span>
					
						<span class="property-value" aria-labelledby="psnclscope-label"><g:fieldValue bean="${bdPsndocInstance}" field="psnclscope"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdPsndocInstance?.sealdate}">
				<li class="fieldcontain">
					<span id="sealdate-label" class="property-label"><g:message code="bdPsndoc.sealdate.label" default="Sealdate" /></span>
					
						<span class="property-value" aria-labelledby="sealdate-label"><g:formatBoolean boolean="${bdPsndocInstance?.sealdate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdPsndocInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdPsndocInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
