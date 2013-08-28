<%@ page import="com.app.so.order.SoSale" %>
<script>
    function onPrint${pageId}(){

        var row = $('#table${pageId}').datagrid('getSelected');
        if (row==null) {
            $.messager.show({title: '消息', msg: '请选择要打印的数据'});
            return;
        }
        var queryParams={id:row.id};

        // public void print(String REPORT_URL,String data,boolean isview,boolean showPrintDialog,int printCount,String sessionid) {



        print('${functionId}','soSale','print',encodeURI(JSON.stringify(queryParams)));

    }








    //    保存
    function onSave${pageId}(){

        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var vali= $('#bodyTable${pageId}').edatagrid('validateRows');
        if(!vali) return;

        var head= $('#form${pageId}').serializeObject();
        $('#bodyTable${pageId}').edatagrid('saveRow');
        var bodys = $('#bodyTable${pageId}').edatagrid('getJSON',true);




//
        $.post( '${createLink(action: 'save')}',{'head':encodeURI(JSON.stringify(head)),'bodys':encodeURI(JSON.stringify(bodys))},function(json){


                    $.messager.progress('close');	// hide progress bar while submit successfully

                    if($('#card${pageId}').showMessage(json)){//有错误数据


                        return;
                    }
                    onClose${pageId}();

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
        // alert($.type(data));
        var addurl
        if($.type(data)=='object'){
            addurl='${createLink(action: 'create')}?keys='+data.data+'&businessKey='+data.businessKey+'&sourceBillTypeCode='+data.sourceBillTypeCode;

        }else{
            addurl='${createLink(action: 'create')}?businessKey='+data;
        }
        showCard(addurl,'${pageId}')
    }

    //修改
    function  onEdit${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择修改节点

            $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id

        showCard(editurl,'${pageId}')

    }

    //修改
    function  onShow${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');

        var showUrl='${createLink(action:'show')}/'+row.id

        showCard(showUrl,'${pageId}')

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

    function onRefPage${pageId}(businessKey,billTypeKey,title,targetBill){
        var refurl='${createLink(controller: 'pubBusinessType', action:'refPage')}?handler=getSelected${pageId}&businessKey='+businessKey+'&billTypeKey='+billTypeKey+'&targetBill='+targetBill;
        $("<div/>").dialog({
            title:title,
            resizable:false,
            modal:true,
            width:1000,
            height:500,

            href:refurl,
            buttons:[{
                text : '增加',
                iconCls : 'icon-add',
                handler : function() {
                    var data=   getSelected${pageId}();


                    if(data.length==0){
                        $.messager.show({
                            title:'警告',
                            msg:'请选择'+title+'!'
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


    //审核
    function onCheck${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        //var index = $('#table${pageId}').datagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要审核的数据！'
            });
            return;
        };
        $.messager.confirm('${message(code:'default.check.message')}',
                '${message(code: 'default.button.check.confirm.message', default: 'Are you sure?')}',
                function(r){
                    if(r){


                        $.post('${createLink(action: 'check')}', { id: row.id },
                                function(data){

                                    if($(this).showMessage(data)){//有错误数据

                                        return;
                                    }


                                    $('#table${pageId}').datagrid('reload');
                                });
                    }
                }
        );
    }



    //弃审
    function onUnCheck${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        //var index = $('#table${pageId}').datagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要弃审的数据！'
            });
            return;
        };
        $.messager.confirm('${message(code:'default.uncheck.message')}',
                '${message(code: 'default.button.uncheck.confirm.message', default: 'Are you sure?')}',
                function(r){
                    if(r){


                        $.post('${createLink(action: 'uncheck')}', { id: row.id },
                                function(data){

                                    if($(this).showMessage(data)){//有错误数据

                                        return;
                                    }


                                    $('#table${pageId}').datagrid('reload');

                                });
                    }
                }
        );
    }

    function saveRec${pageId}(d){
        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var vali= $('#bodyTable${pageId}').edatagrid('validateRows');
        if(!vali) return;

        var head= $('#form${pageId}').serializeObject();
        $('#bodyTable${pageId}').edatagrid('saveRow');
        var bodys = $('#bodyTable${pageId}').edatagrid('getJSON',true);
//        {'head':encodeURI(JSON.stringify(head)),'bodys':encodeURI(JSON.stringify(bodys))}
        $.post( '${createLink(controller: 'soRec',action: 'save')}',{'head':encodeURI(JSON.stringify(head)),'bodys':encodeURI(JSON.stringify(bodys))},function(json){

                    if(d.showMessage(json)){//有错误数据


                        return;
                    }
                    $.messager.progress('close');	// hide progress bar while submit successfully

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

    function onResize${pageId}(w,h){
        $('#card${pageId}').panel('resize',{width:w,height:h});
    }

    function onClose${pageId}(){
        $('#card${pageId}').panel('destroy');
        $('#list${pageId}').panel('open');

    }


    function openRec${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择修改节点

            $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var url='${createLink(controller: 'soSale',action:'sk')}?keys='+row.id+'&businessKey='+row.businessType.id

        $("<div/>").dialog({
            title:'订单收款',
            resizable:false,
            modal:true,
            width:900,
            height:600,

            href:url,
            buttons:[{
                text : '增加',
                iconCls : 'icon-add',
                handler : function() {




                    var a = $(this).closest('.window-body');

                    saveRec${pageId}(a);
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }

function onUp${pageId}(){
    var row=$('#table${pageId}').datagrid('getSelected');

    var index=$('#table${pageId}').datagrid('getRowIndex',row);
    if(row == null){//选择修改节点

        $.messager.show({title:'警告',msg:'请选择上传的数据'});
        return;
    }
    var upUrl='${createLink(action:'up')}/'+row.id

    $.messager.progress();

    $.post(upUrl,null,function(json){
        $.messager.progress('close');
       if(!showRemoteMessage(json)){
           return;
       }

        $("#table${pageId}").datagrid('refreshRow',index);
    });



}


    function onUps${pageId}(){

        var upUrl='${createLink(action:'ups')}/'+row.id

        $.messager.progress();

        $.post(upUrl,null,function(json){
            $.messager.progress('close');
            if(!showRemoteMessage(json)){
                return;
            }

            $("#table${pageId}").datagrid('reload');
        });



    }


</script>

<div id="main${pageId}" style="height: 100%;padding: 3px" class="easyui-panel" data-options="fit:true,border:false,noheader:true,onResize:onResize${pageId}"  >
    <div id="list${pageId}" class="easyui-panel" title=""

         data-options="fit:true,border:false,noheader:true">

        %{--按钮--}%
        <div id="tb${pageId}">


            <g:addButton billTypeCode="S01" pageId="${pageId}" handler="onAdd" refHandler="onRefPage"></g:addButton>
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
            <a href="#" class="easyui-linkbutton"  plain="true" onclick="onCheck${pageId}()">
                ${message(code: 'default.button.check.label',default: '审核')}
            </a>
            <a href="#" class="easyui-linkbutton"  plain="true" onclick="onUnCheck${pageId}()">
                ${message(code: 'default.button.uncheck.label',default: '弃审')}
            </a>
            <a href="#" class="easyui-linkbutton"  plain="true" onclick="onPrint${pageId}()">
                ${message(code: 'default.button.print.label',default: '打印')}
            </a>
            <a href="#" class="easyui-linkbutton"  plain="true" onclick="openRec${pageId}()">
                ${message(code: 'default.button.recMny.label',default: '收款')}
            </a>
            <a href="#" class="easyui-linkbutton"  plain="true" onclick="onUp${pageId}()">
            ${message(code: 'default.button.up.label',default: '上传')}
            </a>
            <a href="#" class="easyui-linkbutton"  plain="true" onclick="onUps${pageId}()">
            ${message(code: 'default.button.ups.label',default: '全部上传')}
            </a>
        </div>
<g:render template="list"></g:render>
%{--<g:render template="tree"></g:render>--}%
%{--<g:render template="treelist"></g:render>--}%

</div>
</div>

