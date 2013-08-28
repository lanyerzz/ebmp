
<%@ page import="com.app.bd.invmandoc.BdInvmandoc" %>
<g:set var="entityName" value="${message(code: 'bdInvmandoc.label', default: 'BdInvmandoc')}" />
<script>

    function onSelect${pageId}(){

    }

    $(function(){
        $('#tree${pageId}').tree({
            onDblClick:function(node){
                $('#table${pageId}').datagrid({
                    url:'${createLink(action:'query')}?pkInvcl='+node.id
                });
                $('#table${pageId}').datagrid('reload');
            }
        });
    });


    //    更新
    function onUpdate${pageId}(d){
        $.messager.progress();	// display the progress bar

            var isValid = $('#form${pageId}').form('validate');
            if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
                return;
            }

            var obj= $('#form${pageId}').serializeObject();

            $.post( '${createLink(action: 'update')}',obj,function(json){

                var row = $("#table${pageId}").datagrid('getSelected');
                $.messager.progress('close');	// hide progress bar while submit successfully

                if(json.validateerrors!=null){//有错误数据
                    d.showMessage(json);

                    return;
                }
                d.dialog('destroy');

                $("#table${pageId}").datagrid('updateRow',{
                    index:$('#table${pageId}').datagrid('getRowIndex',row),
                    row:json
                });

                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
               },
            'json'
        );
    }



    //修改
    function  onEdit${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择修改节点

            $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id;

        $('<div/>').dialog({
            title:'编辑存货管理档案',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:980,
            height:400,

            href:editurl,
            buttons:[{
                text : '编辑',
                iconCls : 'icon-edit',
                handler : function() {
                    var d = $(this).closest('.window-body');
                    onUpdate${pageId}(d);
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });


    }





</script>


<div class="easyui-layout" fit="true">

    %{--按钮--}%
    <div id="tb${pageId}">
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label',default: '修改')}</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').datagrid('reload')">
            ${message(code: 'default.button.refresh.label',default: '刷新')}
        </a>
    </div>

    %{--左边树形--}%
    <div title="存货分类" region="west" style="width:200px">
        <ul id="tree${pageId}" class="easyui-tree" url="${createLink(action:'queryTree')}?=${id}">

        </ul>

    </div>

    %{--表格--}%
    <div title="存货管理档案" region="center" style="scroll:true">
        <table id="table${pageId}"  class="easyui-datagrid" style="width:400px;height:300px"
               url="${createLink(action: 'query')}"
               rownumbers="true"
               fit="true" toolbar="#tb${pageId}" singleSelect="true" pagination="true" pageSize="30">

            <thead>

            <tr>

                <th field="pkInvbasdoc.invcode" sortable="true" data-options="formatter:function(value,row){
                    if(row.pkInvbasdoc){
                        return row.pkInvbasdoc.invcode;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvmandoc.pkInvbasdoc.invcode.label" default="存货编码"/></th>

                <th field="pkInvbasdoc.invname" sortable="true" data-options="formatter:function(value,row){
                    if(row.pkInvbasdoc){
                        return row.pkInvbasdoc.invname;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvmandoc.pkInvbasdoc.invname.label" default="存货名称"/></th>

                <th field="pkInvbasdoc.bdmeasdoc.measname" sortable="false" data-options="formatter:function(value,row){
                    if(row.pkInvbasdoc){
                        return row.pkInvbasdoc.bdmeasdoc.measname;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvmandoc.pkInvbasdoc.measname.label" default="计量单位"/></th>

                <th field="pkInvbasdoc.invspec" sortable="false" data-options="formatter:function(value,row){
                    if(row.pkInvbasdoc){
                        return row.pkInvbasdoc.invspec;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvmandoc.pkInvbasdoc.invspec.label" default="规格"/></th>

                <th field="pkInvbasdoc.invtype" sortable="false" data-options="formatter:function(value,row){
                    if(row.pkInvbasdoc){
                        return row.pkInvbasdoc.invtype;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvmandoc.pkInvbasdoc.invtype.label" default="型号"/></th>

                <th field="pkCumandoc.pkCubasdoc.custname" sortable="true" data-options="formatter:function(value,row){
                    if(row.pkCumandoc){
                        return row.pkCumandoc.pkCubasdoc.custname;
                    }else{
                        return value;
                    }
                }">${message(code:'bdInvmandoc.pkCumandoc.label',default:'主供应商')}</th>

                <th field="refSalePrice" sortable="true" data-options="align:'right'">${message(code: 'bdInvmandoc.refSalePrice.label', default: '参考售价')}</th>

                <th field="lowestPrice" sortable="true" data-options="align:'right'">${message(code: 'bdInvmandoc.lowestPrice.label', default: '最低售价')}</th>

                <th field="maxPrice" sortable="true" data-options="align:'right'">${message(code: 'bdInvmandoc.maxPrice.label', default: '最高限价')}</th>

                <th field="mantaxItem" sortable="true" >${message(code: 'bdInvmandoc.mantaxItem.label', default: '税目')}</th>

                <th field="accFlag" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.accFlag=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvmandoc.accFlag.label', default: '是否辅币核算成本')}</th>

                <th field="cinvmneCode" sortable="true">${message(code: 'bdInvmandoc.cinvmneCode.label', default: '助记码')}</th>

                <th field="keepWasteRate" sortable="true" data-options="align:'right'">${message(code: 'bdInvmandoc.keepWasteRate.label', default: '保管损耗率')}</th>

                <th field="modifier.userRealName" sortable="false" data-options="formatter:function(value,row){
                    if(row.modifier){
                        return row.modifier.userRealName;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvmandoc.modifier.label" default="修改人"/></th>

                <th field="negAllowed" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.negAllowed=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvmandoc.negAllowed.label', default: '是否允许负库存')}</th>

                <th field="outPriority" sortable="true">${message(code: 'bdInvmandoc.outPriority.label', default: '出库优先级')}</th>

                <th field="outTrackIn" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.outTrackIn=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvmandoc.outTrackIn.label', default: '是否出库跟踪入库')}</th>

                <th field="pkCorp.unitName" sortable="false" data-options="formatter:function(value,row){
                    if(row.pkCorp){
                        return row.pkCorp.unitName;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvmandoc.pkCorp.label" default="公司"/></th>

                <th field="prodArea" sortable="true">${message(code: 'bdInvmandoc.prodArea.label', default: '产地')}</th>

                <th field="qualityDayNum" sortable="true">${message(code: 'bdInvmandoc.qualityDayNum.label', default: '保质期')}</th>

                <th field="qualityManFlag" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.qualityManFlag=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvmandoc.qualityManFlag.label', default: '是否保质期管理')}</th>

                <th field="qualityPeriodUnit" sortable="true">${message(code: 'bdInvmandoc.qualityPeriodUnit.label', default: '保质期单位')}</th>

                <th field="recurrentchkcyc" sortable="true">${message(code: 'bdInvmandoc.recurrentchkcyc.label', default: '定期检验周期')}</th>

                <th field="sealFlag" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.sealFlag=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvmandoc.sealFlag.label', default: '封存标志')}</th>

                <th field="serialManaFlag" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.serialManaFlag=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvmandoc.serialManaFlag.label', default: '是否进行序列号管理')}</th>

                <th field="wholemanaflag" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.wholemanaflag=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvmandoc.wholemanaflag.label', default: '是否批次管理')}</th>

                <th field="memo" sortable="true" >${message(code: 'bdInvmandoc.memo.label', default: '备注')}</th>

            </tr>
            </thead>
        </table>
    </div>


</div>