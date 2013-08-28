


<%@ page import="com.app.ywms.cm.lossbill.YwmsLostBill" %>
<g:set var="entityName" value="${message(code: 'YwmsLostBill.label', default: 'YwmsLostBIll')}" />
<script>



    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?targetBill=${targetBill}&billTypeCode=${billTypeCode}",

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

        


        <th field="billdate" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="ywmsLostBIll.billdate.label" default="Billdate"/></th>
        
        <th field="billno" sortable="true" width="100">${message(code: 'ywmsLostBIll.billno.label', default: 'Billno')}</th>
        


        


        <th field="contract.contractNo" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="ywmsLostBIll.contract.label" default="Contract"/></th>
        <th field="pch" sortable="true" width="100">${message(code: 'ywmsLostBIll.pch.label', default: 'Pch')}</th>

        <th field="lostDate" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="ywmsLostBIll.lostDate.label" default="Lost Date"/></th>

        <th field="lostType" sortable="true" width="100" data-options="formatter:function(value,row){
            if(value==0) return '合同损耗';
            else if(value==1) return '保管损耗';
            else if(value==2) return '装卸损耗';
            else if(value==3) return '其他损耗';
        }">${message(code: 'ywmsLostBIll.lostType.label', default: 'Lost Type')}</th>

        <th field="kcl" sortable="true" width="100">${message(code: 'ywmsLostBIll.kcl.label', default: 'Kcl')}</th>

        <th field="fxl" sortable="true" width="100">${message(code: 'ywmsLostBIll.fxl.label', default: 'Fxl')}</th>


        <th field="shsl" sortable="true" width="100">${message(code: 'ywmsLostBIll.shsl.label', default: 'Shsl')}</th>




        <th field="shl" sortable="true" width="100">${message(code: 'ywmsLostBIll.shl.label', default: 'Shl')}</th>
        


        <th field="vnote" sortable="true" width="100">${message(code: 'ywmsLostBIll.vnote.label', default: 'Vnote')}</th>

        <th field="maker.userRealName" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="ywmsLostBIll.maker.label" default="Maker"/></th>

        <th field="makeDate" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="ywmsLostBIll.makeDate.label" default="Make Date"/></th>

        <th field="checker.userRealName" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="ywmsLostBIll.checker.label" default="Checker"/></th>

        <th field="checkDate" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="ywmsLostBIll.checkDate.label" default="Check Date"/></th>

        <th field="bdCorp.unitName" sortable="false" width="100" data-options="formatter:defaultFormatter"><g:message code="ywmsLostBIll.bdCorp.label" default="Bd Corp"/></th>

    </tr>
    </thead>
</table>



