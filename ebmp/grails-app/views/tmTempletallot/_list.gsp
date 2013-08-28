
<%@ page import="com.app.tm.templetallot.TmTempletallot" %>
<g:set var="entityName" value="${message(code: 'tmTempletallot.label', default: 'TmTempletallot')}" />
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
    function onAdd${pageId}(){
        var node = $('#tree${pageId}').tree('getSelected');
        var isLeaf = $('#tree${pageId}').tree('isLeaf',node.target);
        if(node==null){
            $.messager.show({
                title:'警告',
                msg:'请选择功能节点'
            });
            return ;
        }
        if(isLeaf==false){
            $.messager.show({
                title:'警告',
                msg:'请选择末级节点添加'
            });
            return;
        }
        var addurl='${createLink(action: 'create')}/'+node.id
        $('<div/>').dialog({
            title:'添加模板分配',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:400,
            height:350,

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
            title:'编辑模板分配',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:400,
            height:350,

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
                    url:'${createLink(action: 'query')}?functionId='+node.id
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

</div>


<div class="easyui-layout" fit="true">
    <div region="west" title="功能节点" style="width: 200px">
        <ul id="tree${pageId}" class="easyui-tree" url="${createLink(action:'queryTree')}?=${id}"></ul>
    </div>
    <div region="center" title="模板分配">
        %{--表格--}%
        <table id="table${pageId}"  class="easyui-datagrid"
               url="${createLink(action: 'query')}"
               rownumbers="true"
               fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

            <thead>

            <tr>


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
                }">${message(code: 'tmTempletallot.templetType.label', default: 'Templet Type')}</th>

                <th field="tmTemplet.templetName" sortable="false" data-options="formatter:function(value,row){
                    if(row.tmTemplet){
                        return row.tmTemplet.templetName;
                    }else{
                        return value;
                    }
                }"><g:message code="tmTempletallot.tmTemplet.label" default="Tm Templet"/></th>

                <th field="code" sortable="true">${message(code: 'tmTempletallot.code.label', default: 'Code')}</th>

                <th field="corp.unitName" sortable="false" data-options="formatter:function(value,row){
                    if(row.corp){
                        return row.corp.unitName;
                    }else{
                        return value;
                    }
                }"><g:message code="tmTempletallot.corp.label" default="Corp"/></th>

                <th field="isDefault" sortable="true" data-options="formatter:function(value,row){
                    if(row.isDefault==true){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'tmTempletallot.isDefault.label', default: 'Is Default')}</th>

                <th field="role.roleName" sortable="false" data-options="formatter:function(value,row){
                    if(row.role){
                        return row.role.roleName;
                    }else{
                        return value;
                    }
                }"><g:message code="tmTempletallot.role.label" default="Role"/></th>

                <th field="user.userRealName" sortable="false" data-options="formatter:function(value,row){
                    if(row.user){
                        return row.user.userRealName;
                    }else{
                        return value;
                    }
                }"><g:message code="tmTempletallot.user.label" default="User"/></th>

            </tr>
            </thead>
        </table>
    </div>
</div>





