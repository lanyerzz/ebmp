
<%@ page import="com.app.ywms.bd.cddw.YCddw" %>
<g:set var="entityName" value="${message(code: 'YCddw.label', default: 'YCddw')}"/>
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

                    if(json.fathercorp!='0')
                        $("#table${pageId}").treegrid('reload',json.fathercorp);
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
                        $("#table${pageId}").treegrid('reload',json.fathercorp);
                    }else{
                        $("#table${pageId}").treegrid('append',{
                            parent: json.fathercorp,  // the node has a 'id' value that defined through 'idField' property
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
            title: '添加公司',
            iconCls: 'icon-add',
            resizable: false,
            modal: true,
            width: 400,
            height: 500,

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
            title: '编辑节点',
            iconCls: 'icon-edit',
            resizable: false,
            modal: true,
            width: 400,
            height: 500,

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
       idField="id" treeField="id" fit="true" toolbar="#tb${pageId}">

    <thead>

    <tr>

        
        <th field="code"
            sortable="true">${message(code: 'YCddw.code.label', default: 'Code')}</th>
        
        <th field="name"
            sortable="true">${message(code: 'YCddw.name.label', default: 'Name')}</th>
        
        <th field="makedate"
            sortable="true">${message(code: 'YCddw.makedate.label', default: 'Makedate')}</th>
        
        <th field="account"
            sortable="true">${message(code: 'YCddw.account.label', default: 'Account')}</th>
        
        <th field="address"
            sortable="true">${message(code: 'YCddw.address.label', default: 'Address')}</th>
        
        <th field="bdCumandoc" sortable="false"><g:message code="YCddw.bdCumandoc.label"
                                                          default="Bd Cumandoc"/></th>
        
        <th field="blockUp"
            sortable="true">${message(code: 'YCddw.blockUp.label', default: 'Block Up')}</th>
        
        <th field="dateCreated"
            sortable="true">${message(code: 'YCddw.dateCreated.label', default: 'Date Created')}</th>
        
        <th field="email"
            sortable="true">${message(code: 'YCddw.email.label', default: 'Email')}</th>
        
        <th field="fax"
            sortable="true">${message(code: 'YCddw.fax.label', default: 'Fax')}</th>
        
        <th field="frdb"
            sortable="true">${message(code: 'YCddw.frdb.label', default: 'Frdb')}</th>
        
        <th field="khyh"
            sortable="true">${message(code: 'YCddw.khyh.label', default: 'Khyh')}</th>
        
        <th field="lastUpdated"
            sortable="true">${message(code: 'YCddw.lastUpdated.label', default: 'Last Updated')}</th>
        
        <th field="linkman"
            sortable="true">${message(code: 'YCddw.linkman.label', default: 'Linkman')}</th>
        
        <th field="linktel"
            sortable="true">${message(code: 'YCddw.linktel.label', default: 'Linktel')}</th>
        
        <th field="maker" sortable="false"><g:message code="YCddw.maker.label"
                                                          default="Maker"/></th>
        
        <th field="note"
            sortable="true">${message(code: 'YCddw.note.label', default: 'Note')}</th>
        
        <th field="swdjh"
            sortable="true">${message(code: 'YCddw.swdjh.label', default: 'Swdjh')}</th>
        
        <th field="url"
            sortable="true">${message(code: 'YCddw.url.label', default: 'Url')}</th>
        
        <th field="yyzz"
            sortable="true">${message(code: 'YCddw.yyzz.label', default: 'Yyzz')}</th>
        
        <th field="zjf"
            sortable="true">${message(code: 'YCddw.zjf.label', default: 'Zjf')}</th>
        
        <th field="zzjgdmz"
            sortable="true">${message(code: 'YCddw.zzjgdmz.label', default: 'Zzjgdmz')}</th>
        
    </tr>
    </thead>
</table>



