
<%@ page import="com.app.bd.pack.BdPackInfo" %>

<script>

    $(function(){
        <g:if test="${ac=='create'}">
            $('#bodyRows${pageId}').edatagrid({});
        </g:if>
        <g:elseif test="${ac=='edit'}">
            $('#bodyRows${pageId}').edatagrid({url:'${createLink(action: 'queryBody',id: bdPackInstance?.id)}'});
        </g:elseif>

    });

    function onAddRow${pageId}(){
        $('#bodyRows${pageId}').edatagrid('addRow');
    }

    function onDeleteRow${pageId}(){
        var row=$('#bodyRows${pageId}').datagrid('getSelected');
        var index = $('#bodyRows${pageId}').datagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要删除的数据！'
            });
            return;
        };
        $('#bodyRows${pageId}').datagrid('deleteRow',index);
    }

</script>

%{--按钮--}%
<div id="bodytb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddRow${pageId}() ">
        ${message(code: 'default.button.create.label',default: '增加')}
    </a>

    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDeleteRow${pageId}() ">
        ${message(code: 'default.button.delete.label',default: '删除')}
    </a>

</div>
%{--表格--}%
<table id="bodyRows${pageId}"

       rownumbers="true"
       fit="true" toolbar="#bodytb${pageId}" singleSelect="true" fitColumns="true" >

    <thead>

    <tr>
        %{--集团公司--}%
        <g:if test="${bdPackInstance?.bdCorp?.unitCode=='0001'}">

            <g:refTemplate inForm="false" code="refBdInvbasdoc" model="[field:'invbasdoc',required:true,title:g.message(code: 'bdPackInfo.invmandoc.label')]"></g:refTemplate>
        </g:if>
        <g:else>
            <th field="invmandoc" sortable="false"><g:message code="bdPackInfo.invmandoc.label" default="Invmandoc"/></th>
        </g:else>

        <th field="nnumber" sortable="false" width="80" editor="{type:'numberbox',options:{precision:2,required:true}}">${message(code: 'bdPackInfo.nnumber.label', default: 'Nnumber')}</th>
        
        %{--<th field="vfree1" sortable="false">${message(code: 'bdPackInfo.vfree1.label', default: 'Vfree1')}</th>--}%
        %{----}%
        %{--<th field="vfree2" sortable="false">${message(code: 'bdPackInfo.vfree2.label', default: 'Vfree2')}</th>--}%
        %{----}%
        %{--<th field="vfree3" sortable="false">${message(code: 'bdPackInfo.vfree3.label', default: 'Vfree3')}</th>--}%
        %{----}%
        %{--<th field="vfree4" sortable="false">${message(code: 'bdPackInfo.vfree4.label', default: 'Vfree4')}</th>--}%
        %{----}%
        %{--<th field="vfree5" sortable="false">${message(code: 'bdPackInfo.vfree5.label', default: 'Vfree5')}</th>--}%
        
    </tr>
    </thead>
</table>



