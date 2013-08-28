<%@ page import="com.app.sm.function.SmFunction" %>
<!doctype html>

<g:if test="${flash.message}">
    <div class="message" role="status" >${flash.message}</div>
</g:if>

<div id="remoteErrors" class="errors" role="status" hidden=""></div>
<form id="form${pageId}" method="post">

    <fieldset class="form">
        <div id="divparentCode${pageId}" class="fieldcontain">
            <label for="parentCode">
                <g:message code="smFunction.parentCode.label" default="parentCode"/>

            </label>
            <g:textField name="parentCode" value="${parentCode?:'-'}" readonly="" class="myui"/>
        </div>
        <g:hiddenField name="id" value="${smFunctionInstance?.id}" />
        <g:hiddenField name="version" value="${smFunctionInstance?.version}" />

        <g:render template="form"/>
    </fieldset>
</form>
