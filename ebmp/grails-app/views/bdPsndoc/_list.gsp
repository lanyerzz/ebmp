
<%@ page import="com.app.bd.psndoc.BdPsndoc" %>
<g:set var="entityName" value="${message(code: 'bdPsndoc.label', default: 'BdPsndoc')}" />
<script>
    $(function(){
        $('#table${pageId}').datagrid({
            view: detailview,
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table id="table-sub${pageId}-' + index + '" name="table-sub${pageId}"></table></div>';
            },
            onExpandRow: function(index,row){

                $('#table-sub${pageId}-'+index).datagrid({
                    url:'${createLink(action: 'queryBas')}?psnId='+row.id,
                    fitColumns:true,
                    singleSelect:true,
                    rownumbers:true,
                    //loadMsg:'',
                    height:'auto',
                    columns:[[
                        {field:'name',title:'<g:message code="bdPsnbasdoc.name.label" />'},
                        {field:'usedname',title:'<g:message code="bdPsnbasdoc.usedname.label" />'},
                        {field:'sex',title:'<g:message code="bdPsnbasdoc.sex.label" />',formatter:function(value,row){
                            if(row.sex=='male'){
                                return '男';
                            }if(row.sex=='female'){
                                return '女';
                            }else{
                                return value;
                            }
                        }},
                        {field:'birthdate',title:'${message(code: 'bdPsnbasdoc.birthdate.label', default: 'birthdate')}',formatter:dateFormate},
                        {field:'shenfenzhenghao',title:'${message(code: 'bdPsnbasdoc.shenfenzhenghao.label', default: 'shenfenzhenghao')}'},
                        {field:'addr',title:'${message(code: 'bdPsnbasdoc.addr.label', default: 'addr')}'},
                        {field:'bdCorp.unitName',title:'${message(code: 'bdPsnbasdoc.bdCorp.label')}',formatter:function(value,row){
                            if(row.bdCorp==null) return value;
                            return row.bdCorp.unitName;
                        }},
                        {field:'email',title:'${message(code: 'bdPsnbasdoc.email.label')}'},
                        {field:'homephone',title:'${message(code: 'bdPsnbasdoc.homephone.label')}'},
                        {field:'joinworkdate',title:'${message(code: 'bdPsnbasdoc.joinworkdate.label')}',formatter:dateFormate},
                        {field:'mobile',title:'${message(code: 'bdPsnbasdoc.mobile.label')}'},
                        {field:'officephone',title:'${message(code: 'bdPsnbasdoc.officephone.label')}'},
                        {field:'postalcode',title:'${message(code: 'bdPsnbasdoc.postalcode.label')}'},
                        {field:'ssnum',title:'${message(code: 'bdPsnbasdoc.ssnum.label')}'}

                    ]],
                    onResize:function(){
                        $('#table${pageId}').datagrid('fixDetailRowHeight',index);
                    },
                    onLoadSuccess:function(){
                        setTimeout(function(){
                            $('#table${pageId}').datagrid('fixDetailRowHeight',index);
                        },0);
                    }
                });
                $('#table${pageId}').datagrid('fixDetailRowHeight',index);
            }
        });

        $('#tree${pageId}').tree({
            onDblClick:function(node){

                $('#table${pageId}').datagrid({
                    url:'${createLink(action:'query')}?pkDept='+node.id
                });


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
            var isValid1 = $('#psnbasForm${pageId}').form('validate');
            if (!isValid1){
                $.messager.progress('close');	// hide progress bar while the form is invalid
                return;
            }

            var obj= $('#form${pageId}').serializeObject();
            alert(JSON.stringify(obj));
            var obj1 = $('#psnbasForm${pageId}').serializeObject();
            $.post( '${createLink(action: 'update')}',{'obj':encodeURI(JSON.stringify(obj)),'obj1':encodeURI(JSON.stringify(obj1))},function(json){

                var row = $("#table${pageId}").datagrid('getSelected');
                $.messager.progress('close');	// hide progress bar while submit successfully

                if(d.showMessage(json)){//有错误数据

                    return;
                }
                d.dialog('destroy');

                $("#table${pageId}").datagrid('updateRow',{
                    index:$('#table${pageId}').datagrid('getRowIndex',row),
                    row:json
                });
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
        var isValid1 = $('#psnbasForm${pageId}').form('validate');
        if (!isValid1){
            $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }
        var obj= $('#form${pageId}').serializeObject();

        var obj1 = $('#psnbasForm${pageId}').serializeObject();


        $.post( '${createLink(action: 'save')}',{'obj':encodeURI(JSON.stringify(obj)),'obj1':encodeURI(JSON.stringify(obj1))},function(json){

                var row = $("#table${pageId}").datagrid('getSelected');
                    $.messager.progress('close');	// hide progress bar while submit successfully

                if(d.showMessage(json)){//有错误数据


                    return;
                }
                d.dialog('destroy');

                $("#table${pageId}").datagrid('insertRow',{
                    index:0,
                    row:json.psn
                });
                $("#psnbasTable${pageId}").datagrid('insertRow',{
                    index:0,
                    row:json.psnbas
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
        if(node == null){
            $.messager.show({
                title:'警告',
                msg:'请选择部门分类！'
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
        var addurl='${createLink(action: 'create')}?deptId='+node.id
        $('<div/>').dialog({
            title:'添加人员档案',
            iconCls:'icon-add',
            resizable:false,
            modal:true,
            width:700,
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
            title:'编辑人员档案',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:700,
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



</script>


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
</div>
<div class="easyui-layout" fit="true">
    <div region="west" title="部门" style="width: 200px">
        <ul id="tree${pageId}" class="easyui-tree" url="${createLink(action:'queryTree')}?=${id}">

        </ul>
    </div>
    <div region="center">
                %{--表格--}%
                <table id="table${pageId}"  class="easyui-datagrid"
                       rownumbers="true"
                       fit="true" toolbar="#tb${pageId}" singleSelect="true" fitColumns="true" pagination="true" pageSize="30">

                    <thead>

                    <tr>


                        <th field="psncode" sortable="true">${message(code: 'bdPsndoc.psncode.label', default: 'Psncode')}</th>

                        <th field="psnname" sortable="true">${message(code: 'bdPsndoc.psnname.label', default: 'Psnname')}</th>

                        <th field="amcode" sortable="true">${message(code: 'bdPsndoc.amcode.label', default: 'Amcode')}</th>

                        <th field="bdCorp.unitName" sortable="false" data-options="formatter:function(value,row){
                            if(row.bdCorp==null)return value;
                            return row.bdCorp.unitName;
                        }"><g:message code="bdPsndoc.bdCorp.label" default="Bd Corp"/></th>

                        <th field="bdDeptdoc.deptName" sortable="false" data-options="formatter:function(value,row){
                            if(row.bdDeptdoc==null) return value;
                            return row.deDeptdoc.deptName
                        }"><g:message code="bdPsndoc.bdDeptdoc.label" default="Bd Deptdoc"/></th>

                        <th field="bdPsncl.name" sortable="false" data-options="formatter:function(value,row){
                            if(row.bdPsncl==null) return value;
                            return row.bdPsncl.name;
                        }"><g:message code="bdPsndoc.bdPsncl.label" default="Bd Psncl"/></th>

                        <th field="clerkcode" sortable="true">${message(code: 'bdPsndoc.clerkcode.label', default: 'Clerkcode')}</th>

                        <th field="clerkflag" sortable="true">${message(code: 'bdPsndoc.clerkflag.label', default: 'Clerkflag')}</th>

                        <th field="indocflag" sortable="true">${message(code: 'bdPsndoc.indocflag.label', default: 'Indocflag')}</th>

                        <th field="indutydate" sortable="true" data-options="formatter:dateFormate">${message(code: 'bdPsndoc.indutydate.label', default: 'Indutydate')}</th>

                        <th field="innercode" sortable="true">${message(code: 'bdPsndoc.innercode.label', default: 'Innercode')}</th>

                        <th field="jobrank" sortable="true">${message(code: 'bdPsndoc.jobrank.label', default: 'Jobrank')}</th>

                        <th field="jobseries" sortable="true">${message(code: 'bdPsndoc.jobseries.label', default: 'Jobseries')}</th>

                        <th field="maxinnercode" sortable="true">${message(code: 'bdPsndoc.maxinnercode.label', default: 'Maxinnercode')}</th>

                        <th field="outdutydate" sortable="true">${message(code: 'bdPsndoc.outdutydate.label', default: 'Outdutydate')}</th>

                        <th field="psnclscope" sortable="true">${message(code: 'bdPsndoc.psnclscope.label', default: 'Psnclscope')}</th>

                        <th field="sealdate" sortable="true">${message(code: 'bdPsndoc.sealdate.label', default: 'Sealdate')}</th>

                    </tr>
                    </thead>
                </table>
            %{--<div title="人员基本档案" >--}%
                %{--<table id="psnbasTable${pageId}"  class="easyui-datagrid"--}%
                       %{--rownumbers="true"--}%
                       %{--fit="true"  singleSelect="true" fitColumns="true" pagination="true" pageSize="30">--}%

                    %{--<thead>--}%

                    %{--<tr>--}%


                        %{--<th field="name" sortable="true">${message(code: 'bdPsnbasdoc.name.label', default: 'Name')}</th>--}%

                        %{--<th field="usedname" sortable="true">${message(code: 'bdPsnbasdoc.usedname.label', default: 'Usedname')}</th>--}%

                        %{--<th field="sex" sortable="true" data-options="formatter:function(value,row){--}%
                            %{--if(row.sex=='male'){--}%
                                %{--return '男';--}%
                            %{--}if(row.sex=='female'){--}%
                                %{--return '女';--}%
                            %{--}else{--}%
                                %{--return value;--}%
                            %{--}--}%
                        %{--}">${message(code: 'bdPsnbasdoc.sex.label', default: 'Sex')}</th>--}%

                                %{--<th field="birthdate" sortable="true" data-options="formatter:dateFormate">${message(code: 'bdPsnbasdoc.birthdate.label', default: 'Birthdate')}</th>--}%

                                %{--<th field="shenfenzhenghao" sortable="true">${message(code: 'bdPsnbasdoc.shenfenzhenghao.label', default: 'Shenfenzhenghao')}</th>--}%

                                %{--<th field="addr" sortable="true">${message(code: 'bdPsnbasdoc.addr.label', default: 'Addr')}</th>--}%

                                %{--<th field="bdCorp.unitName" sortable="false" data-options="formatter:function(value,row){--}%
                            %{--if(row.bdCorp==null||row.bdCorp.unitName==null) return value;--}%
                            %{--return row.bdCorp.unitName;--}%
                        %{--}"><g:message code="bdPsnbasdoc.bdCorp.label" default="Bd Corp"/></th>--}%

                        %{--<th field="email" sortable="true">${message(code: 'bdPsnbasdoc.email.label', default: 'Email')}</th>--}%

                        %{--<th field="homephone" sortable="true">${message(code: 'bdPsnbasdoc.homephone.label', default: 'Homephone')}</th>--}%

                        %{--<th field="joinworkdate" sortable="true" data-options="formatter:dateFormate">${message(code: 'bdPsnbasdoc.joinworkdate.label', default: 'Joinworkdate')}</th>--}%

                        %{--<th field="mobile" sortable="true">${message(code: 'bdPsnbasdoc.mobile.label', default: 'Mobile')}</th>--}%

                        %{--<th field="officephone" sortable="true">${message(code: 'bdPsnbasdoc.officephone.label', default: 'Officephone')}</th>--}%

                        %{--<th field="postalcode" sortable="true">${message(code: 'bdPsnbasdoc.postalcode.label', default: 'Postalcode')}</th>--}%

                        %{--<th field="ssnum" sortable="true">${message(code: 'bdPsnbasdoc.ssnum.label', default: 'Ssnum')}</th>--}%


                    %{--</tr>--}%
                    %{--</thead>--}%
                %{--</table>--}%
            %{--</div>--}%
    </div>
</div>

