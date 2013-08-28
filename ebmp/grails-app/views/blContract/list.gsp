<%@ page import="com.app.ywms.contract.BaseContract" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'blContract.label', default: 'BlContract')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-blContract" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-blContract" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="zgksrq" title="${message(code: 'blContract.zgksrq.label', default: 'Zgksrq')}"/>

            <g:sortableColumn property="zgjsrq" title="${message(code: 'blContract.zgjsrq.label', default: 'Zgjsrq')}"/>

            <g:sortableColumn property="zdrq" title="${message(code: 'blContract.zdrq.label', default: 'Zdrq')}"/>

            <g:sortableColumn property="shrq" title="${message(code: 'blContract.shrq.label', default: 'Shrq')}"/>

            <g:sortableColumn property="azqlj" title="${message(code: 'blContract.azqlj.label', default: 'Azqlj')}"/>

            <th><g:message code="blContract.bdCumandoc.label" default="Bd Cumandoc"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${blContractInstanceList}" status="i" var="blContractInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${blContractInstance.id}">${fieldValue(bean: blContractInstance, field: "zgksrq")}</g:link></td>

                <td><g:formatDate date="${blContractInstance.zgjsrq}"/></td>

                <td><g:formatDate date="${blContractInstance.zdrq}"/></td>

                <td><g:formatDate date="${blContractInstance.shrq}"/></td>

                <td><g:formatBoolean boolean="${blContractInstance.azqlj}"/></td>

                <td>${fieldValue(bean: blContractInstance, field: "bdCumandoc")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${blContractInstanceTotal}"/>
    </div>
</div>
</body>
</html>
