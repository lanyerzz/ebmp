


<%@ page import="com.app.ywms.ck.gbd.YoutGbd" %>
<g:set var="entityName" value="${message(code: 'youtGbd.label', default: 'YoutGbd')}" />
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

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
        $(d).dialog('destroy');
    }






</script>




%{--表格--}%
<table id="table${pageId}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true"  pagination="true" pageSize="30">

    <thead>

    <tr>
        <th field="businessType.name" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'businessType.name');
        }"><g:message code="youtGbd.businessType.label" default="Business Type"/></th>

        
        <th field="billdate" sortable="true" data-options="formatter:dateFormate"><g:message code="youtGbd.billdate.label" default="Billdate"/></th>
        


        <th field="billno" sortable="true">${message(code: 'youtGbd.billno.label', default: 'Billno')}</th>


        <th field="thdw" sortable="true">${message(code: 'youtGbd.thdw.label')}</th>
        <th field="hw" sortable="true">${message(code: 'youtGbd.hw.label')}</th>
        <th field="invspec" sortable="true">${message(code: 'youtGbd.invspec.label')}</th>
        <th field="invtype" sortable="true">${message(code: 'youtGbd.invtype.label')}</th>
        <th field="cph" sortable="true">${message(code: 'youtGbd.cph.label')}</th>

        <th field="tzsl" sortable="true">${message(code: 'youtGbd.tzsl.label', default: 'Tzsl')}</th>


        <th field="mz" sortable="true">${message(code: 'youtGbd.mz.label', default: 'Mz')}</th>
        
        <th field="pz" sortable="true">${message(code: 'youtGbd.pz.label', default: 'Pz')}</th>
        <th field="fysl" sortable="true">${message(code: 'youtGbd.fysl.label', default: 'Fysl')}</th>


        <th field="fhzt" sortable="true">${message(code: 'youtGbd.fhzt.label', default: 'Fhzt')}</th>


        <th field="fsr.psnname" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'fsr.psnname');
        }"><g:message code="youtGbd.fsr.label" default="Fsr"/></th>
        

        <th field="maker.userRealName" sortable="true" data-options="formatter:function(value,row){return getObjectAttr(row,'maker.userRealName')}"><g:message code="youtGbd.maker.label" default="Maker"/></th>

        <th field="makeDate" sortable="true" data-options="formatter:dateFormate"><g:message code="youtGbd.makeDate.label" default="Make Date"/></th>



        <th field="checker.userRealName" sortable="true" data-options="formatter:function(value,row){return getObjectAttr(row,'checker.userRealName')}"><g:message code="youtGbd.checker.label" default="Checker"/></th>

        <th field="checkDate" sortable="true" data-options="formatter:dateFormate"><g:message code="youtGbd.checkDate.label" default="Check Date"/></th>


        <th field="bdCorp.unitName" sortable="false" data-options="formatter:function(value,row){return getObjectAttr(row,'bdCorp.unitName')}"><g:message code="youtGbd.bdCorp.label" default="Bd Corp"/></th>

    </tr>
    </thead>
</table>



