<%@ page import="com.app.ywms.rk.cbdgd.Ycbdgd" %>
<script>




    //    保存
    function onSave${pageId}(){

        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }
        $('#rowTable${pageId}').edatagrid('saveRow');
        var head= $('#form${pageId}').serializeObject();

        var bodys = $('#rowTable${pageId}').edatagrid('getJSON');

        //检查行数据
        for(var i=0;i<bodys.length;i++){
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

        $.post( '${createLink(action: 'save')}',{'head':encodeURI(JSON.stringify(head)),'bodys':encodeURI(JSON.stringify(bodys))},function(json){

                    var row = $("#table${pageId}").datagrid('getSelected');
                    $.messager.progress('close');	// hide progress bar while submit successfully

                    if( $('#card${pageId}').showMessage(json)){//有错误数据


                        return;
                    }
                    onClose${pageId}();
                    $('#table${pageId}').datagrid('reload');

                },
                'json'
        );
    }


    function onAdd${pageId}(data){
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

    function  onShow${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');

        var url='${createLink(action:'show')}/'+row.id
        showCard(url,'${pageId}')
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
                                    $('#table${pageId}').datagrid('reload');
                                    $.messager.show({
                                        title:'消息',
                                        msg:'数据已经删除！'
                                    });
                                });
                    }
                }
        );
    }



    //审核
    function onCheck${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        var index = $('#table${pageId}').datagrid('getRowIndex',row);
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
                                    %{--row['checker']=data.data.checker--}%
                                    %{--row['checkDate']=data.data.checkDate--}%
                                    %{--$("#table${pageId}").datagrid('updateRow',{--}%
                                        %{--index:$('#table${pageId}').datagrid('getRowIndex',row),--}%
                                        %{--'row':row--}%
                                    %{--});--}%

                                });
                    }
                }
        );
    }



    //弃审
    function onUnCheck${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        var index = $('#table${pageId}').datagrid('getRowIndex',row);
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

                                    if($(document).showMessage(data)){//有错误数据

                                        return;
                                    }

                                    $('#table${pageId}').datagrid('reload');
                                    %{--row['checker']=null;--}%
                                    %{--row['checkDate']=null--}%
                                    %{--$("#table${pageId}").datagrid('updateRow',{--}%
                                        %{--index:$('#table${pageId}').datagrid('getRowIndex',row),--}%
                                        %{--'row':row--}%
                                    %{--});--}%

                                });
                    }
                }
        );
    }



    //增加
    function onRefPage${pageId}(businessKey,billTypeKey,title,targetBill){
        var refUrl='${createLink(controller: 'pubBusinessType', action:'refPage')}?handler=getSelected${pageId}&businessKey='+businessKey+'&billTypeKey='+billTypeKey+'&targetBill='+targetBill;
        $("<div/>").dialog({
            title:title,
            resizable:false,
            modal:true,
            width:1000,
            height:500,

            href:refUrl,
            buttons:[{
                text : '增加',
                iconCls : 'icon-add',
                handler : function() {
                    var data=   getSelected${pageId}();
                  // alert(JSON.stringify(data));
                    if(data.length==0){
                        $.messager.show({
                            title:'警告',
                            msg:'未择数据!'
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

    function onResize${pageId}(w,h){
        $('#card${pageId}').panel('resize',{width:w,height:h});
    }

    function onClose${pageId}(){
        $('#card${pageId}').panel('destroy');
        $('#list${pageId}').panel('open');

    }

</script>
<div id="main${pageId}" style="padding: 3px" class="easyui-panel" data-options="fit:true,border:false,noheader:true,onResize:onResize${pageId}"  >
    <div id="list${pageId}" class="easyui-panel" title=""

         data-options="fit:true,border:false,noheader:true">
%{--按钮--}%
<div id="tb${pageId}">
    <g:addButton pageId="${pageId}" handler="onAdd" refHandler="onRefPage" billTypeCode="${billTypeCode}"></g:addButton>
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
    <a href="#" class="easyui-linkbutton"  plain="true" iconCls="icon-check" onclick="onCheck${pageId}()">
        ${message(code: 'default.button.check.label',default: '审核')}
    </a>
    <a href="#" class="easyui-linkbutton"  plain="true" iconCls="icon-uncheck" onclick="onUnCheck${pageId}()">
        ${message(code: 'default.button.uncheck.label',default: '弃审')}
    </a>
</div>
<g:render template="list"></g:render>
</div>
</div>