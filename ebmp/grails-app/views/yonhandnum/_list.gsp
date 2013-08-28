
<%@ page import="com.app.ywms.kc.Yonhandnum" %>

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

        
        <th field="invmandoc.pkInvbasdoc.invname" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="yonhandnum.invmandoc.label" default="Invmandoc"/></th>
        

        <th field="gh.name" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="yonhandnum.gh.label" default="Gh"/></th>


        
        <th field="fxsl" sortable="true" width="100">${message(code: 'yonhandnum.fxsl.label', default: 'Fxsl')}</th>
        
        <th field="kcl" sortable="true" width="100">${message(code: 'yonhandnum.kcl.label', default: 'Kcl')}</th>
        
        <th field="bdCorp.unitName" sortable="false" width="100" data-options="formatter:defaultFormatter"><g:message code="yonhandnum.bdCorp.label" default="Bd Corp"/></th>

        
        <th field="lockNum" sortable="true" width="100">${message(code: 'yonhandnum.lockNum.label', default: 'Lock Num')}</th>
        
    </tr>
    </thead>
</table>



