<g:set  var="p_pageId" value="${java.util.UUID.randomUUID().toString().replaceAll('-','')}"></g:set>
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
    <input id="${id}${pageId}" class="easyui-combogrid" name="${name}" data-options="
                  {
                  <g:if test="${value}">url:'${createLink(controller: 'smUser',action: 'list')}/${value}',</g:if>
    <g:else>
        onShowPanel:function(){
       _onShowPanelInForm('${id}','${pageId}','${createLink(controller: 'smUser',action: 'list')}');
                                        },

    </g:else>


                  value:'${value}',pagination:true,
                  required:${required?:false},
                  mode:'remote',
                  fitColumns:true,
                  rownumbers:true,singleSelect:true,pageSize:10,
                  idField:'id',textField:'username', columns:[[
                 {field:'username',title:'${g.message(code:"smUser.username.label" ,default:"username")  }',width:100,sortable:true},
                 {field:'userRealName',title:'${g.message(code:"smUser.userRealName.label" ,default:"userRealName") }',width:100,sortable:true}
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

        <a id="edit${p_pageId}" href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="openNode('010102'); ">
        </a>
    </div>
</g:if>
<g:else>

    <th field="${field}" sortable="false" width="100" editor="{type:'comboxgrid',options:{
                 cid:'${field}${pageId}',
                 mode:'remote',
                  fitColumns:true,
                  pagination:true,
                  required:${required?:false},
                  rownumbers:true,singleSelect:true,pageSize:10,
                  <g:if test="${onSelect}"> onSelect:${onSelect},</g:if>
    <g:if test="${onChange}"> onChange:${onChange},</g:if>
                  idField:'id',textField:'username',
                onShowPanel:function(){
       _onShowPanelInForm('${field}','${pageId}','${createLink(controller: 'smUser',action: 'list')}');
                                        },
                columns:[[
                 {field:'username',title:'<g:message code="smUser.username.label" default="用户名"/>',width:100,sortable:true},
                 {field:'userRealName',title:'<g:message code="smUser.userRealName.label" default="userRealName"/>',width:100,sortable:true}
                    ]],panelWidth:550,toolbar:'<div id=tbxx${p_pageId} ><span>项目(右键选择列):</span><input type=hidden name=fieldkey id=fieldkey${p_pageId} ><input name=fieldname id=fieldname${p_pageId} editalbe=false width=100 disabled=true><span>条件:</span> <input name=where id=where${p_pageId}>【<a href=#  onclick=onQuery(\'${id}\',\'${pageId}\',\'${p_pageId}\')>查询</a>】【<a href=#  onclick=openNode(\'010102\')>编辑</a>】</div>',
                    onHeaderContextMenu:function(e, field){
                         _onHeaderContextMenu(e,field,'${field}','${pageId}','${p_pageId}');


                    }
            }}"  data-options="formatter:function(value,row){
                   if(value!=undefined){
                    delete row['${field}.id'];
                        row['${field}']=null;
                    return username;

                    }
            }">
        ${title}</th>
</g:else>
