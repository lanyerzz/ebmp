
<%@ page import="com.app.ywms.bd.tank.YBdTank" %>
<g:set var="entityName" value="${message(code: 'YBdTank.label', default: 'YBdTank')}"/>
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

        
        <th field="aqrj"
            sortable="true">${message(code: 'YBdTank.aqrj.label', default: 'Aqrj')}</th>
        
        <th field="bcrj"
            sortable="true">${message(code: 'YBdTank.bcrj.label', default: 'Bcrj')}</th>
        
        <th field="bdInvmandoc" sortable="false"><g:message code="YBdTank.bdInvmandoc.label"
                                                          default="Bd Invmandoc"/></th>
        
        <th field="bg"
            sortable="true">${message(code: 'YBdTank.bg.label', default: 'Bg')}</th>
        
        <th field="bonded"
            sortable="true">${message(code: 'YBdTank.bonded.label', default: 'Bonded')}</th>
        
        <th field="bw"
            sortable="true">${message(code: 'YBdTank.bw.label', default: 'Bw')}</th>
        
        <th field="code"
            sortable="true">${message(code: 'YBdTank.code.label', default: 'Code')}</th>
        
        <th field="code2"
            sortable="true">${message(code: 'YBdTank.code2.label', default: 'Code2')}</th>
        
        <th field="dateCreated"
            sortable="true">${message(code: 'YBdTank.dateCreated.label', default: 'Date Created')}</th>
        
        <th field="describe"
            sortable="true">${message(code: 'YBdTank.describe.label', default: 'Describe')}</th>
        
        <th field="gd"
            sortable="true">${message(code: 'YBdTank.gd.label', default: 'Gd')}</th>
        
        <th field="gd1"
            sortable="true">${message(code: 'YBdTank.gd1.label', default: 'Gd1')}</th>
        
        <th field="gd2"
            sortable="true">${message(code: 'YBdTank.gd2.label', default: 'Gd2')}</th>
        
        <th field="gdsl"
            sortable="true">${message(code: 'YBdTank.gdsl.label', default: 'Gdsl')}</th>
        
        <th field="gllx"
            sortable="true">${message(code: 'YBdTank.gllx.label', default: 'Gllx')}</th>
        
        <th field="glsm"
            sortable="true">${message(code: 'YBdTank.glsm.label', default: 'Glsm')}</th>
        
        <th field="jygs"
            sortable="true">${message(code: 'YBdTank.jygs.label', default: 'Jygs')}</th>
        
        <th field="jyrq"
            sortable="true">${message(code: 'YBdTank.jyrq.label', default: 'Jyrq')}</th>
        
        <th field="jysm"
            sortable="true">${message(code: 'YBdTank.jysm.label', default: 'Jysm')}</th>
        
        <th field="jyyj"
            sortable="true">${message(code: 'YBdTank.jyyj.label', default: 'Jyyj')}</th>
        
        <th field="jyzsbh"
            sortable="true">${message(code: 'YBdTank.jyzsbh.label', default: 'Jyzsbh')}</th>
        
        <th field="lastUpdated"
            sortable="true">${message(code: 'YBdTank.lastUpdated.label', default: 'Last Updated')}</th>
        
        <th field="rxhz"
            sortable="true">${message(code: 'YBdTank.rxhz.label', default: 'Rxhz')}</th>
        
        <th field="xuni"
            sortable="true">${message(code: 'YBdTank.xuni.label', default: 'Xuni')}</th>
        
        <th field="yxrq"
            sortable="true">${message(code: 'YBdTank.yxrq.label', default: 'Yxrq')}</th>
        
        <th field="zgzf"
            sortable="true">${message(code: 'YBdTank.zgzf.label', default: 'Zgzf')}</th>
        
        <th field="zhijing"
            sortable="true">${message(code: 'YBdTank.zhijing.label', default: 'Zhijing')}</th>
        
        <th field="zzgq"
            sortable="true">${message(code: 'YBdTank.zzgq.label', default: 'Zzgq')}</th>
        
    </tr>
    </thead>
</table>



