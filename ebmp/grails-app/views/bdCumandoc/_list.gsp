
<%@ page import="com.app.bd.cumandoc.BdCumandoc" %>
<g:set var="entityName" value="${message(code: 'bdCumandoc.label', default: 'BdCumandoc')}" />
<script>



    //    更新
    function onUpdate${pageId}(d){
        $.messager.progress();	// display the progress bar

            var isValid = $('#form${pageId}').form('validate');
            if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
                return;
            }

            var obj= $('#form${pageId}').serializeObject();

            $.post( '${createLink(action: 'update')}',obj,function(json){

                var row = $("#table${pageId}").datagrid('getSelected');
                $.messager.progress('close');	// hide progress bar while submit successfully

                if(json.validateerrors!=null){//有错误数据
                    d.showMessage(json);

                    return;
                }
                d.dialog('destroy');

                $("#table${pageId}").datagrid('updateRow',{
                    index:$('#table${pageId}').datagrid('getRowIndex',row),
                    row:json
                });

                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
               },
            'json'
        );
    }


    //修改
    function  onEdit${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择修改节点

            $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id

        $('<div/>').dialog({
            title:'编辑',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:400,
            height:400,

            href:editurl,
            buttons:[{
                text : '编辑',
                iconCls : 'icon-edit',
                handler : function() {
                    var d = $(this).closest('.window-body');
                    onUpdate${pageId}(d);
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });


    }



    function onOpenQuery${pageId}(){
        $('#query${pageId}').dialog('open');
    }

    function onQuery${pageId}(){
        $('#query${pageId}').dialog('close');
        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
    }

    $(function(){
        $('#tree${pageId}').tree({
            onDblClick:function(node){
                $('#table${pageId}').datagrid({
                    url:'${createLink(action:'query')}?pkAreacl='+node.id
                });
                $('#table${pageId}').datagrid('reload');
            }
        });
    });

</script>

%{--查询窗口--}%
<div id="query${pageId}" title="查询" class="easyui-dialog" data-options="buttons:'#query-buttons${pageId}',resizable:true,closed:true,width:600,height:500" modal="true" href="${createLink(action: 'createQuery')}" ></div>
<div id="query-buttons${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true"  onclick="onQuery${pageId}() ">
        ${message(code: 'default.button.query.label',default: '查询')}
    </a>
</div>

%{--按钮--}%
<div id="tb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label',default: '修改')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').datagrid('reload')">
        ${message(code: 'default.button.refresh.label',default: '刷新')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
        ${message(code: 'default.button.query.label',default: '查询')}
    </a>
</div>

<div class="easyui-layout" fit="true">
    <div title="地区分类" region="west" style="width:200px">
        <ul id="tree${pageId}" class="easyui-tree" url="${createLink(action:'queryTree')}?=${id}">

        </ul>
    </div>

    <div region="center" title="客商管理档案">
        %{--表格--}%
        <table id="table${pageId}"  class="easyui-datagrid"
               url="${createLink(action: 'query')}"
               rownumbers="true"
               fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

            <thead>

            <tr>
                <th field="pkCubasdoc.custcode" sortable="true" data-options="formatter:function(value,row){
                    if(row.pkCubasdoc){
                        return row.pkCubasdoc.custcode;
                    }else{
                        return value;
                    }
                }">${message(code: 'bdCumandoc.pkCubasdoc.custcode.label', default: 'Custcode')}</th>

                <th field="pkCubasdoc.custname" sortable="true" data-options="formatter:function(value,row){
                    if(row.pkCubasdoc){
                        return row.pkCubasdoc.custname;
                    }else{
                        return value;
                    }
                }">${message(code: 'bdCumandoc.pkCubasdoc.custname.label', default: 'Custname')}</th>

                <th field="pkCubasdoc.custshortname" sortable="true" data-options="formatter:function(value,row){
                    if(row.pkCubasdoc){
                        return row.pkCubasdoc.custshortname;
                    }else{
                        return value;
                    }
                }">${message(code: 'bdCumandoc.pkCubasdoc.custshortname.label', default: '客商简称')}</th>

                <th field="custprop" sortable="true" data-options="formatter:function(value,row){
                    if(row.pkCubasdoc.custprop==0){
                        return '外部单位';
                    }else if(row.pkCubasdoc.custprop==1){
                        return '内部单位';
                    }else{
                        return value;
                    }
                }">${message(code: 'bdCumandoc.pkCubasdoc.custprop.label', default: '客商类型')}</th>

                <th field="pkCubasdoc.engname" sortable="true" data-options="formatter:function(value,row){
                    if(row.pkCubasdoc){
                        return row.pkCubasdoc.engname;
                    }else{
                        return value;
                    }
                }">${message(code: 'bdCumandoc.pkCubasdoc.engname.label', default: '外文名称')}</th>

                <th field="pkCubasdoc.blockUp" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.pkCubasdoc.blockUp=='true'){
                        return '是';
                    }else{
                        return '否';
                    }

                }">${message(code: 'bdCumandoc.pkCubasdoc.blockUp.label', default: '停用')}</th>

                <th field="iscustomer" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.iscustomer=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCumandoc.iscustomer.label', default: '客商')}</th>

                <th field="isvender" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.isvender=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
            }">${message(code: 'bdCumandoc.isvender.label', default: '供应商')}</th>

            </tr>
            </thead>
        </table>

    </div>


</div>






