<g:set var="p_pageId" value="${java.util.UUID.randomUUID().toString().replaceAll('-','')}"></g:set>
<g:if test="${inForm==true}">
    <script>
        $(function(){
            $('#${id}${pageId}').combogrid({validType:"combogridValidate['${id}${pageId}']"});
            $('#where${p_pageId}').searchbox({
                searcher:function(value,name){
                    onQuery('${id}','${pageId}','${p_pageId}');
                },
                prompt:'查询条件' });
            $('#edit${p_pageId}').linkbutton({});
        });


    </script>
<input id="${id}${pageId}"   name="${name}" data-options="
                  {
                   <g:if test="${value}">url:'${createLink(controller: 'baseContract',action: 'queryC4')}/${value}',</g:if>
<g:else> onShowPanel:function(){ _onShowPanelInForm('${id}','${pageId}','${createLink(controller: 'baseContract',action: 'queryC4')}'); }, </g:else>
                  value:'${value}',pagination:true,
                  required:${required?:false},
                  mode:'remote',
                  fitColumns:true,
                  <g:if test="${onBeforeLoad}">
                    onBeforeLoad:${onBeforeLoad},
                  </g:if>
                  rownumbers:true,singleSelect:true,pageSize:10,
                  idField:'id',textField:'contractNo',
                  <g:if test="${onSelect}"> onSelect:${onSelect},</g:if>
                  <g:if test="${onChange}"> onChange:${onChange},</g:if>
                  columns:[[
                     {field:'contractNo',title:'${g.message(code:"baseContract.contractNo.label" )}',width:100,sortable:true},
                     {field:'contrantNo2',title:'${g.message(code:"baseContract.contrantNo2.label") }',width:100,sortable:true},
                     {field:'contractescribe',title:'${g.message(code: "baseContract.contractescribe.label")}',width:100,sortable:true}
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
    </a>
</div>
</g:if>
<g:else>
    <th field="${field}" sortable="false" width="100" editor="{type:'comboxgrid',options:{
                 cid:'${field}${pageId}',
                 canSave:false,
                 mode:'remote',
                  fitColumns:true,
                  pagination:true,
                  required:${required?:false},
                  rownumbers:true,singleSelect:true,pageSize:10,
                  idField:'id',textField:'contractNo',
                <g:if test="${onSelect}"> onSelect:${onSelect},</g:if>
    <g:if test="${onChange}"> onChange:${onChange},</g:if>
    onShowPanel:function(){
      _onShowPanel('${field}','${pageId}','${createLink(controller: 'baseContract',action: 'queryC4')}');
                                    },
                columns:[[
                {field:'contractNo',title:'<g:message code="baseContract.contractNo.label" default="contractNo" />',width:100,sortable:true},
                {field:'contractNo2',title:'<g:message code="baseContract.contractNo2.label" default="contractNo2" />',width:100,sortable:true},
                {field:'signDate',title:'<g:message code="baseContract.signDate.label" default="signDate" />',width:100,sortable:true,formatter:dateFormate},
                {field:'signAddress',title:'<g:message code="BaseContract.signAddress.label" default="signAddress" />',width:100,sortable:true},
                {field:'contractescribe',title:'<g:message code="BaseContract.contractescribe.label" default="contractescribe" />',width:100,sortable:true}
                    ]],panelWidth:550,toolbar:'<div id=tbxx${p_pageId} ><span>项目(右键选择列):</span><input type=hidden name=fieldkey id=fieldkey${p_pageId} ><input name=fieldname id=fieldname${p_pageId} editalbe=false width=100 disabled=true><span>条件:</span> <input name=where id=where${p_pageId}>【<a href=#  onclick=onQuery(\'${field}\',\'${pageId}\',\'${p_pageId}\')>查询</a>】</div>',
                    onHeaderContextMenu:function(e, field){
                         _onHeaderContextMenu(e,field,'${id}','${pageId}','${p_pageId}');


                    }
            }}"  data-options="formatter:function(value,row){


                    if(value!=undefined && value!=null){
                    //alert('${field}.id:'+value.id);
                        row['${field}.id']=value.id;
                        return value.contractNo;

                    }else{
                        delete row['${field}.id'];
                        row['${field}']=null;
                        return '';
                    }
            }">
        ${title}</th>
</g:else>