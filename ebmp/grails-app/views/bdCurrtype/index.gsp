<script>
/**
*  增加
 */
    function onAdd${pageId}() {
        var addurl='${createLink(action: 'create')}'
        $('<div/>').dialog({
            title:'添加币种',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:400,
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
/**
*保存
* @param d
 */
    function onSave${pageId}(d) {
        $.messager.progress();
        $('#form${pageId}').form('submit',{url:'${createLink(controller:'bdCurrtype',action:'save')}',onSubmit:function(){
            var isValid = $(this).form('validate');
            if(!isValid){
                $.messager.progress('close');
            }
            return isValid;
        },success:function(row){

            $.messager.progress('close');
            {
                var jdata = jQuery.parseJSON(row);
                if(jdata.validateerrors!=null){
                    d.showMessage(jdata);
                    return;
                }
                d.dialog('destroy');
                $('#table${pageId}').datagrid('reload');
                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
            }
        }});
    }
/**
*修改
 */
    function onEdit${pageId}() {
        var selectrow = $('#table${pageId}').datagrid('getSelected');
        if(selectrow==null){
            $.messager.show({title:'警告',msg:'请选择要修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+selectrow.id

        $('<div/>').dialog({
            title:'编辑币种',
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
/**
*修改
* @param d
 */
    function onUpdate${pageId}(d){
        $.messager.progress();
        $('#form${pageId}').form('submit',{url:'${createLink(controller:'bdCurrtype',action:'update')}',onSubmit:function(){
            var isValid = $(this).form('validate');
            if(!isValid){
                $.messager.progress('close');
            }
            return isValid;
        },success:function(row){

            $.messager.progress('close');
            {
                var jdata = jQuery.parseJSON(row);
                if(jdata.validateerrors!=null){
                    d.showMessage(jdata);
                    return;
                }
                d.dialog('destroy');
                $('#table${pageId}').datagrid('reload');
                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
            }
        }});
    }
/**
*删除
 */
    function onDelete${pageId}() {
        var row = $('#table${pageId}').datagrid('getSelected');
        var index = $('#table${pageId}').datagrid('getRowIndex',row);
//        alert(index);
        if (row==null) {
            $.messager.show({title: '消息', msg: '请选择要删除的数据'});
            return;
        }
        $.messager.confirm('${message(code:'default.delete.message',default:'删除数据')}', '${message(code:'default.button.delete.confirm.message',default:'Are you sure?')}', function (r) {
            if (r) {
                $.post('${createLink(controller:'bdCurrtype',action:'delete')}', {id: row.id}, function (data) {
                    $('#table${pageId}').datagrid('deleteRow',index);
                });
            }
        });

    }
    function onPrint${pageId}(){
        var row = $('#table${pageId}').datagrid('getSelected');
        if (row==null) {
            $.messager.show({title: '消息', msg: '请选择要打印的数据'});
            return;
        }
        var queryParams={id:row.id};


        print('${functionId}','bdCurrtype','print',encodeURI(JSON.stringify(queryParams)));

    }
</script>
<%@ page contentType="text/html;charset=UTF-8" %>
<div id="tb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
       onclick="onAdd${pageId}()">${message(code: 'default.button.create.label', default: '增加')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label', default: '修改')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
       onclick="onDelete${pageId}()">${message(code: 'default.button.delete.label', default: '删除')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"
       onclick="$('#table${pageId}').datagrid('reload')">${message(code: 'default.button.refresh.label', default: '刷新')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"
       onclick="onPrint${pageId}()">${message(code: 'default.button.print.label', default: '打印')}</a>
</div>
<table id="table${pageId}" class="easyui-datagrid"
       url="${createLink(controller: 'bdCurrtype', action: 'query')}" rownumbers="true" toolbar="#tb${pageId}"
       fit="true" singleSelect="true" >
    <thead frozen="true">
    <tr>
        <th field='currtypecode' width="100">${message(code: 'bdCurrtype.currtypecode.label', default: 'currtypecode')}</th>
        <th data-options="field:'currtypename'" width="100">${message(code: 'bdCurrtype.currtypename.label', default: 'currtypecode')}</th>
        <th data-options="field:'currtypesign'" width="100">${message(code: 'bdCurrtype.currtypesign.label', default: 'currtypecode')}</th>
        <th data-options="field:'currbusidigit',align:'right'" width="100">${message(code: 'bdCurrtype.currbusidigit.label', default: 'currtypecode')}</th>
        <th data-options="field:'currdigit',align:'right'" width="100">${message(code: 'bdCurrtype.currdigit.label', default: 'currtypecode')}</th>
    </tr>
    </thead>
</table>

