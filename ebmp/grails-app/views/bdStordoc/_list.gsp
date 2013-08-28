
<%@ page import="com.app.bd.stordoc.BdStordoc" %>
<g:set var="entityName" value="${message(code: 'bdStordoc.label', default: 'BdStordoc')}" />
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

                if(d.showMessage(json)){//有错误数据

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




    //    保存
    function onSave${pageId}(d){

        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
        $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var obj= $('#form${pageId}').serializeObject();

        $.post( '${createLink(action: 'save')}',obj,function(json){

                var row = $("#table${pageId}").datagrid('getSelected');
                    $.messager.progress('close');	// hide progress bar while submit successfully

                if(d.showMessage(json)){//有错误数据


                    return;
                }
                d.dialog('destroy');

                $("#table${pageId}").datagrid('reload');

                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
               },
            'json'
        );
    }

    //增加
    function onAdd${pageId}(data){

        var addurl='${createLink(action: 'create')}';


        $('<div/>').dialog({
            title:'添加',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:650,
            height:500,

            href:addurl,
            buttons:[{
                text : '增加',
                iconCls : 'icon-add',
                handler : function() {
                    var d = $(this).closest('.window-body');
                    onSave${pageId}(d);
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });

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
            height:500,

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

    //        删除
    function onDelete${pageId}(){

        var row=$('#table${pageId}').datagrid('getSelected');
        var index = $('#table${pageId}').datagrid('getRowIndex',row);
        if(row==null){
        $.messager.show({
                title:'消息',
                msg:'请选择需要删除的数据！'
            });
            return;
        };
        $.messager.confirm('${message(code:'default.delete.message',default: '删除数据')}',
                '${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}',
                function(r){
                    if(r){


                    $.post('${createLink(action: 'delete')}', { id: row.id },
                                function(data){
                                    $('#table${pageId}').datagrid('deleteRow',index);
                                    $.messager.show({
                                        title:'消息',
                                        msg:'数据已经删除！'
                                    });
                                });
                    }
                }
    );
    }

    function onOpenQuery${pageId}(){
//        $('#query${pageId}').dialog('open');
        $('<div/>').dialog({
            title:'查询',
            iconCls:'icon-search',
            resizable:true,
            modal:true,
//            fit:true,
            width :600,
            height:500,
            // inline:true,
            href:'${createLink(action: 'createQuery')}',
            buttons:[{
                text : '查询',
                iconCls : 'icon-search',
                handler : function() {
                    var d = $(this).closest('.window-body');
                    onQuery${pageId}(d);
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }



    function onRefPage${pageId}(businessKey,billTypeKey,title){
        var xhjhdurl='${createLink(controller: 'pubBusinessType', action:'refPage')}?handler=getSelected${pageId}&businessKey='+businessKey+'&billTypeKey='+billTypeKey;
        $("<div/>").dialog({
            title:title,
            resizable:false,
            modal:true,
            width:1000,
            height:500,

            href:xhjhdurl,
            buttons:[{
                text : '增加',
                iconCls : 'icon-add',
                handler : function() {
                    var data=   getSelected${pageId}();


                    if(data.length==0){
                        $.messager.show({
                            title:'警告',
                            msg:'请选择卸货计划单!'
                        });
                        return;
                    }

                    var a = $(this).closest('.window-body');
                    onAdd${pageId}(data);
                    a.dialog('destroy');
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });

    }

</script>



%{--按钮--}%
<div id="tb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAdd${pageId}(null) ">
        ${message(code: 'default.button.create.label',default: '增加')}
    </a>

    %{--<g:addButton billTypeCode="" pageId="${pageId}" handler="onAdd" refHandler="onRefPage"></g:addButton>--}%
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label',default: '修改')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">
        ${message(code: 'default.button.delete.label',default: '删除')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').datagrid('reload')">
        ${message(code: 'default.button.refresh.label',default: '刷新')}
    </a>

</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        
        <th field="code" sortable="true">${message(code: 'bdStordoc.code.label', default: 'Code')}</th>
        
        <th field="name" sortable="true">${message(code: 'bdStordoc.name.label', default: 'Name')}</th>
        

        <th field="calbody" sortable="false" data-options="
            formatter:function(value,row){
                return getObjectAttr(row,'calbody.name');
            }
        "><g:message code="bdStordoc.calbody.label" default="Calbody"/></th>
        <th field="storaddr" sortable="true">${message(code: 'bdStordoc.storaddr.label', default: 'Storaddr')}</th>
        <th field="sealflag" sortable="true">${message(code: 'bdStordoc.sealflag.label', default: 'Sealflag')}</th>
        <th field="memo" sortable="true">${message(code: 'bdStordoc.memo.label', default: 'Memo')}</th>
        

        

        <th field="bdCorp" sortable="false" data-options="
            formatter:function(value,row){
                return getObjectAttr(value,'unitName');
            }
        "><g:message code="bdStordoc.bdCorp.label" default="Bd Corp"/></th>

    </tr>
    </thead>
</table>



