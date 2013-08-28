
<%@ page import="com.app.so.order.SoSale" %>

<script>


    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?refQuery=${refQuery?:false}&targetBill=${targetBill}",
            view: detailview,
            onDblClickRow:function(rowIndex, rowData){
                onShow${pageId}();
            },
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
                        {field:'invmandoc.pkInvbasdoc.invcode',title:'<g:message code="bdInvbasdoc.invcode.label" />',formatter:function(value,row){

                            return getObjectAttr(row,'invmandoc.pkInvbasdoc.invcode');
                        }},
                        {field:'invmandoc.pkInvbasdoc.invname',title:'<g:message code="bdInvbasdoc.invname.label" />',formatter:function(value,row){
                            return getObjectAttr(row,'invmandoc.pkInvbasdoc.invname');
                        }},
                        {field:'invmandoc.pkInvbasdoc.invspec',title:'<g:message code="bdInvbasdoc.invspec.label" />',formatter:function(value,row){
                            return getObjectAttr(row,'invmandoc.pkInvbasdoc.invspec');
                        }},
                        {field:'invmandoc.pkInvbasdoc.invtype',title:'<g:message code="bdInvbasdoc.invtype.label" />',formatter:function(value,row){
                            return getObjectAttr(row,'invmandoc.pkInvbasdoc.invtype');
                        }},
                        {field:'invmandoc.pkInvbasdoc.bdmeasdoc.measname',title:'<g:message code="soSaleOrder.measdoc.label" />',formatter:function(value,row){
                            return getObjectAttr(row,'invmandoc.pkInvbasdoc.bdmeasdoc.measname');
                        }},
                        {field:'batch',title:'<g:message code="soSaleOrder.batch.label" />'},
                        {field:'bzm.name',title:'<g:message code="soSaleOrder.bzm.label" />',formatter:function(value,row){
                            return getObjectAttr(row,'bzm.name');
                        }},
                        {field:'fjl.measname',title:'<g:message code="soSaleOrder.bzm.label" />',formatter:function(value,row){
                            return getObjectAttr(row,'fjl.measname');
                        }},
                        {field:'fsl',title:'<g:message code="soSaleOrder.fsl.label" />'},
                        {field:'nnumber',title:'<g:message code="soSaleOrder.nnumber.label" />'},
                        {field:'ntaxprice',title:'<g:message code="soSaleOrder.ntaxprice.label" />'},
                        {field:'noriginalcursummny',title:'<g:message code="soSaleOrder.noriginalcursummny.label" />'},
                        {field:'frownote',title:'<g:message code="soSaleOrder.frownote.label" />'}

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
        $(d).dialog('destroy');
        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});

    }





</script>


        %{--表格--}%
        <table id="table${pageId}"

               rownumbers="true"
               fit="true" toolbar="#tb${pageId}" singleSelect="true"  pagination="true" pageSize="30">

            <thead>

            <tr>
                <th field="billno" sortable="true">${message(code: 'soSale.billno.label', default: 'Billno')}</th>
                <th field="billdate" sortable="true" data-options="formatter:dateFormate">${message(code: 'soSale.billdate.label', default: 'Billdate')}</th>
                <th field="businessType.code" sortable="true" data-options="formatter:function(value,row){
                    return getObjectAttr(row,'businessType.code');
                }"><g:message code="soSale.businessType.label" default="Business Type"/></th>
                <th field="customer.pkCubasdoc.custname" sortable="true" data-options="formatter:function(value,row){
                    return getObjectAttr(row,'customer.pkCubasdoc.custname');
                }"><g:message code="soSale.customer.label" default="Customer"/></th>
                <th field="vreceiveaddress" sortable="true">${message(code: 'soSale.vreceiveaddress.label', default: 'Vreceiveaddress')}</th>

                <th field="balatype.name" sortable="true" data-options="formatter:function(value,row){
                    return getObjectAttr(row,'balatype.name');
                }"><g:message code="soSale.balatype.label" default="Balatype"/></th>

                <th field="bretinvflag" sortable="true" data-options="formatter:booleanFormate">${message(code: 'soSale.bretinvflag.label', default: 'Bretinvflag')}</th>


                <th field="calbody.calbodyName" sortable="true" data-options="formatter:function(value,row){
                    return getObjectAttr(row,'calbody.calbodyName');
                }"><g:message code="soSale.calbody.label" default="Calbody"/></th>



                <th field="deptdoc.deptName" sortable="true" data-options="formatter:function(value,row){
                    return getObjectAttr(row,'deptdoc.deptName');
                }"><g:message code="soSale.deptdoc.label" default="Deptdoc"/></th>

                <th field="psndoc.psnname" sortable="false" data-options="formatter:function(value,row){
                    return getObjectAttr(row,'psndoc.psnname');
                }"><g:message code="soSale.psndoc.label" default="Psndoc"/></th>

                <th field="ndiscountrate" sortable="true">${message(code: 'soSale.ndiscountrate.label', default: 'Ndiscountrate')}</th>

                <th field="nheadsummny" sortable="true">${message(code: 'soSale.nheadsummny.label', default: 'Nheadsummny')}</th>

                %{--<th field="npreceivemny" sortable="true">${message(code: 'soSale.npreceivemny.label', default: 'Npreceivemny')}</th>--}%

                <th field="nratemnny" sortable="true">${message(code: 'soSale.nratemnny.label', default: 'Nratemnny')}</th>
                <th field="nrecmnny" sortable="true">${message(code: 'soSale.nrecmnny.label', default: 'nrecmmny')}</th>



                <th field="vnote" sortable="true">${message(code: 'soSale.vnote.label', default: 'Vnote')}</th>


                <th field="makeDate" sortable="true" data-options="formatter:dateFormate">${message(code: 'soSale.makeDate.label', default: 'Make Date')}</th>

                <th field="maker.userRealName" sortable="true" data-options="formatter:function(value,row){
                    return getObjectAttr(row,'maker.userRealName');
                }"><g:message code="soSale.maker.label" default="Maker"/></th>


                <th field="checkDate" sortable="true" data-options="formatter:dateFormate">${message(code: 'soSale.checkDate.label', default: 'Check Date')}</th>

                <th field="checker" sortable="false" data-options="formatter:function(value,row){
                    return getObjectAttr(row,'checker.userRealName');
                }"><g:message code="soSale.checker.label" default="Checker"/></th>

                <th field="bdCorp" sortable="false" data-options="formatter:function(value,row){
                      return getObjectAttr(value,'unitName');
                }"><g:message code="soSale.bdCorp.label" default="Bd Corp"/></th>
            </tr>
            </thead>
        </table>




