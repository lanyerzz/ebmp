<%@ page import="com.app.pub.billnorule.PubBillnorule" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'pubBillnorule.label', default: 'PubBillnorule')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-pubBillnorule" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                    default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-pubBillnorule" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="pubBillnorule.pubbilltype.label" default="Pubbilltype"/></th>

            <th><g:message code="pubBillnorule.bdCorp.label" default="Bd Corp"/></th>

            <g:sortableColumn property="bdate" title="${message(code: 'pubBillnorule.bdate.label', default: 'Bdate')}"/>

            <g:sortableColumn property="cleanByDay"
                              title="${message(code: 'pubBillnorule.cleanByDay.label', default: 'Clean By Day')}"/>

            <g:sortableColumn property="currentNo"
                              title="${message(code: 'pubBillnorule.currentNo.label', default: 'Current No')}"/>

            <g:sortableColumn property="currentNoDate"
                              title="${message(code: 'pubBillnorule.currentNoDate.label', default: 'Current No Date')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${pubBillnoruleInstanceList}" status="i" var="pubBillnoruleInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${pubBillnoruleInstance.id}">${fieldValue(bean: pubBillnoruleInstance, field: "pubbilltype")}</g:link></td>

                <td>${fieldValue(bean: pubBillnoruleInstance, field: "bdCorp")}</td>

                <td><g:formatBoolean boolean="${pubBillnoruleInstance.bdate}"/></td>

                <td><g:formatBoolean boolean="${pubBillnoruleInstance.cleanByDay}"/></td>

                <td>${fieldValue(bean: pubBillnoruleInstance, field: "currentNo")}</td>

                <td><g:formatDate date="${pubBillnoruleInstance.currentNoDate}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${pubBillnoruleInstanceTotal}"/>
    </div>
</div>
</body>
</html>
