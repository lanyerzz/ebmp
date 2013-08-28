
<%@ page import="com.app.ywms.settle.fee.YwmsFeeBill" %>
<g:set var="entityName" value="${message(code: 'ywmsFeeBill.label', default: 'YwmsFeeBill')}"/>
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

        
        <th field="billdate"
            sortable="true">${message(code: 'ywmsFeeBill.billdate.label', default: 'Billdate')}</th>
        
        <th field="feeType" sortable="false"><g:message code="ywmsFeeBill.feeType.label"
                                                          default="Fee Type"/></th>
        
        <th field="jsrq"
            sortable="true">${message(code: 'ywmsFeeBill.jsrq.label', default: 'Jsrq')}</th>
        
        <th field="dj"
            sortable="true">${message(code: 'ywmsFeeBill.dj.label', default: 'Dj')}</th>
        
        <th field="yfsl"
            sortable="true">${message(code: 'ywmsFeeBill.yfsl.label', default: 'Yfsl')}</th>
        
        <th field="yfje"
            sortable="true">${message(code: 'ywmsFeeBill.yfje.label', default: 'Yfje')}</th>
        
        <th field="fkdw" sortable="false"><g:message code="ywmsFeeBill.fkdw.label"
                                                          default="Fkdw"/></th>
        
        <th field="bdCorp" sortable="false"><g:message code="ywmsFeeBill.bdCorp.label"
                                                          default="Bd Corp"/></th>
        
        <th field="bg"
            sortable="true">${message(code: 'ywmsFeeBill.bg.label', default: 'Bg')}</th>
        
        <th field="bght" sortable="false"><g:message code="ywmsFeeBill.bght.label"
                                                          default="Bght"/></th>
        
        <th field="billTypeCode"
            sortable="true">${message(code: 'ywmsFeeBill.billTypeCode.label', default: 'Bill Type Code')}</th>
        
        <th field="billno"
            sortable="true">${message(code: 'ywmsFeeBill.billno.label', default: 'Billno')}</th>
        
        <th field="billtype" sortable="false"><g:message code="ywmsFeeBill.billtype.label"
                                                          default="Billtype"/></th>
        
        <th field="businessType" sortable="false"><g:message code="ywmsFeeBill.businessType.label"
                                                          default="Business Type"/></th>
        
        <th field="checkDate"
            sortable="true">${message(code: 'ywmsFeeBill.checkDate.label', default: 'Check Date')}</th>
        
        <th field="checker" sortable="false"><g:message code="ywmsFeeBill.checker.label"
                                                          default="Checker"/></th>
        
        <th field="dateCreated"
            sortable="true">${message(code: 'ywmsFeeBill.dateCreated.label', default: 'Date Created')}</th>
        
        <th field="djlj"
            sortable="true">${message(code: 'ywmsFeeBill.djlj.label', default: 'Djlj')}</th>
        
        <th field="hw" sortable="false"><g:message code="ywmsFeeBill.hw.label"
                                                          default="Hw"/></th>
        
        <th field="hz" sortable="false"><g:message code="ywmsFeeBill.hz.label"
                                                          default="Hz"/></th>
        
        <th field="je"
            sortable="true">${message(code: 'ywmsFeeBill.je.label', default: 'Je')}</th>
        
        <th field="jssl"
            sortable="true">${message(code: 'ywmsFeeBill.jssl.label', default: 'Jssl')}</th>
        
        <th field="lastUpdated"
            sortable="true">${message(code: 'ywmsFeeBill.lastUpdated.label', default: 'Last Updated')}</th>
        
        <th field="makeDate"
            sortable="true">${message(code: 'ywmsFeeBill.makeDate.label', default: 'Make Date')}</th>
        
        <th field="maker" sortable="false"><g:message code="ywmsFeeBill.maker.label"
                                                          default="Maker"/></th>
        
        <th field="vnote"
            sortable="true">${message(code: 'ywmsFeeBill.vnote.label', default: 'Vnote')}</th>
        
        <th field="xgywdh"
            sortable="true">${message(code: 'ywmsFeeBill.xgywdh.label', default: 'Xgywdh')}</th>
        
        <th field="ywsl"
            sortable="true">${message(code: 'ywmsFeeBill.ywsl.label', default: 'Ywsl')}</th>
        
        <th field="yxhqrd" sortable="false"><g:message code="ywmsFeeBill.yxhqrd.label"
                                                          default="Yxhqrd"/></th>
        
    </tr>
    </thead>
</table>



