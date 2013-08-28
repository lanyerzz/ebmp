<%@ page import="com.app.ywms.bd.weighbridge.YWeighbridge" %>
<script>
    $(function(){
       $('#form${pageId}').dateFormate();
    });
</script>
<g:set var="ac" value="edit"></g:set>



<div id="card${pageId}" class="easyui-layout"  fit="true">
    <div id="head" data-options="region:'center',title:'${message(code: 'YWeighbridge.label', default: 'YWeighbridge')}',split:true" style="height:280px;" >
        <form id="form${pageId}" method="post" >
            <fieldset class="form" method="post">
                <g:render template="form" />
            </fieldset>
        </form>

    </div>

    %{--<div  data-options="region:'center',title:'',split:true,border:false" >--}%
        %{--<g:render template="bodyList"></g:render>--}%
    %{--</div>--}%

    <div data-options="region:'south',split:false" class="panel-tools" style="background-color: #95B8E7">
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-save" onclick="onSave${pageId}()">保存</a>
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-cancel" onclick="onClose${pageId}()">取消</a>
    </div>



</div>