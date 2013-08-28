


<%@ page import="com.app.nc.NcContrast" %>
<g:set var="entityName" value="${message(code: 'ncContrast.label', default: 'NcContrast')}" />
<script>



    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?refQuery=${refQuery?:false}&targetBill=${targetBill}",

            onDblClickRow:function(rowIndex, rowData){
                onShow${pageId}();
            }


        });
    });












    function onOpenQuery${pageId}(){

        $('<div/>').dialog({
            title:'查询',
            iconCls:'icon-search',
            resizable:true,
            modal:true,
//            fit:true,
            width :600,
            height:500,
            // inline:true,
            href:'${createLink(action: 'createQuery')}',
            buttons:[{
                text : '查询',
                iconCls : 'icon-search',
                handler : function() {
                    var d = $(this).closest('.window-body');
                    onQuery${pageId}(d);
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }

    function onQuery${pageId}(d){

        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:JSON.stringify(criters)});
        $(d).dialog('destroy');
    }







</script>




%{--表格--}%
<table id="table${pageId}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true"  pagination="true" pageSize="30">

    <thead>

    <tr>
        <th field="type" sortable="true" width="100" data-options="formatter:function(value,row){
            if(value=='bdCorp'){
                return '公司';
            }
        }">${message(code: 'ncContrast.type.label', default: 'Type')}</th>
        


        
        <th field="sourveValue" sortable="true" width="100">${message(code: 'ncContrast.sourveValue.label', default: 'Sourve Value')}</th>
        
        <th field="targetValue" sortable="true" width="100">${message(code: 'ncContrast.targetValue.label', default: 'Target Value')}</th>

        <th field="bdCorp.unitName" sortable="false" width="100" data-options="formatter:defaultFormatter"><g:message code="ncContrast.bdCorp.label" default="Bd Corp"/></th>


    </tr>
    </thead>
</table>



