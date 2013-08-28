
<%@ page import="com.app.ywms.bd.shipdoc.Yshipdoc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'yshipdoc.label', default: 'Yshipdoc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-yshipdoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-yshipdoc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list yshipdoc">
			
				<g:if test="${yshipdocInstance?.buildYear}">
				<li class="fieldcontain">
					<span id="buildYear-label" class="property-label"><g:message code="yshipdoc.buildYear.label" default="Build Year" /></span>
					
						<span class="property-value" aria-labelledby="buildYear-label"><g:formatDate date="${yshipdocInstance?.buildYear}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.makedate}">
				<li class="fieldcontain">
					<span id="makedate-label" class="property-label"><g:message code="yshipdoc.makedate.label" default="Makedate" /></span>
					
						<span class="property-value" aria-labelledby="makedate-label"><g:formatDate date="${yshipdocInstance?.makedate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.shipname}">
				<li class="fieldcontain">
					<span id="shipname-label" class="property-label"><g:message code="yshipdoc.shipname.label" default="Shipname" /></span>
					
						<span class="property-value" aria-labelledby="shipname-label"><g:fieldValue bean="${yshipdocInstance}" field="shipname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.badj}">
				<li class="fieldcontain">
					<span id="badj-label" class="property-label"><g:message code="yshipdoc.badj.label" default="Badj" /></span>
					
						<span class="property-value" aria-labelledby="badj-label"><g:fieldValue bean="${yshipdocInstance}" field="badj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.basm}">
				<li class="fieldcontain">
					<span id="basm-label" class="property-label"><g:message code="yshipdoc.basm.label" default="Basm" /></span>
					
						<span class="property-value" aria-labelledby="basm-label"><g:fieldValue bean="${yshipdocInstance}" field="basm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.bazsh}">
				<li class="fieldcontain">
					<span id="bazsh-label" class="property-label"><g:message code="yshipdoc.bazsh.label" default="Bazsh" /></span>
					
						<span class="property-value" aria-labelledby="bazsh-label"><g:fieldValue bean="${yshipdocInstance}" field="bazsh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="yshipdoc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${yshipdocInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.dl}">
				<li class="fieldcontain">
					<span id="dl-label" class="property-label"><g:message code="yshipdoc.dl.label" default="Dl" /></span>
					
						<span class="property-value" aria-labelledby="dl-label"><g:formatBoolean boolean="${yshipdocInstance?.dl}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.draft}">
				<li class="fieldcontain">
					<span id="draft-label" class="property-label"><g:message code="yshipdoc.draft.label" default="Draft" /></span>
					
						<span class="property-value" aria-labelledby="draft-label"><g:fieldValue bean="${yshipdocInstance}" field="draft"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.grossweight}">
				<li class="fieldcontain">
					<span id="grossweight-label" class="property-label"><g:message code="yshipdoc.grossweight.label" default="Grossweight" /></span>
					
						<span class="property-value" aria-labelledby="grossweight-label"><g:fieldValue bean="${yshipdocInstance}" field="grossweight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.head}">
				<li class="fieldcontain">
					<span id="head-label" class="property-label"><g:message code="yshipdoc.head.label" default="Head" /></span>
					
						<span class="property-value" aria-labelledby="head-label"><g:fieldValue bean="${yshipdocInstance}" field="head"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="yshipdoc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${yshipdocInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.linkman}">
				<li class="fieldcontain">
					<span id="linkman-label" class="property-label"><g:message code="yshipdoc.linkman.label" default="Linkman" /></span>
					
						<span class="property-value" aria-labelledby="linkman-label"><g:fieldValue bean="${yshipdocInstance}" field="linkman"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.linktel}">
				<li class="fieldcontain">
					<span id="linktel-label" class="property-label"><g:message code="yshipdoc.linktel.label" default="Linktel" /></span>
					
						<span class="property-value" aria-labelledby="linktel-label"><g:fieldValue bean="${yshipdocInstance}" field="linktel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.load}">
				<li class="fieldcontain">
					<span id="load-label" class="property-label"><g:message code="yshipdoc.load.label" default="Load" /></span>
					
						<span class="property-value" aria-labelledby="load-label"><g:fieldValue bean="${yshipdocInstance}" field="load"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.maker}">
				<li class="fieldcontain">
					<span id="maker-label" class="property-label"><g:message code="yshipdoc.maker.label" default="Maker" /></span>
					
						<span class="property-value" aria-labelledby="maker-label"><g:fieldValue bean="${yshipdocInstance}" field="maker"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.netweight}">
				<li class="fieldcontain">
					<span id="netweight-label" class="property-label"><g:message code="yshipdoc.netweight.label" default="Netweight" /></span>
					
						<span class="property-value" aria-labelledby="netweight-label"><g:fieldValue bean="${yshipdocInstance}" field="netweight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="yshipdoc.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${yshipdocInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="yshipdoc.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:fieldValue bean="${yshipdocInstance}" field="owner"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.shipcountry}">
				<li class="fieldcontain">
					<span id="shipcountry-label" class="property-label"><g:message code="yshipdoc.shipcountry.label" default="Shipcountry" /></span>
					
						<span class="property-value" aria-labelledby="shipcountry-label"><g:fieldValue bean="${yshipdocInstance}" field="shipcountry"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.shipforeignname}">
				<li class="fieldcontain">
					<span id="shipforeignname-label" class="property-label"><g:message code="yshipdoc.shipforeignname.label" default="Shipforeignname" /></span>
					
						<span class="property-value" aria-labelledby="shipforeignname-label"><g:fieldValue bean="${yshipdocInstance}" field="shipforeignname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.shiplength}">
				<li class="fieldcontain">
					<span id="shiplength-label" class="property-label"><g:message code="yshipdoc.shiplength.label" default="Shiplength" /></span>
					
						<span class="property-value" aria-labelledby="shiplength-label"><g:fieldValue bean="${yshipdocInstance}" field="shiplength"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.shiptype}">
				<li class="fieldcontain">
					<span id="shiptype-label" class="property-label"><g:message code="yshipdoc.shiptype.label" default="Shiptype" /></span>
					
						<span class="property-value" aria-labelledby="shiptype-label"><g:fieldValue bean="${yshipdocInstance}" field="shiptype"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.shipwidth}">
				<li class="fieldcontain">
					<span id="shipwidth-label" class="property-label"><g:message code="yshipdoc.shipwidth.label" default="Shipwidth" /></span>
					
						<span class="property-value" aria-labelledby="shipwidth-label"><g:fieldValue bean="${yshipdocInstance}" field="shipwidth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.using}">
				<li class="fieldcontain">
					<span id="using-label" class="property-label"><g:message code="yshipdoc.using.label" default="Using" /></span>
					
						<span class="property-value" aria-labelledby="using-label"><g:formatBoolean boolean="${yshipdocInstance?.using}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.yrk}">
				<li class="fieldcontain">
					<span id="yrk-label" class="property-label"><g:message code="yshipdoc.yrk.label" default="Yrk" /></span>
					
						<span class="property-value" aria-labelledby="yrk-label"><g:formatBoolean boolean="${yshipdocInstance?.yrk}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${yshipdocInstance?.zjm}">
				<li class="fieldcontain">
					<span id="zjm-label" class="property-label"><g:message code="yshipdoc.zjm.label" default="Zjm" /></span>
					
						<span class="property-value" aria-labelledby="zjm-label"><g:fieldValue bean="${yshipdocInstance}" field="zjm"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${yshipdocInstance?.id}" />
					<g:link class="edit" action="edit" id="${yshipdocInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
