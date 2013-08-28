<g:set var="p_pageId" value="${java.util.UUID.randomUUID().toString().replaceAll('-','')}"></g:set>
<g:if test="${inForm==true}">
    <script>
        $(function(){
            $('#${id}${pageId}').combogrid({validType:"combogridValidate['${id}${pageId}']"});
            $('#edit${p_pageId}').linkbutton({});
            $('#where${p_pageId}').searchbox({
                searcher:function(value,name){
                    onQuery('${id}','${pageId}','${p_pageId}');
                },
                prompt:'查询条件' });
        });
    </script>
<input id="${id}${pageId}"  name="${name}" data-options="
                  {url:'${createLink(controller: 'pubBusinessType',action: 'query')}?id=${value}&billtypecode=${billtypecode}',
                  value:'${value}',pagination:true,
                  required:${required?:false},
                  mode:'remote',
                  fitColumns:true,
                  rownumbers:true,singleSelect:true,pageSize:10,
                  idField:'id',textField:'name',
                  <g:if test="${onSelect}"> onSelect:${onSelect},</g:if>
                  <g:if test="${onChange}"> onChange:${onChange},</g:if>
                  columns:[[
                 {field:'code',title:'<g:message code="pubBusinessType.code.label" />',width:100,sortable:true},
                 {field:'name',title:'<g:message code="pubBusinessType.name.label" />',width:100,sortable:true}
                    ]],panelWidth:530,toolbar:'#tbxx${p_pageId}',
                    onHeaderContextMenu:function(e, field){
                         _onHeaderContextMenu(e,field,'${id}','${pageId}','${p_pageId}');

                    },
                    formatter: function(row){
		                var opts = $(this).combobox('options');
		                return row[opts.textField];
	                }
                ">

<div id="tbxx${p_pageId}">
    <span>项目(右键选择列):</span>
    <input type="hidden" name="fieldkey" id="fieldkey${p_pageId}" width="100" readonly="">
    <input name="fieldname" id="fieldname${p_pageId}" editalbe="false" width="100" disabled="">
    <span>条件:</span>
    <input name="where" id="where${p_pageId}">
    <a id="edit${p_pageId}" href="#"  iconCls="icon-edit" plain="true" onclick="openNode('011201'); ">
    </a>
</div>
</g:if>