<%@ page import="com.app.bd.salestru.BdSalestru" %>

<script>
    //增加
    function onAdd${pageId}(data){
        var addurl
        if($.type(data)=='object'){
            addurl='${createLink(action: 'create')}?keys='+data.data+'&businessKey='+data.businessKey+'&sourceBillTypeCode='+data.sourceBillTypeCode;

        }else{
            addurl='${createLink(action: 'create')}?businessKey='+data;
        }
        showCard(addurl,'${pageId}');

    }
    //show
    function  onShow${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        var editurl='${createLink(action:'show')}/'+row.id

        showCard(editurl,'${pageId}');


    }


    //修改
    function  onEdit${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择修改节点

        $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id

        showCard(editurl,'${pageId}');


    }


    //    保存
    function onSave${pageId}(d){

    $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
        $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        %{--var vali= $('#bodyTable${pageId}').edatagrid('validateRows');--}%
        %{--if(!vali) return;--}%

        var head= $('#form${pageId}').serializeObject();
        %{--$('#bodyTable${pageId}').edatagrid('saveRow');--}%
        %{--var bodys = $('#bodyTable${pageId}').edatagrid('getJSON',true);--}%
//      {'head':JSON.stringify(head),'bodys':JSON.stringify(bodys)}
    $.post( '${createLink(action: 'save')}',head,function(json){
            $.messager.progress('close');	// hide progress bar while submit successfully
            if($('#card${pageId}').showMessage(json)){//有错误数据


                return;
            }


           closeCard('${pageId}');

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




    function onResize${pageId}(w,h){
    $('#card${pageId}').panel('resize',{width:w,height:h});
    }





</script>



<div id="main${pageId}" style="height: 100%;padding: 3px" class="easyui-panel" data-options="fit:true,border:false,noheader:true,onResize:onResize${pageId}"  >
    <div id="list${pageId}" class="easyui-panel" title=""

         data-options="fit:true,border:false,noheader:true">

        %{--按钮--}%
        <div id="tb${pageId}">
            %{--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAdd${pageId}() ">--}%
            %{--${message(code: 'default.button.create.label',default: '增加')}--}%
            %{--</a>--}%

            <g:addButton billTypeCode="${billTypeCode}" pageId="${pageId}" handler="onAdd" refHandler="onRefPage"></g:addButton>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label',default: '修改')}</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">
                ${message(code: 'default.button.delete.label',default: '删除')}
            </a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').datagrid('reload')">
                ${message(code: 'default.button.refresh.label',default: '刷新')}
            </a>

        </div>
        <g:render template="list"></g:render>
        %{--<g:render template="tree"></g:render>--}%
        %{--<g:render template="treelist"></g:render>--}%

    </div>
</div>