<%@ page import="com.app.ywms.ck.fhtzd.Yfhtzd" %>

<script>
    $(function(){
        initFileWritePlugin();
    });

    function onShow${pageId}(){
        var row = $('#table${pageId}').datagrid('getSelected');

        var url = '${createLink(action:'show')}/' + row.id

        showCard(url,'${pageId}');
    }
    %{--//增加--}%
    function onAdd${pageId}(data) {

        var addurl
        if ($.type(data) == 'object') {
            addurl = '${createLink(action: 'create')}?keys=' + data.data + '&businessKey=' + data.businessKey + '&sourceBillTypeCode=' + data.sourceBillTypeCode;

        } else {
            addurl = '${createLink(action: 'create')}?businessKey=' + data;
        }
        showCard(addurl,'${pageId}');

    }


    %{--//修改--}%
    function onEdit${pageId}() {
        var row = $('#table${pageId}').datagrid('getSelected');
        if (row == null) {//选择修改节点

            $.messager.show({title: '警告', msg: '请选择修改的数据'});
            return;
        }
        var editurl = '${createLink(action:'edit')}/' + row.id

        showCard(editurl,'${pageId}');
    }


    %{--//    保存--}%
    function onSave${pageId}(d) {

        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid) {
            $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var vali= $('#bodyTable${pageId}').edatagrid('validateRows');
        if(!vali) return;

        var head = $('#form${pageId}').serializeObject();

        var bodys = $('#bodyTable${pageId}').edatagrid('getJSON');



        if(bodys.length==0){
            $.messager.alert('警告！','保存前请先分配明细！');
            $.messager.progress('close');
            return;
        }
//
        $.post('${createLink(action: 'save')}', {'head':encodeURI(JSON.stringify(head)),'mx':encodeURI(JSON.stringify(bodys))}, function (json) {
                    $.messager.progress('close');	// hide progress bar while submit successfully
                    if ($('#card${pageId}').showMessage(json)) {//有错误数据
                        return;
                    }


                    onClose${pageId}();

                    $("#table${pageId}").datagrid('reload');

                    $.messager.show({
                        title: '消息',
                        msg: '操作完成！'
                    });
                },
                'json'
        );
    }


    %{--//        删除--}%
    function onDelete${pageId}() {

        var row = $('#table${pageId}').datagrid('getSelected');
        var index = $('#table${pageId}').datagrid('getRowIndex', row);
        if (row == null) {
            $.messager.show({
                title: '消息',
                msg: '请选择需要删除的数据！'
            });
            return;
        }
        ;
        $.messager.confirm('${message(code:'default.delete.message',default: '删除数据')}',
                '${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}',
                function (r) {
                    if (r) {


                        $.post('${createLink(action: 'delete')}', { id: row.id },
                                function (data) {
                                    $('#table${pageId}').datagrid('deleteRow', index);
                                    $.messager.show({
                                        title: '消息',
                                        msg: '数据已经删除！'
                                    });
                                });
                    }
                }
        );
    }


    %{--//审核--}%
    function onCheck${pageId}() {
        var row = $('#table${pageId}').datagrid('getSelected');
        if (row == null) {
            $.messager.show({
                title: '消息',
                msg: '请选择需要审核的数据！'
            });
            return;
        }
        ;
        $.messager.confirm('${message(code:'default.check.message')}',
                '${message(code: 'default.button.check.confirm.message', default: 'Are you sure?')}',
                function (r) {
                    if (r) {


                        $.post('${createLink(action: 'check')}', { id: row.id },
                                function (data) {

                                    if ($(this).showMessage(data)) {//有错误数据

                                        return;
                                    }


                                    $('#table${pageId}').datagrid('reload');
                                });
                    }
                }
        );
    }


    %{--//弃审--}%
    function onUnCheck${pageId}() {
        var row = $('#table${pageId}').datagrid('getSelected');

        if (row == null) {
            $.messager.show({
                title: '消息',
                msg: '请选择需要弃审的数据！'
            });
            return;
        }
        ;
        $.messager.confirm('${message(code:'default.uncheck.message')}',
                '${message(code: 'default.button.uncheck.confirm.message', default: 'Are you sure?')}',
                function (r) {
                    if (r) {


                        $.post('${createLink(action: 'uncheck')}', { id: row.id },
                                function (data) {

                                    if ($(this).showMessage(data)) {//有错误数据

                                        return;
                                    }


                                    $('#table${pageId}').datagrid('reload');

                                });
                    }
                }
        );
    }


    function onResize${pageId}(w, h) {
        $('#card${pageId}').panel('resize', {width: w, height: h});
    }

    function onClose${pageId}() {
        $('#card${pageId}').panel('destroy');
        $('#list${pageId}').panel('open');

    }


    function onRefPage${pageId}(businessKey, billTypeKey, title, targetBill) {
        var xhjhdurl = '${createLink(controller: 'pubBusinessType', action:'refPage')}?handler=getSelected${pageId}&businessKey=' + businessKey + '&billTypeKey=' + billTypeKey + '&targetBill=' + targetBill;
        $("<div/>").dialog({
            title: title,
            resizable: false,
            modal: true,
            width: 800,
            height: 500,

            href: xhjhdurl,
            buttons: [
                {
                    text: '增加',
                    iconCls: 'icon-add',
                    handler: function () {
                        var data = getSelected${pageId}();


                        if (data.length == 0) {

                            return;
                        }

                        var a = $(this).closest('.window-body');
                        onAdd${pageId}(data);
                        a.dialog('destroy');
                    }
                }
            ],
            onClose: function () {
                $(this).dialog('destroy');
            }
        });

    }

function jh${pageId}(){
    $("<div/>").dialog({
        title: '叫号',
        resizable: false,
        modal: true,
        width: 600,
        height: 500,

        href: '${createLink(controller: 'yfhtzd',action: 'queryCanInCar')}',
        buttons: [
            {
                text: '叫号',
                iconCls: 'icon-ok',
                handler: function () {

                    var data = getCarNos${pageId}();

                    if (data.length == 0) {

                        return;
                    }
                    var keys=''
                    $.each(data,function(i,v){
                        keys+= v.id+',';
                    });

                    $.post('${createLink(controller: 'yfhtzd',action: 'saveCarState')}',{keys:keys},function(json){

                        var contents=json.toString().split('\\n');
                        var content='';
                        $.each(contents,function(i,v){
                            content+=v+'\r\n';
                        });
//                        '/Users/lanyer/git/ebmp/ebmp/web-app/test.txt'
                        if(!getCookie('jh_file_path')){
                            $.messager.alert('警告','请先在设置选项里设置文件路径,再重新叫号.');
                            return;
                        }
                        fileWrite(content,getCookie('jh_file_path'),false);
                    });




                    var a = $(this).closest('.window-body');

                    a.dialog('destroy');
                }
            }
        ],
        onClose: function () {
            $(this).dialog('destroy');
        }
    });
}

function jhSetting${pageId}(){
    $('<div/>').dialog({
        title:'设置',
        width:300,
        height:150,
        modal: true,
        content:'<div class="fieldcontain" style="margin-top: 20px"><label>文件路径</label><input id="filePath${pageId}" value="'+ getCookie('jh_file_path')+'"></div>',
        buttons: [
            {
                text: '确认',
                iconCls: 'icon-ok',
                handler: function () {

                    var path=$('#filePath${pageId}').val()
                    setCookie('jh_file_path',path);
                    var a = $(this).closest('.window-body');
                    a.dialog('destroy');
                }
            }
        ], onClose: function () {
            $(this).dialog('destroy');
        }
    });
}


    /**
    *查询过期单据
     */
function querystaleBill${pageId}(){

       var critierias= createCriterias('and')
        addCriteria(critierias,[opt_lessThan,'yxrq',new Date().getTime().toString(),opt_type_date]);
        var or=createCriterias('or')
        addCriteria(or,[opt_equals,'closed',false,opt_type_boolean])
        addCriteria(or,[opt_isNull,'closed'])
        addCriterias(critierias,or);
        $('#table${pageId}').datagrid('reload',{queryParams: encodeURI(JSON.stringify(critierias))});
}

function onOpenBIll${pageId}(){

    var row = $('#table${pageId}').datagrid('getSelected');
    if (row == null) {//选择修改节点

        $.messager.show({
            title: '警告',
            msg: '请选定打开的数据'
        });
        return;
    }
    $.post('${createLink(action: 'openBIll')}/'+row.id,null,function(json){

        $.messager.show({
            title: '成功',
            msg: '操作成功！'
        });
    });


}


    function onCloseBill${pageId}(){
        var row = $('#table${pageId}').datagrid('getSelected');
        if (row == null) {//选择修改节点

            $.messager.show({title: '警告', msg: '请选定关闭的数据'});
            return;
        }
        $.post('${createLink(action: 'closeBill')}/'+row.id,null,function(json){
            $.messager.show({
                title: '成功',
                msg: '操作成功！'
            });
        });
    }


</script>


<div id="main${pageId}" style="height: 100%;padding: 3px" class="easyui-panel"  data-options="fit:true,border:false,noheader:true,onResize:onResize${pageId}">
    <div id="list${pageId}" class="easyui-panel" title="" data-options="fit:true,border:false,noheader:true" >

        %{--按钮--}%
        <div id="tb${pageId}">
            %{--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAdd${pageId}() ">--}%
            %{--${message(code: 'default.button.create.label',default: '增加')}--}%
            %{--</a>--}%

            <g:addButton billTypeCode="${billTypeCode}" pageId="${pageId}" handler="onAdd" refHandler="onAdd"></g:addButton>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
               onclick="onEdit${pageId}()">${message(code: 'default.button.edit.label', default: '修改')}</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">
                ${message(code: 'default.button.delete.label', default: '删除')}
            </a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"
               onclick="$('#table${pageId}').datagrid('reload')">
                ${message(code: 'default.button.refresh.label', default: '刷新')}
            </a>

        <a href="#" class="easyui-menubutton" data-options="menu:'#closeOpt${pageId}'"   plain="true" >
           过期处理
        </a>



            <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
                ${message(code: 'default.button.query.label', default: '查询')}
            </a>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-check" onclick="onCheck${pageId}()">
                ${message(code: 'default.button.check.label', default: '审核')}
            </a>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-uncheck" onclick="onUnCheck${pageId}()">
                ${message(code: 'default.button.uncheck.label', default: '弃审')}
            </a>
            <a href="#" class="easyui-linkbutton" plain="true" onclick="jh${pageId}()">叫号</a>
            <a href="#" class="easyui-linkbutton" plain="true" onclick="jhSetting${pageId}()">设置</a>
        </div>



        <div id="closeOpt${pageId}">
            <div iconCls="icon-search" onclick="querystaleBill${pageId}()">
                显示过期通知单
            </div>
            <div iconCls="" onclick="onOpenBIll${pageId}()">
                打开
            </div>
            <div iconCls="" onclick="onCloseBill${pageId}()">
                关闭
            </div>
        </div>
        <g:render template="list"></g:render>
        %{--<g:render template="tree"></g:render>--}%
        %{--<g:render template="treelist"></g:render>--}%

    </div>
</div>