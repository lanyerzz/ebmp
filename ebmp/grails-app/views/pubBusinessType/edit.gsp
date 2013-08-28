<%@ page import="com.app.pub.businesstype.PubBusinessType" %>
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
<div id="layout" class="easyui-layout" fit="true">
    <div data-options="region:'north',title:'主表信息',split:true" style="height:100px;">
        <form id="form${pageId}"  method="post">
            <fieldset class="form" >
                <g:render template="form"/>
            </fieldset>
        </form>
    </div>
    <div data-options="region:'center',title:'子表信息'"  style="padding:5px;background:#eee;">
        <g:render template="bodyList"></g:render>


    </div>

</div>

