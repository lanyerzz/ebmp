
<%@ page import="com.app.so.rec.SoRec" %>
<g:set var="entityName" value="${message(code: 'soRec.label', default: 'SoRec')}" />
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
                    columns:[[{field:'currtype.currtypename',title:'${message(code: 'soRecBody.currtype.label')}',formatter:function(value,row){
                        return getObjectAttr(row,'currtype.currtypename');
                    }},
                        {field:'ssje',title:'${message(code: 'soRecBody.ssje.label')}'},
                        {field:'hl',title:'${message(code:'soRecBody.hl.label')}'},
                        {field:'hxje',title:'${message(code:'soRecBody.hxje.label')}'}
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
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        


        
        <th field="billdate" sortable="true" data-options="formatter:dateFormate">${message(code: 'soRec.billdate.label', default: 'Billdate')}</th>
        
        <th field="billno" sortable="true">${message(code: 'soRec.billno.label', default: 'Billno')}</th>


        <th field="businessType.name" sortable="false" data-options="formatter:function(value,row){
            return getObjectAttr(row,'businessType.name');
        }"><g:message code="soRec.businessType.label" default="Business Type"/></th>

        <th field="zk" sortable="true">${message(code: 'soRec.zk.label', default: 'Zk')}</th>
        <th field="hxje" sortable="true">${message(code: 'soRec.hxje.label', default: 'Hxje')}</th>

        <th field="maker.userRealName" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'maker.userRealName');
        }"><g:message code="soRec.maker.label" default="Maker"/></th>

        <th field="makeDate" sortable="true" data-options="formatter:dateFormate">${message(code: 'soRec.makeDate.label', default: 'Make Date')}</th>

        <th field="checker.userRealName" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'checker.userRealName');
        }"><g:message code="soRec.checker.label" default="Checker"/></th>
        <th field="checkDate" sortable="true" data-options="formatter:dateFormate">${message(code: 'soRec.checkDate.label', default: 'Check Date')}</th>





        


        
        <th field="vnote" sortable="true">${message(code: 'soRec.vnote.label', default: 'Vnote')}</th>

        <th field="bdCorp.unitName" sortable="false" data-options="formatter:function(value,row){
            return getObjectAttr(row,'bdCorp.unitName');
        }"><g:message code="soRec.bdCorp.label" default="Bd Corp"/></th>
        
    </tr>
    </thead>
</table>



