<%@ page import="com.app.bd.banktype.BdBanktype" %>

<g:if test="${flash.message}">
    <div class="message" role="status" >${flash.message}</div>
</g:if>
<div id="remoteErrors" class="errors" role="status" hidden=""></div>
<form id="form${pageId}"  method="post">
    <fieldset class="form" >
        <g:render template="form"/>
    </fieldset>
</form>