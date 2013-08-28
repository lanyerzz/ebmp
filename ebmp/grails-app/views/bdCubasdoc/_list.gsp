
<%@ page import="com.app.bd.cubasdoc.BdCubasdoc" %>
<g:set var="entityName" value="${message(code: 'bdCubasdoc.label', default: 'BdCubasdoc')}" />
<script>



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




    //    保存
    function onSave${pageId}(d){

        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
        $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var obj= $('#form${pageId}').serializeObject();

        $.post( '${createLink(action: 'save')}',obj,function(json){

                var row = $("#table${pageId}").datagrid('getSelected');
                    $.messager.progress('close');	// hide progress bar while submit successfully

                if(json.validateerrors!=null){//有错误数据
                    d.showMessage(json);

                    return;
                }
                d.dialog('destroy');

                $("#table${pageId}").datagrid('insertRow',{
                    index:0,
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

    //增加
    function onAdd${pageId}(){
        var node = $('#tree${pageId}').tree('getSelected');
        var isLeaf = $('#tree${pageId}').tree('isLeaf',node.target);
        if(node==null){
            $.messager({
                title:'警告',
                msg:'请选择地区分类'
            });
            return;
        }
        if(isLeaf==false){
            $.messager.show({
                title:'警告',
                msg:'请在末级节点添加档案'
            });
            return;
        }
        var addurl='${createLink(action: 'create')}/'+node.id
        $('<div/>').dialog({
            title:'添加客商基本档案',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:1000,
            height:500,

            href:addurl,
            buttons:[{
                text : '增加',
                iconCls : 'icon-add',
                handler : function() {
                    var d = $(this).closest('.window-body');
                    onSave${pageId}(d);
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });

    }

    //修改
    function  onEdit${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择修改节点

            $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id

        $('<div/>').dialog({
            title:'编辑',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:1000,
            height:500,

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

    //        删除
    function onDelete${pageId}(){

        var row=$('#table${pageId}').datagrid('getSelected');
        var index = $('#table${pageId}').datagrid('getRowIndex',row);
        if(row==null){
        $.messager.show({
                title:'消息',
                msg:'请选择需要删除的数据！'
            });
            return;
        };
        $.messager.confirm('${message(code:'default.delete.message',default: '删除数据')}',
                '${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}',
                function(r){
                    if(r){


                    $.post('${createLink(action: 'delete')}', { id: row.id },
                                function(data){
                                    $('#table${pageId}').datagrid('deleteRow',index);
                                    $.messager.show({
                                        title:'消息',
                                        msg:'数据已经删除！'
                                    });
                                });
                    }
                }
        );
    }

    function onOpenQuery${pageId}(){
        $('#query${pageId}').dialog('open');
    }

    function onQuery${pageId}(){
        $('#query${pageId}').dialog('close');
        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
    }

    function onOpenAllotDlg${pageId}(){
        var node = $('#tree${pageId}').tree('getSelected');
        if(node == null){
            $.messager.show({
                title:'警告',
                msg:'请选择地区分类！'
            });
            return;
        }
        $('<div/>').dialog({
            title:'分配',
            resizable:false,
            modal:true,
            width:600,
            height:500,

            href:'${createLink(action:'openAllotDlg')}?pkAreacl='+node.id,
            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }

    $(function(){
        $('#tree${pageId}').tree({
            onDblClick:function(node){
                $('#table${pageId}').datagrid('options').url='${createLink(action:'query')}'
                var obj=createCriterias('and')
                addCriteria(obj,[opt_equals,'pkAreacl.id',node.id])
                $('#table${pageId}').datagrid('reload',{queryParams:JSON.stringify(obj)});
            }
        });
    });

</script>

%{--查询窗口--}%
<div id="query${pageId}" title="查询" class="easyui-dialog" data-options="buttons:'#query-buttons${pageId}',resizable:true,closed:true,width:600,height:500" modal="true" href="${createLink(action: 'createQuery')}" ></div>
<div id="query-buttons${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true"  onclick="onQuery${pageId}() ">
        ${message(code: 'default.button.query.label',default: '查询')}
    </a>
</div>

%{--按钮--}%
<div id="tb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAdd${pageId}() ">
        ${message(code: 'default.button.create.label',default: '增加')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label',default: '修改')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">
        ${message(code: 'default.button.delete.label',default: '删除')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').datagrid('reload')">
        ${message(code: 'default.button.refresh.label',default: '刷新')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
        ${message(code: 'default.button.query.label',default: '查询')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="" plain="true" onclick="onOpenAllotDlg${pageId}()">${message(code: 'default.button.allot.label',default: '分配')}</a>
</div>
<div class="easyui-layout" fit="true">
    <div title="地区分类" region="west" style="width:200px">
        <ul id="tree${pageId}" class="easyui-tree" url="${createLink(action:'queryTree')}?=${id}">

        </ul>
    </div>
    <div region="center" title="客商基本档案">
        %{--表格--}%
        <table id="table${pageId}"  class="easyui-datagrid"
               url="${createLink(action: 'query')}"
               rownumbers="true"
               fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

            <thead>

            <tr>


                <th field="custcode" sortable="true">${message(code: 'bdCubasdoc.custcode.label', default: 'Custcode')}</th>

                <th field="custname" sortable="true">${message(code: 'bdCubasdoc.custname.label', default: 'Custname')}</th>

                <th field="custshortname" sortable="true">${message(code: 'bdCubasdoc.custshortname.label', default: '客商简称')}</th>

                <th field="custprop" sortable="true" data-options="formatter:function(value,row){
                    if(row.custprop==0){
                        return '外部单位';
                    }else if(row.custprop==1){
                        return '内部单位';
                    }else{
                        return '';
                    }
                }">${message(code: 'bdCubasdoc.custprop.label', default: '客商类型')}</th>

                <th field="engname" sortable="true">${message(code: 'bdCubasdoc.engname.label', default: '外文名称')}</th>

                <th field="blockUp" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.blockUp=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.blockUp.label', default: '停用')}</th>

                <th field="mnecode" sortable="true">${message(code: 'bdCubasdoc.mnecode.label', default: '助记码')}</th>

                <th field="pkCorp.unitName" sortable="false" data-options="formatter:function(value,row){
                    if(row.pkCorp){
                        return row.pkCorp.unitName;
                    }else{
                        return value;
                    }
                }"><g:message code="bdCubasdoc.pkCorp.label" default="公司主键"/></th>



                <th field="signClient" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.signClient=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.signClient.label', default: '签约客户')}</th>

                <th field="trader" sortable="true"data-options="align:'center',formatter:function(value,row){
                    if(row.trader=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.trader.label', default: '贸易商')}</th>

                <th field="deliveryCorp" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.deliveryCorp=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.deliveryCorp.label', default: '提货单位')}</th>

                <th field="agentCorp" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.agentCorp=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.agentCorp.label', default: '代理单位')}</th>

                <th field="openingCorp" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.openingCorp=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.openingCorp.label', default: '开证单位')}</th>

                <th field="exchange" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.exchange=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.exchange.label', default: '交易所')}</th>

                <th field="transitwarehouse" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.transitwarehouse=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.transitwarehouse.label', default: '中转库区')}</th>

                <th field="useWhenStorage" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.useWhenStorage=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.useWhenStorage.label', default: '入库时使用')}</th>




                <th field="legalbody" sortable="true">${message(code: 'bdCubasdoc.legalbody.label', default: '法人代表')}</th>

                <th field="conaddr" sortable="true">${message(code: 'bdCubasdoc.conaddr.label', default: '通信地址')}</th>

                <th field="fax" sortable="true">${message(code: 'bdCubasdoc.fax.label', default: '传真')}</th>

                <th field="url" sortable="true">${message(code: 'bdCubasdoc.url.label', default: 'Url')}</th>

                <th field="zipcode" sortable="true">${message(code: 'bdCubasdoc.zipcode.label', default: '邮政编码')}</th>

                <th field="email" sortable="true">${message(code: 'bdCubasdoc.email.label', default: 'Email')}</th>

                <th field="recordInfo" sortable="true">${message(code: 'bdCubasdoc.recordInfo.label', default: '备案信息')}</th>

                <th field="sampleGuarantee" sortable="true" data-options="{formatter:dateFormate">${message(code: 'bdCubasdoc.sampleGuarantee.label', default: '样张有效期')}</th>



                <th field="contractLinkman" sortable="true">${message(code: 'bdCubasdoc.contractLinkman.label', default: '合同联系人')}</th>

                <th field="phone1" sortable="true">${message(code: 'bdCubasdoc.phone1.label', default: '联系电话')}</th>

                <th field="fax1" sortable="true">${message(code: 'bdCubasdoc.fax1.label', default: '传真')}</th>

                <th field="invoiceLinkman" sortable="true">${message(code: 'bdCubasdoc.invoiceLinkman.label', default: '结算发票联系人')}</th>

                <th field="phone2" sortable="true">${message(code: 'bdCubasdoc.phone2.label', default: '联系电话')}</th>

                <th field="fax2" sortable="true">${message(code: 'bdCubasdoc.fax2.label', default: '传真')}</th>

                <th field="contractInvoiceMailingAddress" sortable="true">${message(code: 'bdCubasdoc.contractInvoiceMailingAddress.label', default: '合同发票邮寄地址')}</th>

                <th field="accountStatementMailingAddress" sortable="true">${message(code: 'bdCubasdoc.accountStatementMailingAddress.label', default: '对账单邮寄地址')}</th>

                <th field="consignee" sortable="true">${message(code: 'bdCubasdoc.consignee.label', default: '收件人')}</th>

                <th field="zipcode1" sortable="true">${message(code: 'bdCubasdoc.zipcode1.label', default: '邮编')}</th>

                <th field="phone3" sortable="true">${message(code: 'bdCubasdoc.phone3.label', default: '联系电话')}</th>

                <th field="fax3" sortable="true">${message(code: 'bdCubasdoc.fax3.label', default: '传真')}</th>




                <th field="commercialInstruments" sortable="true">${message(code: 'bdCubasdoc.commercialInstruments.label', default: '营业执照')}</th>

                <th field="organizationalSetupCard" sortable="true">${message(code: 'bdCubasdoc.organizationalSetupCard.label', default: '组织机构代码证')}</th>

                <th field="taxRegistryNo" sortable="true">${message(code: 'bdCubasdoc.taxRegistryNo.label', default: '税务登记号s')}</th>

                <th field="grade" sortable="true">${message(code: 'bdCubasdoc.grade.label', default: '等级')}</th>

                <th field="creditmny" sortable="true" data-options="align:'right'">${message(code: 'bdCubasdoc.creditmny.label', default: '信用额度')}</th>

                <th field="accountsPayablePeriod" sortable="true" data-options="align:'right'">${message(code: 'bdCubasdoc.accountsPayablePeriod.label', default: '应付账期')}</th>

                <th field="accountsReceivablePeriod" sortable="true" data-options="align:'right'">${message(code: 'bdCubasdoc.accountsReceivablePeriod.label', default: '应收账期')}</th>



                <th field="emailservice" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.emailservice=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.emailservice.label', default: '开通邮件通知服务')}</th>

                <th field="msgservice" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.msgservice=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.msgservice.label', default: '开通短信通知服务')}</th>

                <th field="asOwnerNotify" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.asOwnerNotify=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.asOwnerNotify.label', default: '作为货主通知')}</th>

                <th field="deliveryNotify" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.deliveryNotify=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdCubasdoc.deliveryNotify.label', default: '提货时通知')}</th>

                <th field="receivePhone" sortable="true">${message(code: 'bdCubasdoc.receivePhone.label', default: '接收手机号码')}</th>

                <th field="textShort" sortable="true">${message(code: 'bdCubasdoc.textShort.label', default: '短信简称')}</th>

                <th field="receiveEmail" sortable="true">${message(code: 'bdCubasdoc.receiveEmail.label', default: '接收邮件')}</th>

                <th field="creator.userRealName" sortable="false" data-options="formatter:function(value,row){
                    if(row.creator){
                        return row.creator.userRealName;
                    }else{
                        return value;
                    }
                }"><g:message code="bdCubasdoc.creator.label" default="创建人"/></th>

                <th field="memo" sortable="true">${message(code: 'bdCubasdoc.memo.label', default: '备注')}</th>



























                %{--<th field="ecotypesincevfive" sortable="true">${message(code: 'bdCubasdoc.ecotypesincevfive.label', default: 'Ecotypesincevfive')}</th>--}%

                %{--<th field="freecustflag" sortable="true">${message(code: 'bdCubasdoc.freecustflag.label', default: '是否散户')}</th>--}%

                %{--<th field="isconnflag" sortable="true">${message(code: 'bdCubasdoc.isconnflag.label', default: '是否渠道成员')}</th>--}%

                %{--<th field="linkman2" sortable="true">${message(code: 'bdCubasdoc.linkman2.label', default: '联系人2')}</th>--}%

                %{--<th field="linkman3" sortable="true">${message(code: 'bdCubasdoc.linkman3.label', default: '联系人3')}</th>--}%

                %{--<th field="mobilephone1" sortable="true">${message(code: 'bdCubasdoc.mobilephone1.label', default: '手机1')}</th>--}%

                %{--<th field="mobilephone2" sortable="true">${message(code: 'bdCubasdoc.mobilephone2.label', default: '手机2')}</th>--}%

                %{--<th field="mobilephone3" sortable="true">${message(code: 'bdCubasdoc.mobilephone3.label', default: '手机3')}</th>--}%

                %{--<th field="pkAreacl" sortable="false"><g:message code="bdCubasdoc.pkAreacl.label" default="地区分类"/></th>--}%

                %{--<th field="pkCorp1" sortable="false"><g:message code="bdCubasdoc.pkCorp1.label" default="对应公司编码"/></th>--}%

                %{--<th field="registerfund" sortable="true">${message(code: 'bdCubasdoc.registerfund.label', default: '注册资金')}</th>--}%

                %{--<th field="saleaddr" sortable="true">${message(code: 'bdCubasdoc.saleaddr.label', default: '营业地址')}</th>--}%

                %{--<th field="sealflag" sortable="true">${message(code: 'bdCubasdoc.sealflag.label', default: 'Sealflag')}</th>--}%

                %{--<th field="taxpayerid" sortable="true">${message(code: 'bdCubasdoc.taxpayerid.label', default: '纳税人登记号')}</th>--}%


                %{--<th field="trade" sortable="true">${message(code: 'bdCubasdoc.trade.label', default: '所属行业')}</th>--}%


            </tr>
            </thead>
        </table>
    </div>
</div>





