<g:set  var="p_pageId" value="${java.util.UUID.randomUUID().toString().replaceAll('-','')}"></g:set>

<g:if test="${inForm==true}">
    <script>
        $(function(){
            $('#${id}${pageId}').combogrid({validType:"combogridValidate['${id}${pageId}']"});
            $('#serch${p_pageId}').linkbutton({});
            $('#edit${p_pageId}').linkbutton({});
            $('#where${p_pageId}').searchbox({
                searcher:function(value,name){
                    onQuery('${id}','${pageId}','${p_pageId}');
                },
                prompt:'查询条件' });
        });
    </script>
<input id="${id}${pageId}"  name="${name}" data-options="
                  {url:'${createLink(controller: 'tmTemplet',action: 'query')}/${value}',
                  value:'${value}',pagination:true,
                  required:${required?:false},
                  mode:'remote',
                  fitColumns:true,
                  rownumbers:true,singleSelect:true,pageSize:10,
                  idField:'id',textField:'templetName', columns:[[
                 {field:'templetCode',title:'${g.message(code:"tmTemplet.templetCode.label" ,default:"templetCode")  }',width:100,sortable:true},
                 {field:'templetName',title:'${g.message(code:"tmTemplet.templetName.label" ,default:"templetName") }',width:100,sortable:true}
                    ]],panelWidth:530,toolbar:'#tbxx${p_pageId}',onHeaderContextMenu:function(e, field){
                         _onHeaderContextMenu(e,field,'${id}','${pageId}','${p_pageId}');

                    }
                ">

<div id="tbxx${p_pageId}">
    <span>项目(右键选择列):</span>
    <input type="hidden" name="fieldkey" id="fieldkey${p_pageId}" width="100" readonly="">
    <input name="fieldname" id="fieldname${p_pageId}" editalbe="false" width="100" disabled="">
    <span>条件:</span>
    <input name="where" id="where${p_pageId}">
    <a href="#" id="serch${p_pageId}" iconCls="icon-search" plain="true" onclick="onQuery('${id}','${pageId}','${p_pageId}')
    ">

    </a>
    <a href="#" id="edit${p_pageId}" iconCls="icon-edit" plain="true" onclick="openNode('010301'); ">
    </a>
</div>
    </g:if>
