
<%@ page import="com.app.pub.businesstype.PubBusinessType" %>
<g:set var="entityName" value="${message(code: 'pubBusinessType.label', default: 'PubBusinessType')}" />
<script>
    $(function(){
        $('#table${pageId}').datagrid({
            view: detailview,
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table id="table-sub${pageId}-' + index + '" name="table-sub${pageId}"></table></div>';
            },
            onExpandRow: function(index,row){

                $('#table-sub${pageId}-'+index).datagrid({
                    url:'${createLink(action: 'queryBody')}?headId='+row.id,
                    fitColumns:true,
                    singleSelect:true,
                    rownumbers:true,
                    //loadMsg:'',
                    height:'auto',
                    columns:[[
                        {field:'sourceType.billtypename',title:'<g:message code="pubBusinessBill.sourceType.label" />',formatter:function(value,row){
                            if(row.sourceType==null) return value;
                            return row.sourceType.billtypename;
                        }},
                        {field:'billtype.billtypename',title:'<g:message code="pubBusinessBill.billtype.label" />',formatter:function(value,row){
                            if(row.billtype==null) return value;
                            return row.billtype.billtypename;
                        }},
                        {field:'canDefine',title:'${message(code: 'pubBusinessBill.canDefine.label', default: 'canDefine')}',formatter:function(value,row){
                            if(row.canDefine=='true'){
                                return '是';
                            }else{
                                return '否';
                            }
                        }},
                        {field:'flowType',title:'${message(code: 'pubBusinessBill.flowType.label', default: 'flowType')}',formatter:function(value,row){
                            if(row.flowType=='0'){
                                return '拉式';
                            }else if(row.flowType=='1'){
                                return '拉式';
                            }else if(row.flowType=='2'){
                                return '推式';
                            }else{
                                return value;
                            }
                        }}
                    ]],
                    onResize:function(){
                        $('#table${pageId}').datagrid('fixDetailRowHeight',index);
                    },
                    onLoadSuccess:function(){
                        setTimeout(function(){
                            $('#table${pageId}').datagrid('fixDetailRowHeight',index);
                        },0);
                    }
                });
                $('#table${pageId}').datagrid('fixDetailRowHeight',index);
            }
        });
    });


    //    更新
    function onUpdate${pageId}(d){
        $.messager.progress();	// display the progress bar

            var isValid = $('#form${pageId}').form('validate');
            if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
                return;
            }

        $('#rowTable${pageId}').edatagrid('saveRow');
        var head= $('#form${pageId}').serializeObject();
        var body = $('#rowTable${pageId}').edatagrid('getJSON');

        //检查行数据
        for(var i=0;i<body.length;i++){
            var vali= $('#rowTable${pageId}').edatagrid('validateRow',i);
            if(!vali) {
                $.messager.show({
                    title:'消息',
                    msg:'表体数据未填写完整！'
                });
                $.messager.progress('close');
                return;
            }

        }


        $.post( '${createLink(action: 'save')}',{'head':encodeURI(JSON.stringify(head)),'body':encodeURI(JSON.stringify(body))},function(json){

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

        $('#rowTable${pageId}').edatagrid('saveRow');
        var head= $('#form${pageId}').serializeObject();
        var body = $('#rowTable${pageId}').edatagrid('getJSON');


        //检查行数据
        for(var i=0;i<body.length;i++){
            var vali= $('#rowTable${pageId}').edatagrid('validateRow',i);
            if(!vali) {
                $.messager.show({
                    title:'消息',
                    msg:'表体数据未填写完整！'
                });
                $.messager.progress('close');
                return;
            }

        }


        $.post( '${createLink(action: 'save')}',{'head':encodeURI(JSON.stringify(head)),'body':encodeURI(JSON.stringify(body))},function(json){

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
            title:'添加',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:800,
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
            title:'编辑',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:800,
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
//        $('#query${pageId}').dialog('open');
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
        d.dialog('destroy');
        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
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
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        

        <th field="code" sortable="true">${message(code: 'pubBusinessType.code.label', default: 'Code')}</th>
        
        <th field="name" sortable="true">${message(code: 'pubBusinessType.name.label', default: 'Name')}</th>

        <th field="bdCorp.unitName" sortable="false" width="20" data-options="formatter:function(value,row){
            if(row.bdCorp==null) return value;
            return row.bdCorp.unitName;
        }"><g:message code="pubBusinessType.bdCorp.label" default="Bd Corp"/></th>

    </tr>
    </thead>
</table>



