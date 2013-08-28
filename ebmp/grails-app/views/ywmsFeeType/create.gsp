<%@ page import="com.app.ywms.settle.feetype.YwmsFeeType" %>

<script>
    $(function(){
        $('#form${pageId}').dateFormate();
    });
</script>

<g:set var="ac" value="create"></g:set>
<form id="form${pageId}"  method="post" >
    <fieldset class="form" >
        <g:render template="form"/>
    </fieldset>
</form>