
<%@ page import="com.app.bd.invbasdoc.BdInvbasdoc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bdInvbasdoc.label', default: 'BdInvbasdoc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bdInvbasdoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bdInvbasdoc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bdInvbasdoc">
			
				<g:if test="${bdInvbasdocInstance?.invcode}">
				<li class="fieldcontain">
					<span id="invcode-label" class="property-label"><g:message code="bdInvbasdoc.invcode.label" default="Invcode" /></span>
					
						<span class="property-value" aria-labelledby="invcode-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="invcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.invname}">
				<li class="fieldcontain">
					<span id="invname-label" class="property-label"><g:message code="bdInvbasdoc.invname.label" default="Invname" /></span>
					
						<span class="property-value" aria-labelledby="invname-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="invname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.bdmeasdoc}">
				<li class="fieldcontain">
					<span id="bdmeasdoc-label" class="property-label"><g:message code="bdInvbasdoc.bdmeasdoc.label" default="Bdmeasdoc" /></span>
					
						<span class="property-value" aria-labelledby="bdmeasdoc-label"><g:link controller="bdMeasdoc" action="show" id="${bdInvbasdocInstance?.bdmeasdoc?.id}">${bdInvbasdocInstance?.bdmeasdoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.bdmeasdoc1}">
				<li class="fieldcontain">
					<span id="bdmeasdoc1-label" class="property-label"><g:message code="bdInvbasdoc.bdmeasdoc1.label" default="Bdmeasdoc1" /></span>
					
						<span class="property-value" aria-labelledby="bdmeasdoc1-label"><g:link controller="bdMeasdoc" action="show" id="${bdInvbasdocInstance?.bdmeasdoc1?.id}">${bdInvbasdocInstance?.bdmeasdoc1?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.bdmeasdoc2}">
				<li class="fieldcontain">
					<span id="bdmeasdoc2-label" class="property-label"><g:message code="bdInvbasdoc.bdmeasdoc2.label" default="Bdmeasdoc2" /></span>
					
						<span class="property-value" aria-labelledby="bdmeasdoc2-label"><g:link controller="bdMeasdoc" action="show" id="${bdInvbasdocInstance?.bdmeasdoc2?.id}">${bdInvbasdocInstance?.bdmeasdoc2?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.bdmeasdoc3}">
				<li class="fieldcontain">
					<span id="bdmeasdoc3-label" class="property-label"><g:message code="bdInvbasdoc.bdmeasdoc3.label" default="Bdmeasdoc3" /></span>
					
						<span class="property-value" aria-labelledby="bdmeasdoc3-label"><g:link controller="bdMeasdoc" action="show" id="${bdInvbasdocInstance?.bdmeasdoc3?.id}">${bdInvbasdocInstance?.bdmeasdoc3?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.bdmeasdoc4}">
				<li class="fieldcontain">
					<span id="bdmeasdoc4-label" class="property-label"><g:message code="bdInvbasdoc.bdmeasdoc4.label" default="Bdmeasdoc4" /></span>
					
						<span class="property-value" aria-labelledby="bdmeasdoc4-label"><g:link controller="bdMeasdoc" action="show" id="${bdInvbasdocInstance?.bdmeasdoc4?.id}">${bdInvbasdocInstance?.bdmeasdoc4?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.bdmeasdoc5}">
				<li class="fieldcontain">
					<span id="bdmeasdoc5-label" class="property-label"><g:message code="bdInvbasdoc.bdmeasdoc5.label" default="Bdmeasdoc5" /></span>
					
						<span class="property-value" aria-labelledby="bdmeasdoc5-label"><g:link controller="bdMeasdoc" action="show" id="${bdInvbasdocInstance?.bdmeasdoc5?.id}">${bdInvbasdocInstance?.bdmeasdoc5?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="bdInvbasdoc.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:formatDate date="${bdInvbasdocInstance?.createtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="bdInvbasdoc.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="smUser" action="show" id="${bdInvbasdocInstance?.creator?.id}">${bdInvbasdocInstance?.creator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bdInvbasdoc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bdInvbasdocInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def1}">
				<li class="fieldcontain">
					<span id="def1-label" class="property-label"><g:message code="bdInvbasdoc.def1.label" default="Def1" /></span>
					
						<span class="property-value" aria-labelledby="def1-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def10}">
				<li class="fieldcontain">
					<span id="def10-label" class="property-label"><g:message code="bdInvbasdoc.def10.label" default="Def10" /></span>
					
						<span class="property-value" aria-labelledby="def10-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def10"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def11}">
				<li class="fieldcontain">
					<span id="def11-label" class="property-label"><g:message code="bdInvbasdoc.def11.label" default="Def11" /></span>
					
						<span class="property-value" aria-labelledby="def11-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def11"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def12}">
				<li class="fieldcontain">
					<span id="def12-label" class="property-label"><g:message code="bdInvbasdoc.def12.label" default="Def12" /></span>
					
						<span class="property-value" aria-labelledby="def12-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def12"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def13}">
				<li class="fieldcontain">
					<span id="def13-label" class="property-label"><g:message code="bdInvbasdoc.def13.label" default="Def13" /></span>
					
						<span class="property-value" aria-labelledby="def13-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def13"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def14}">
				<li class="fieldcontain">
					<span id="def14-label" class="property-label"><g:message code="bdInvbasdoc.def14.label" default="Def14" /></span>
					
						<span class="property-value" aria-labelledby="def14-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def14"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def15}">
				<li class="fieldcontain">
					<span id="def15-label" class="property-label"><g:message code="bdInvbasdoc.def15.label" default="Def15" /></span>
					
						<span class="property-value" aria-labelledby="def15-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def15"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def16}">
				<li class="fieldcontain">
					<span id="def16-label" class="property-label"><g:message code="bdInvbasdoc.def16.label" default="Def16" /></span>
					
						<span class="property-value" aria-labelledby="def16-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def16"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def17}">
				<li class="fieldcontain">
					<span id="def17-label" class="property-label"><g:message code="bdInvbasdoc.def17.label" default="Def17" /></span>
					
						<span class="property-value" aria-labelledby="def17-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def17"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def18}">
				<li class="fieldcontain">
					<span id="def18-label" class="property-label"><g:message code="bdInvbasdoc.def18.label" default="Def18" /></span>
					
						<span class="property-value" aria-labelledby="def18-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def18"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def19}">
				<li class="fieldcontain">
					<span id="def19-label" class="property-label"><g:message code="bdInvbasdoc.def19.label" default="Def19" /></span>
					
						<span class="property-value" aria-labelledby="def19-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def19"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def2}">
				<li class="fieldcontain">
					<span id="def2-label" class="property-label"><g:message code="bdInvbasdoc.def2.label" default="Def2" /></span>
					
						<span class="property-value" aria-labelledby="def2-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def20}">
				<li class="fieldcontain">
					<span id="def20-label" class="property-label"><g:message code="bdInvbasdoc.def20.label" default="Def20" /></span>
					
						<span class="property-value" aria-labelledby="def20-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def20"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def3}">
				<li class="fieldcontain">
					<span id="def3-label" class="property-label"><g:message code="bdInvbasdoc.def3.label" default="Def3" /></span>
					
						<span class="property-value" aria-labelledby="def3-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def4}">
				<li class="fieldcontain">
					<span id="def4-label" class="property-label"><g:message code="bdInvbasdoc.def4.label" default="Def4" /></span>
					
						<span class="property-value" aria-labelledby="def4-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def5}">
				<li class="fieldcontain">
					<span id="def5-label" class="property-label"><g:message code="bdInvbasdoc.def5.label" default="Def5" /></span>
					
						<span class="property-value" aria-labelledby="def5-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def6}">
				<li class="fieldcontain">
					<span id="def6-label" class="property-label"><g:message code="bdInvbasdoc.def6.label" default="Def6" /></span>
					
						<span class="property-value" aria-labelledby="def6-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def6"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def7}">
				<li class="fieldcontain">
					<span id="def7-label" class="property-label"><g:message code="bdInvbasdoc.def7.label" default="Def7" /></span>
					
						<span class="property-value" aria-labelledby="def7-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def7"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def8}">
				<li class="fieldcontain">
					<span id="def8-label" class="property-label"><g:message code="bdInvbasdoc.def8.label" default="Def8" /></span>
					
						<span class="property-value" aria-labelledby="def8-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def8"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.def9}">
				<li class="fieldcontain">
					<span id="def9-label" class="property-label"><g:message code="bdInvbasdoc.def9.label" default="Def9" /></span>
					
						<span class="property-value" aria-labelledby="def9-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="def9"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.discountflag}">
				<li class="fieldcontain">
					<span id="discountflag-label" class="property-label"><g:message code="bdInvbasdoc.discountflag.label" default="Discountflag" /></span>
					
						<span class="property-value" aria-labelledby="discountflag-label"><g:formatBoolean boolean="${bdInvbasdocInstance?.discountflag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.forinvname}">
				<li class="fieldcontain">
					<span id="forinvname-label" class="property-label"><g:message code="bdInvbasdoc.forinvname.label" default="Forinvname" /></span>
					
						<span class="property-value" aria-labelledby="forinvname-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="forinvname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.free1}">
				<li class="fieldcontain">
					<span id="free1-label" class="property-label"><g:message code="bdInvbasdoc.free1.label" default="Free1" /></span>
					
						<span class="property-value" aria-labelledby="free1-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="free1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.free2}">
				<li class="fieldcontain">
					<span id="free2-label" class="property-label"><g:message code="bdInvbasdoc.free2.label" default="Free2" /></span>
					
						<span class="property-value" aria-labelledby="free2-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="free2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.free3}">
				<li class="fieldcontain">
					<span id="free3-label" class="property-label"><g:message code="bdInvbasdoc.free3.label" default="Free3" /></span>
					
						<span class="property-value" aria-labelledby="free3-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="free3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.free4}">
				<li class="fieldcontain">
					<span id="free4-label" class="property-label"><g:message code="bdInvbasdoc.free4.label" default="Free4" /></span>
					
						<span class="property-value" aria-labelledby="free4-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="free4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.free5}">
				<li class="fieldcontain">
					<span id="free5-label" class="property-label"><g:message code="bdInvbasdoc.free5.label" default="Free5" /></span>
					
						<span class="property-value" aria-labelledby="free5-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="free5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.graphid}">
				<li class="fieldcontain">
					<span id="graphid-label" class="property-label"><g:message code="bdInvbasdoc.graphid.label" default="Graphid" /></span>
					
						<span class="property-value" aria-labelledby="graphid-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="graphid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="bdInvbasdoc.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.invbarcode}">
				<li class="fieldcontain">
					<span id="invbarcode-label" class="property-label"><g:message code="bdInvbasdoc.invbarcode.label" default="Invbarcode" /></span>
					
						<span class="property-value" aria-labelledby="invbarcode-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="invbarcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.invmnecode}">
				<li class="fieldcontain">
					<span id="invmnecode-label" class="property-label"><g:message code="bdInvbasdoc.invmnecode.label" default="Invmnecode" /></span>
					
						<span class="property-value" aria-labelledby="invmnecode-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="invmnecode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.invpinpai}">
				<li class="fieldcontain">
					<span id="invpinpai-label" class="property-label"><g:message code="bdInvbasdoc.invpinpai.label" default="Invpinpai" /></span>
					
						<span class="property-value" aria-labelledby="invpinpai-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="invpinpai"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.invshortname}">
				<li class="fieldcontain">
					<span id="invshortname-label" class="property-label"><g:message code="bdInvbasdoc.invshortname.label" default="Invshortname" /></span>
					
						<span class="property-value" aria-labelledby="invshortname-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="invshortname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.invspec}">
				<li class="fieldcontain">
					<span id="invspec-label" class="property-label"><g:message code="bdInvbasdoc.invspec.label" default="Invspec" /></span>
					
						<span class="property-value" aria-labelledby="invspec-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="invspec"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.invtype}">
				<li class="fieldcontain">
					<span id="invtype-label" class="property-label"><g:message code="bdInvbasdoc.invtype.label" default="Invtype" /></span>
					
						<span class="property-value" aria-labelledby="invtype-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="invtype"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.ismngstockbygrswt}">
				<li class="fieldcontain">
					<span id="ismngstockbygrswt-label" class="property-label"><g:message code="bdInvbasdoc.ismngstockbygrswt.label" default="Ismngstockbygrswt" /></span>
					
						<span class="property-value" aria-labelledby="ismngstockbygrswt-label"><g:formatBoolean boolean="${bdInvbasdocInstance?.ismngstockbygrswt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.isretail}">
				<li class="fieldcontain">
					<span id="isretail-label" class="property-label"><g:message code="bdInvbasdoc.isretail.label" default="Isretail" /></span>
					
						<span class="property-value" aria-labelledby="isretail-label"><g:formatBoolean boolean="${bdInvbasdocInstance?.isretail}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.isstorebyconvert}">
				<li class="fieldcontain">
					<span id="isstorebyconvert-label" class="property-label"><g:message code="bdInvbasdoc.isstorebyconvert.label" default="Isstorebyconvert" /></span>
					
						<span class="property-value" aria-labelledby="isstorebyconvert-label"><g:formatBoolean boolean="${bdInvbasdocInstance?.isstorebyconvert}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.laborflag}">
				<li class="fieldcontain">
					<span id="laborflag-label" class="property-label"><g:message code="bdInvbasdoc.laborflag.label" default="Laborflag" /></span>
					
						<span class="property-value" aria-labelledby="laborflag-label"><g:formatBoolean boolean="${bdInvbasdocInstance?.laborflag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bdInvbasdoc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bdInvbasdocInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.length}">
				<li class="fieldcontain">
					<span id="length-label" class="property-label"><g:message code="bdInvbasdoc.length.label" default="Length" /></span>
					
						<span class="property-value" aria-labelledby="length-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="length"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="bdInvbasdoc.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.modifier}">
				<li class="fieldcontain">
					<span id="modifier-label" class="property-label"><g:message code="bdInvbasdoc.modifier.label" default="Modifier" /></span>
					
						<span class="property-value" aria-labelledby="modifier-label"><g:link controller="smUser" action="show" id="${bdInvbasdocInstance?.modifier?.id}">${bdInvbasdocInstance?.modifier?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.modifytime}">
				<li class="fieldcontain">
					<span id="modifytime-label" class="property-label"><g:message code="bdInvbasdoc.modifytime.label" default="Modifytime" /></span>
					
						<span class="property-value" aria-labelledby="modifytime-label"><g:formatDate date="${bdInvbasdocInstance?.modifytime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.pkCorp}">
				<li class="fieldcontain">
					<span id="pkCorp-label" class="property-label"><g:message code="bdInvbasdoc.pkCorp.label" default="Pk Corp" /></span>
					
						<span class="property-value" aria-labelledby="pkCorp-label"><g:link controller="bdCorp" action="show" id="${bdInvbasdocInstance?.pkCorp?.id}">${bdInvbasdocInstance?.pkCorp?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.pkInvcl}">
				<li class="fieldcontain">
					<span id="pkInvcl-label" class="property-label"><g:message code="bdInvbasdoc.pkInvcl.label" default="Pk Invcl" /></span>
					
						<span class="property-value" aria-labelledby="pkInvcl-label"><g:link controller="bdInvcl" action="show" id="${bdInvbasdocInstance?.pkInvcl?.id}">${bdInvbasdocInstance?.pkInvcl?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.sealflag}">
				<li class="fieldcontain">
					<span id="sealflag-label" class="property-label"><g:message code="bdInvbasdoc.sealflag.label" default="Sealflag" /></span>
					
						<span class="property-value" aria-labelledby="sealflag-label"><g:formatBoolean boolean="${bdInvbasdocInstance?.sealflag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.setpartsflag}">
				<li class="fieldcontain">
					<span id="setpartsflag-label" class="property-label"><g:message code="bdInvbasdoc.setpartsflag.label" default="Setpartsflag" /></span>
					
						<span class="property-value" aria-labelledby="setpartsflag-label"><g:formatBoolean boolean="${bdInvbasdocInstance?.setpartsflag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.shipunitnum}">
				<li class="fieldcontain">
					<span id="shipunitnum-label" class="property-label"><g:message code="bdInvbasdoc.shipunitnum.label" default="Shipunitnum" /></span>
					
						<span class="property-value" aria-labelledby="shipunitnum-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="shipunitnum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.storeunitnum}">
				<li class="fieldcontain">
					<span id="storeunitnum-label" class="property-label"><g:message code="bdInvbasdoc.storeunitnum.label" default="Storeunitnum" /></span>
					
						<span class="property-value" aria-labelledby="storeunitnum-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="storeunitnum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.unitvolume}">
				<li class="fieldcontain">
					<span id="unitvolume-label" class="property-label"><g:message code="bdInvbasdoc.unitvolume.label" default="Unitvolume" /></span>
					
						<span class="property-value" aria-labelledby="unitvolume-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="unitvolume"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.unitweight}">
				<li class="fieldcontain">
					<span id="unitweight-label" class="property-label"><g:message code="bdInvbasdoc.unitweight.label" default="Unitweight" /></span>
					
						<span class="property-value" aria-labelledby="unitweight-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="unitweight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.weitunitnum}">
				<li class="fieldcontain">
					<span id="weitunitnum-label" class="property-label"><g:message code="bdInvbasdoc.weitunitnum.label" default="Weitunitnum" /></span>
					
						<span class="property-value" aria-labelledby="weitunitnum-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="weitunitnum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bdInvbasdocInstance?.width}">
				<li class="fieldcontain">
					<span id="width-label" class="property-label"><g:message code="bdInvbasdoc.width.label" default="Width" /></span>
					
						<span class="property-value" aria-labelledby="width-label"><g:fieldValue bean="${bdInvbasdocInstance}" field="width"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bdInvbasdocInstance?.id}" />
					<g:link class="edit" action="edit" id="${bdInvbasdocInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
