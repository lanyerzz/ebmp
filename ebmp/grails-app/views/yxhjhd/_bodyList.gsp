
<%@ page import="grails.converters.JSON; com.app.ywms.rk.xhjhd.YxhjhdB" %>
<g:set var="entityName" value="${message(code: 'yxhjhdB.label', default: 'YxhjhdB')}" />
<script>
    $(function(){

        var options${pageId}={

            view: detailview,
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table id="rowTable-sub${pageId}-' + index + '"></table></div>';
            },
            onExpandRow: function(index,row){
                $('#rowTable-sub${pageId}-'+index).datagrid({
                    url:"${createLink(action: 'queryGH')}?headId="+row.id+"&targetBill=${targetBill}",
                    rownumbers:true,
                    height:'auto',
                    columns:[[
                        {field:'gh.name',title:'罐号',width:120,formatter:defaultFormatter},
                        {field:'jhsl',title:'计划入库数量',width:120}
                    ]],
                    onResize:function(){
                        $('#rowTable${pageId}').datagrid('fixDetailRowHeight',index);
                    },
                    onLoadSuccess:function(){
                        setTimeout(function(){
                            $('#rowTable${pageId}').datagrid('fixDetailRowHeight',index);
                        },0);
                    }
                });
                $('#rowTable${pageId}').datagrid('fixDetailRowHeight',index);
            }
        };






        <g:if test="${ac=='create'}">
            <g:if test="${yxhjhdInstance.bodys}">
            $('#rowTable${pageId}').edatagrid(options${pageId});
            $('#rowTable${pageId}').edatagrid('loadData',${yxhjhdInstance.bodys*.part([defaultPart:true]) as JSON});
            </g:if>
            <g:else>
             $('#rowTable${pageId}').edatagrid(options${pageId});
             $('#rowTable${pageId}').edatagrid('addRow');
            </g:else>

        </g:if>
        <g:elseif test="${ac=='show'}">
            options${pageId}.url= "${createLink(action: 'queryBody')}?headId=${yxhjhdInstance?.id}";
            $('#rowTable${pageId}').datagrid(options${pageId});
        </g:elseif>
        <g:elseif test="${ac=='edit'}">
            options${pageId}.url= "${createLink(action: 'queryBody')}?headId=${yxhjhdInstance?.id}";

            $('#rowTable${pageId}').edatagrid(options${pageId});
        </g:elseif>



    });



    function onAddBody${pageId}(){
        $('#rowTable${pageId}').edatagrid('addRow');
    }



    //        删除
    function onDeleteBody${pageId}(){

        var row=$('#rowTable${pageId}').datagrid('getSelected');
        var index = $('#rowTable${pageId}').datagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要删除的数据！'
            });
            return;
        };
        $('#rowTable${pageId}').datagrid('deleteRow',index);
    }
    function onSelectinv${pageId}(index,data){

        if(data==null){

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:''});
        }else{

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:data.pkInvbasdoc.invcode});
        }

    }

    function onChangeinv${pageId}(newValue, oldValue){
        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:''});

    }
    function onSelectCumandoc${pageId}(index,data){

        if(data==null){

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdCumandoc.pkCubasdoc.custcode',value:''});
        }else{

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdCumandoc.pkCubasdoc.custcode',value:data.pkCubasdoc.custcode});
        }

    }

    function onChangeCumandoc${pageId}(newValue, oldValue){
        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdCumandoc.pkCubasdoc.custcode',value:''});

    }



</script>


<g:if test="${ac!="show"}">
%{--按钮--}%
    <div id="bodytb${pageId}">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddBody${pageId}() ">
            ${message(code: 'default.button.create.label',default: '增加')}
        </a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDeleteBody${pageId}() ">
            ${message(code: 'default.button.delete.label',default: '删除')}
        </a>

    </div>
</g:if>

%{--表格--}%
<table id="rowTable${pageId}"
       rownumbers="true"
        title="明细"
       fit="true" toolbar="#bodytb${pageId}" singleSelect="true" >

    <thead>

    <tr>
        <th field="hc" sortable="false" width="80" editor="text">${message(code: 'yxhjhdB.hc.label', default: 'Hc')}</th>

        <th field="bdCumandoc.pkCubasdoc.custcode" width="80" sortable="false" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row){

                   return getObjectAttr(row,'bdCumandoc.pkCubasdoc.custcode');
            }">${message(code: 'yxhjhdB.bdCumandoc.pkCubasdoc.custcode.label', default: 'bdCumandoc')}</th>

<g:if test="${yxhjhdInstance?.sourceBillTypeCode}">
    <th field="bdCumandoc.pkCubasdoc.custname" width="80" sortable="false" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row){

                   return getObjectAttr(row,'bdCumandoc.pkCubasdoc.custname');
            }">${message(code: 'yxhjhdB.bdCumandoc.label', default: 'bdCumandoc')}</th>
