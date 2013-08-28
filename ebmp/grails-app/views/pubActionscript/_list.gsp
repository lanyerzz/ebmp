
<%@ page import="com.app.pub.actionscript.PubActionscript" %>
<g:set var="entityName" value="${message(code: 'pubActionscript.label', default: 'PubActionscript')}" />
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

                $("#table${pageId}").datagrid('reload');

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

                if(json.validateerrors!=null){//有错误数据
                    d.showMessage(json);

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
    function onAdd${pageId}(){
        var addurl='${createLink(action: 'create')}'
        $('<div/>').dialog({
            title:'添加脚本',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:400,
            height:300,

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
            title:'编辑脚本',
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

    function onQuery${pageId}(d){
        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
        $(d).dialog('destroy');
    }

    function onCompile${pageId}(){

    }

    function onEditScritp${pageId}(){

            var row=$('#table${pageId}').datagrid('getSelected');

            if(row==null){
                $.messager.show({
                    title:'消息',
                    msg:'请选择需要编辑的数据！'
                });
                return;
            };
            var editurl='${createLink(action:'editScript')}/'+row.id

            $('<div/>').dialog({
                title:'编辑脚本',
                iconCls:'icon-edit',
                resizable:false,
                modal:true,
                width:700,
                height:600,

                href:editurl,
                buttons:[{
                    text : '保存',
                    iconCls : 'icon-edit',
                    handler : function() {
                        var d = $(this).closest('.window-body');
                        onSaveScript${pageId}(d);
                    }
                }],
                onClose : function() {
                    $(this).dialog('destroy');
                }
            });

        }

    function  onSaveScript${pageId}(d){
        $.messager.progress();	// display the progress bar



        var obj= $('#scriptform${pageId}').serializeObject();
       // alert(JSON.stringify(obj));

        $.post( '${createLink(action: 'saveScript')}',obj,function(json){

                    var row = $("#table${pageId}").datagrid('getSelected');
                    $.messager.progress('close');	// hide progress bar while submit successfully

                    if(d.showMessage(json)){//有错误数据


                        return;
                    }
                    d.dialog('destroy');


                },
                'json'
        );
    }
function onBatch${pageId}(){
    $('<div/>').dialog({
        title:'批量添加',
        iconCls:'icon-add',
        resizable:false,
        modal:true,
        width:600,
        height:500,

        href:'${createLink(action: 'batch')}',
        buttons:[{
            text : '增加',
            iconCls : 'icon-add',
            handler : function() {
                var d = $(this).closest('.window-body');
                batchSave${pageId}(d);
            }
        }],
        onClose : function() {
            $(this).dialog('destroy');
        }
    });

}

function batchSave${pageId}(d){
    var isValid = $('#batchForm${pageId}').form('validate');
    if (!isValid){
        $.messager.progress('close');	// hide progress bar while the form is invalid
        return;
    }
    var obj= $('#batchForm${pageId}').serializeObject();



    $.post('${createLink(action: 'batchSave')}',obj,function(json){
        if($('#batchForm${pageId}').showMessage(json)){
            return;
        }

        d.dialog('destroy');

        $("#table${pageId}").datagrid('reload');

    },'json');


}

</script>


%{--按钮--}%
<div id="tb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAdd${pageId}() ">
        ${message(code: 'default.button.create.label',default: '增加')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label',default: '修改')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">
        ${message(code: 'default.button.delete.label',default: '删除')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').datagrid('reload')">
        ${message(code: 'default.button.refresh.label',default: '刷新')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
        ${message(code: 'default.button.query.label',default: '查询')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="" plain="true" onclick="onEditScritp${pageId}()">
        ${message(code: 'default.button.editScript.label',default: '编辑脚本')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="" plain="true" onclick="onBatch${pageId}()">
        ${message(code: 'default.button.batch.label')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        
        <th field="scriptCode" sortable="true">${message(code: 'pubActionscript.scriptCode.label', default: 'Script Code')}</th>
        
        <th field="scriptName" sortable="true">${message(code: 'pubActionscript.scriptName.label', default: 'Script Name')}</th>
        
        <th field="path" sortable="true">${message(code: 'pubActionscript.path.label', default: 'Path')}</th>
        
        <th field="actionType" sortable="true" data-options="formatter:function(value,row){
            if(row.actionType==0){
                return '动作前';
            }else if(row.actionType==1){
                return '动作后';
            }else{
                return vale;
            }
        }">${message(code: 'pubActionscript.actionType.label', default: 'Action Type')}</th>
        
        <th field="pubBilltype.billtypename" sortable="true" data-options="formatter:function(value,row){
            if(row.pubBilltype){
                return row.pubBilltype.billtypename;
            }else{
                return value;
            }
        }"><g:message code="pubActionscript.pubBilltype.label" default="Pub Billtype"/></th>
        

    </tr>
    </thead>
</table>



