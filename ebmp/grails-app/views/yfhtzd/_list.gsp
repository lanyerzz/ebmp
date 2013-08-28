<%@ page import="com.app.ywms.ck.fhtzd.Yfhtzd" %>
<g:set var="entityName" value="${message(code: 'yfhtzd.label', default: 'Yfhtzd')}"/>
<script>


    $(function () {
        $('#table${pageId}').datagrid({
            url: "${createLink(action: 'query')}?targetBill=${targetBill}&businessType=${businessType}",

            onDblClickRow: function (rowIndex, rowData) {
                onShow${pageId}();
            },
            view: detailview,
            detailFormatter: function (index, row) {
                return '<div style="padding:2px"><table id="tb-sub${pageId}-' + index + '" ></table></div>';
            },
            onExpandRow: function (index, row) {
                $('#tb-sub${pageId}-' + index).datagrid({
                    url: '${createLink(action: 'queryBody')}?headId=' + row.id + '&targetBill=${targetBill}',
                    fitColumns: true,
                    singleSelect: true,
                    rownumbers: true,

                    height: 'auto',
                    singleSelect: false,
                    columns: [
                        [
                            {field:'billno',title:'${message(code: 'td.billno.label', default: '提单号')}'},
                            {field:'khtdh',title:'${message(code: 'td.khtdh.label')}'},
                            {field:'hc',title:'${message(code: 'td.hc.label')}'},
                            {field:'gh',title:'${message(code: 'td.gh.label')}'},
                            {field:'pc',title:'${message(code: 'td.pc.label')}'},
                            {field:'max',title:'${message(code: 'td.max.label')}'},
                            {field:'bcsy',title:'${message(code: 'td.bcsy.label')}'},
                            {field:'bz',title:'${message(code: 'td.bz.label')}'}
                        ]
                    ],
                    onResize: function () {
                        $('#table${pageId}').datagrid('fixDetailRowHeight', index);
                    },
                    onLoadSuccess: function () {
                        setTimeout(function () {
                            $('#table${pageId}').datagrid('fixDetailRowHeight', index);
                        }, 0);
                    }
                });
                $('#table${pageId}').datagrid('fixDetailRowHeight', index);
            }
        });
    });


    function onOpenQuery${pageId}() {

        $('<div/>').dialog({
            title: '查询',
            iconCls: 'icon-search',
            resizable: true,
            modal: true,

            width: 600,
            height: 500,

            href: '${createLink(action: 'createQuery')}',
            buttons: [
                {
                    text: '查询',
                    iconCls: 'icon-search',
                    handler: function () {
                        var d = $(this).closest('.window-body');
                        onQuery${pageId}(d);
                    }
                }
            ],
            onClose: function () {
                $(this).dialog('destroy');
            }
        });
    }

    function onQuery${pageId}(d) {

        var criters = getCriter${pageId}();

        $('#table${pageId}').datagrid('reload', {queryParams: encodeURI(JSON.stringify(criters))});
        $(d).dialog('destroy');
    }







</script>




