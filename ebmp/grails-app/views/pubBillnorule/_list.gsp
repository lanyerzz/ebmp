
<%@ page import="com.app.pub.billnorule.PubBillnorule" %>
<g:set var="entityName" value="${message(code: 'pubBillnorule.label', default: 'PubBillnorule')}" />
<script>

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
        if(row.id==null){
            var addurl='${createLink(action:'create')}/'+row.pubbilltype.id;
            $('<div/>').dialog({
                title:'添加单据号规则',
                iconCls:'icon-add',
                resizable:false,
                modal:true,
                width:500,
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

        }else{
            var editurl='${createLink(action:'edit')}/'+row.id;
            $('<div/>').dialog({
                title:'编辑单据号规则',
                iconCls:'icon-edit',
                resizable:false,
                modal:true,
                width:500,
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
                                    $('#table${pageId}').datagrid('reload');
                                });
                    }
                }
        );
    }






</script>



%{--按钮--}%
<div id="tb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label',default: '修改')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">
        ${message(code: 'default.button.delete.label',default: '删除')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').datagrid('reload')">
        ${message(code: 'default.button.refresh.label',default: '刷新')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid" style="width:400px;height:300px"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true">

    <thead>

    <tr>
        <th field="pubbilltype.billtypecode" sortable="false" data-options="formatter:function(value,row){
            if(row.pubbilltype){
                return row.pubbilltype.billtypecode;
            }else{
                return value;
            }
        }"><g:message code="pubBillnorule.pubbilltype.label" default="单据类型编码"/></th>

        <th field="pubbilltype.billtypename" sortable="false" data-options="formatter:function(value,row){
            if(row.pubbilltype){
                return row.pubbilltype.billtypename;
            }else{
                return value;
            }
        }"><g:message code="pubBillnorule.pubbilltype.label" default="单据类型名称"/></th>

        <th field="subcode" sortable="true">${message(code: 'pubBillnorule.subcode.label', default: '自定义单据号前缀')}</th>

        <th field="currentNo" sortable="true" data-options="align:'right'">${message(code: 'pubBillnorule.currentNo.label', default: '流水号记录')}</th>

        <th field="nolength" sortable="true" data-options="align:'right'">${message(code: 'pubBillnorule.nolength.label', default: '单据号长度')}</th>


        <th field="bdCorp.unitName" sortable="false" data-options="formatter:function(value,row){
            if(row.bdCorp){
                return row.bdCorp.unitName;
            }else{
                return value;
            }
        }"><g:message code="pubBillnorule.bdCorp.label" default="公司"/></th>
        
        <th field="bdate" sortable="true" data-options="align:'center',formatter:function(value,row){
            if(row.bdate=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'pubBillnorule.bdate.label', default: '是否按照日期编制单据号')}</th>
        
        <th field="cleanByDay" sortable="true" data-options="align:'center',formatter:function(value,row){
            if(row.cleanByDay=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'pubBillnorule.cleanByDay.label', default: '是否按照日期清零')}</th>

    </tr>
    </thead>
</table>



