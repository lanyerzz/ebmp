<%@ page import="com.app.bd.invbasdoc.BdInvbasdoc" %>
<script>
    $(function(){
       $('#form${pageId}').dateFormate();
    });
</script>
<g:set var="ac" value="edit"></g:set>

<form id="form${pageId}" method="post" >
    <fieldset class="form" method="post">
        <g:render template="form" />
    </fieldset>
</form>