%{--表格--}%
<table id="table${pageId}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}"
            singleSelect="true"  pagination="true" pageSize="30">

    <thead>

    <tr>



        <th field="businessType.name"
            sortable="true" data-options="formatter:function(value,row){
                return getObjectAttr(row,'businessType.name');
            }">${message(code: 'yfhtzd.businessType.label', default: 'Business Type')}</th>
        <th field="billdate" sortable="true" data-options="formatter:dateFormate">${message(code: 'yfhtzd.billdate.label', default: 'Billdate')}</th>

        <th field="billno" sortable="true">${message(code: 'yfhtzd.billno.label', default: 'Billno')}</th>

        <th field="khtdh" sortable="true">${message(code: 'yfhtzd.khtdh.label', default: 'Khtdh')}</th>
        <th field="yxrq" sortable="true" data-options="formatter:dateTimeFormate">${message(code: 'yfhtzd.yxrq.label', default: 'Yxrq')}</th>
        <th field="thdw.pkCubasdoc.custname" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'thdw.pkCubasdoc.custname');
        }">${message(code: 'yfhtzd.thdw.label', default: 'Thdw')}</th>

        <th field="hw.pkInvbasdoc.invname" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'hw.pkInvbasdoc.invname');
        }">${message(code: 'yfhtzd.hw.label')}</th>


        <th field="hw.pkInvbasdoc.invspec" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'hw.pkInvbasdoc.invspec');
        }">${message(code: 'yfhtzd.invspec.label')}</th>
        <th field="hw.pkInvbasdoc.invtype" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'hw.pkInvbasdoc.invtype');
        }">${message(code: 'yfhtzd.invtype.label')}</th>


        <th field="shdw.pkCubasdoc.custname" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'shdw.pkCubasdoc.custname');
        }">${message(code: 'yfhtzd.shdw.label')}</th>
        <th field="tzsl" sortable="true">${message(code: 'yfhtzd.tzsl.label', default: 'Tzsl')}</th>

        <th field="cfkz" sortable="true" data-options="formatter:function(value,row){

            if(value==0){
                return '提单内控制超发';
            }else if(value==1){
                return '通知单内控制超发';
            }else if(value==2){
                return '严禁任何形式的超发'
            }

        }">${message(code: 'yfhtzd.cfkz.label', default: 'Cfkz')}</th>

        <th field="zyfs" sortable="true" data-options="formatter:function(value,row){
            if(value=='house'){
                return '管道直放';
            }else if(value=='ship'){
             return '船运';
            }else if(value=='train'){
             return '火车';
            }else if(value=='truck'){
             return '槽车';
            }else if(value=='tz'){
             return '桶装';
            }else if(value=='tzdl'){
             return '定量灌装';
            }
        }">${message(code: 'yfhtzd.zyfs.label', default: 'Zyfs')}</th>

        <th field="ccm" sortable="true">${message(code: 'yfhtzd.ccm.label', default: 'Ccm')}</th>


        <th field="gch" sortable="true">${message(code: 'yfhtzd.gch.label', default: 'Gch')}</th>


        <th field="md" sortable="true">${message(code: 'yfhtzd.md.label', default: 'Md')}</th>

        <th field="tj" sortable="true">${message(code: 'yfhtzd.tj.label', default: 'Tj')}</th>



        <th field="fhzt" sortable="true">${message(code: 'yfhtzd.fhzt.label', default: 'Fhzt')}</th>
        <th field="thtzsjh" sortable="true">${message(code: 'yfhtzd.thtzsjh.label', default: 'Thtzsjh')}</th>
        <th field="yjys" sortable="true" data-options="formatter:booleanFormate">${message(code: 'yfhtzd.yjys.label', default: 'Yjys')}</th>
        <th field="sjrq" sortable="true" data-options="formatter:dateFormate">${message(code: 'yfhtzd.sjrq.label', default: 'Sjrq')}</th>
        <th field="jsr" sortable="true">${message(code: 'yfhtzd.jsr.label', default: 'Jsr')}</th>
        <th field="jsms" sortable="true">${message(code: 'yfhtzd.jsms.label', default: 'Jsms')}</th>




        <th field="bz" sortable="true">${message(code: 'yfhtzd.bz.label', default: 'Bz')}</th>

        <th field="maker.userRealName" sortable="true"
            data-options="formatter:function(value,row){return getObjectAttr(row,'maker.userRealName')}"><g:message
                code="yfhtzd.maker.label" default="Maker"/></th>
        <th field="makeDate" sortable="true" data-options="formatter:dateFormate"><g:message
                code="yfhtzd.makeDate.label" default="Make Date"/></th>


        <th field="checkDate" sortable="true" data-options="formatter:dateFormate"><g:message
                code="yfhtzd.checkDate.label" default="Check Date"/></th>
        <th field="checker.userRealName" sortable="true"
            data-options="formatter:function(value,row){return getObjectAttr(row,'checker.userRealName')}"><g:message
                code="yfhtzd.checker.label" default="Checker"/></th>

        <th field="bdCorp.unitName" sortable="false"
            data-options="formatter:function(value,row){return getObjectAttr(row,'bdCorp.unitName')}"><g:message
                code="yfhtzd.bdCorp.label" default="Bd Corp"/></th>
    </tr>
    </thead>
</table>



