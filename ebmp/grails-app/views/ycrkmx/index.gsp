<%@ page import="com.app.ywms.kc.Ycrkmx" %>

<script>



    function onResize${pageId}(w,h){
    $('#card${pageId}').panel('resize',{width:w,height:h});
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
                    var data=   getSelected${pageId}();


                    if(data==false){

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

    function onFollow${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        $("<div/>").dialog({
            title:'跟踪',
            resizable:false,
            modal:true,
            width:800,
            height:500,

            href:'${createLink(action: 'follow')}/'+row.id,

            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }

</script>



<div id="main${pageId}" style="height: 100%;padding: 3px" class="easyui-panel" data-options="fit:true,border:false,noheader:true,onResize:onResize${pageId}"  >
    <div id="list${pageId}" class="easyui-panel" title=""

         data-options="fit:true,border:false,noheader:true">

        %{--按钮--}%
        <div id="tb${pageId}">
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').datagrid('reload')">
                ${message(code: 'default.button.refresh.label',default: '刷新')}
            </a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
                ${message(code: 'default.button.query.label',default: '查询')}
            </a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onFollow${pageId}()">
                ${message(code: 'default.button.follow.label',default: '跟踪')}
            </a>
        </div>
        <g:render template="list"></g:render>
        %{--<g:render template="tree"></g:render>--}%
        %{--<g:render template="treelist"></g:render>--}%

    </div>
</div>