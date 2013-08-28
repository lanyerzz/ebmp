
<%@ page import="com.app.ywms.bd.tank.YBdTank" %>
<g:set var="entityName" value="${message(code: 'YBdTank.label', default: 'YBdTank')}" />
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

                if(json.validateerrors!=null){//有错误数据
                    d.showMessage(json);

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
            title:'添加罐号档案',
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
            title:'编辑罐号档案',
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
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        <th field="code" sortable="true">${message(code: 'YBdTank.code.label', default: 'Code')}</th>

        <th field="gllx" sortable="true" data-options="formatter:function(value,row,index){
            if(row.gllx==0){
                return '使用中';
            }else if(row.gllx==1){
                return '包罐';
            }else if(row.gllx==2){
                return '清空';
            }else if(row.gllx==3){
                return '停用';
            }else{
                return value;
            }
        }">${message(code: 'YBdTank.gllx.label', default: 'Gllx')}</th>

        <th field="describe" sortable="true">${message(code: 'YBdTank.describe.label', default: 'Describe')}</th>

        <th field="bcrj" sortable="true">${message(code: 'YBdTank.bcrj.label', default: 'Bcrj')}</th>

        <th field="aqrj" sortable="true">${message(code: 'YBdTank.aqrj.label', default: 'Aqrj')}</th>

        <th field="bdInvmandoc.pkInvbasdoc.invname" sortable="false" data-options="formatter:function(value,row){
            if(row.bdInvmandoc){
                return row.bdInvmandoc.pkInvbasdoc.invname;
            }else{
                return value;
            }
        }"><g:message code="YBdTank.bdInvmandoc.label" default="Bd Invmandoc"/></th>
        
        <th field="bg" sortable="true" data-options="formatter:function(value,row){
            if(row.bg=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'YBdTank.bg.label', default: 'Bg')}</th>

        <th field="zzgq" sortable="true" data-options="formatter:function(value,row){
            if(row.zzgq=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'YBdTank.zzgq.label', default: 'Zzgq')}</th>

        <th field="bonded" sortable="true" data-options="formatter:function(value,row){
            if(row.bonded=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'YBdTank.bonded.label', default: 'Bonded')}</th>

        <th field="zgzf" sortable="true" data-options="formatter:function(value,row){
            if(row.zgzf=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'YBdTank.zgzf.label', default: 'Zgzf')}</th>

        <th field="rxhz" sortable="true" data-options="formatter:function(value,row){
            if(row.rxhz=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'YBdTank.rxhz.label', default: 'Rxhz')}</th>

        <th field="xuni" sortable="true" data-options="formatter:function(value,row){
            if(row.xuni=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'YBdTank.xuni.label', default: 'Xuni')}</th>

        <th field="bw" sortable="true" data-options="formatter:function(value,row){
            if(row.bw=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'YBdTank.bw.label', default: 'Bw')}</th>

        <th field="gd" sortable="true">${message(code: 'YBdTank.gd.label', default: 'Gd')}</th>

        <th field="gdsl" sortable="true">${message(code: 'YBdTank.gdsl.label', default: 'Gdsl')}</th>

        <th field="jyzsbh" sortable="true">${message(code: 'YBdTank.jyzsbh.label', default: 'Jyzsbh')}</th>

        <th field="jyrq" sortable="true" data-options="{formatter:dateFormate">${message(code: 'YBdTank.jyrq.label', default: 'Jyrq')}</th>

        <th field="yxrq" sortable="true" data-options="{formatter:dateFormate">${message(code: 'YBdTank.yxrq.label', default: 'Yxrq')}</th>

        <th field="jygs" sortable="true">${message(code: 'YBdTank.jygs.label', default: 'Jygs')}</th>

        <th field="jyyj" sortable="true">${message(code: 'YBdTank.jyyj.label', default: 'Jyyj')}</th>

        <th field="jysm" sortable="true">${message(code: 'YBdTank.jysm.label', default: 'Jysm')}</th>

        <th field="gd1" sortable="true">${message(code: 'YBdTank.gd1.label', default: 'Gd1')}</th>

        <th field="gd2" sortable="true">${message(code: 'YBdTank.gd2.label', default: 'Gd2')}</th>

        <th field="zhijing" sortable="true">${message(code: 'YBdTank.zhijing.label', default: 'Zhijing')}</th>

        <th field="code2" sortable="true">${message(code: 'YBdTank.code2.label', default: 'Code2')}</th>

        <th field="glsm" sortable="true">${message(code: 'YBdTank.glsm.label', default: 'Glsm')}</th>
        











    </tr>
    </thead>
</table>



