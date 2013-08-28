<%@ page import="com.app.ywms.bd.cddw.YCddw" %>

<g:if test="${flash.message}">
    <div class="message" role="status" >${flash.message}</div>
</g:if>
<form id="form${pageId}"  method="post">
    <fieldset class="form" >
        <g:render template="form"/>
    </fieldset>
</form>