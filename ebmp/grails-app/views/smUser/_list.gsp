<%@ page import="com.app.sm.user.SmUser" %>
<g:set var="entityName" value="${message(code: 'smUser.label', default: 'SmUser')}"/>
<script>


    //    更新
    function onUpdate${pageId}(d) {
        var row =  $('#table${pageId}').datagrid('getSelected');
        $.messager.progress();	// display the progress bar
        $('#form${pageId}').form('submit', {
            url: '${createLink(action: 'update')}',
            onSubmit: function () {
                var isValid = $(this).form('validate');
                if (!isValid) {
                    $.messager.progress('close');	// hide progress bar while the form is invalid
                }
                return isValid;	// return false will stop the form submission
            },
            success: function (node) {
                $.messager.progress('close');
                {
                    var json = jQuery.parseJSON(node);
                    if (d.showMessage(json)) {//有错误数据

                        return;
                    }
                    d.dialog('destroy');

                    $("#table${pageId}").datagrid('updateRow', {index: $('#table${pageId}').datagrid('getRowIndex',row), row: json});

                    $.messager.show({
                        title: '消息',
                        msg: '修改完成！'
                    });
                }

            }
        });
    }


    //    保存
    function onSave${pageId}(d) {
        $.messager.progress();	// display the progress bar
        $('#form${pageId}').form('submit', {
            url: '${createLink(controller:'smUser', action: 'save')}',
            onSubmit: function () {
                var isValid = $(this).form('validate');
                if (!isValid) {
                    $.messager.progress('close');	// hide progress bar while the form is invalid
                }
                return isValid;	// return false will stop the form submission
            },
            success: function (node) {
                var json = jQuery.parseJSON(node);
                $.messager.progress('close');	// hide progress bar while submit successfully
                {
                    if (d.showMessage(json)) {//有错误数据

                        return;
                    }
                   d.dialog('destroy');

                    $("#table${pageId}").datagrid('insertRow', {
                        index: 0,  // the node has a 'id' value that defined through 'idField' property
                        row: json
                    });
                    $.messager.show({
                        title: '消息',
                        msg: '操作完成！'
                    });
                }
            }

        });
    }

    //增加
    function onAdd${pageId}() {
        var addurl='${createLink(action: 'create')}'
        $('<div/>').dialog({
            title:'添加用户',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:780,
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
    function onEdit${pageId}() {
        var row = $('#table${pageId}').datagrid('getSelected');
        if (row == null) {//选择父节点

            $.messager.show({title: '警告', msg: '请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id

        $('<div/>').dialog({
            title:'编辑用户',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:780,
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
    function onDelete${pageId}() {

        var row = $('#table${pageId}').datagrid('getSelected');
        var index = $('#table${pageId}').datagrid('getRowIndex', row);
        if (row == null) {
            $.messager.show({
                title: '消息',
                msg: '请选择需要删除的数据！'
            });
            return;
        }
        ;
        $.messager.confirm('${message(code:'default.delete.message',default: '删除数据')}',
                '${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}',
                function (r) {
                    if (r) {


                        $.post('${createLink(action: 'delete')}', { id: row.id },
                                function (data) {
                                    $('#table${pageId}').datagrid('deleteRow', index);
                                    $.messager.show({
                                        title: '消息',
                                        msg: '数据已经删除！'
                                    });
                                });
                    }
                }
        );
    }

    function onEditPwd${pageId}(){
        var row = $('#table${pageId}').datagrid('getSelected');
        if(row==null){
            $.messager.show({
                title:'警告',
                msg:'请选择要修改密码的用户数据'
            });
            return;
        }
        $('#editPwddlg${pageId}').dialog({
            title:'修改密码',
            href:'${createLink(action:'editPwd')}/'+row.id
        });
        $('#editPwddlg${pageId}').dialog('open').dialog('refresh');

    }

    function onSavePwd${pageId}(){
        $.messager.progress();	// display the progress bar
        $('#editPwdform${pageId}').form('submit', {
            url: '${createLink(action: 'savePwd')}',
            onSubmit: function () {
                var isValid = $(this).form('validate');
                if (!isValid) {
                    $.messager.progress('close');	// hide progress bar while the form is invalid
                }
                return isValid;	// return false will stop the form submission
            },
            success: function (node) {
                $.messager.progress('close');
                {
                    var json = jQuery.parseJSON(node);
                    if ($('#editPwddlg${pageId}').showMessage(json)) {//有错误数据

                        return;
                    }
                    $('#editPwddlg${pageId}').dialog('close');

                    $.messager.show({
                        title: '消息',
                        msg: '修改完成！'
                    });
                }

            }
        });
    }

function linkRole${pageId}(){
    var row = $('#table${pageId}').datagrid('getSelected');
    if(row==null){
        $.messager.show({
            title:'警告',
            msg:'请选择要分配角色的用户'
        });
        return;
    }



    $('<div/>').dialog({
        title:'分配角色',
        iconCls:'icon-add',
        resizable:false,
        modal:true,
        width:600,
        height:500,

        href:'${createLink(action:'createLinkRole')}/'+row.id,
        buttons:[{
            text : '分配',
            iconCls : 'icon-add',
            handler : function() {
                var d = $(this).closest('.window-body');
                saveLinkRole${pageId}(d);
            }
        }],
        onClose : function() {
            $(this).dialog('destroy');
        }
    });

}

    function saveLinkRole${pageId}(d){
        var nodes = $('#rcTree${pageId}').tree('getChecked');
        var row = $('#table${pageId}').datagrid('getSelected');
        var data=new Array();

        for(var i=0;i<nodes.length;i++){

           var pnode=$('#rcTree${pageId}').tree('getParent',nodes[i].target);

            data.push({roleid:pnode.id,corpid:nodes[i].id});
        }


        $.post('${createLink(action: 'saveLinkRole')}',{'data':JSON.stringify(data),'userid':row.id},function(data){
            $(this).showMessage(data);
            d.dialog('destroy');
        },'json');

    }

</script>



%{--按钮--}%
<div id="tb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="onAdd${pageId}() ">
        ${message(code: 'default.button.create.label', default: '增加')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label', default: '修改')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">
        ${message(code: 'default.button.delete.label', default: '删除')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"
       onclick="$('#table${pageId}').datagrid('reload')">
        ${message(code: 'default.button.refresh.label', default: '刷新')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-lock-edit" plain="true" onclick="onEditPwd${pageId}()">
        <g:message code="default.button.editpwd.label" default="修改密码"/>
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="" plain="true" onclick="linkRole${pageId}()">
        <g:message code="default.button.linkrole.label" default="分配角色"/>
    </a>

</div>
%{--表格--}%
<table id="table${pageId}" class="easyui-datagrid"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true">

    <thead>

    <tr>

        <th field="username" sortable="true">${message(code: 'smUser.username.label', default: '用户名')}</th>

        <th field="passwordExpired"
            sortable="true" data-options="align:'center',formatter:function(value,row){
            if(row.passwordExpired==true){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'smUser.passwordExpired.label', default: '密码失效')}</th>

        <th field="userenabled"
            sortable="true" data-options="align:'center',formatter:function(value,row){
            if(row.userenabled==true){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'smUser.userenabled.label', default: '账户启用')}</th>

        <th field="accountExpired"
            sortable="true" data-options="align:'center',formatter:function(value,row){
            if(row.accountExpired==true){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'smUser.accountExpired.label', default: '账户失效')}</th>

        <th field="accountLocked"
            sortable="true" data-options="align:'center',formatter:function(value,row){
            if(row.accountLocked==true){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'smUser.accountLocked.label', default: '账户锁定')}</th>

        <th field="userRealName"
            sortable="true">${message(code: 'smUser.userRealName.label', default: '用户真实姓名')}</th>

        <th field="address" sortable="true">${message(code: 'smUser.address.label', default: '地址')}</th>

        <th field="email" sortable="true">${message(code: 'smUser.email.label', default: '电子邮箱')}</th>

        <th field="linkTel" sortable="true">${message(code: 'smUser.linkTel.label', default: '联系电话')}</th>

        <th field="linkTel1" sortable="true">${message(code: 'smUser.linkTel1.label', default: '联系电话1')}</th>

        <th field="linkTel2" sortable="true">${message(code: 'smUser.linkTel2.label', default: '联系电话2')}</th>

        <th field="psndoc.psnname" sortable="true" data-options="formatter:function(value,row){
            if(row.psndoc){
                return psndoc.psnname;
            }else{
                return value;
            }
        }">${message(code: 'smUser.psndoc.label',default:'人员档案')}</th>
    </tr>
    </thead>
</table>


%{--修改密码窗口--}%

<div id="editPwddlg${pageId}" class="easyui-dialog" title="修改密码" style="width:300px;height:200px;"
     data-options="iconCls:'icon-lock-edit',resizable:true,modal:true,closed:true"
     buttons='#epb${pageId}' cache="true">

</div>

<div id="epb${pageId}">
    <a href="#" class="easyui-linkbutton" onclick="onSavePwd${pageId}()">
        <g:message code="default.button.save.label" default="保存"></g:message>
    </a>

</div>



