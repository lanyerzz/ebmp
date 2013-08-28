<%@ page import="com.app.bd.banktype.BdBanktype" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'bdBanktype.label', default: 'BdBanktype')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-bdBanktype" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-bdBanktype" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="banktypecode"
                              title="${message(code: 'bdBanktype.banktypecode.label', default: 'Banktypecode')}"/>

            <g:sortableColumn property="banktypename"
                              title="${message(code: 'bdBanktype.banktypename.label', default: 'Banktypename')}"/>

            <g:sortableColumn property="amcode" title="${message(code: 'bdBanktype.amcode.label', default: 'Amcode')}"/>

            <g:sortableColumn property="createtime"
                              title="${message(code: 'bdBanktype.createtime.label', default: 'Createtime')}"/>

            <th><g:message code="bdBanktype.creator.label" default="Creator"/></th>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'bdBanktype.dateCreated.label', default: 'Date Created')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${bdBanktypeInstanceList}" status="i" var="bdBanktypeInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${bdBanktypeInstance.id}">${fieldValue(bean: bdBanktypeInstance, field: "banktypecode")}</g:link></td>

                <td>${fieldValue(bean: bdBanktypeInstance, field: "banktypename")}</td>

                <td>${fieldValue(bean: bdBanktypeInstance, field: "amcode")}</td>

                <td>${fieldValue(bean: bdBanktypeInstance, field: "createtime")}</td>

                <td>${fieldValue(bean: bdBanktypeInstance, field: "creator")}</td>

                <td><g:formatDate date="${bdBanktypeInstance.dateCreated}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${bdBanktypeInstanceTotal}"/>
    </div>
</div>
</body>
</html>
