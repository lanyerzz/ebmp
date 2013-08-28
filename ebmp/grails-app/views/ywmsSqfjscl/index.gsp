<div id="main${pageId}" style="padding: 3px" class="easyui-panel" data-options="fit:true,border:false,noheader:true"  >
    <div id="list${pageId}" class="easyui-panel" title=""

         data-options="fit:true,border:false,noheader:true">

        <div id="tb${pageId}">

            <a href="#" class="easyui-linkbutton"   plain="true" onclick="">首期费参数</a>
            <a href="#" class="easyui-linkbutton"   plain="true" onclick="">
                生成首期费
            </a>
            <a href="#" class="easyui-linkbutton"   plain="true" onclick="onOpenQuery${pageId}()">
                查询
            </a>


        </div>

<g:render template="list"></g:render>
    </div>
</div>