
<%@ page import="com.app.bd.pack.BdPack" %>
<g:set var="entityName" value="${message(code: 'bdPack.label', default: 'BdPack')}"/>
<script>


    //    更新
    function onUpdate${pageId}(d) {

        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var head= $('#form${pageId}').serializeObject();
        var bodys = getBodyData${pageId}();
        $.post( '${createLink(action: 'save')}',{'head':encodeURI(JSON.stringify(head)),'bodys':encodeURI(JSON.stringify(bodys))},function(json){

                    var row = $("#table${pageId}").treegrid('getSelected');
                    $.messager.progress('close');	// hide progress bar while submit successfully

                    if(d.showMessage(json)){//有错误数据

                        return;
                    }
                    d.dialog('destroy');

                    if(json.pid!='0')
                        $("#table${pageId}").treegrid('reload',json.pid);
                    else
                        $("#table${pageId}").treegrid('reload');

                    $.messager.show({
                        title:'消息',
                        msg:'操作完成！'
                    });
                },
                'json'
        );
    }


    function getBodyData${pageId}(){
        $('#bodyRows${pageId}').edatagrid('saveRow');
        var bodys = $('#bodyRows${pageId}').edatagrid('getJSON',true);

        //检查行数据
        for(var i=0;i<bodys.length;i++){
            var vali= $('#bodyRows${pageId}').edatagrid('validateRow',i);
            if(!vali) {
                $.messager.show({
                    title:'消息',
                    msg:'表体数据未填写完整！'
                });
                $.messager.progress('close');
                return null;
            }

        }

        return bodys;
    }

    //    保存
    function onSave${pageId}(d) {

        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var head= $('#form${pageId}').serializeObject();


        var bodys = getBodyData${pageId}();


//        {'head':encodeURI(JSON.stringify(head)),'bodys':encodeURI(JSON.stringify(bodys))}
        $.post( '${createLink(action: 'save')}',{'head':encodeURI(JSON.stringify(head)),'bodys':encodeURI(JSON.stringify(bodys))},function(json){

                    var row = $("#table${pageId}").treegrid('getSelected');
                    $.messager.progress('close');	// hide progress bar while submit successfully

                    if( d.showMessage(json)){//有错误数据


                        return;
                    }
                    d.dialog('destroy');

                    var nodes=[]
                    nodes[0]=json
                    if(row != null && row.state == "closed"){

                        $("#table${pageId}").treegrid('reload',json.pid);
                    }else{

                        $("#table${pageId}").treegrid('append',{
                            parent: json.pid,  // the node has a 'id' value that defined through 'idField' property
                            data:nodes
                        });
                    }

                    $.messager.show({
                        title:'消息',
                        msg:'操作完成！'
                    });
                },
                'json'
        );
    }

    //增加
    function onAdd${pageId}() {
        var row =$('#table${pageId}').treegrid('getSelected');
        var addurl = '${createLink(action: 'create ')}'
        if (row != null) {
            addurl += '?pid=' + row.id;
        }
       $('<div/>').dialog({
            title: '添加包装信息',
            iconCls: 'icon-add',
            resizable: false,
            modal: true,
            width: 600,
            height: 500,

            href: addurl,
            buttons: [
                {
                    text: '增加',
                    iconCls: 'icon-add',
                    handler: function () {
                        var d = $(this).closest('.window-body');
                        onSave${pageId}(d);
                    }
                }
            ],
            onClose: function () {
                $(this).dialog('destroy');
            }
        });


    }

    //修改
    function onEdit${pageId}() {
        var row =$('#table${pageId}').treegrid('getSelected');
        if (row == null) {//选择父节点

        $.messager.show({title: '警告', msg: '请选择修改的数据'});
            return;
        }
        var editurl = '${createLink(action: 'edit')}/' + row.id

        $('<div/>').dialog({
            title: '编辑包装码',
            iconCls: 'icon-edit',
            resizable: false,
            modal: true,
            width: 600,
            height: 500,

            href: editurl,
            buttons: [
                {
                    text: '编辑',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var d = $(this).closest('.window-body');
                        onUpdate${pageId}(d);
                    }
                }
            ],
            onClose: function () {
                $(this).dialog('destroy');
            }
        });


    }

    //        删除
    function onDelete${pageId}() {

        var row =$('#table${pageId}').treegrid('getSelected');
        if (row == null) {
        $.messager.show({
                title: '消息',
                msg: '请选择需要删除的数据！'
            });
            return;
        };
        $.messager.confirm('${message(code:'default.delete.message',default: '删除数据')}',
                '${message(code: 'default.button.delete.confirm.message', default: ' Are you sure ? ')}',
                function (r) {
                    if (r) {
                        $.post('${createLink(action: 'delete')}', { id: row.id },
                                    function (data) {
                                        $('#table${pageId}').treegrid('remove', data);
                                        $.messager.show({
                                            title: '消息',
                                            msg: '数据已经删除！'
                                        });
                                    }
                        );
                    }
                }
    )
        ;
    }


    //
    function onUnSelect${pageId}() {

       $('#table${pageId}').treegrid('clearSelections');

    }
</script>



%{--按钮--}%
<div id="tb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="onAdd${pageId}() ">
        ${message(code: 'default.button.create.label',default: '增加')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label',default: '修改')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">
        ${message(code: 'default.button.delete.label',default: '删除')}
    </a>

    <a href="#" class="easyui-linkbutton" iconCls="" plain="true" onclick="onUnSelect${pageId}() ">
        ${message(code: 'default.button.unSelect.label',default: '取消选定')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').treegrid('reload')">
        ${message(code: 'default.button.refresh.label',default: '刷新')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}" class="easyui-treegrid"
       url="${createLink(action: 'queryTree')}"
       rownumbers="true"
       idField="id" treeField="name" fit="true" toolbar="#tb${pageId}">

    <thead>

    <tr>

        

        <th field="code"
            sortable="false">${message(code: 'bdPack.code.label', default: 'Code')}</th>


        
        <th field="name"
            sortable="false">${message(code: 'bdPack.name.label', default: 'Name')}</th>
        
        <th field="note"
            sortable="false">${message(code: 'bdPack.note.label', default: 'Note')}</th>

        <th field="bdCorp" sortable="false" data-options="
            formatter:function(value,row){
                return getObjectAttr(value,'unitName');
            }
        "><g:message code="bdPack.bdCorp.label"
                                                       default="Bd Corp"/></th>


    </tr>
    </thead>
</table>



