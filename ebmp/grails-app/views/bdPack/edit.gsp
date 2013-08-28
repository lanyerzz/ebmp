<%@ page import="com.app.bd.pack.BdPack" %>
<script>
    $(function(){
       $('#form${pageId}').dateFormate();
    });
</script>
<g:set var="ac" value="edit"></g:set>

<div  class="easyui-layout"  fit="true">
    <div data-options="region:'north',title:'包装信息',split:true" style="height:140px;" >
        <form id="form${pageId}"  method="post" style="padding: 0px;padding-top: 0px">
            <fieldset style="padding: 5px;padding-top: 0px;" >
                <g:render template="form"/>
            </fieldset>
        </form>

    </div>

    <div data-options="region:'center',title:'配码表信息'"  >

        <g:render template="bodyList"></g:render>
    </div>

</div>