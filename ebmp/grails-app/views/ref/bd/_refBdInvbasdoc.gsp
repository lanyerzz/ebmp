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
                  <g:if test="${value}">url:'${createLink(controller: 'bdInvbasdoc',action: 'query1')}/${value}',</g:if>
    <g:else>
        onShowPanel:function(){
        _onShowPanelInForm('${id}','${pageId}','${createLink(controller: 'bdInvbasdoc',action: 'query1')}');
        },

    </g:else>

                  value:'${value}',pagination:true,
                  required:${required?:false},
                  mode:'remote',
                  fitColumns:true,
                  rownumbers:true,singleSelect:true,pageSize:10,
                  idField:'id',textField:'invname',
                  <g:if test="${onSelect}"> onSelect:${onSelect},</g:if>
                  <g:if test="${onChange}"> onChange:${onChange},</g:if>
                  columns:[[
                 {field:'pkInvbasdoc.invcode',title:'<g:message code="bdInvbasdoc.invcode.label" default="存货编码"/>',width:100,sortable:true,
                 formatter: function(val,row){
                        return row.invcode;
	                }
	              },
                 {field:'pkInvbasdoc.invname',title:'<g:message code="bdInvbasdoc.invname.label" default="存货名称"/>',width:100,sortable:true,
                 formatter: function(val,row){
                        return row.invname;
	                }
                 }
                    ]],panelWidth:530,toolbar:'#tbxx${p_pageId}',
                    onHeaderContextMenu:function(e, field){
                         _onHeaderContextMenu(e,field,'${id}','${pageId}','${p_pageId}');

                    }
                ">
    <span id="tbxx${p_pageId}">
        <span>项目(右键选择列):</span>
        <input type="hidden" name="fieldkey" id="fieldkey${p_pageId}" width="100" readonly="">
        <input name="fieldname" id="fieldname${p_pageId}" editalbe="false" width="100" disabled="">
        <span>条件:</span>
        <input name="where" id="where${p_pageId}">
        <a href="#" id="edit${p_pageId}" iconCls="icon-edit" plain="true" onclick="openNode('01060204'); ">
        </a>
    </span>
</g:if>
<g:else>

    <th field="${field}"   sortable="false" width="100"  editor="{type:'comboxgrid',options:{

                 cid:'${field}${pageId}',
                 mode:'remote',
                  fitColumns:true,
                  pagination:true,
                  required:${required?:false},
                  rownumbers:true,singleSelect:true,pageSize:10,
                  idField:'id',textField:'invname',
                  <g:if test="${onSelect}"> onSelect:${onSelect},</g:if>
                  <g:if test="${onChange}"> onChange:${onChange},</g:if>


        onShowPanel:function(){
        _onShowPanel('${field}','${pageId}','${createLink(controller: 'bdInvbasdoc',action: 'query1')}');
                                    },

                columns:[[
                 {field:'invcode',title:'<g:message code="bdInvbasdoc.invcode.label" default="存货编码"/>',width:100,sortable:true
	              },
                 {field:'invname',title:'<g:message code="bdInvbasdoc.invname.label" default="存货名称"/>',width:100,sortable:true
                 }
                ]],panelWidth:550,toolbar:'<div id=tbxx${p_pageId} ><span>项目(右键选择列):</span><input type=hidden name=fieldkey id=fieldkey${p_pageId} ><input name=fieldname id=fieldname${p_pageId} editalbe=false width=100 disabled=true><span>条件:</span> <input name=where id=where${p_pageId}>【<a href=#  onclick=onQuery(\'${field}\',\'${pageId}\',\'${p_pageId}\') >查询</a>】【<a href=#  onclick=openNode(\'01060204\')>编辑</a>】</div>',
                    onHeaderContextMenu:function(e, field){
                         _onHeaderContextMenu(e,field,'${field}','${pageId}','${p_pageId}');


                    }
            }}"  data-options="canSave:false,formatter:function(value,row){
                   if(value!=undefined && value!=null){
                    row['${field}.id']=value.id;
                    return value.invname;

                    }else{
                    delete row['${field}.id'];
                     row['${field}']=null;
                    return '';
                    }
            }">
        ${title}</th>
</g:else>







