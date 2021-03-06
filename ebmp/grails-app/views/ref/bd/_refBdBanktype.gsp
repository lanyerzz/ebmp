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
                  {
                  <g:if test="${value}">url:'${createLink(controller: 'bdBankdoc',action: 'query')}/${value}',</g:if>
                  <g:else>
                    onShowPanel:function(){
                                       _onShowPanelInForm('${id}','${pageId}','${createLink(controller: 'bdBankdoc',action: 'query')}');
                                            },

                </g:else>
                  url:'${createLink(controller: 'bdBalatype',action: 'query')}/${value}',
                  value:'${value}',pagination:true,
                  mode:'remote',
                  required:${required?:false},
                  fitColumns:true,
                  rownumbers:true,singleSelect:true,pageSize:10,
                  idField:'id',textField:'banktypename', columns:[[
                 {field:'banktypecode',title:'<g:message code="bdBanktype.banktypecode.label" default="banktypecode" />',width:100,sortable:true},
                 {field:'banktypename',title:'<g:message code="bdBanktype.banktypename.label" default="banktypename" />',width:100,sortable:true}
                    ]],panelWidth:530,toolbar:'#tbxx${p_pageId}',onHeaderContextMenu:function(e, field){
                        _onHeaderContextMenu(e,field,'${id}','${pageId}','${p_pageId}');

                    }
                ">

<div id="tbxx${p_pageId}" style="display: inline-block;width: 100%">
    <span>项目(右键选择列):</span>
    <input type="hidden" name="fieldkey" id="fieldkey${p_pageId}" width="100" readonly="">
    <input name="fieldname" id="fieldname${p_pageId}" editalbe="false" width="100" disabled="">
    <span>条件:</span>
    <input name="where" id="where${p_pageId}">
    <a href="#" id="edit${p_pageId}" iconCls="icon-edit" plain="true" onclick="openNode('01060406'); ">
    </a>
</div>
    </g:if>