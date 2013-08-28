
<%@ page import="com.app.ic.bill.IcGeneralHead" %>
<g:set var="entityName" value="${message(code: 'icGeneralHead.label', default: 'IcGeneralHead')}" />
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
                    fitColumns:false,

                    singleSelect:true,
                    rownumbers:true,
                    height:'auto',
                    singleSelect:false,
                    columns:[[
                        {field:'bdInvmandoc.pkInvbasdoc.invcode',title:'${g.message(code:"bdInvbasdoc.invcode.label")}',formatter:function(value,row){
                            return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invcode');
                        }},
                        {field:'bdInvmandoc.pkInvbasdoc.invname',title:'${g.message(code:"bdInvbasdoc.invname.label")}',formatter:function(value,row){
                            return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invname');
                        }},
                        {field:'bdInvmandoc.pkInvbasdoc.invspec',title:'${g.message(code:"bdInvbasdoc.invspec.label")}',formatter:function(value,row){
                            return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invspec');
                        }},
                        {field:'bdInvmandoc.pkInvbasdoc.invtype',title:'${g.message(code:"bdInvbasdoc.invtype.label")}',formatter:function(value,row){
                            return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invtype');
                        }},

                        {field:'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname',title:'${g.message(code:"icGeneralBody.measdoc.label")}',formatter:function(value,row){
                            return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname');
                        }},
                        {field:'vbatchcode',title:'${g.message(code:"icGeneralBody.vbatchcode.label")}'},
                        {field:'astunit.measname',title:'${g.message(code:"icGeneralBody.astunit.label")}',formatter:defaultFormatter},
                        {field:'pack.name',title:'${g.message(code:"icgeneralbody.pack.label")}',formatter:defaultFormatter},
                        {field:'hsl',title:'${g.message(code:"icgeneralbody.hsl.label")}'},
                        {field:'ninassistNum',title:'${g.message(code:"icGeneralBody.ninassistNum.label")}'},
                        {field:'nshouldinNum',title:'${g.message(code:"icGeneralBody.nshouldinNum.label")}'},
                        {field:'ninassistNum',title:'${g.message(code:"icGeneralBody.ninassistNum.label")}',sum:true},
                        {field:'ninNum',title:'${g.message(code:"icGeneralBody.ninNum.label")}'},
                        {field:'inDate',title:'${g.message(code:"icGeneralBody.inDate.label")}',formatter:dateFormate},
                        {field:'vreceiveaddress',title:'${g.message(code:"icgeneralbody.vreceiveaddress.label")}'},
                        {field:'vnotebody',title:'${g.message(code:"icgeneralbody.vnotebody.label")}'}
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
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="false" pagination="true" pageSize="30">

    <thead>

    <tr>


        <th field="businessType.name" sortable="true" data-options="formatter:defaultFormatter" width="100"><g:message code="icGeneralHead.businessType.label" default="Business Type"/></th>
        <th field="billno" sortable="true">${message(code: 'icGeneralHead.billno.label', default: 'Billno')}</th>
        <th field="billdate" sortable="true" data-options="formatter:dateFormate"  width="100">${message(code: 'icGeneralHead.billdate.label', default: 'Billdate')}</th>

        <th field="cbiz.psnname" sortable="true" data-options="formatter:defaultFormatter"  width="100"><g:message code="icGeneralHead.cbiz.label" default="Cbiz"/></th>
        <th field="cwarehouse.name" sortable="true" data-options="formatter:defaultFormatter"  width="100"><g:message code="icGeneralHead.cwarehouse.label" default="Cwarehouse" /></th>

        <th field="ccustomer.custname" sortable="true" data-options="formatter:defaultFormatter"  width="100"><g:message code="icGeneralHead.ccustomer.label" default="Ccustomer"/></th>

        <th field="cdept.deptName" sortable="true" data-options="formatter:defaultFormatter"  width="100"><g:message code="icGeneralHead.cdept.label" default="Cdept"/></th>



        <th field="cwhsmanager.name" sortable="true" data-options="formatter:defaultFormatter"  width="100"><g:message code="icGeneralHead.cwhsmanager.label" default="Cwhsmanager"/></th>

        <th field="vnote" sortable="true">${message(code: 'icGeneralHead.vnote.label', default: 'Vnote')}</th>



        <th field="maker.userRealName" sortable="true" data-options="formatter:defaultFormatter"  width="100"><g:message code="icGeneralHead.maker.label" default="Maker"/></th>

        <th field="makeDate" sortable="true" data-options="formatter:dateFormate"  width="100">${message(code: 'icGeneralHead.makeDate.label', default: 'Make Date')}</th>



        <th field="checker" sortable="true"  width="80"><g:message code="icGeneralHead.checker.label" default="Checker"/></th>

        <th field="checkDate" sortable="true"  width="100" data-options="formatter:dateFormate">${message(code: 'icGeneralHead.checkDate.label', default: 'Check Date')}</th>




        <th field="bdCorp.unitName"  width="100" data-options="formatter:defaultFormatter" sortable="true"><g:message code="icGeneralHead.bdCorp.label" default="Bd Corp"/></th>
    </tr>
    </thead>
</table>



