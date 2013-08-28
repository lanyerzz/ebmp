<%@ page import="com.app.ywms.rk.hyjh.YhyjhB" %>
<g:set var="entityName" value="${message(code: 'yhyjhB.label', default: 'YhyjhB')}" />
<script>

    $(function(){
        <g:if test="${ac=='show'}">
        $('#rowTable${pageId}').datagrid({
            loadFilter:function(data){

                if(data.rows && data.rows.length!=0)
                {
                    enJsonDateFormate(data.rows,['yjxhsj']);
                }

                return data;
            }

        });
        </g:if>
        <g:else>
        $('#rowTable${pageId}').edatagrid({
            loadFilter:function(data){

                if(data.rows && data.rows.length!=0)
                {
                    enJsonDateFormate(data.rows,['yjxhsj']);
                }

                return data;
            }

        });
        </g:else>

        <g:if test="${ec=='create'}">
        onAddBody${pageId}();
        </g:if>


    });


    function onAddBody${pageId}(){
        $('#rowTable${pageId}').edatagrid('addRow')
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

        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'jldw',value:''});
        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:''});
    }else{

        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'jldw',value:data.pkInvbasdoc.bdmeasdoc.measname});
        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:data.pkInvbasdoc.invcode});
    }

}


    function onChangeinv${pageId}(newValue, oldValue){
        if(oldValue==null || oldValue=='' ) return;
        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'jldw',value:''});
       $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:''});

    }

</script>


<g:if test="${ac!='show'}">
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
       <g:if test="${ec!='create'}">url="${createLink(action: 'queryBody')}?headId=${yhyjhInstance?.id}"</g:if>
       rownumbers="true" title="明细"
       fit="true" toolbar="#bodytb${pageId}" singleSelect="true" fitColumns="true" >

    <thead>

    <tr>
        <th field="bdInvmandoc.pkInvbasdoc.invcode"  sortable="false" width="100" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row){

                   if(row.bdInvmandoc==null) return '';
                   return row.bdInvmandoc.pkInvbasdoc.invcode;
            }">
            <g:message code="bdInvmandoc.pkInvbasdoc.invcode.label" />
        </th>

        <g:refTemplate inForm="false" model="[title:g.message(code: 'yhyjhB.bdInvmandoc.label'),field:'bdInvmandoc',onSelect:'onSelectinv'+pageId,onChange:'onChangeinv'+pageId,required:true]" code="refBdInvmandoc"></g:refTemplate>


        <th field="sl" sortable="false" width="80" editor="{type:'numberbox',options:{precision:2,required:true}}">${message(code: 'yhyjhB.sl.label', default: 'Sl')}</th>
        <th field="jldw" sortable="false" width="80" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row){

                   if(row.bdInvmandoc==null || row.bdInvmandoc.pkInvbasdoc.bdmeasdoc==null) return value;
                   return row.bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname;
            }">${message(code: 'yhyjhB.jldw.label', default: '单位')}</th>

        <th field="sfpc" sortable="false" width="80" align="center"  editor="{
                    type:'checkbox',
                    options:{
                        on:true,
                        off:false
                    }
                }  " >${message(code: 'yhyjhB.sfpc.label', default: 'Sfpc')}</th>

        <th field="sfyh" sortable="false" width="80" align='center'  editor="{
                    type:'checkbox',
                    options:{
                        on: true,
                        off: false
                    }
                }" data-options="formatter:booleanFormate">${message(code: 'yhyjhB.sfyh.label', default: 'Sfyh')}</th>
        <g:refTemplate inForm="false" model="[title:g.message(code:'yhyjhB.yjkbbw.label' ),field:'yjkbbw']" code="refYBerthage"></g:refTemplate>


        <th field="yjxhsj" sortable="false" width="80" editor="datebox" data-options="type:'date'">${message(code: 'yhyjhB.yjxhsj.label', default: 'Yjxhsj')}</th>
        <th field="note" sortable="false" width="80" editor="text">${message(code: 'yhyjhB.note.label', default: 'Note')}</th>
    </tr>
    </thead>
</table>
