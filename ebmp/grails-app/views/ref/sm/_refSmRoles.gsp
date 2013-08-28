<g:set  var="p_pageId" value="${java.util.UUID.randomUUID().toString().replaceAll('-','')}"></g:set>
<input id="${id}${pageId}" class="easyui-combogrid" name="${name}" data-options="
                  {url:'${createLink(controller: 'smRoles',action: 'list')}/${value}',
                  value:'${value}',pagination:true,
                  required:${required?:false},
                  mode:'remote',
                  fitColumns:true,
                  rownumbers:true,singleSelect:true,pageSize:10,
                  idField:'id',textField:'roleName', columns:[[
                 {field:'roleCode',title:'${g.message(code:"smRoles.roleCode.label" ,default:"roleCode")  }',width:100,sortable:true},
                 {field:'roleName',title:'${g.message(code:"smRoles.roleName.label" ,default:"roleName") }',width:100,sortable:true}
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
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onQuery('${id}','${pageId}','${p_pageId}')
    ">

    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="openNode('010103'); ">
    </a>
</div>