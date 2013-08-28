
<%@ page import="com.app.ywms.ck.zmtd.Yzmtdh" %>
<g:set var="entityName" value="${message(code: 'yzmtdh.label', default: 'Yzmtdh')}" />
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
                    url:'${createLink(action: 'queryBody')}?id='+row.id+'&targetBill=${targetBill}',
                    fitColumns:true,
                    singleSelect:true,
                    rownumbers:true,
                    //loadMsg:'',
                    height:'auto',
                    singleSelect:false,
                    columns:[[
                        {field:'rk.ht.contractNo',title:'<g:message code="baseContract.contractNo.label" />',formatter:function(value,row){
                            return getObjectAttr(row,'rk.ht.contractNo');
                        }},
                        {field:'rk.ht.contractNo2',title:'<g:message code="baseContract.contractNo2.label" />',formatter:function(value,row){
                            return getObjectAttr(row,'rk.ht.contractNo2');
                        }},
                        {field:'rk.pc',title:'${message(code: 'yzmtdb.pc.label')}',align:'right',formatter:function(value,row){return getObjectAttr(row,'rk.pc');}},

                        {field:'rk.sourceBillType.billtypename',title:'${message(code: 'yzmtdb.sourceBillType.billtypename.label')}',formatter:function(value,row){

                            return getObjectAttr(row,'rk.sourceBillType.billtypename');
                        }},
                        {field:'rk.sourceBillCode',title:'${message(code: 'yzmtdb.sourceBillCode.label')}',formatter:function(value,row){

                            return getObjectAttr(row,'rk.sourceBillCode');
                        }},
                        {field:'tdsl',title:'${message(code: 'yzmtdh.tdsl.label')}',formatter:function(value,row){
                            return getObjectAttr(row,'rk.insl');
                        }},
                        {field:'bcky',title:'${message(code: 'yzmtdb.bcky.label')}'},
                        {field:'bcsy',title:'${message(code: 'yzmtdb.bcsy.label')}'},
                        {field:'vnote',title:'${message(code: 'yzmtdb.vnote.label')}'}
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
    <table id="table${pageId}"  class="easyui-datagrid"
           url="${createLink(action: 'query')}"
           rownumbers="true"
           fit="true" toolbar="#tb${pageId}" singleSelect="true"  pagination="true" pageSize="30">

        <thead>
        <tr>
            <th colspan="5">基本信息</th>
            <th colspan="4">转出方信息</th>
            <th colspan="2">转入方信息</th>
            <th colspan="13">其他信息</th>
        </tr>
        </thead>
        <thead frozen="true">
        <tr>
            <th field="billno" sortable="true">${message(code: 'yzmtdh.billno.label', default: 'Billno')}</th>
            <th field="billdate" sortable="true" data-options="formatter:dateFormate">${message(code: 'yzmtdh.billdate.label', default: 'Billdate')}</th>
            <th field="businessType.name" sortable="false" data-options="formatter:function(value,row){
                return getObjectAttr(row,'businessType.name');
            }"><g:message code="yzmtdh.businessType.label" default="Business Type"/></th>

        </tr>
        </thead>
        <thead>
        <tr>
            <th field="khtdh" sortable="true">${message(code: 'yzmtdh.khtdh.label', default: 'Khtdh')}</th>
            <th field="zmlx" sortable="true" data-options="
                formatter:function(value,row){
                    if(value=='0'){
                        return '提货权转卖';
                    }else if(value==1){
                        return '货权转卖';
                    }else if(value==2){
                        return '不可撤销转卖';
                    }
                    %{--return 'xxxx';--}%
                }
            ">${message(code: 'yzmtdh.zmlx.label', default: 'Zmlx')}</th>


            %{--[index:'fax',value:'传真件提货'],[index:'jsx',value:'介绍信原件'],[index:'sw',value:'商务确认单证'],[index:'yj',value:'提货单原件']]--}%
            <th field="tzfs" sortable="true" data-options="formatter:function(value,row){
                    if(value=='fax'){
                        return '传真件提货';
                    }else if(value=='jsx'){
                        return '介绍信原件';
                    }else if(value=='sw'){
                        return '商务确认单证';
                    }else if(value=='yj'){
                        return '提货单原件';
                    }
            }">${message(code: 'yzmtdh.tzfs.label', default: 'Tzfs')}</th>


            <th field="yjqr" sortable="true" data-options="
                formatter:booleanFormate
            ">${message(code: 'yzmtdh.yjqr.label', default: 'Yjqr')}</th>

            <th field="yxrq" sortable="true" data-options="formatter:dateFormate">${message(code: 'yzmtdh.yxrq.label', default: 'Yxrq')}</th>

            <th field="zcdw.pkCubasdoc.custname" sortable="true" data-options="formatter:function(value,row){
                return getObjectAttr(row,'zcdw.pkCubasdoc.custname');
            }"><g:message code="yzmtdh.zcdw.label" default="Zcdw"/></th>
            <th field="hw.pkInvbasdoc.invname" sortable="true"  data-options="formatter:function(value,row){
                return getObjectAttr(row,'hw.pkInvbasdoc.invname');
            }"><g:message code="yzmtdh.hw.label" default="Hw"/></th>

            <th field="tdsl" sortable="true">${message(code: 'yzmtdh.tdsl.label', default: 'Tdsl')}</th>
            <th field="szsl" sortable="true">${message(code: 'yzmtdh.szsl.label', default: 'Szsl')}</th>

            <th field="zrdw.pkCubasdoc.custname" sortable="true" data-options="
                formatter:function(value,row){
                    return getObjectAttr(row,'zrdw.pkCubasdoc.custname');
                }
            "><g:message code="yzmtdh.zrdw.label" default="Zrdw"/></th>
            <th field="sfthffccf" sortable="true" data-options="
                formatter:booleanFormate
            ">${message(code: 'yzmtdh.sfthffccf.label', default: 'Sfthffccf')}</th>

            <th field="dshk" sortable="true" data-options="
                formatter:booleanFormate
            ">${message(code: 'yzmtdh.dshk.label', default: 'Dshk')}</th>
            <th field="hwdj" sortable="true">${message(code: 'yzmtdh.hwdj.label', default: 'Hwdj')}</th>
            <th field="jsfs.name" sortable="true" data-options="
                formatter:function(value,row){
                    return getObjectAttr(row,'jsfs.name');
                }
            "><g:message code="yzmtdh.jsfs.label" default="Jsfs"/></th>
            <th field="thtzsj" sortable="true">${message(code: 'yzmtdh.thtzsj.label', default: 'Thtzsj')}</th>
            <th field="sfysqyj" sortable="true">${message(code: 'yzmtdh.sfysqyj.label', default: 'Sfysqyj')}</th>

            <th field="sqsj" sortable="true" data-options="
                formatter:dateFormate
            ">${message(code: 'yzmtdh.sqsj.label', default: 'Sqsj')}</th>

            <th field="jsr.psnname" sortable="true" data-options="
                formatter:function(value,row){
                    return getObjectAttr(row,'jsr.psnname');

                }
            "><g:message code="yzmtdh.jsr.label" default="Jsr"/></th>







            <th field="jsms" sortable="true">${message(code: 'yzmtdh.jsms.label', default: 'Jsms')}</th>

            <th field="maker.userRealName" sortable="true" data-options="
                formatter:function(value,row){
                    return getObjectAttr(row,'maker.userRealName');
                }
            "><g:message code="yzmtdh.maker.label" default="Maker"/></th>
            <th field="makeDate" sortable="true" data-options="
                formatter:dateFormate
            ">${message(code: 'yzmtdh.makeDate.label', default: 'Make Date')}</th>


            %{--<th field="khyxrq" sortable="true">${message(code: 'yzmtdh.khyxrq.label', default: 'Khyxrq')}</th>--}%
            <th field="checker.userRealName" sortable="true" data-options="
                formatter:function(value,row){
                    return getObjectAttr(row,'checker.userRealName');
                }
            "><g:message code="yzmtdh.checker.label" default="Checker"/></th>

            <th field="checkDate" sortable="true" data-options="
                formatter:dateFormate
            ">${message(code: 'yzmtdh.checkDate.label', default: 'Check Date')}</th>


            <th field="bdCorp.unitName" sortable="false" data-options="
                formatter:function(value,row){
                    return getObjectAttr(row,'bdCorp.unitName');
                }
            "><g:message code="yzmtdh.bdCorp.label" default="Bd Corp"/></th>

        </tr>
        </thead>
    </table>




