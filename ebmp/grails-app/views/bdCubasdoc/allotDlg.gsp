<script>


    function change${pageId}(new_,old_){

        $('#notAllotedList${pageId}').datagrid('reload',{'pkAreacl':'${pkAreacl}','pkCorp':new_});
        $('#allotedList${pageId}').datagrid('reload',{'pkAreacl':'${pkAreacl}','pkCorp':new_});
    }

    function onAllot${pageId}(){
        var row = $('#notAllotedList${pageId}').datagrid('getSelected');
        var corp = $('#corp').combotree('getValue');
        if(!corp){
            $.messager.show({
                title:'警告',
                msg:'请选择要分配的公司!'
            });
            return;
        }
        if(!row){
            $.messager.show({
                title:'警告',
                msg:'请选择要分配的客商!'
            });
            return;
        }
        var index = $('#notAllotedList${pageId}').datagrid('getRowIndex',row)
        $.post('${createLink(action:'allot')}',{'pkCubasdoc':row.id,'pkCorp':corp},function(json){
            if(json.success){
                $('#notAllotedList${pageId}').datagrid('deleteRow',index);
                $('#allotedList${pageId}').datagrid('insertRow',{
                    index:0,
                    row:row
                });
                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
            }

        });
    }

    function onAllotAll${pageId}(){
        var areacl = '${pkAreacl}'
        var corp = $('#corp').combotree('getValue');
        if(!corp){
            $.messager.show({
                title:'警告',
                msg:'请选择要分配的公司!'
            });
            return;
        }
        if(!areacl){
            $.messager.show({
                title:'警告',
                msg:'请选择存货分类!'
            });
            return;
        }
        $.post('${createLink(action:'allotAll')}',{'pkCorp':corp,'pkAreacl':areacl},function(json){
            if(json.success){
                $('#notAllotedList${pageId}').datagrid('reload');
                $('#allotedList${pageId}').datagrid('reload');
                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
            }

        });

    }

    function onCancelAllot${pageId}(){
        var row = $('#allotedList${pageId}').datagrid('getSelected');
        var corp = $('#corp').combotree('getValue');
        if(!corp){
            $.messager.show({
                title:'警告',
                msg:'请选择要分配的公司!'
            });
            return;
        }
        if(!row){
            $.messager.show({
                title:'警告',
                msg:'请选择要取消分配的存货!'
            });
            return;
        }
        var index = $('#allotedList${pageId}').datagrid('getRowIndex',row)
        $.post('${createLink(action:'deleteAllot')}',{'pkCubasdoc':row.id,'pkCorp':corp},function(json){
            if(json.success){
                $('#allotedList${pageId}').datagrid('deleteRow',index);
                $('#notAllotedList${pageId}').datagrid('insertRow',{
                    index:0,
                    row:row
                });
                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
            }

        });
    }

    function onCancelAllotAll${pageId}(){
        var areacl = '${pkAreacl}';
        var corp = $('#corp').combotree('getValue');
        if(!corp){
            $.messager.show({
                title:'警告',
                msg:'请选择要分配的公司!'
            });
            return;
        }
        if(!areacl){
            $.messager.show({
                title:'警告',
                msg:'请选择存货分类!'
            });
            return;
        }
        $.post('${createLink(action:'deleteAllotAll')}',{'pkCorp':corp,'pkAreacl':areacl},function(json){
            if(json.success){
                $('#allotedList${pageId}').datagrid('reload');
                $('#notAllotedList${pageId}').datagrid('reload');
                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
            }

        });
    }
</script>
<div class="easyui-layout" fit="true">
    <div region="north" border="false" style="height:35px">
        <div id="corp${pageId}" class="fieldcontain  ">
            <label for="corp">
                <g:message code="bdCubasdoc.pkCorp.label" default="Pk Corp" />

            </label>
            <input id="corp" data-options="onChange:change${pageId}" class="easyui-combotree"  valueField="id" textField="unitName" idField="id" textField="unitName" url="${createLink(controller:'bdCorp',action:'query')}" required="" style="width:150px"/>
        </div>
    </div>
    <div region="west" style="width:245px">
        <table id="notAllotedList${pageId}" class="easyui-datagrid" url="${createLink(action:'queryCubasdocNotInCorp')}" fit="true" singleSelect="true">
            <thead>
            <tr>
                <th field="custcode" sortable="true"><g:message code="bdCubasdoc.custcode.label"></g:message></th>
                <th field="custname" sortable="true"><g:message code="bdCubasdoc.custname.label"></g:message></th>
            </tr>
            </thead>
        </table>
    </div>
    <div region="center" style="width:30px" align="center" style="padding:10px;">
        <div style="margin-top:100px">
            <a href="#" class="easyui-linkbutton" iconCls="" plain="false"  onclick="onAllot${pageId}() ">
                ${message(code: 'default.button.allotSingle.label',default: '单条分配')}
            </a>
        </div>
        <div>
            <a href="#" class="easyui-linkbutton" iconCls="" plain="false"  onclick="onAllotAll${pageId}() ">
                ${message(code: 'default.button.allotAll.label',default: '全部分配')}
            </a>
        </div>
        <div>
            <a href="#" class="easyui-linkbutton" iconCls="" plain="false"  onclick="onCancelAllot${pageId}() ">
                ${message(code: 'default.button.cancelAllot.label',default: '取消分配')}
            </a>
        </div>
        <div>
            <a href="#" class="easyui-linkbutton" iconCls="" plain="false"  onclick="onCancelAllotAll${pageId}() ">
                ${message(code: 'default.button.cancelAllotAll.label',default: '全部取消')}
            </a>
        </div>
    </div>
    <div region="east" style="width:245px">
        <table id="allotedList${pageId}" class="easyui-datagrid" url="${createLink(action:'queryCubasdocInCorp')}" fit="true" singleSelect="true">
            <thead>
            <tr>
                <th field="custcode" sortable="true"><g:message code="bdCubasdoc.custcode.label"></g:message></th>
                <th field="custname" sortable="true"><g:message code="bdCubasdoc.custname.label"></g:message></th>
            </tr>
            </thead>
        </table>
    </div>

</div>
