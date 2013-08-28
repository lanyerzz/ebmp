<%@ page import="com.app.ic.bill.IcGeneralHead" %>

<script>
    $(function(){
        $('#form${pageId}').dateFormate();
        $('#form${pageId}').disabled();
    });
    function onFPGH${pageId}(){
        var row =$('#rowTable${pageId}').datagrid('getSelected');
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请先选中表体数据！'
            });
            return;
        }
        var index=$('#rowTable${pageId}').datagrid('getRowIndex',row);
        $('#rowTable${pageId}').datagrid('collapseRow',index);//expandRow
        $("<div/>").dialog({
            title:'分配罐号',
            resizable:false,
            modal:true,
            width:600,
            height:400,

            href:'${createLink(action: 'showGH')}/'+row.id,
            buttons:[{
                text : '分配',
                iconCls : 'icon-add',
                handler : function() {


                   var d = $(this).closest('.window-body');

                    saveGH${pageId}(d);
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }

    function saveGH${pageId}(d){

        $.messager.progress();
        $('#ghtab${pageId}').edatagrid('saveRow');
       if(! $('#ghtab${pageId}').edatagrid('validateRows')){
           $.messager.progress('close');
           return;
       };

       if(!check${pageId}()){
           $.messager.progress('close');
           return ;
       }


        var rows= $('#ghtab${pageId}').edatagrid('getJSON');
        var row =$('#rowTable${pageId}').datagrid('getSelected');
        var obj={id:row.id,ghs:JSON.stringify(rows)}
        $.post('${createLink(action: 'saveGH')}',obj,function(json){
            $.messager.progress('close');
           if(showRemoteMessage(json)){
               return;
           }
            d.dialog('destroy');
        });


    }

</script>

<g:set var="ac" value="show"></g:set>

<div id="card${pageId}" class="easyui-layout"  fit="true">
    <div id="head" data-options="region:'north',split:false,border:true"  class="panel-tools" style="background-color: #f1f1f1;">

        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-save" onclick="onEdit${pageId}()">修改</a>-
        <a class="easyui-linkbutton"  plain="true"  iconCls="" onclick="onFPGH${pageId}()">分配罐号</a>-
        <a class="easyui-linkbutton"  plain="true"  iconCls="icon-cancel" onclick=" closeCard('${pageId}');">关闭</a>


    </div>

    <div  data-options="region:'center',split:true,border:true" >
        <form id="form${pageId}"  method="post">
            <fieldset class="form" >
                <g:render template="form"/>
            </fieldset>
        </form>
    </div>

    <div data-options="region:'south',split:true,border:false" style="height: 380px">
        <g:render template="bodyList"></g:render>
    </div>



</div>