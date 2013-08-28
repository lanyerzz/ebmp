


<%@ page import="com.app.bd.salestru.BdSalestru" %>
<g:set var="entityName" value="${message(code: 'bdSalestru.label', default: 'BdSalestru')}" />
<script>



    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?refQuery=${refQuery?:false}&targetBill=${targetBill}",

            onDblClickRow:function(rowIndex, rowData){
                onShow${pageId}();
            }
        });
    });






</script>




%{--表格--}%
<table id="table${pageId}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true"  pagination="true" pageSize="30">

    <thead>

    <tr>

        
        <th field="code" sortable="true" width="100">${message(code: 'bdSalestru.code.label', default: 'Code')}</th>
        
        <th field="name" sortable="true" width="100">${message(code: 'bdSalestru.name.label', default: 'Name')}</th>
        


        <th field="bdDeptdoc.deptName" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="bdSalestru.bdDeptdoc.label" default="Bd Deptdoc"/></th>

        
        <th field="sealdate" sortable="true" width="100" data-options="formatter:booleanFormate">${message(code: 'bdSalestru.sealdate.label', default: 'Sealdate')}</th>
        
        <th field="vaddress" sortable="true" width="100">${message(code: 'bdSalestru.vaddress.label', default: 'Vaddress')}</th>

        <th field="bdCorp.unitName" sortable="false" width="100" data-options="formatter:defaultFormatter"><g:message code="bdSalestru.bdCorp.label" default="Bd Corp"/></th>


    </tr>
    </thead>
</table>



