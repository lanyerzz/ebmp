<%@ page import="com.app.ywms.contract.BaseContract" %>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<script>
    $(function(){
        $('#form${pageId}').dateFormate();
    });
</script>
<div  class="easyui-layout"  fit="true">
    <div id="head" data-options="region:'center',split:true" style="" >
        <form id="form${pageId}"  method="post">
            <fieldset class="form" >
                <g:render template="form"/>
            </fieldset>
        </form>

    </div>

    %{--<div  data-options="region:'center',title:'',split:true,border:false" >--}%
    %{--<g:render template="bodylist"></g:render>--}%
    %{--</div>--}%

    <div data-options="region:'south',split:false" class="panel-tools" style="background-color: #95B8E7">
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-save" onclick="onSave${pageId}()">保存</a>
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-cancel" onclick="onClose${pageId}()">取消</a>
    </div>



</div>