
<%@ page import="com.app.bd.carsinfo.BdCarsinfo" %>
<g:set var="entityName" value="${message(code: 'bdCarsinfo.label', default: 'BdCarsinfo')}" />
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
    var row=$('#table${pageId}').datagrid('getSelected');

        $.post( '${createLink(action: 'update')}',
                obj,
                function(json){


                    $.messager.progress('close');
                    if(d.showMessage(json)){//有错误数据

                        return;
                    }
                    d.dialog('destroy');

                    $("#table${pageId}").datagrid('updateRow',{index:$('#table${pageId}').datagrid('getRowIndex',row),row:json});

                    $.messager.show({
                        title:'消息',
                        msg:'修改完成！'
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

        $.post( '${createLink(action: 'save')}',
                obj,
                function(json){

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
                },
                'json'
        );



    }

    //增加
    function onAdd${pageId}(){
        var addurl='${createLink(action: 'create')}'
        $('<div/>').dialog({
            title:'添加车辆信息',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:500,
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
            title:'编辑车辆信息',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:500,
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
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" pagination="true" pagesize="30"
       data-options="onHeaderContextMenu:function(e, field){ }">

    <thead>

    <tr>


        <th field="carCode" sortable="true">${message(code: 'bdCarsinfo.carCode.label', default: '车号')}</th>

        <th field="carNo" sortable="true">${message(code: 'bdCarsinfo.carNo.label', default: '车辆编码')}</th>

        <th field="carOwner" sortable="true">${message(code: 'bdCarsinfo.carOwner.label', default: '车主')}</th>

        <th field="carOwnerId" sortable="true">${message(code: 'bdCarsinfo.carOwnerId.label', default: '车主身份证id')}</th>

        <th field="carType" sortable="true" data-options="formatter:function(value,row,index){
                if(row.carType==0){
                    return '普通半挂';
                }else if(row.carType==1){
                    return '罐式全挂';
                }else if(row.carType==2){
                    return '集装箱全挂';
                }else{
                    return value;
                }
            }">${message(code: 'bdCarsinfo.carType.label', default: '挂车类型')}</th>

        <th field="deadweight" sortable="true">${message(code: 'bdCarsinfo.deadweight.label', default: '车辆自重')}</th>

        <th field="approvedLoading" sortable="true">${message(code: 'bdCarsinfo.approvedLoading.label', default: '核定载重')}</th>

        <th field="isLoadlimit" sortable="true" data-options="align:'center',formatter:function(value,row){
            if(row.isLoadlimit=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'bdCarsinfo.isLoadlimit.label', default: '是否限载')}</th>

        <th field="carrier.pkCubasdoc.custname" sortable="false" data-options="formatter:function(value,row){
            if(row.carrier){
                return row.carrier.pkCubasdoc.custname;
            }else{
                return value;
            }
        }"><g:message code="bdCarsinfo.carrier.label" default="承运商"/></th>

        <th field="clqsdw.pkCubasdoc.custname" sortable="false" data-options="formatter:function(value,row){
            if(row.clqsdw){
                return row.clqsdw.pkCubasdoc.custname;
            }else{
                return value;
            }
        }"><g:message code="bdCarsinfo.clqsdw.label" default="车辆权属单位"/></th>

        <th field="linkMan" sortable="true">${message(code: 'bdCarsinfo.linkMan.label', default: '联系人')}</th>

        <th field="linkPhone" sortable="true">${message(code: 'bdCarsinfo.linkPhone.label', default: '联系手机')}</th>

        <th field="yszjyxq" sortable="true" data-options="{formatter:dateFormate">${message(code: 'bdCarsinfo.yszjyxq.label', default: '运输证件有效期')}</th>

        <th field="ylrqyxq" sortable="true" data-options="{formatter:dateFormate">${message(code: 'bdCarsinfo.ylrqyxq.label', default: '压力容器有效期')}</th>

        <th field="ylrqzNo" sortable="true">${message(code: 'bdCarsinfo.ylrqzNo.label', default: '压力容器证号')}</th>

        <th field="yszjCode" sortable="true">${message(code: 'bdCarsinfo.yszjCode.label', default: '运输证件编码')}</th>

        <th field="memo" sortable="true">${message(code: 'bdCarsinfo.memo.label', default: '备注')}</th>
    </tr>
    </thead>
</table>



