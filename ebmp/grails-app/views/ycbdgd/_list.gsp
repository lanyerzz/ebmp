
<%@ page import="com.app.ywms.rk.cbdgd.Ycbdgd" %>
<g:set var="entityName" value="${message(code: 'ycbdgd.label', default: 'Ycbdgd')}" />

<script>
    $(function(){

        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?targetBill=${targetBill}&businessType=${businessType}",
            view: detailview,
            onDblClickRow:function(rowIndex, rowData){
                onShow${pageId}();
            },
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table id="table-sub${pageId}-' + index + '"  name="table-sub${pageId}"></table></div>';
            },
            onExpandRow: function(index,row){

                $('#table-sub${pageId}-'+index).datagrid({
                    url:'${createLink(action: 'queryBody')}?headId='+row.id+'&targetBill=${targetBill}',
                    fitColumns:true,
//                    singleSelect:true,
                    rownumbers:true,
                    //loadMsg:'',
                    height:'auto',
                    columns:[[
                        {field:'bdInvmandoc.pkInvbasdoc.invcode',title:'<g:message code="bdInvmandoc.pkInvbasdoc.invcode.label" />',width:100,formatter:function(value,row){
                            if(row.bdInvmandoc==null) return '';
                            return row.bdInvmandoc.pkInvbasdoc.invcode;
                        }},
                        {field:'bdInvmandoc.pkInvbasdoc.invname',title:'<g:message code="bdInvmandoc.pkInvbasdoc.invname.label" />',width:100,formatter:function(value,row){
                            if(row.bdInvmandoc==null) return '';
                            return row.bdInvmandoc.pkInvbasdoc.invname;
                        }},
                        {field:'tdsl',title:'${message(code: 'ycbdgdB.tdsl.label', default: 'tdsl')}',align:'right'},
                        {field:'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname',title:'${message(code: 'ycbdgdB.jldw.label', default: '单位')}',width:100,formatter:function(value,row){

                            return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname');
                        }},
                        {field:'hzdw.pkCubasdoc.custname',title:'${message(code: 'ycbdgdB.hzdw.label', default: 'hzdw')}',width:100,formatter:function(value,row){

                            if(row.cddw==null || row.cddw.pkCubasdoc.custname==null) return value;
                            return row.cddw.pkCubasdoc.custname;
                        }},

                        {field:'cddw.pkCubasdoc.custname',title:'${message(code: 'ycbdgdB.cddw.label', default: 'cddw')}',width:100,formatter:function(value,row){

                            if(row.cddw==null || row.cddw.pkCubasdoc.custname==null) return value;
                            return row.cddw.pkCubasdoc.custname;
                        }},
                        {field:'kzdw.pkCubasdoc.custname',title:'${message(code: 'ycbdgdB.kzdw.label', default: 'kzdw')}',width:100,formatter:function(value,row){

                            if(row.kzdw==null || row.kzdw.pkCubasdoc.custname==null) return value;
                            return row.kzdw.pkCubasdoc.custname;
                        }},
                        {field:'pch',title:'${message(code: 'ycbdgdB.pch.label')}',width:100},
                        {field:'ccqyhth.contrantNo',title:'${g.message(code:'ycbdgd.ccqyhth.label')}',width:100,formatter:function(value,row,index){return getObjectAttr(row,'ccqyhth.contractNo');}},
                        {field:'ccqyhth.contrantNo2',title:'${message(code: 'baseContract.contractNo2.label')}',width:100,formatter:function(value,row,index){return getObjectAttr(row,'ccqyhth.contractNo2');}},
                        {field:'ccqyhth.signDate',title:'${message(code: 'ycbdgd.htqdrq.label', default: 'Htqdrq')}',width:100,formatter:function(value,row,index){

                            return  dateFormate(getObjectAttr(row,'ccqyhth.signDate'));
                        }},
                        {field:'yjxhgh',title:'${message(code: 'ycbdgdB.yjxhgh.label')}',width:100},
                        {field:'note',title:'${message(code: 'yhyjhB.note.label')}',width:100}
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






    //打开查询页面
    function onOpenQuery${pageId}(){
        //$('#query${pageId}').dialog('open');
        $('<div/>').dialog({
            title:'查询',
            iconCls:'icon-search',
            resizable:true,
            modal:true,
//            fit:true,
            width :600,
            height:500,
            // inline:true,
            href:'${createLink(action: 'createQuery')}?refQuery=${reQuery?:false}',
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
        d.dialog('destroy');
    }

</script>




%{--表格--}%
<table id="table${pageId}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        
        <th field="billno" sortable="true" width="100">${message(code: 'ycbdgd.billno.label', default: 'Billno')}</th>
        
        <th field="billdate" sortable="true"  width="60" data-options="formatter:dateFormate">${message(code: 'ycbdgd.billdate.label', default: 'Billdate')}</th>

        <th field="businessType.name"   width="100" sortable="true" data-options="formatter:function(value,row){

            return getObjectAttr(row,'businessType.name');
        }">${message(code: 'ycbdgd.businessType.label')}</th>

        <th field="chuanming.shipname"  width="100" sortable="true" data-options="formatter:function(value,row){

            return getObjectAttr(row,'chuanming.shipname');
        }">${message(code: 'ycbdgd.chuanming.label', default: 'Chuanming')}</th>

        <th field="yjdgrq"  width="60" sortable="true" data-options="{formatter:dateFormate">${message(code: 'ycbdgd.yjdgrq.label', default: 'Yjdgrq')}</th>

        <th field="note"  width="100" sortable="true">${message(code: 'ycbdgd.note.label', default: 'Note')}</th>

        <th field="maker"  width="100" sortable="false" data-options="formatter:function(value,row){
            if(row.maker){
                return row.maker.userRealName;
            }else{
                return value;
            }
        }"><g:message code="ycbdgd.maker.label" default="Maker"/></th>

        <th field="makeDate"  width="100" sortable="true" data-options="{formatter:dateFormate">${message(code: 'ycbdgd.makeDate.label', default: 'Make Date')}</th>

        <th field="checker"  width="100" sortable="false" data-options="formatter:function(value,row){
            if(row.checker){
                return row.checker.userRealName;
            }else{
                return value;
            }
        }"><g:message code="ycbdgd.checker.label" default="Checker"/></th>

        <th field="checkDate"   width="100" sortable="true" data-options="formatter:dateFormate">${message(code: 'ycbdgd.checkDate.label', default: 'Check Date')}</th>



    </tr>
    </thead>
</table>



