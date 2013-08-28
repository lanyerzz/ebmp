<%@ page import="com.app.sm.function.SmFunction" %>
<!doctype html>
<g:set var="ac" value="edit"></g:set>

<form id="form${pageId}" method="post" >
    <g:hiddenField name="id" value="${smFunctionInstance?.id}" />
    <g:hiddenField name="version" value="${smFunctionInstance?.version}" />
    <fieldset class="form">
        <g:render template="form" />
    </fieldset>
</form>

