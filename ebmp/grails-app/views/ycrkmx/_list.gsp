


<%@ page import="com.app.ywms.kc.Ycrkmx" %>
<g:set var="entityName" value="${message(code: 'ycrkmx.label', default: 'Ycrkmx')}" />
<script>



    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?targetBill=${targetBill}&billTypeCode=${billTypeCode}"


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
        <th field="crklx" sortable="true" width="100" data-options="formatter:function(value,row){
            if(value==0){
                return '入库';
            }else if(value==1){
                return '出库';
            }
        }">${message(code: 'ycrkmx.crklx.label', default: 'Crklx')}</th>
        <th field="billdate" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="ycrkmx.billdate.label" default="Billdate"/></th>

        <th field="ht.contractNo" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="ycrkmx.ht.label" default="Ht"/></th>

        <th field="pc" sortable="true" width="100">${message(code: 'ycrkmx.pc.label', default: 'Pc')}</th>

        <th field="hz.pkCubasdoc.custname" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="ycrkmx.hz.label" default="Hz"/></th>

        <th field="invmandoc.pkInvbasdoc.invname" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="ycrkmx.invmandoc.label" default="Invmandoc"/></th>
        

        

        <th field="gh.name" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="ycrkmx.gh.label" default="Gh"/></th>

        <th field="shl" sortable="true" width="100">${message(code: 'ycrkmx.shl.label', default: 'Shl')}</th>
        
        <th field="insl" sortable="true" width="100">${message(code: 'ycrkmx.insl.label', default: 'Insl')}</th>
        
        <th field="outsl" sortable="true" width="100">${message(code: 'ycrkmx.outsl.label', default: 'Outsl')}</th>
        

        
        <th field="fxsl" sortable="true" width="100">${message(code: 'ycrkmx.fxsl.label', default: 'Fxsl')}</th>
        
        <th field="hxsl" sortable="true" width="100">${message(code: 'ycrkmx.hxsl.label', default: 'Hxsl')}</th>
        

        
        <th field="lockNum" sortable="true" width="100">${message(code: 'ycrkmx.lockNum.label', default: 'Lock Num')}</th>
        


        <th field="zgzf" sortable="true" width="100" data-options="formatter:booleanFormate">${message(code: 'ycrkmx.zgzf.label', default: 'Zgzf')}</th>
        <th field="note" sortable="false" width="100">${message(code: 'ycrkmx.note.label', default: 'Note')}</th>
        <th field="bdCorp.unitName" sortable="false" width="100" data-options="formatter:defaultFormatter"><g:message code="ycrkmx.bdCorp.label" default="Bd Corp"/></th>


    </tr>
    </thead>
</table>



