<%@ page import="com.app.so.rec.SoRec" %>

<script>
    //增加
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

    //修改
    function  onShow${pageId}(){

        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择修改节点

            $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'show')}/'+row.id

        showCard(editurl,'${pageId}')


    }


    //    保存
    function onSave${pageId}(d){

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
    $.post( '${createLink(action: 'save')}',{'head':encodeURI(JSON.stringify(head)),'bodys':encodeURI(JSON.stringify(bodys))},function(json){

                if($('#card${pageId}').showMessage(json)){//有错误数据


                    return;
                }
            $.messager.progress('close');	// hide progress bar while submit successfully

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


    function onResize${pageId}(w,h){
        $('#card${pageId}').panel('resize',{width:w,height:h});
    }

    function onClose${pageId}(){
        $('#card${pageId}').panel('destroy');
        $('#list${pageId}').panel('open');

    }


    function onRefPage${pageId}(businessKey,billTypeKey,title,targetBill){


        var xhjhdurl='${createLink(controller: 'pubBusinessType', action:'refPage')}?handler=getSelected${pageId}&businessKey='+businessKey+'&billTypeKey='+billTypeKey+'&targetBill='+targetBill;
        $("<div/>").dialog({
            title:title,
            resizable:false,
            modal:true,
            width:800,
            height:500,

            href:xhjhdurl,
            buttons:[{
                text : '增加',
                iconCls : 'icon-add',
                handler : function() {


                    var data=   getHeadData();


                    if(data.length==0){

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

function up${pageId}(){
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

        var upUrl='${createLink(action:'ups')}/'

        $.messager.progress();

        $.post(upUrl,null,function(json){
            $.messager.progress('close');
            if(!showRemoteMessage(json)){
                return;
            }

            $("#table${pageId}").datagrid('reload');
        });



    }


    function upZK${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');

        var index=$('#table${pageId}').datagrid('getRowIndex',row);
        if(row == null){//选择修改节点

            $.messager.show({title:'警告',msg:'请选择上传的数据'});
            return;
        }
        var upUrl='${createLink(action:'upZK')}/'+row.id

        $.messager.progress();

        $.post(upUrl,null,function(json){
            $.messager.progress('close');
            if(!showRemoteMessage(json)){
                return;
            }

            $("#table${pageId}").datagrid('refreshRow',index);
        });
    }


    function onUpsZK${pageId}(){

        var upUrl='${createLink(action:'upsZK')}/'

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


            <g:addButton billTypeCode="S02" pageId="${pageId}" handler="onAdd" refHandler="onRefPage"></g:addButton>
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
        <a href="#"  class="easyui-splitbutton"
           data-options="menu:'#up${pageId}',iconCls:'icon-ok'" onclick="up${pageId}()">收款单上传</a>
        <div id="up${pageId}" style="width:100px;">
            <div data-options="" onclick="onUps${pageId}()">全部</div>
        </div>
        <a href="#"  class="easyui-splitbutton"
           data-options="menu:'#upzk${pageId}',iconCls:'icon-ok'" onclick="upZK${pageId}()">折扣上传</a>
        <div id="upzk${pageId}" style="width:100px;">
            <div data-options="" onclick="onUpsZK${pageId}()">全部</div>
        </div>
    </div>
        <g:render template="list"></g:render>
        %{--<g:render template="tree"></g:render>--}%
        %{--<g:render template="treelist"></g:render>--}%

    </div>
</div>