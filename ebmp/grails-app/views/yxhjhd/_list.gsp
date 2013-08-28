
<%@ page import="com.app.ywms.rk.xhjhd.Yxhjhd" %>
<g:set var="entityName" value="${message(code: 'yxhjhd.label', default: 'Yxhjhd')}" />
<script>
    $(function(){
        $('#table${pageId}').datagrid({
            view: detailview,
            onDblClickRow:function(rowIndex, rowData){
                onShow${pageId}();
            },
            url:"${createLink(action: 'query')}?targetBill=${targetBill}&businessType=${businessType}",
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table id="tb-sub${pageId}-' + index + '"></table></div>';
            },
            onExpandRow: function(index,row){
                $('#tb-sub${pageId}-'+index).datagrid({
                    url:"${createLink(action: 'queryBody')}?headId="+row.id+"&targetBill=${targetBill}",
//                    fitColumns:true,
//                    singleSelect:true,
                    rownumbers:true,
                    //loadMsg:'',
                    height:'auto',
                    columns:[[
                        {field:'hc',title:'<g:message code="yxhjhdB.hc.label"/>',width:100},
                        {field:'bdCumandoc.pkCubasdoc.custcode',title:'<g:message code="bdCumandoc.pkCubasdoc.custcode.label" />',formatter:function(value,row){
                            if(row.bdCumandoc==null) return value;
                            return row.bdCumandoc.pkCubasdoc.custcode;
                        },width:100},
                        {field:'bdCumandoc.pkCubasdoc.custname',title:'<g:message code="bdCumandoc.pkCubasdoc.custname.label" />',formatter:function(value,row){
                            if(row.bdCumandoc==null) return value;
                            return row.bdCumandoc.pkCubasdoc.custname;
                        },width:100},
                        {field:'bdInvmandoc.pkInvbasdoc.invcode',title:'<g:message code="bdInvmandoc.pkInvbasdoc.invcode.label" />',formatter:function(value,row){
                            if(row.bdInvmandoc==null) return value;
                            return row.bdInvmandoc.pkInvbasdoc.invcode;
                        },width:100},
                        {field:'bdInvmandoc.pkInvbasdoc.invname',title:'<g:message code="bdInvmandoc.pkInvbasdoc.invname.label" />',formatter:function(value,row){
                            if(row.bdInvmandoc==null) return value;
                            return row.bdInvmandoc.pkInvbasdoc.invname;
                        },width:100},

                        {field:'tdsl',title:'${message(code: 'yxhjhdB.tdsl.label')}',align:'right',width:100},
                        {field:'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname',title:'${message(code: 'yxhjhdB.jldw.label', default: '单位')}',formatter:function(value,row){

                            return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname');
                        },width:100},
                        {field:'mtfw',title:'${message(code: 'yxhjhdB.mtfw.label')}',formatter:function(value,row){
                            if(row.mtfw=='true'){
                                return '是';
                            }else{
                                return '否';
                            }
                        },width:100},
                        {field:'zgzf',title:'${message(code: 'yxhjhdB.zgzf.label')}',formatter:function(value,row){
                            if(row.zgzf=='true'){
                                return '是';
                            }else{
                                return '否';
                            }
                        },width:100},
                        {field:'tsjc',title:'${message(code: 'yxhjhdB.tsjc.label')}',formatter:function(value,row){
                            if(row.tsjc=='true'){
                                return '是';
                            }else{
                                return '否';
                            }
                        },width:100},
                        {field:'bs',title:'${message(code: 'yxhjhdB.bs.label')}',formatter:function(value,row){
                            if(row.bs=='true'){
                                return '是';
                            }else{
                                return '否';
                            }
                        },width:100},
                        {field:'ywy.psnname',title:'${message(code: 'yxhjhdB.ywy.label')}',formatter:function(value,row){
                            if(row.ywy==null||row.ywy.psnname==null){
                                return value;
                            }
                            return row.ywy.psnname;
                        },width:100},
                        {field:'pch',title:'${message(code: 'yxhjhdB.pch.label')}'},
                        {field:'xghth.contractNo',title:'${message(code: 'baseContract.contractNo.label')}',formatter:function(value,row){
                           return getObjectAttr(row,'xghth.contractNo');
                        },width:100},
                        {field:'xghth.contractNo2',title:'${message(code: 'baseContract.contractNo2.label')}',formatter:function(value,row){
                        return getObjectAttr(row,'xghth.contractNo2');
                        },width:100},

                        {field:'khtdh',title:'${message(code: 'yxhjhdB.khtdh.label')}',width:100},
                        {field:'cddw.pkCubasdoc.custname',title:'${message(code: 'yxhjhdB.cddw.label')}',formatter:function(value,row){
                            if(row.cddw==null||row.cddw.pkCubasdoc.custname==null) return value;
                            return row.cddw.pkCubasdoc.custname;
                        },width:100},
                        {field:'ddtzsj',title:'${message(code: 'yxhjhdB.ddtzsj.label')}',width:100},
                        {field:'closed',title:'${message(code: 'yxhjhdB.closed.label')}',width:100},
                        {field:'note',title:'${message(code: 'yxhjhdB.note.label')}',width:100}
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
        //  $('#query${pageId}').dialog('open');

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
<table id="table${pageId}"  class="easyui-datagrid"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true" pagination="true" pageSize="30">

    <thead>

    <tr>

        
        <th field="billno" sortable="true" width="100">${message(code: 'yxhjhd.billno.label', default: 'Billno')}</th>

        <th field="businessType.name" sortable="true" width="100" data-options="formatter:function(value,row){
            if(row.businessType==null)return value;
            return row.businessType.name;
        }">${message(code: 'yxhjhd.businessType.label')}</th>

        <th field="zxlx" sortable="true" width="100" data-options="formatter:function(value,row){
            if(row.zxlx==0){
                return '卸货';
            }else if(row.zxlx==1){
                return '装货';
            }else{
                return value;
            }
        }">${message(code: 'yxhjhd.zxlx.label', default: 'Zxlx')}</th>

        <th field="myxz" sortable="true" width="100" data-options="formatter:function(value,row){
            if(row.myxz==0){
                return '内贸';
            }else if(row.myxz==1){
                return '外贸';
            }else{
                return value;
            }
        }">${message(code: 'yxhjhd.myxz.label', default: 'Myxz')}</th>

        <th field="yykhqr" sortable="true" width="100" data-options="formatter:function(value,row){
            if(row.yykhqr=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'yxhjhd.yykhqr.label', default: 'Yykhqr')}</th>

        <th field="shipdoc.shipname" sortable="true" width="100" data-options="formatter:function(value,row){
            if(row.shipdoc==null||row.shipdoc.shipname==null) return value;
            return row.shipdoc.shipname;
        }"><g:message code="yxhjhd.shipdoc.label" default="Shipdoc"/></th>

        <th field="yjdgrq" sortable="true" width="100" data-options="formatter:dateFormate">${message(code: 'yxhjhd.yjdgrq.label', default: 'Yjdgrq')}</th>

        <th field="cddw.pkCubasdoc.custname" sortable="true" width="100" data-options="formatter:function(value,row){
            if(row.cddw==null||row.cddw.pkCubasdoc.custname==null) return value;
            return row.cddw.pkCubasdoc.custname;
        }"><g:message code="yxhjhd.cddw.label" default="Cddw"/></th>

        <th field="lygk" sortable="true" width="100">${message(code: 'yxhjhd.lygk.label', default: 'Lygk')}</th>

        <th field="ddtzsj" sortable="true" width="100">${message(code: 'yxhjhd.ddtzsj.label', default: 'Ddtzsj')}</th>

        <th field="fsdx" sortable="true" width="100" data-options="formatter:function(value,row){
            if(row.fsdx=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'yxhjhd.fsdx.label', default: 'Fsdx')}</th>

        <th field="maker.userRealName" sortable="true" width="100" data-options="formatter:function(value,row){
            if(row.maker==null||row.maker.userRealName==null) return value;
            return row.maker.userRealName;
        }"><g:message code="yxhjhd.maker.label" default="Maker"/></th>

        <th field="makeDate" sortable="true" width="100" data-options="formatter:dateFormate">${message(code: 'yxhjhd.makedate.label', default: 'Makedate')}</th>

        <th field="checker.userRealName" sortable="true" width="100" data-options="formatter:function(value,row){
            if(row.checker==null||row.checker.userRealName==null) return value;
            return row.checker.userRealName;
        }"><g:message code="yxhjhd.signer.label" default="Signer"/></th>

        <th field="checkDate" sortable="true" width="100" data-options="formatter:dateFormate">${message(code: 'yxhjhd.signdate.label', default: 'Signdate')}</th>

        <th field="qtms" sortable="true" width="100">${message(code: 'yxhjhd.qtms.label', default: 'Qtms')}</th>

        <th field="note" sortable="true" width="100">${message(code: 'yxhjhd.note.label', default: 'Note')}</th>
        
        <th field="bdCorp.unitName" sortable="false" width="100" data-options="formatter:function(value,row){
            if(row.bdCorp==null||row.bdCorp.unitName==null) return value;
            return row.bdCorp.unitName;
        }"><g:message code="yxhjhd.bdCorp.label" default="Bd Corp"/></th>





    </tr>
    </thead>
</table>



