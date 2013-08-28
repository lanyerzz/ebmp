<%@ page import="com.app.ic.special.IcSpecial" %>

<script>



    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?refQuery=${refQuery?:false}&targetBill=${targetBill}",

            onDblClickRow:function(rowIndex, rowData){
                onShow${pageId}();
            },
            view: detailview,
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table id="tb-sub${pageId}-' + index + '" ></table></div>';
            },
            onExpandRow: function(index,row){
                $('#tb-sub${pageId}-'+index).datagrid({
                    url:'${createLink(action: 'queryBody')}?headId='+row.id+'&targetBill=${targetBill}',
                    fitColumns:true,
                    singleSelect:true,
                    rownumbers:true,

                    height:'auto',
                    singleSelect:false,
                    columns:[[
                        {field:'bdInvmandoc.pkInvbasdoc.invcode',title:'${message(code:"bdInvbasdoc.invcode.label")}',formatter:defaultFormatter,width:100},
                        {field:'bdInvmandoc.pkInvbasdoc.invname',title:'${message(code:"bdInvbasdoc.invname.label")}',formatter:defaultFormatter,width:100},
                        {field:'bdInvmandoc.pkInvbasdoc.invspec',title:'${message(code:"bdInvbasdoc.invspec.label")}',formatter:defaultFormatter,width:100},
                        {field:'bdInvmandoc.pkInvbasdoc.invtype',title:'${message(code:"bdInvbasdoc.invtype.label")}',formatter:defaultFormatter,width:100},
                        {field:'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname',title:'${message(code:"icGeneralBody.measdoc.label")}',formatter:defaultFormatter,width:100},
                        {field:'vbatchcode',title:'${message(code:"icSpecialB.vbatchcode.label")}',width:100},
                        {field:'castunit.name',title:'${message(code:"icSpecialB.castunit.label")}',formatter:defaultFormatter,width:100},
                        {field:'pack.name',title:'${message(code:"icSpecialB.pack.label")}',formatter:defaultFormatter,width:100},
                        {field:'hsl',title:'${message(code:"icSpecialB.hsl.label")}',formatter:defaultFormatter,width:80},
                        {field:'nshldtransastnum',title:'${message(code:"icSpecialB.nshldtransastnum.label")}',width:80},
                        {field:'dshldtransnum',title:'${message(code:"icSpecialB.dshldtransnum.label")}',width:80},
                        {field:'vnote',title:'${message(code:"icSpecialB.vnote.label")}',width:100}
                    ]],
                    onResize:function(){
                        $('#table${pageId}').datagrid('fixDetailRowHeight',index);
                    },
                    onLoadSuccess:function(){
                        setTimeout(function(){
                            $('#table${pageId}').datagrid('fixDetailRowHeight',index);
                        },0);
                    }
                });
                $('#table${pageId}').datagrid('fixDetailRowHeight',index);
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

        <th field="billno" sortable="true" width="100">${message(code: 'icSpecial.billno.label', default: 'Billno')}</th>

        <th field="billdate" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="icSpecial.billdate.label" default="Billdate"/></th>


        <th field="inwarehouse.name" sortable="true" width="100" data-options="formatter:function(value,row){
            return getObjectAttr(row,'inwarehouse.name');
        }"><g:message code="icSpecial.inwarehouse.label" default="Inwarehouse"/></th>


        

        <th field="outwarehouse.name" sortable="true" width="100" data-options="formatter:function(value,row){
            return getObjectAttr(row,'outwarehouse.name');
        }"><g:message code="icSpecial.outwarehouse.label" default="Outwarehouse"/></th>


        

        <th field="adjuster.name" sortable="true" width="100" data-options="formatter:function(value,row){
            return getObjectAttr(row,'adjuster.name');
        }"><g:message code="icSpecial.adjuster.label" default="Adjuster"/></th>






        <th field="cshlddiliverdate" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="icSpecial.cshlddiliverdate.label" default="Cshlddiliverdate"/></th>
        


        %{--<th field="inbsr.name" sortable="true" width="100" data-options="formatter:function(value,row){--}%
            %{--return getObjectAttr(row,'inbsr.name');--}%
        %{--}"><g:message code="icSpecial.inbsr.label" default="Inbsr"/></th>--}%


        

        %{--<th field="indept.name" sortable="true" width="100" data-options="formatter:function(value,row){--}%
            %{--return getObjectAttr(row,'indept.name');--}%
        %{--}"><g:message code="icSpecial.indept.label" default="Indept"/></th>--}%


        



        %{--<th field="outbsor.name" sortable="true" width="100" data-options="formatter:function(value,row){--}%
            %{--return getObjectAttr(row,'outbsor.name');--}%
        %{--}"><g:message code="icSpecial.outbsor.label" default="Outbsor"/></th>--}%


        

        %{--<th field="outdeptid.name" sortable="true" width="100" data-options="formatter:function(value,row){--}%
            %{--return getObjectAttr(row,'outdeptid.name');--}%
        %{--}"><g:message code="icSpecial.outdeptid.label" default="Outdeptid"/></th>--}%



        %{--<th field="shldarrivedate" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="icSpecial.shldarrivedate.label" default="Shldarrivedate"/></th>--}%
        

        <th field="vnote" sortable="true" width="100">${message(code: 'icSpecial.vnote.label', default: 'Vnote')}</th>


        <th field="maker.userRealName" sortable="true" width="100" data-options="formatter:function(value,row){return getObjectAttr(row,'maker.userRealName')}"><g:message code="icSpecial.maker.label" default="Maker"/></th>
        <th field="makeDate" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="icSpecial.makeDate.label" default="Make Date"/></th>


        <th field="checker.userRealName" sortable="true" width="100" data-options="formatter:function(value,row){return getObjectAttr(row,'checker.userRealName')}"><g:message code="icSpecial.checker.label" default="Checker"/></th>


        <th field="checkDate" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="icSpecial.checkDate.label" default="Check Date"/></th>



        <th field="bdCorp.unitName" sortable="false" width="100" data-options="formatter:function(value,row){return getObjectAttr(row,'bdCorp.unitName')}"><g:message code="icSpecial.bdCorp.label" default="Bd Corp"/></th>


    </tr>
    </thead>
</table>



