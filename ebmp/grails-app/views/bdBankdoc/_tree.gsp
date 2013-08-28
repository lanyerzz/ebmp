
<%@ page import="com.app.bd.bankdoc.BdBankdoc" %>
<g:set var="entityName" value="${message(code: 'bdBankdoc.label', default: 'BdBankdoc')}"/>
<script>


    //    更新
    function onUpdate${pageId}(d) {

        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var obj= $('#form${pageId}').serializeObject();

        $.post( '${createLink(action: 'update')}',obj,function(json){

                    var row = $("#table${pageId}").treegrid('getSelected');
                    $.messager.progress('close');	// hide progress bar while submit successfully

                    if(json.validateerrors!=null){//有错误数据
                        d.showMessage(json);

                        return;
                    }
                    d.dialog('destroy');

                    if(json.pid!='0')
                        $("#table${pageId}").treegrid('reload',json.pid);
                    else
                        $("#table${pageId}").treegrid('reload');

                    $.messager.show({
                        title:'消息',
                        msg:'操作完成！'
                    });
                },
                'json'
        );
    }


    //    保存
    function onSave${pageId}(d) {

        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var obj= $('#form${pageId}').serializeObject();
        $.post( '${createLink(action: 'save')}',obj,function(json){

                    var row = $("#table${pageId}").treegrid('getSelected');
                    $.messager.progress('close');	// hide progress bar while submit successfully

                    if(json.validateerrors!=null){//有错误数据
                        d.showMessage(json);

                        return;
                    }
                    d.dialog('destroy');

                    var nodes=[]
                    nodes[0]=json
                    if(row != null && row.state == "closed"){
                        $("#table${pageId}").treegrid('reload',json.pid);
                    }else{
                        $("#table${pageId}").treegrid('append',{
                            parent: json.pid,  // the node has a 'id' value that defined through 'idField' property
                            data:nodes
                        });
                    }

                    $.messager.show({
                        title:'消息',
                        msg:'操作完成！'
                    });
                },
                'json'
        );
    }

    //增加
    function onAdd${pageId}() {
        var row =$('#table${pageId}').treegrid('getSelected');
        var addurl = '${createLink(action: 'create ')}'
        if (row != null) {
            addurl += '/' + row.id;
        }
       $('<div/>').dialog({
            title: '添加银行档案',
            iconCls: 'icon-add',
            resizable: false,
            modal: true,
            width: 980,
            height:300,

            href: addurl,
            buttons: [
                {
                    text: '增加',
                    iconCls: 'icon-add',
                    handler: function () {
                        var d = $(this).closest('.window-body');
                        onSave${pageId}(d);
                    }
                }
            ],
            onClose: function () {
                $(this).dialog('destroy');
            }
        });


    }

    //修改
    function onEdit${pageId}() {
        var row =$('#table${pageId}').treegrid('getSelected');
        if (row == null) {//选择父节点

        $.messager.show({title: '警告', msg: '请选择修改的数据'});
            return;
        }
        var editurl = '${createLink(action: 'edit')}/' + row.id

        $('<div/>').dialog({
            title: '编辑银行档案',
            iconCls: 'icon-edit',
            resizable: false,
            modal: true,
            width: 980,
            height: 300,

            href: editurl,
            buttons: [
                {
                    text: '编辑',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var d = $(this).closest('.window-body');
                        onUpdate${pageId}(d);
                    }
                }
            ],
            onClose: function () {
                $(this).dialog('destroy');
            }
        });


    }

    //        删除
    function onDelete${pageId}() {

        var row =$('#table${pageId}').treegrid('getSelected');
        if (row == null) {
        $.messager.show({
                title: '消息',
                msg: '请选择需要删除的数据！'
            });
            return;
        };
        $.messager.confirm('${message(code:'default.delete.message',default: '删除数据')}',
                '${message(code: 'default.button.delete.confirm.message', default: ' Are you sure ? ')}',
                function (r) {
                    if (r) {
                        $.post('${createLink(action: 'delete')}', { id: row.id },
                                    function (data) {
                                        $('#table${pageId}').treegrid('remove', data);
                                        $.messager.show({
                                            title: '消息',
                                            msg: '数据已经删除！'
                                        });
                                    }
                        );
                    }
                }
    )
        ;
    }



</script>



%{--按钮--}%
<div id="tb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="onAdd${pageId}() ">
        ${message(code: 'default.button.create.label',default: '增加')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label',default: '修改')}</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">
        ${message(code: 'default.button.delete.label',default: '删除')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').treegrid('reload')">
        ${message(code: 'default.button.refresh.label',default: '刷新')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}" class="easyui-treegrid" style="width:400px;height:300px"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       idField="id" treeField="bankdocname" fit="true" toolbar="#tb${pageId}">

    <thead>

    <tr>

        
        <th field="bankdoccode"
            sortable="true">${message(code: 'bdBankdoc.bankdoccode.label', default: '银行档案编码')}</th>
        
        <th field="bankdocname"
            sortable="true">${message(code: 'bdBankdoc.bankdocname.label', default: '银行档案名称')}</th>

        <th field="shortname"
            sortable="true">${message(code: 'bdBankdoc.shortname.label', default: '银行简称')}</th>


        <th field="address"
            sortable="true">${message(code: 'bdBankdoc.address.label', default: '地址')}</th>
        
        <th field="amcode"
            sortable="true">${message(code: 'bdBankdoc.amcode.label', default: '助记码')}</th>
        
        <th field="banktype.banktypename" sortable="false" data-options="formatter:function(value,row){

                return value;

        }"><g:message code="bdBankdoc.banktype.label" default="银行类型"/></th>
        
        <th field="bdCorp.unitName" sortable="false" data-options="formatter:function(value,row){

                return value;

        }"><g:message code="bdBankdoc.bdCorp.label" default="公司"/></th>

        <th field="modifier.userRealName" sortable="false" data-options="formatter:function(value,row){

                return value;

        }"><g:message code="bdBankdoc.modifier.label" default="修改人"/></th>

        <th field="creator.userRealName" sortable="false" data-options="formatter:function(value,row){
            if(row.creator){
                return row.creator.userRealName;
            }else{
                return value;
            }
        }"><g:message code="bdBankdoc.creator.label" default="创建人"/></th>



        <th field="linkman1"
            sortable="true">${message(code: 'bdBankdoc.linkman1.label', default: '联系人1')}</th>

        <th field="linkman2"
            sortable="true">${message(code: 'bdBankdoc.linkman2.label', default: '联系人2')}</th>

        <th field="linkman3"
            sortable="true">${message(code: 'bdBankdoc.linkman3.label', default: '联系人3')}</th>

        <th field="phone1"
            sortable="true">${message(code: 'bdBankdoc.phone1.label', default: '联系电话1')}</th>
        
        <th field="phone2"
            sortable="true">${message(code: 'bdBankdoc.phone2.label', default: '联系电话2')}</th>
        
        <th field="phone3"
            sortable="true">${message(code: 'bdBankdoc.phone3.label', default: '联系电话3')}</th>
        
        <th field="sealflag"
            sortable="true" data-options="align:'center',formatter:function(value,row){
            if(row.sealflag=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'bdBankdoc.sealflag.label', default: '封存标志')}</th>
        

    </tr>
    </thead>
</table>



