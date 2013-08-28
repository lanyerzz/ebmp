
<%@ page import="com.app.bd.psnbasdoc.BdPsnbasdoc" %>
<g:set var="entityName" value="${message(code: 'bdPsnbasdoc.label', default: 'BdPsnbasdoc')}" />
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

                $("#table${pageId}").datagrid('insertRow',{
                    index:0,
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

    //增加
    function onAdd${pageId}(){
        var addurl='${createLink(action: 'create')}'
        $('<div/>').dialog({
            title:'添加人员基本档案',
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

    //修改
    function  onEdit${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择修改节点

            $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id

        $('<div/>').dialog({
            title:'编辑人员基本档案',
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
        $('#query${pageId}').dialog('open');
    }

    function onQuery${pageId}(){
        $('#query${pageId}').dialog('close');
        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
    }

    function onOpenAllot${pageId}(){
        var row = $('#table${pageId}').datagrid('getSelected');
        if(row==null){
            $.messager.show({
                title:'警告',
                msg:'请选择要分配的档案'
            });
        }
        $('<div/>').dialog({
            title:'分配',
            resizable:false,
            modal:true,
            width:600,
            height:500,

            href:'${createLink(action:'openAllotDlg')}?basId='+row.id,
            buttons:[{
                text : '分配',
                handler : function() {
                    var d = $(this).closest('.window-body');
                    onAllot${pageId}(d);
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }

    function onAllot${pageId}(d){
        var row = $('#table${pageId}').datagrid('getSelected');
        if(row==null){
            $.messager.show({
                title:'警告',
                msg:'请选择要分配的档案'
            });
        }
        var nodes = $('#allotTree${pageId}').tree('getChecked','indeterminate');
        var nodes1 = $('#allotTree${pageId}').tree('getChecked');

        var keys = ''

        for(var i=0;i<nodes.length;i++){

            if(keys!='')keys+=',';
            keys+=nodes[i].id;

        }

        for(var i=0;i<nodes1.length;i++){

            if(keys!='')keys+=',';
            keys+=nodes1[i].id;

        }
        var obj = {'basId':row.id,'key':keys};
        if(nodes==null){
            obj = {'basId':row.id};
        }
        $.post('${createLink(action:'linkPsnbasdoc')}',obj,function(json){
            $(this).showMessage(json);
        });
    }

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
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
        ${message(code: 'default.button.query.label',default: '查询')}
    </a>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="onOpenAllot${pageId}()">
        ${message(code:'default.button.allot.label')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        
        <th field="name" sortable="true">${message(code: 'bdPsnbasdoc.name.label', default: 'Name')}</th>

        <th field="usedname" sortable="true">${message(code: 'bdPsnbasdoc.usedname.label', default: 'Usedname')}</th>

        <th field="sex" sortable="true" data-options="formatter:function(value,row){
            if(row.sex=='male'){
                return '男';
            }if(row.sex=='female'){
                return '女';
            }else{
                return value;
            }
        }">${message(code: 'bdPsnbasdoc.sex.label', default: 'Sex')}</th>
        
        <th field="birthdate" sortable="true" data-options="formatter:dateFormate">${message(code: 'bdPsnbasdoc.birthdate.label', default: 'Birthdate')}</th>
        
        <th field="shenfenzhenghao" sortable="true">${message(code: 'bdPsnbasdoc.shenfenzhenghao.label', default: 'Shenfenzhenghao')}</th>
        
        <th field="addr" sortable="true">${message(code: 'bdPsnbasdoc.addr.label', default: 'Addr')}</th>
        
        <th field="bdCorp.unitName" sortable="false" data-options="formatter:function(value,row){
            if(row.bdCorp==null||row.bdCorp.unitName==null) return value;
            return row.bdCorp.unitName;
        }"><g:message code="bdPsnbasdoc.bdCorp.label" default="Bd Corp"/></th>
        
        <th field="email" sortable="true">${message(code: 'bdPsnbasdoc.email.label', default: 'Email')}</th>
        
        <th field="homephone" sortable="true">${message(code: 'bdPsnbasdoc.homephone.label', default: 'Homephone')}</th>
        
        <th field="joinworkdate" sortable="true" data-options="formatter:dateFormate">${message(code: 'bdPsnbasdoc.joinworkdate.label', default: 'Joinworkdate')}</th>
        
        <th field="mobile" sortable="true">${message(code: 'bdPsnbasdoc.mobile.label', default: 'Mobile')}</th>
        
        <th field="officephone" sortable="true">${message(code: 'bdPsnbasdoc.officephone.label', default: 'Officephone')}</th>
        
        <th field="postalcode" sortable="true">${message(code: 'bdPsnbasdoc.postalcode.label', default: 'Postalcode')}</th>
        
        <th field="ssnum" sortable="true">${message(code: 'bdPsnbasdoc.ssnum.label', default: 'Ssnum')}</th>
        

    </tr>
    </thead>
</table>



