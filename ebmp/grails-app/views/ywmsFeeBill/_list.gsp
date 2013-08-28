


<%@ page import="com.app.ywms.settle.fee.YwmsFeeBill" %>
<g:set var="entityName" value="${message(code: 'ywmsFeeBill.label', default: 'YwmsFeeBill')}" />
<script>



    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?refQuery=${refQuery?:false}&targetBill=${targetBill}",

            onDblClickRow:function(rowIndex, rowData){
                onEdit${pageId}();
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
                    columns:[[]],
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

        
        <th field="billdate" sortable="true" data-options="formatter:dateFormate"><g:message code="ywmsFeeBill.billdate.label" default="Billdate"/></th>
        

        <th field="feeType.name" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'feeType.name');
        }"><g:message code="ywmsFeeBill.feeType.label" default="Fee Type"/></th>


        
        <th field="jsrq" sortable="true" data-options="formatter:dateFormate"><g:message code="ywmsFeeBill.jsrq.label" default="Jsrq"/></th>
        
        <th field="dj" sortable="true">${message(code: 'ywmsFeeBill.dj.label', default: 'Dj')}</th>
        
        <th field="yfsl" sortable="true">${message(code: 'ywmsFeeBill.yfsl.label', default: 'Yfsl')}</th>
        
        <th field="yfje" sortable="true">${message(code: 'ywmsFeeBill.yfje.label', default: 'Yfje')}</th>
        
        <th field="fkdw.pkCubasdoc.custname" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'fkdw.pkCubasdoc.custname');
        }"><g:message code="ywmsFeeBill.fkdw.label" default="Fkdw"/></th>
        
        <th field="bdCorp.unitName" sortable="false" data-options="formatter:function(value,row){return getObjectAttr(row,'bdCorp.unitName')}"><g:message code="ywmsFeeBill.bdCorp.label" default="Bd Corp"/></th>
        
        <th field="bg" sortable="true">${message(code: 'ywmsFeeBill.bg.label', default: 'Bg')}</th>
        

        <th field="bght.name" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'bght.name');
        }"><g:message code="ywmsFeeBill.bght.label" default="Bght"/></th>


        
        <th field="billTypeCode" sortable="true">${message(code: 'ywmsFeeBill.billTypeCode.label', default: 'Bill Type Code')}</th>
        
        <th field="billno" sortable="true">${message(code: 'ywmsFeeBill.billno.label', default: 'Billno')}</th>
        

        <th field="billtype.name" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'billtype.name');
        }"><g:message code="ywmsFeeBill.billtype.label" default="Billtype"/></th>


        

        <th field="businessType.name" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'businessType.name');
        }"><g:message code="ywmsFeeBill.businessType.label" default="Business Type"/></th>


        
        <th field="checkDate" sortable="true" data-options="formatter:dateFormate"><g:message code="ywmsFeeBill.checkDate.label" default="Check Date"/></th>
        
        <th field="checker.userRealName" sortable="true" data-options="formatter:function(value,row){return getObjectAttr(row,'checker.userRealName')}"><g:message code="ywmsFeeBill.checker.label" default="Checker"/></th>
        
        <th field="dateCreated" sortable="true" data-options="formatter:dateFormate"><g:message code="ywmsFeeBill.dateCreated.label" default="Date Created"/></th>
        
        <th field="djlj" sortable="true">${message(code: 'ywmsFeeBill.djlj.label', default: 'Djlj')}</th>
        
        <th field="hw.pkInvbasdoc.invname" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'hw.pkInvbasdoc.invname');
        }"><g:message code="ywmsFeeBill.hw.label" default="Hw"/></th>
        
        <th field="hz.pkCubasdoc.custname" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'hz.pkCubasdoc.custname');
        }"><g:message code="ywmsFeeBill.hz.label" default="Hz"/></th>
        
        <th field="je" sortable="true">${message(code: 'ywmsFeeBill.je.label', default: 'Je')}</th>
        
        <th field="jssl" sortable="true">${message(code: 'ywmsFeeBill.jssl.label', default: 'Jssl')}</th>
        
        <th field="lastUpdated" sortable="true" data-options="formatter:dateFormate"><g:message code="ywmsFeeBill.lastUpdated.label" default="Last Updated"/></th>
        
        <th field="makeDate" sortable="true" data-options="formatter:dateFormate"><g:message code="ywmsFeeBill.makeDate.label" default="Make Date"/></th>
        
        <th field="maker.userRealName" sortable="true" data-options="formatter:function(value,row){return getObjectAttr(row,'maker.userRealName')}"><g:message code="ywmsFeeBill.maker.label" default="Maker"/></th>
        
        <th field="vnote" sortable="true">${message(code: 'ywmsFeeBill.vnote.label', default: 'Vnote')}</th>
        
        <th field="xgywdh" sortable="true">${message(code: 'ywmsFeeBill.xgywdh.label', default: 'Xgywdh')}</th>
        
        <th field="ywsl" sortable="true">${message(code: 'ywmsFeeBill.ywsl.label', default: 'Ywsl')}</th>
        

        <th field="yxhqrd.name" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'yxhqrd.name');
        }"><g:message code="ywmsFeeBill.yxhqrd.label" default="Yxhqrd"/></th>


        
    </tr>
    </thead>
</table>



