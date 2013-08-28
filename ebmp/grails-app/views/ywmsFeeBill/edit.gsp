<%@ page import="com.app.ywms.settle.fee.YwmsFeeBill" %>
<script>
    $(function(){
       $('#form${pageId}').dateFormate();
    });
</script>
<g:set var="ac" value="edit"></g:set>



<div id="card${pageId}" class="easyui-layout"  fit="true">
    <div id="head" data-options="region:'north',title:'${message(code: 'ywmsFeeBill.label', default: 'YwmsFeeBill')}',split:true" style="height:280px;" >
        <form id="form${pageId}" method="post" >
            <fieldset class="form"  >
                <g:render template="form" />
            </fieldset>
        </form>

    </div>

    <div  data-options="region:'center',title:'',split:true,border:false" >
        <g:render template="bodyList"></g:render>
    </div>

    <div data-options="region:'south',split:false" class="panel-tools" style="background-color: #f1f1f1">
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-save" onclick="onSave${pageId}()">保存</a>
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-cancel" onclick="onClose${pageId}()">关闭</a>
    </div>



</div>