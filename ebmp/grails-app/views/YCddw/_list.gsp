
<%@ page import="com.app.ywms.bd.cddw.YCddw" %>
<g:set var="entityName" value="${message(code: 'YCddw.label', default: 'YCddw')}" />
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
            title:'添加船代单位',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:1000,
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
            title:'编辑船代单位',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:1000,
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
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="$('#table${pageId}').datagrid('reload')">
        ${message(code: 'default.button.refresh.label',default: '刷新')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
        ${message(code: 'default.button.query.label',default: '查询')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        
        <th field="code" sortable="true">${message(code: 'YCddw.code.label', default: 'Code')}</th>
        
        <th field="name" sortable="true">${message(code: 'YCddw.name.label', default: 'Name')}</th>

        <th field="blockUp" sortable="true" data-options="formatter:function(value,row){
            if(row.blockUp==true){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'YCddw.blockUp.label', default: 'Block Up')}</th>

        <th field="bdCumandoc" sortable="false" data-options="formatter:function(value,row){
            if(row.bdCumandoc){
                return row.bdCumandoc.pkCubasdoc.custname;
            }else{
                return value;
            }
        }"><g:message code="YCddw.bdCumandoc.label" default="Bd Cumandoc"/></th>

        <th field="linkman" sortable="true">${message(code: 'YCddw.linkman.label', default: 'Linkman')}</th>

        <th field="linktel" sortable="true">${message(code: 'YCddw.linktel.label', default: 'Linktel')}</th>

        <th field="fax" sortable="true">${message(code: 'YCddw.fax.label', default: 'Fax')}</th>

        <th field="email" sortable="true">${message(code: "YCddw.email.label", default: 'Email')}</th>

        <th field="url" sortable="true">${message(code: 'YCddw.url.label', default: 'Url')}</th>

        <th field="address" sortable="true">${message(code: 'YCddw.address.label', default: 'Address')}</th>
        
        <th field="frdb" sortable="true">${message(code: 'YCddw.frdb.label', default: 'Frdb')}</th>
        
        <th field="khyh" sortable="true">${message(code: 'YCddw.khyh.label', default: 'Khyh')}</th>

        <th field="account" sortable="true">${message(code: 'YCddw.account.label', default: 'Account')}</th>


        <th field="swdjh" sortable="true">${message(code: 'YCddw.swdjh.label', default: 'Swdjh')}</th>
        

        <th field="yyzz" sortable="true">${message(code: 'YCddw.yyzz.label', default: 'Yyzz')}</th>
        
        <th field="zjf" sortable="true">${message(code: 'YCddw.zjf.label', default: 'Zjf')}</th>
        
        <th field="zzjgdmz" sortable="true">${message(code: 'YCddw.zzjgdmz.label', default: 'Zzjgdmz')}</th>

        <th field="maker" sortable="false" data-options="formatter:function(value,row){
            if(row.maker){
                return row.maker.userRealName;
            }else{
                return value;
            }
        }"><g:message code="YCddw.maker.label" default="Maker"/></th>

        <th field="makedate" sortable="true" data-options="{formatter:dateFormate">${message(code: 'YCddw.makedate.label', default: 'Makedate')}</th>

        <th field="note" sortable="true">${message(code: 'YCddw.note.label', default: 'Note')}</th>


    </tr>
    </thead>
</table>



