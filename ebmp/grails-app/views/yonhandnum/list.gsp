<%@ page import="com.app.ywms.kc.Yonhandnum" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'yonhandnum.label', default: 'Yonhandnum')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-yonhandnum" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-yonhandnum" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="yonhandnum.invmandoc.label" default="Invmandoc"/></th>

            <th><g:message code="yonhandnum.gh.label" default="Gh"/></th>

            <g:sortableColumn property="fxsl" title="${message(code: 'yonhandnum.fxsl.label', default: 'Fxsl')}"/>

            <g:sortableColumn property="kcl" title="${message(code: 'yonhandnum.kcl.label', default: 'Kcl')}"/>

            <th><g:message code="yonhandnum.bdCorp.label" default="Bd Corp"/></th>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'yonhandnum.dateCreated.label', default: 'Date Created')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${yonhandnumInstanceList}" status="i" var="yonhandnumInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${yonhandnumInstance.id}">${fieldValue(bean: yonhandnumInstance, field: "invmandoc")}</g:link></td>

                <td>${fieldValue(bean: yonhandnumInstance, field: "gh")}</td>

                <td>${fieldValue(bean: yonhandnumInstance, field: "fxsl")}</td>

                <td>${fieldValue(bean: yonhandnumInstance, field: "kcl")}</td>

                <td>${fieldValue(bean: yonhandnumInstance, field: "bdCorp")}</td>

                <td><g:formatDate date="${yonhandnumInstance.dateCreated}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${yonhandnumInstanceTotal}"/>
    </div>
</div>
</body>
</html>
