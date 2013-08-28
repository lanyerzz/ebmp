
<%@ page import="com.app.bd.exchange.BdExchange" %>
<g:set var="entityName" value="${message(code: 'bdExchange.label', default: 'BdExchange')}" />
<script>


    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}",
            view: detailview,
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table id="tb-sub${pageId}-' + index + '" ></table></div>';
            },
            onExpandRow: function(index,row){
                $('#tb-sub${pageId}-'+index).datagrid({
                    url:'${createLink(action: 'queryBody')}/'+row.id,
                    //fitColumns:true,
                    singleSelect:true,
                    rownumbers:true,
                    //loadMsg:'',
                    height:'auto',
                    singleSelect:false,
                    columns:[[
                        {field:'day',title:'${message(code: 'bdExchangeB.day.label', default: 'Day')}',width:100},
                        {field:'exchange',title:'${message(code: 'bdExchangeB.exchange.label', default: 'Exchange')}',width:100}
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





    //    保存
    function onSave${pageId}(d){

        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
        $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var head= $('#form${pageId}').serializeObject();

        if(head['currtypeOne.id']==head['currtypeTwo.id']){
            $.messager.alert('警告','币种1和币种2不能相等！');
            $.messager.progress('close');
            return;
        }

        var bodys = $('#body${pageId}').edatagrid('getJSON');

        if(bodys.length==0){
            $.messager.progress('close');	// hide progress bar while the form is invalid
            $.messager.alert('警告','明细数据不能为空！');
            return;
        }

        %{--var deleteds=$('#body${pageId}').edatagrid('getChanges','deleted');--}%
        //检查行数据
        for(var i=0;i<bodys.length;i++){
            var vali= $('#body${pageId}').edatagrid('validateRow',i);
            if(!vali) {
                $.messager.show({
                    title:'消息',
                    msg:'表体数据未填写完整！'
                });
                $.messager.progress('close');
                return;
            }

        }


        $.post( '${createLink(action: 'save')}',{'head':encodeURI(JSON.stringify(head)),'bodys':encodeURI(JSON.stringify(bodys))},function(json){


                $.messager.progress('close');	// hide progress bar while submit successfully

                if(d.showMessage(json)){//有错误数据


                    return;
                }
                d.dialog('destroy');

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
    function onAdd${pageId}(data){
        var  addurl='${createLink(action: 'create')}'
        $('<div/>').dialog({
            title:'添加',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:700,
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
            width:700,
            height:500,

            href:editurl,
            buttons:[{
                text : '编辑',
                iconCls : 'icon-edit',
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

        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
        d.dialog('destroy');
    }


    function onRefPage${pageId}(businessKey,billTypeKey,title){
        var xhjhdurl='${createLink(controller: 'pubBusinessType', action:'refPage')}?handler=getSelected${pageId}&businessKey='+businessKey+'&billTypeKey='+billTypeKey;
        $("<div/>").dialog({
            title:title,
            resizable:false,
            modal:true,
            width:1000,
            height:500,

            href:xhjhdurl,
            buttons:[{
                text : '增加',
                iconCls : 'icon-add',
                handler : function() {
                    var data=   getSelected${pageId}();


                    if(data.length==0){
                        $.messager.show({
                            title:'警告',
                            msg:'请选择卸货计划单!'
                        });
                        return;
                    }

                    var a = $(this).closest('.window-body');
                    onAdd${pageId}(data);
                    a.dialog('destroy');
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
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
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
        ${message(code: 'default.button.query.label',default: '查询')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" fitColumns="true" singleSelect="true"  pagination="true" pageSize="30">

    <thead>

    <tr>

        
        <th field="currtypeOne.currtypename" sortable="true" width="80" data-options="formatter:function(value,row){
            return getObjectAttr(row,'currtypeOne.currtypename');
        }"><g:message code="bdExchange.currtypeOne.label" default="Currtype One"/></th>
        
        <th field="currtypeTwo.currtypename" sortable="true" width="80" data-options="formatter:function(value,row){
            return getObjectAttr(row,'currtypeTwo.currtypename');
        }"><g:message code="bdExchange.currtypeTwo.label" default="Currtype Two"/></th>
        
        <th field="year" sortable="true" width="80" >${message(code: 'bdExchange.year.label', default: 'Year')}</th>

        <th field="month" sortable="true" width="80" >${message(code: 'bdExchange.month.label', default: 'Month')}</th>


        
    </tr>
    </thead>
</table>



