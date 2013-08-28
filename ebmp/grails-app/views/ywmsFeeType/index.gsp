<%@ page import="com.app.ywms.settle.feetype.YwmsFeeType" %>

<div id="main${pageId}" style="height: 100%;padding: 3px" class="easyui-panel" data-options="fit:true,border:false,noheader:true"  >
    <div id="list${pageId}" class="easyui-panel" title=""

         data-options="fit:true,border:false,noheader:true">

        <g:render template="tree"></g:render>
        %{--<g:render template="treelist"></g:render>--}%

    </div>
</div>