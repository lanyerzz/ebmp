
<%@ page import="com.app.sm.roles.SmRoles" %>
<g:set var="entityName" value="${message(code: 'smRoles.label', default: '角色')}" />
<script>

    //    更新
    function onUpdate${pageId}(d){


    $('#form${pageId}').form('submit', {
            url:'${createLink(action: 'update')}',
            onSubmit: function(){
                var isValid = $(this).form('validate');
                if (!isValid){
                $.messager.progress('close');	// hide progress bar while the form is invalid
                }
                return isValid;	// return false will stop the form submission
            },
            success: function(node){

                {
                    var json=  jQuery.parseJSON(node);
                    if(d.showMessage(json)){//有错误数据

                    return;
                }
                   d.dialog('destroy');

                    $("#table${pageId}").datagrid('updateRow',{index:$('#table${pageId}').datagrid('getSelected'),row:json});

                    $.messager.show({
                    title:'消息',
                    msg:'修改完成！'
                });
            }

        }
    });
    }




    //    保存
    function onSave${pageId}(d){
    $.messager.progress();	// display the progress bar
    $('#form${pageId}').form('submit', {
            url:'${createLink(action: 'save')}',
            onSubmit: function(){
                var isValid = $(this).form('validate');
                if (!isValid){
                $.messager.progress('close');	// hide progress bar while the form is invalid
                }
                return isValid;	// return false will stop the form submission
            },
            success: function(node){
                var json=jQuery.parseJSON(node);
                $.messager.progress('close');	// hide progress bar while submit successfully

                if(d.showMessage(json)){//有错误数据

                    return;
                }
                d.dialog('destroy');

                    $("#table${pageId}").datagrid('insertRow',{
                    index: 0,  // the node has a 'id' value that defined through 'idField' property
                    row: json
                });
                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
            }

        });
    }

    //增加
    function onAdd${pageId}(){
        var addurl='${createLink(action: 'create')}'
        $('<div/>').dialog({
            title:'添加角色',
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
        if(row == null){//选择父节点

        $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id

        $('<div/>').dialog({
            title:'编辑角色',
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

    /**
    *打开公司分配界面
     */
    function onOpenLinkCorp${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择父节点

            $.messager.show({title:'警告',msg:'请选择要关联的角色'});
            return;
        }

        $('#linkdlg${pageId}').dialog('open').dialog('refresh','${createLink(action:'createLinkCorp')}/'+row.id);
    }

    function onLinkCorp${pageId}(){
            var row=$('#table${pageId}').datagrid('getSelected');
            var nodes= $('#corpTree${pageId}').tree('getChecked','checked');

            var keys = [];

            $.each(nodes,function(i,v){

                keys.push(v.id);
            });
      var  postData={"id":keys};
//        alert(JSON.stringify(postData));
            $.post('${createLink(action: 'linkCorps')}',{"data":JSON.stringify(postData),"id":row.id},function(data){
               if( !$(this).showMessage(data)){
                   $('#linkdlg${pageId}').dialog('close');
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
    <a href="#" class="easyui-linkbutton" plain="true" onclick="onOpenLinkCorp${pageId}()">
        <g:message code="defautl.button.linkCorp.label" default="关联公司" />
    </a>
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid" style="width:400px;height:300px"
       url="${createLink(action: 'list')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true">

    <thead>

    <tr>

        
        <th field="roleCode" sortable="true">${message(code: 'smRoles.roleCode.label', default: '角色编码')}</th>
        
        <th field="roleName" sortable="true">${message(code: 'smRoles.roleName.label', default: '角色名称')}</th>
        
        <th field="description"  width="300px">${message(code: 'smRoles.description.label', default: '描述')}</th>

        
    </tr>
    </thead>
</table>



<div id="linkdlg${pageId}" class="easyui-dialog" title="关联公司" style="width:500px;height:300px;" data-options="resizable:true,modal:true,closed:true"
    buttons='#button${pageId}' cache="true">
</div>

<div id="button${pageId}">
    <a href="#" class="easyui-linkbutton" onclick="onLinkCorp${pageId}()">
        <g:message code="default.button.save.label" default="确定"></g:message>
    </a>

</div>
