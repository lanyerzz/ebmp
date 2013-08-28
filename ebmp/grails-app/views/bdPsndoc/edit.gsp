<%@ page import="com.app.bd.psndoc.BdPsndoc" %>
<script>
    $(function(){
       $('#form${pageId}').dateFormate();
    });
    $(function(){
        $('#psnbasForm${pageId}').dateFormate();
    });
</script>
<g:set var="ac" value="edit"></g:set>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<div class="easyui-tabs" fit="true">
    <div title="人员档案">
        <form id="form${pageId}"  method="post">
            <fieldset class="form" >
                <g:render template="form"/>
            </fieldset>
        </form>
    </div>
    <div title="人员基本档案">
        <form id="psnbasForm${pageId}" method="post">
            <fieldset class="form" >
                <g:render template="basForm"/>
            </fieldset>
        </form>
    </div>

</div>
