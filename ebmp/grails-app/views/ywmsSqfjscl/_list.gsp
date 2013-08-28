
<%@ page import="com.app.ywms.ck.zmtd.Yzmtdh" %>
<g:set var="entityName" value="${message(code: 'yzmtdh.label', default: 'Yzmtdh')}" />
<script>


    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?refQuery=${refQuery?:false}&targetBill=${targetBill}"


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
            <th field="fyjs">计算费用</th>
            <th field="jszt">结算状态</th>
            <th field="billtype">合同类型</th>
            <th field="fyjs">入库类型</th>
            <th field="ht">合同号</th>
            <th field="pch">批次号</th>
            <th field="hc">航次</th>
            <th field="rkrq">入库日期</th>
            <th field="cqksrq">超期开始日期</th>
            <th field="fyjs">费用追踪号</th>
            <th field="fyjs">装卸载消耗</th>
            <th field="fyjs">超期消耗</th>
            <th field="fyjs">消耗合计</th>
            <th field="fyjs">免仓储天数</th>
            <th field="fyjs">首期仓储单价</th>
            <th field="fyjs">装卸费单价</th>
            <th field="fyjs">超期单价</th>
            <th field="fyjs">仓储费周期</th>
            <th field="fyjs">超期累加</th>
            <th field="fyjs">仓储费计算方式</th>
            <th field="fyjs">计算超损</th>
            <th field="fyjs">超损起算日期</th>
            <th field="fyjs">超损周期</th>
            <th field="fyjs">超损比例</th>
            <th field="fyjs">码头服务费单价</th>
            <th field="fyjs">港口保安费单价</th>
            <th field="fyjs">货主</th>
            <th field="fyjs">转出单位</th>
            <th field="fyjs">货物名称</th>
            <th field="fyjs">客户提单号</th>
            <th field="fyjs">未开计算单费用</th>
            <th field="fyjs">减免总额</th>
            <th field="fyjs">申请中发票金额</th>
            <th field="fyjs">未开发票金额</th>
            <th field="fyjs">已收款金额</th>
            <th field="fyjs">应收款金额</th>
            <th field="fyjs">备注</th>

        </tr>
        </thead>
    </table>




