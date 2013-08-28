<%@ page import="com.app.bd.invbasdoc.BdInvbasdoc" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'bdInvbasdoc.label', default: 'BdInvbasdoc')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-bdInvbasdoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-bdInvbasdoc" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="invcode"
                              title="${message(code: 'bdInvbasdoc.invcode.label', default: 'Invcode')}"/>

            <g:sortableColumn property="invname"
                              title="${message(code: 'bdInvbasdoc.invname.label', default: 'Invname')}"/>

            <th><g:message code="bdInvbasdoc.bdmeasdoc.label" default="Bdmeasdoc"/></th>

            <th><g:message code="bdInvbasdoc.bdmeasdoc1.label" default="Bdmeasdoc1"/></th>

            <th><g:message code="bdInvbasdoc.bdmeasdoc2.label" default="Bdmeasdoc2"/></th>

            <th><g:message code="bdInvbasdoc.bdmeasdoc3.label" default="Bdmeasdoc3"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${bdInvbasdocInstanceList}" status="i" var="bdInvbasdocInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${bdInvbasdocInstance.id}">${fieldValue(bean: bdInvbasdocInstance, field: "invcode")}</g:link></td>

                <td>${fieldValue(bean: bdInvbasdocInstance, field: "invname")}</td>

                <td>${fieldValue(bean: bdInvbasdocInstance, field: "bdmeasdoc")}</td>

                <td>${fieldValue(bean: bdInvbasdocInstance, field: "bdmeasdoc1")}</td>

                <td>${fieldValue(bean: bdInvbasdocInstance, field: "bdmeasdoc2")}</td>

                <td>${fieldValue(bean: bdInvbasdocInstance, field: "bdmeasdoc3")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${bdInvbasdocInstanceTotal}"/>
    </div>
</div>
</body>
</html>
