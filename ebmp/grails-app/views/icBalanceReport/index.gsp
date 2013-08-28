<%@ page import="com.app.ic.bill.IcGeneralHead" %>

<script>




    function onResize${pageId}(w,h){

        $('#card${pageId}').panel('resize',{width:w,height:h});
    }




</script>



<div id="main${pageId}" style="height: 100%;padding: 3px" class="easyui-panel" data-options="fit:true,border:false,noheader:true,onResize:onResize${pageId}"  >
    <div id="list${pageId}" class="easyui-panel" title=""

         data-options="fit:true,border:false,noheader:true">

        %{--按钮--}%
        <div id="tb${pageId}">
           <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="onFreash${pageId}()">
                ${message(code: 'default.button.refresh.label',default: '刷新')}
            </a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
                ${message(code: 'default.button.query.label',default: '查询')}
            </a>

        </div>
        <g:render template="list"></g:render>


    </div>
</div>