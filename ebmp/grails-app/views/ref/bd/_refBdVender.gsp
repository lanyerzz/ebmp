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

                  <g:if test="${value}">url:'${createLink(controller: 'bdCumandoc',action: 'queryVender')}/${value}',</g:if>
    <g:else>
        onShowPanel:function(){
       _onShowPanelInForm('${id}','${pageId}','${createLink(controller: 'bdCumandoc',action: 'queryVender')}');
                                        },

    </g:else>

                  value:'${value}',pagination:true,
                  required:${required?:false},
                  mode:'remote',
                  fitColumns:true,
                  rownumbers:true,singleSelect:true,pageSize:10,
                  idField:'id',textField:'custname',
                  <g:if test="${onSelect}"> onSelect:${onSelect},</g:if>
    <g:if test="${onChange}"> onChange:${onChange},</g:if>
                  columns:[[
                     {field:'pkCubasdoc.custcode',title:'${g.message(code:"bdCumandoc.pkCubasdoc.custcode.label" ,default:"客户编码")}',formatter:function(value,row){
                        if(row.pkCubasdoc){
                            return row.pkCubasdoc.custcode;
                        }
                     } ,width:100,sortable:true},
                     {field:'pkCubasdoc.custname',title:'${g.message(code:"bdCumandoc.pkCubasdoc.custname.label" ,default:"客户名称") }',formatter:function(value,row){
                            return row.pkCubasdoc.custname;
                     },width:100,sortable:true},
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
        <a href="#" id="edit${p_pageId}" iconCls="icon-edit" plain="true" onclick="openNode('01060304'); ">
        </a>
    </div>
</g:if>