</g:if>
<g:else>
    <g:refTemplate inForm="false" code="refBdCustomer" model="[title:g.message(code:'yxhjhdB.bdCumandoc.label' ),field:'bdCumandoc',onSelect:'onSelectCumandoc'+pageId,onChange:'onChangeCumandoc'+pageId,required: true]"></g:refTemplate>

</g:else>


        <th field="bdInvmandoc.pkInvbasdoc.invcode" width="80" sortable="false" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row){

                   return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invcode');
            }">${message(code: 'yxhjhdB.bdInvmandoc.pkInvbasdoc.invcode.label', default: 'bdInvmandoc')}</th>

        <g:if test="${yxhjhdInstance?.sourceBillTypeCode}">
            <th field="bdInvmandoc.pkInvbasdoc.invname" width="80" sortable="false" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row){

                   return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invname');
            }">${message(code: 'bdInvmandoc.pkInvbasdoc.invname.label', default: 'bdInvmandoc')}</th>
        </g:if>
        <g:else>
            <g:refTemplate inForm="false" code="refBdInvmandoc" model="[title:g.message(code: 'yxhjhdB.bdInvmandoc.label'),field:'bdInvmandoc',onSelect:'onSelectinv'+pageId,onChange:'onChangeinv'+pageId,required:true]"></g:refTemplate>


        </g:else>


        <th field="mtfw" width="100" align='center' sortable="false" editor="{
                    type:'checkbox',
                    options:{
                        on:true,
                        off:false
                    }
        }  " data-options="formatter:booleanFormate">${message(code: 'yxhjhdB.mtfw.label', default: 'Mtfw')}</th>



        <th field="tdsl" sortable="false" width="80" editor="{type:'numberbox',options:{precision:2,required:true}}">${message(code: 'yxhjhdB.tdsl.label', default: 'Tdsl')}</th>

        <th field="bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname" sortable="false" width="80" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row){

                 return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname');
            }">${message(code: 'yxhjhdB.jldw.label', default: '单位')}</th>
        <th field="zgzf"  width="100" align='center' sortable="false" editor="{
                    type:'checkbox',
                    options:{
                        on:true,
                        off:false
                    }
        }  " data-options="formatter:booleanFormate">${message(code: 'yxhjhdB.zgzf.label', default: 'Zgzf')}</th>

        <th field="tsjc" width="100" align='center' sortable="false" editor="{
                    type:'checkbox',
                    options:{
                        on:true,
                        off:false
                    }
        }  " data-options="formatter:booleanFormate">${message(code: 'yxhjhdB.tsjc.label', default: 'Tsjc')}</th>
        <th field="bs" width="100" align='center' sortable="false" editor="{
                    type:'checkbox',
                    options:{
                        on:true,
                        off:false
                    }
        }  " data-options="formatter:booleanFormate">${message(code: 'yxhjhdB.bs.label', default: 'Bs')}</th>

        <g:refTemplate inForm="false" code="refBdPsndoc" model="[title:g.message(code: 'yxhjhdB.ywy.label'),field:'ywy']"></g:refTemplate>


        <th field="hytdh" sortable="false" width="80" editor="text">${message(code: 'yxhjhdB.hytdh.label', default: 'Hytdh')}</th>
        <th field="pch" sortable="false" width="80" >${message(code: 'yxhjhdB.pch.label', default: 'pch')}</th>

        <th field="xghth.contractNo" sortable="false" width="80"  data-options="canSave:false,formatter:function(value,row){

                  return getObjectAttr(row,'xghth.contractNo');
            }">${message(code: 'baseContract.contractNo.label', default: 'Xghth')}</th>

        <th field="xghth.contractNo2" sortable="false" width="80"  data-options="canSave:false,formatter:function(value,row){

                   return getObjectAttr(row,'xghth.contractNo2');
            }">${message(code: 'baseContract.contractNo2.label', default: 'Xghth')}</th>

        <th field="khtdh" sortable="false" width="80" editor="text">${message(code: 'yxhjhdB.khtdh.label', default: 'Khtdh')}</th>
        <g:refTemplate code="refBdCustomer"  model="[title:g.message(code:'yxhjhdB.cddw.label' ),field:'cddw']" inForm="false"></g:refTemplate>


        <th field="ddtzsj" sortable="false" width="80" editor="text">${message(code: 'yxhjhdB.ddtzsj.label', default: 'Ddtzsj')}</th>

        <th field="note" sortable="false" width="80" editor="text">${message(code: 'yxhjhdB.note.label', default: 'Note')}</th>

    </tr>
    </thead>
</table>



