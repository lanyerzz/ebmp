
<%@ page import="com.app.ic.bill.IcGeneralHead" %>
<g:set var="entityName" value="${message(code: 'icGeneralHead.label', default: 'IcGeneralHead')}" />
<script>

    $(function(){
        $('#table${pageId}').datagrid({});
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
        initTable${pageId}();
        $('#table${pageId}').datagrid('reload',{queryParams:JSON.stringify(criters)});
        $(d).dialog('destroy');
    }

    function onFreash${pageId}(){
        initTable${pageId}();
        $('#table${pageId}').datagrid('reload');
    }



    function initTable${pageId}(){
       var opt= $('#table${pageId}').datagrid('options');

            opt.url='${createLink(controller:'icBalanceReport',action: 'query')}';

    }


</script>




%{--表格--}%
<table id="table${pageId}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="false" pagination="true" pageSize="30">

    <thead>

    <tr>
        <th field="invbasdoc.invcode" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="bdInvbasdoc.invcode.label"></g:message></th>
        <th field="invbasdoc.invname" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="bdInvbasdoc.invname.label"></g:message></th>
        <th field="invbasdoc.invspec" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="bdInvbasdoc.invspec.label"></g:message></th>
        <th field="invbasdoc.invtype" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="bdInvbasdoc.invtype.label"></g:message></th>
        <th field="invmandoc.pkInvbasdoc.bdmeasdoc.measname" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="icOnhandnum.measname.label"></g:message></th>
        <th field="warehouse.code" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="bdStordoc.code.label"></g:message></th>
        <th field="warehouse.name" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="bdStordoc.name.label"></g:message></th>
        <th field="calbody.calbodyCode" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="bdCalbody.bodyCode.label"></g:message></th>
        <th field="calbody.calbodyName" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="bdCalbody.bodyName.label"></g:message></th>
        <th field="vlot" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="icOnhandnum.vlot.label"></g:message></th>
        <th field="pack.name" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="icOnhandnum.bdPack.name.label"></g:message></th>
        <th field="hsl" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="icOnhandnum.hsl.label"></g:message></th>
        <th field="nonhandastnum" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="icOnhandnum.nonhandastnum.label"></g:message></th>
        <th field="nonhandnum" sortable="true" data-options="formatter:defaultFormatter"> <g:message code="icOnhandnum.nonhandnum.label"></g:message></th>

    </tr>
    </thead>
</table>