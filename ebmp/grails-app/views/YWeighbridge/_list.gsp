
<%@ page import="com.app.ywms.bd.weighbridge.YWeighbridge" %>
<g:set var="entityName" value="${message(code: 'YWeighbridge.label', default: 'YWeighbridge')}" />
<script>



    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?refQuery=${refQuery?:false}&targetBill=${targetBill}",

            onDblClickRow:function(rowIndex, rowData){
                onEdit${pageId}();
            }
        });
    });












    function onOpenQuery${pageId}(){
//        $('#query${pageId}').dialog('open');
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

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
        $(d).dialog('destroy');
    }







</script>




%{--表格--}%
<table id="table${pageId}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        <th field="code" sortable="true">${message(code: 'YWeighbridge.code.label', default: 'Code')}</th>
        <th field="commName" sortable="true">${message(code: 'YWeighbridge.commName.label', default: 'Comm Name')}</th>
        
        <th field="ibit" sortable="true">${message(code: 'YWeighbridge.bit.label', default: 'Bit')}</th>
        

        <th field="databits" sortable="true">${message(code: 'YWeighbridge.databits.label', default: 'Databits')}</th>

        
        <th field="payity" sortable="true">${message(code: 'YWeighbridge.payity.label', default: 'Payity')}</th>
        
        <th field="stopbits" sortable="true">${message(code: 'YWeighbridge.stopbits.label', default: 'Stopbits')}</th>
        <th field="driver" sortable="true">${message(code: 'YWeighbridge.driver.label', default: 'driver')}</th>

        <th field="writeFilePath" sortable="true">${message(code: 'YWeighbridge.writeFilePath.label', default: 'writeFilePath')}</th>
        <th field="bdCorp.unitName" sortable="false" data-options="formatter:function(value,row){return getObjectAttr(row,'bdCorp.unitName')}"><g:message code="YWeighbridge.bdCorp.label" default="Bd Corp"/></th>
    </tr>
    </thead>
</table>



