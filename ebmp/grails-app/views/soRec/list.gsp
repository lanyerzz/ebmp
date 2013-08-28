<%@ page import="com.app.so.rec.SoRec" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'soRec.label', default: 'SoRec')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-soRec" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-soRec" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="soRec.bdCorp.label" default="Bd Corp"/></th>

            <g:sortableColumn property="billTypeCode"
                              title="${message(code: 'soRec.billTypeCode.label', default: 'Bill Type Code')}"/>

            <g:sortableColumn property="billdate"
                              title="${message(code: 'soRec.billdate.label', default: 'Billdate')}"/>

            <g:sortableColumn property="billno" title="${message(code: 'soRec.billno.label', default: 'Billno')}"/>

            <th><g:message code="soRec.billtype.label" default="Billtype"/></th>

            <th><g:message code="soRec.businessType.label" default="Business Type"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${soRecInstanceList}" status="i" var="soRecInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${soRecInstance.id}">${fieldValue(bean: soRecInstance, field: "bdCorp")}</g:link></td>

                <td>${fieldValue(bean: soRecInstance, field: "billTypeCode")}</td>

                <td><g:formatDate date="${soRecInstance.billdate}"/></td>

                <td>${fieldValue(bean: soRecInstance, field: "billno")}</td>

                <td>${fieldValue(bean: soRecInstance, field: "billtype")}</td>

                <td>${fieldValue(bean: soRecInstance, field: "businessType")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${soRecInstanceTotal}"/>
    </div>
</div>
</body>
</html>
