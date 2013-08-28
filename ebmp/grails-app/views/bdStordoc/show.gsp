<%@ page import="com.app.bd.stordoc.BdStordoc" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'bdStordoc.label', default: 'BdStordoc')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-bdStordoc" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-bdStordoc" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list bdStordoc">

        <g:if test="${bdStordocInstance?.code}">
            <li class="fieldcontain">
                <span id="code-label" class="property-label"><g:message code="bdStordoc.code.label"
                                                                        default="Code"/></span>

                <span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${bdStordocInstance}"
                                                                                        field="code"/></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="bdStordoc.name.label"
                                                                        default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bdStordocInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.bdCorp}">
            <li class="fieldcontain">
                <span id="bdCorp-label" class="property-label"><g:message code="bdStordoc.bdCorp.label"
                                                                          default="Bd Corp"/></span>

                <span class="property-value" aria-labelledby="bdCorp-label"><g:link controller="bdCorp" action="show"
                                                                                    id="${bdStordocInstance?.bdCorp?.id}">${bdStordocInstance?.bdCorp?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.calbody}">
            <li class="fieldcontain">
                <span id="calbody-label" class="property-label"><g:message code="bdStordoc.calbody.label"
                                                                           default="Calbody"/></span>

                <span class="property-value" aria-labelledby="calbody-label"><g:link controller="bdCalbody"
                                                                                     action="show"
                                                                                     id="${bdStordocInstance?.calbody?.id}">${bdStordocInstance?.calbody?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.checkDate}">
            <li class="fieldcontain">
                <span id="checkDate-label" class="property-label"><g:message code="bdStordoc.checkDate.label"
                                                                             default="Check Date"/></span>

                <span class="property-value" aria-labelledby="checkDate-label"><g:formatDate
                        date="${bdStordocInstance?.checkDate}"/></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.checker}">
            <li class="fieldcontain">
                <span id="checker-label" class="property-label"><g:message code="bdStordoc.checker.label"
                                                                           default="Checker"/></span>

                <span class="property-value" aria-labelledby="checker-label"><g:link controller="smUser" action="show"
                                                                                     id="${bdStordocInstance?.checker?.id}">${bdStordocInstance?.checker?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="bdStordoc.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${bdStordocInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="bdStordoc.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${bdStordocInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.makeDate}">
            <li class="fieldcontain">
                <span id="makeDate-label" class="property-label"><g:message code="bdStordoc.makeDate.label"
                                                                            default="Make Date"/></span>

                <span class="property-value" aria-labelledby="makeDate-label"><g:formatDate
                        date="${bdStordocInstance?.makeDate}"/></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.maker}">
            <li class="fieldcontain">
                <span id="maker-label" class="property-label"><g:message code="bdStordoc.maker.label"
                                                                         default="Maker"/></span>

                <span class="property-value" aria-labelledby="maker-label"><g:link controller="smUser" action="show"
                                                                                   id="${bdStordocInstance?.maker?.id}">${bdStordocInstance?.maker?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.memo}">
            <li class="fieldcontain">
                <span id="memo-label" class="property-label"><g:message code="bdStordoc.memo.label"
                                                                        default="Memo"/></span>

                <span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${bdStordocInstance}"
                                                                                        field="memo"/></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.sealflag}">
            <li class="fieldcontain">
                <span id="sealflag-label" class="property-label"><g:message code="bdStordoc.sealflag.label"
                                                                            default="Sealflag"/></span>

                <span class="property-value" aria-labelledby="sealflag-label"><g:formatBoolean
                        boolean="${bdStordocInstance?.sealflag}"/></span>

            </li>
        </g:if>

        <g:if test="${bdStordocInstance?.storaddr}">
            <li class="fieldcontain">
                <span id="storaddr-label" class="property-label"><g:message code="bdStordoc.storaddr.label"
                                                                            default="Storaddr"/></span>

                <span class="property-value" aria-labelledby="storaddr-label"><g:fieldValue bean="${bdStordocInstance}"
                                                                                            field="storaddr"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${bdStordocInstance?.id}"/>
            <g:link class="edit" action="edit" id="${bdStordocInstance?.id}"><g:message code="default.button.edit.label"
                                                                                        default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
