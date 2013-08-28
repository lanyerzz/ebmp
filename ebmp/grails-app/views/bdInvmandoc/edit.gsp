<%@ page import="com.app.bd.invmandoc.BdInvmandoc" %>
<script>
    $(function(){
       $('#form${pageId}').dateFormate();
    });
</script>
<g:set var="ac" value="edit"></g:set>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<div id="remoteErrors" class="errors" role="status" hidden=""></div>
<form id="form${pageId}" method="post" >
    <fieldset class="form" method="post">
        <g:render template="form" />
    </fieldset>
</form>

