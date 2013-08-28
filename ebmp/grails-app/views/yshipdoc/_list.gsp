
<%@ page import="com.app.ywms.bd.shipdoc.Yshipdoc" %>
<g:set var="entityName" value="${message(code: 'yshipdoc.label', default: 'Yshipdoc')}" />
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
            title:'添加船舶档案',
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
            title:'编辑船舶档案',
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
        //  $('#query${pageId}').dialog('open');

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

        var criters= getCriter${pageId}();

        $('#tb${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
        d.dialog('destroy');
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

        <th field="shipname" sortable="true">${message(code: 'yshipdoc.shipname.label', default: 'Shipname')}</th>

        <th field="shipforeignname" sortable="true">${message(code: 'yshipdoc.shipforeignname.label', default: 'Shipforeignname')}</th>

        <th field="zjm" sortable="true">${message(code: 'yshipdoc.zjm.label', default: 'Zjm')}</th>

        <th field="shipcountry" sortable="true">${message(code: 'yshipdoc.shipcountry.label', default: 'Shipcountry')}</th>

        <th field="buildYear" sortable="true" data-options="{formatter:dateFormate">${message(code: 'yshipdoc.buildYear.label', default: 'Build Year')}</th>

        <th field="shiptype" sortable="true" data-options="formatter:function(value,row){
            if(row.shiptype==0){
                return '内轮';
            }else if(row.shiptype==1){
                return '外轮';
            }else if(row.shiptype==2){
                return '其他';
            }else{
                return value;
            }
        }">${message(code: 'yshipdoc.shiptype.label', default: 'Shiptype')}</th>
        


        
        <th field="dl" sortable="true" data-options="formatter:function(value,row){
            if(row.dl=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'yshipdoc.dl.label', default: 'Dl')}</th>

        <th field="yrk" sortable="true" data-options="formatter:function(value,row){
            if(row.yrk=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'yshipdoc.yrk.label', default: 'Yrk')}</th>

        <th field="chuanzhu" sortable="true">${message(code: 'yshipdoc.chuanzhu.label', default: 'Owner')}</th>

        <th field="linkman" sortable="true">${message(code: 'yshipdoc.linkman.label', default: 'Linkman')}</th>

        <th field="linktel" sortable="true">${message(code: 'yshipdoc.linktel.label', default: 'Linktel')}</th>

        <th field="head" sortable="true">${message(code: 'yshipdoc.head.label', default: 'Head')}</th>

        <th field="draft" sortable="true" data-options="align:'right'">${message(code: 'yshipdoc.draft.label', default: 'Draft')}</th>

        <th field="load" sortable="true" data-options="align:'right'">${message(code: 'yshipdoc.load.label', default: 'Load')}</th>
        
        <th field="shiplength" sortable="true" data-options="align:'right'">${message(code: 'yshipdoc.shiplength.label', default: 'Shiplength')}</th>

        <th field="shipwidth" sortable="true" data-options="align:'right'">${message(code: 'yshipdoc.shipwidth.label', default: 'Shipwidth')}</th>

        <th field="netweight" sortable="true" data-options="align:'right'">${message(code: 'yshipdoc.netweight.label', default: 'Netweight')}</th>

        <th field="grossweight" sortable="true" data-options="align:'right'">${message(code: 'yshipdoc.grossweight.label', default: 'Grossweight')}</th>


        <th field="badj" sortable="true">${message(code: 'yshipdoc.badj.label', default: 'Badj')}</th>

        <th field="basm" sortable="true">${message(code: 'yshipdoc.basm.label', default: 'Basm')}</th>

        <th field="bazsh" sortable="true">${message(code: 'yshipdoc.bazsh.label', default: 'Bazsh')}</th>
        

        <th field="syz" sortable="true" data-options="formatter:function(value,row){
            if(row.syz=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'yshipdoc.syz.label', default: 'syz')}</th>
        



        <th field="maker.userRealName" sortable="true" data-options="formatter:function(value,row){
            if(row.maker){
                return row.maker.userRealName;
            }else{
                return value;
            }
        }">${message(code: 'yshipdoc.maker.label', default: 'Maker')}</th>

        <th field="makedate" sortable="true" data-options="{formatter:dateFormate">${message(code: 'yshipdoc.makedate.label', default: 'Makedate')}</th>

        <th field="note" sortable="true">${message(code: 'yshipdoc.note.label', default: 'Note')}</th>

    </tr>
    </thead>
</table>



