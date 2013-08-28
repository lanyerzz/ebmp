<%@ page import="com.app.bd.measdoc.BdMeasdoc" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'bdMeasdoc.label', default: 'BdMeasdoc')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-bdMeasdoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-bdMeasdoc" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="shortname"
                              title="${message(code: 'bdMeasdoc.shortname.label', default: 'Shortname')}"/>

            <g:sortableColumn property="measname"
                              title="${message(code: 'bdMeasdoc.measname.label', default: 'Measname')}"/>

            <g:sortableColumn property="basecodeflag"
                              title="${message(code: 'bdMeasdoc.basecodeflag.label', default: 'Basecodeflag')}"/>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'bdMeasdoc.dateCreated.label', default: 'Date Created')}"/>

            <g:sortableColumn property="lastUpdated"
                              title="${message(code: 'bdMeasdoc.lastUpdated.label', default: 'Last Updated')}"/>

            <g:sortableColumn property="oppdimen"
                              title="${message(code: 'bdMeasdoc.oppdimen.label', default: 'Oppdimen')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${bdMeasdocInstanceList}" status="i" var="bdMeasdocInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${bdMeasdocInstance.id}">${fieldValue(bean: bdMeasdocInstance, field: "shortname")}</g:link></td>

                <td>${fieldValue(bean: bdMeasdocInstance, field: "measname")}</td>

                <td><g:formatBoolean boolean="${bdMeasdocInstance.basecodeflag}"/></td>

                <td><g:formatDate date="${bdMeasdocInstance.dateCreated}"/></td>

                <td><g:formatDate date="${bdMeasdocInstance.lastUpdated}"/></td>

                <td>${fieldValue(bean: bdMeasdocInstance, field: "oppdimen")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${bdMeasdocInstanceTotal}"/>
    </div>
</div>
</body>
</html>
