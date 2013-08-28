
<%@ page import="com.app.tm.templet.TmTemplet" %>
<g:set var="entityName" value="${message(code: 'tmTemplet.label', default: 'TmTemplet')}" />
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
            title:'添加模板',
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
            title:'编辑模板',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:400,
            height:300,

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
        $(d).dialog('close');
        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
    }

    function onCompile${pageId}(){
        var row = $('#table${pageId}').datagrid('getSelected');
        if(row==null){
            $.messager.show({
                title:'警告',
                msg:'请选择要编译的模板！'
            });
            return;
        }
        var compileUrl = '${createLink(controller:'tmTemplet',action:'compileTemplet')}/'+row.id
        $.post(compileUrl,null,function(json){
            if(json.success){
                $.messager.show({
                    title:'消息',
                    msg:'编译成功!'
                });
            }else{
                return ;
            }
        });
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
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onCompile${pageId}()">
        ${message(code: 'default.button.compile.label',default: '编译')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        
        <th field="templetCode" sortable="true">${message(code: 'tmTemplet.templetCode.label', default: 'Templet Code')}</th>
        
        <th field="templetName" sortable="true">${message(code: 'tmTemplet.templetName.label', default: 'Templet Name')}</th>
        
        <th field="corp.unitName" sortable="false" data-options="formatter:function(value,row){
            if(row.corp){
                return row.corp.unitName;
            }else{
                return value;
            }
        }"><g:message code="tmTemplet.corp.label" default="Corp"/></th>
        
        <th field="templetPath" sortable="true">${message(code: 'tmTemplet.templetPath.label', default: 'Templet Path')}</th>
        
        <th field="templetType" sortable="true" data-options="formatter:function(value,row){
            if(row.templetType==0){
                return '打印模板';
            }else if(row.templetType==1){
                return '查询模板';
            }else if(row.templetType==2){
                return '单据模板';
            }else if(row.templetType==3){
                return '报表模板';
            }else{
                return value;
            }
        }">${message(code: 'tmTemplet.templetType.label', default: 'Templet Type')}</th>
        
    </tr>
    </thead>
</table>



