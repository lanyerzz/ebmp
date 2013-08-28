<%@ page import="com.app.ywms.ck.gbd.YoutGbd" %>

<script>
    $(function(){
        $('#form${pageId}').dateFormate();
    });
</script>

<g:set var="ac" value="create"></g:set>

<div id="card${pageId}" class="easyui-layout"  fit="true">
    <div id="head" data-options="region:'north',split:false,border:true" class="panel-tools" style="background-color: #f1f1f1" >
        <a class="easyui-linkbutton"  plain="true" iconCls="icon-weigh1"  onclick="pz${pageId}()">皮重</a>
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-weigh2" onclick="mz${pageId}()">毛重</a>
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-edit" onclick="onEditNum${pageId}()">调整</a>
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-save" onclick="onSave${pageId}()">保存</a>
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-cancel" onclick="onClose${pageId}()">关闭</a>
    </div>


    <div  data-options="region:'center',title:'',split:true,border:true"  >
        <form id="form${pageId}"  method="post" >
            <fieldset class="form" >
                <g:render template="form"/>
            </fieldset>
        </form>

    </div>

    <div data-options="region:'south',split:true,border:false" style="height: 280px">


        <g:render template="bodyList"></g:render>
    </div>



</div>