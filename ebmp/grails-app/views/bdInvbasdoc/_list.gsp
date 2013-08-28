
<%@ page import="com.app.bd.invbasdoc.BdInvbasdoc" %>
<g:set var="entityName" value="${message(code: 'bdInvbasdoc.label', default: 'BdInvbasdoc')}" />
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

                $("#table${pageId}").datagrid('reload');

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

                $("#table${pageId}").datagrid('reload');

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
        if(node == null){
            $.messager.show({
                title:'警告',
                msg:'请选择存货分类！'
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
            title:'添加存货基本档案',
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
        var editurl='${createLink(action:'edit')}/'+row.id;

        $('<div/>').dialog({
            title:'编辑存货基本档案',
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

    $(function(){
        $('#tree${pageId}').tree({
            onDblClick:function(node){
                $('#table${pageId}').datagrid('options').url='${createLink(action:'query')}?pkInvcl='+node.id;

                $('#table${pageId}').datagrid('reload');
            }
        });
    });

    function onOpenAllotDlg${pageId}(){
        var node = $('#tree${pageId}').tree('getSelected');
        if(node == null){
            $.messager.show({
                title:'警告',
                msg:'请选择存货分类！'
            });
            return;
        }
        $('<div/>').dialog({
            title:'分配',
            resizable:false,
            modal:true,
            width:600,
            height:500,

            href:'${createLink(action:'openAllotDlg')}?invclId='+node.id,
            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }

    function leadingIn${pageId}(){
        var uploadUrl = '${createLink(controller:'bdInvbasdoc',action:'openUploadDlg')}'
        $('<div>').dialog({
            title:'导入文件',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:400,
            height:200,
            href:uploadUrl,
            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }

    function leadingOut${pageId}(){
        var node = $('#tree${pageId}').tree('getSelected');
        if(!node){
            $.messager.show({
                title:'警告',
                msg:'请选择要导出的存货分类'
            });
            return;
        }
        $.post('${createLink(action:'leadingOut')}',{'pkInvcl':node.id});

    }


</script>

<div class="easyui-layout" fit="true">
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
        <a href="#" class="easyui-linkbutton" iconCls="" plain="true" onclick="onOpenAllotDlg${pageId}()">${message(code: 'default.button.allot.label',default: '分配')}</a>
        <a href="#" class="easyui-linkbutton" iconCls="" plain="true" onclick="leadingIn${pageId}()">${message(code: 'default.button.leadingIn.label',default: '导入')}</a>
        <a href="#" class="easyui-linkbutton" iconCls="" plain="true" onclick="leadingOut${pageId}()">${message(code: 'default.button.leadingout.label',default: '导出')}</a>
    </div>
    %{--左边树形--}%
    <div title="存货分类" region="west" style="width:200px">
        <ul id="tree${pageId}" class="easyui-tree" url="${createLink(action:'queryTree')}?=${id}">

        </ul>

    </div>




    %{--表格--}%
    <div title="存货基本档案" region="center" style="scroll:true">
        <table id="table${pageId}"  class="easyui-datagrid"  rownumbers="true" fit="true" fitcolumen="true" toolbar="#tb${pageId}" singleSelect="true" pagination="true" pageSize="30">

            <thead>

            <tr>

                <th field="invcode" sortable="true">${message(code: 'bdInvbasdoc.invcode.label', default: 'Invcode')}</th>

                <th field="invname" sortable="true">${message(code: 'bdInvbasdoc.invname.label', default: 'Invname')}</th>

                <th field="forinvname" sortable="true">${message(code: 'bdInvbasdoc.forinvname.label', default: '外文名称')}</th>

                <th field="graphid" sortable="true">${message(code: 'bdInvbasdoc.graphid.label', default: '图号')}</th>

                <th field="height" sortable="true" data-options="align:'right'">${message(code: 'bdInvbasdoc.height.label', default: '高度')}</th>

                <th field="width" sortable="true" data-options="align:'right'">${message(code: 'bdInvbasdoc.width.label', default: '宽度')}</th>

                <th field="length" sortable="true" data-options="align:'right'"> ${message(code: 'bdInvbasdoc.length.label', default: '长度')}</th>

                <th field="invbarcode" sortable="true">${message(code: 'bdInvbasdoc.invbarcode.label', default: '条形码')}</th>

                <th field="invmnecode" sortable="true">${message(code: 'bdInvbasdoc.invmnecode.label', default: '助记码')}</th>

                <th field="invpinpai" sortable="true">${message(code: 'bdInvbasdoc.invpinpai.label', default: '品牌')}</th>

                <th field="invshortname" sortable="true">${message(code: 'bdInvbasdoc.invshortname.label', default: '存货简称')}</th>

                <th field="invspec" sortable="true">${message(code: 'bdInvbasdoc.invspec.label', default: '规格')}</th>

                <th field="invtype" sortable="true">${message(code: 'bdInvbasdoc.invtype.label', default: '型号')}</th>

                <th field="bdmeasdoc.measname" sortable="false" data-options="formatter:function(value,row){
                    if(row.bdmeasdoc){
                        return row.bdmeasdoc.measname;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvbasdoc.bdmeasdoc.label" default="主计量单位"/></th>

                <th field="bdmeasdoc1.measname" sortable="false" data-options="formatter:function(value,row){
                    if(row.bdmeasdoc1){
                        return row.bdmeasdoc1.measname;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvbasdoc.bdmeasdoc1.label" default="销售默认单位"/></th>

                <th field="bdmeasdoc2.measname" sortable="false" data-options="formatter:function(value,row){
                    if(row.bdmeasdoc2){
                        return row.bdmeasdoc2.measname;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvbasdoc.bdmeasdoc2.label" default="采购默认单位"/></th>

                <th field="bdmeasdoc3.measname" sortable="false" data-options="formatter:function(value,row){
                    if(row.bdmeasdoc3){
                        return row.bdmeasdoc3.measname;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvbasdoc.bdmeasdoc3.label" default="库存默认单位"/></th>

                <th field="bdmeasdoc4.measname" sortable="false" data-options="formatter:function(value,row){
                    if(row.bdmeasdoc4){
                        return row.bdmeasdoc4.measname;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvbasdoc.bdmeasdoc4.label" default="生产默认单位"/></th>

                <th field="bdmeasdoc5.measname" sortable="false" data-options="formatter:function(value,row){
                    if(row.bdmeasdoc5){
                        return row.bdmeasdoc5.measname;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvbasdoc.bdmeasdoc5.label" default="零售计量单位"/></th>

                <th field="creator.userRealName" sortable="false" data-options="formatter:function(value,row){
                    if(row.creator){
                        return row.creator.userRealName;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvbasdoc.creator.label" default="创建人"/></th>

                <th field="discountflag" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.discountflag=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvbasdoc.discountflag.label', default: '价格折扣')}</th>

                <th field="ismngstockbygrswt" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.ismngstockbygrswt=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvbasdoc.ismngstockbygrswt.label', default: '按毛重管理库存')}</th>

                <th field="isretail" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.isretail=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvbasdoc.isretail.label', default: '是否零售')}</th>

                <th field="isstorebyconvert" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.isstroebyconvert=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvbasdoc.isstorebyconvert.label', default: '换算率结存')}</th>

                <th field="laborflag" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.laborflag=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvbasdoc.laborflag.label', default: '应税劳务')}</th>

                <th field="modifier.userRealName" sortable="false" data-options="formatter:function(value,row){
                    if(row.modifier){
                        return row.modifier.userRealName;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvbasdoc.modifier.label" default="修改人"/></th>

                <th field="modifytime" sortable="true" data-options="align:'right'">${message(code: 'bdInvbasdoc.modifytime.label', default: '修改时间')}</th>

                <th field="pkCorp.unitName" sortable="false" data-options="formatter:function(value,row){
                    if(row.pkCorp){
                        return row.pkCorp.unitName;
                    }else{
                        return value;
                    }
                }"><g:message code="bdInvbasdoc.pkCorp.label" default="公司"/></th>

                <th field="sealflag" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.sealflag=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvbasdoc.sealflag.label', default: '封存标志')}</th>

                <th field="setpartsflag" sortable="true" data-options="align:'center',formatter:function(value,row){
                    if(row.setpartsflag=='true'){
                        return '是';
                    }else{
                        return '否';
                    }
                }">${message(code: 'bdInvbasdoc.setpartsflag.label', default: '成套件')}</th>

                <th field="shipunitnum" sortable="true" data-options="align:'right'">${message(code: 'bdInvbasdoc.shipunitnum.label', default: '多少标准运输单位')}</th>

                <th field="storeunitnum" sortable="true" data-options="align:'right'">${message(code: 'bdInvbasdoc.storeunitnum.label', default: '多少标准存储单位')}</th>

                <th field="unitvolume" sortable="true" data-options="align:'right'">${message(code: 'bdInvbasdoc.unitvolume.label', default: '单位体积')}</th>

                <th field="unitweight" sortable="true" data-options="align:'right'">${message(code: 'bdInvbasdoc.unitweight.label', default: '单位重量')}</th>

                <th field="weitunitnum" sortable="true" data-options="align:'right'">${message(code: 'bdInvbasdoc.weitunitnum.label', default: '多少标准重量单位')}</th>

                <th field="memo" sortable="true">${message(code: 'bdInvbasdoc.memo.label', default: '备注')}</th>

            </tr>
            </thead>
        </table>
    </div>

</div>







