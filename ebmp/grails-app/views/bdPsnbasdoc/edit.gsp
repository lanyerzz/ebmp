<%@ page import="com.app.bd.psnbasdoc.BdPsnbasdoc" %>
<script>
    $(function(){
       $('#form${pageId}').dateFormate();
    });
</script>
<g:set var="ac" value="edit"></g:set>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<form id="form${pageId}" method="post" >
    <fieldset class="form" method="post">
        <g:render template="form" />
    </fieldset>
</form>

