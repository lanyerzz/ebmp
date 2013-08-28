<%@ page import="com.app.ic.bill.IcGeneralHead" %>

<script>
    $(function(){
        $('#form${pageId}').dateFormate();
    });
</script>

<g:set var="ac" value="create"></g:set>

<div id="card${pageId}" class="easyui-layout"  fit="true">
    <div id="head" data-options="region:'north',split:false,border:true"  class="panel-tools" style="background-color: #f1f1f1;">

        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-save" onclick="onSave${pageId}()">保存</a>
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-cancel" onclick="onClose${pageId}()">取消</a>


    </div>

    <div  data-options="region:'center',split:true,border:true" >
        <form id="form${pageId}"  method="post">
            <fieldset class="form" >
                <g:render template="form"/>
            </fieldset>
        </form>
    </div>

    <div data-options="region:'south',split:true,border:false" style="height: 380px">
        <g:render template="bodylist"></g:render>
    </div>



</div>