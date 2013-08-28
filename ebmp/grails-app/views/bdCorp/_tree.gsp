
<%@ page import="com.app.bd.corp.BdCorp" %>
<g:set var="entityName" value="${message(code: 'bdCorp.label', default: 'BdCorp')}" />
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

        $.post( '${createLink(action: 'update')}',
                obj,
                function(json){

                    var row = $("#table${pageId}").treegrid('getSelected');
//                    var json=jQuery.parseJSON(node);
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
    function onSave${pageId}(d){
        $.messager.progress();	// display the progress bar

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
            $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var obj= $('#form${pageId}').serializeObject();
        $.post( '${createLink(action: 'save')}',
                obj,
                function(json){

                    var row = $("#table${pageId}").treegrid('getSelected');
//                    var json=jQuery.parseJSON(node);
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
    function onAdd${pageId}(){
        var row=$('#table${pageId}').treegrid('getSelected');

        if(row == null){//选择父节点
            $.messager.show({
                title:'警告',
                msg:'不允许新增集团'
            });
        }else{
            var addurl='${createLink(action: 'create')}'
            if(row!=null){
                addurl+='/'+row.id;
            }
            $('<div/>').dialog({
                title:'添加公司',
                iconCls:'icon-add',
                resizable:false,
                modal:true,
                width:400,
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



    }

    //修改
    function  onEdit${pageId}(){
        var row=$('#table${pageId}').treegrid('getSelected');
        if(row == null){//选择父节点

            $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id

        $('<div/>').dialog({
            title:'编辑公司',
            iconCls:'icon-edit',
            resizable:false,
            modal:true,
            width:400,
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

        var row=$('#table${pageId}').treegrid('getSelected');
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
                                    $('#table${pageId}').treegrid('remove',data);
                                    $.messager.show({
                                        title:'消息',
                                        msg:'数据已经删除！'
                                    });
                                });
                    }
                }
        );
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
    <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#table${pageId}').treegrid('reload')">
        ${message(code: 'default.button.refresh.label',default: '刷新')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-treegrid" style="width:400px;height:300px"
       url="${createLink(controller:'bdCorp',action: 'query')}"
       rownumbers="true"
       idField="id" treeField="unitName" fit="true" toolbar="#tb${pageId}">

    <thead>

    <tr>

        
        <th field="unitCode" sortable="false">${message(code: 'bdCorp.unitCode.label', default: '公司编码')}</th>

        <th field="unitName" sortable="false">${message(code: 'bdCorp.unitName.label', default: '公司名称')}</th>

        <th field="foreignname" sortable="false">${message(code: 'bdCorp.foreignname.label', default: '外文名称')}</th>

        <th field="unitshortname" sortable="false">${message(code: 'bdCorp.unitshortname.label', default: '公司简称')}</th>



        <th field="url" sortable="false">${message(code: 'bdCorp.url.label', default: 'Web网址')}</th>

        <th field="begindate" sortable="false"  align="right" data-options="formatter:dateFormate">${message(code: 'bdCorp.begindate.label', default: '业务开始日期')}</th>

        <th field="enddate" sortable="false" align="right" data-options="formatter:dateFormate">${message(code: 'bdCorp.enddate.label', default: '业务终止日期')}</th>

        <th field="briefintro" sortable="false">${message(code: 'bdCorp.briefintro.label', default: '简介')}</th>

        <th field="currencyType.currtypename" sortable="false" data-options="formatter:function(value,row,index){
				if (row.currencyType){
					return row.currencyType.currtypename;
				} else {
					return value;
				}
			}"><g:message code="bdCorp.currencyType.label" default="币种"/></th>

        <th field="fax1" sortable="false">${message(code: 'bdCorp.fax1.label', default: '传真1')}</th>

        <th field="fax2" sortable="false">${message(code: 'bdCorp.fax2.label', default: '传真2')}</th>

        <th field="ishasaccount" sortable="false" data-options="align:'center',formatter:function(value,row){
            if(row.ishasaccount=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'bdCorp.ishasaccount.label', default: '是否已建帐')}</th>
        
        <th field="isseal" sortable="false" data-options="align:'center',formatter:function(value,row){
            if(row.isseal=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'bdCorp.isseal.label', default: '是否封存')}</th>
        

        
        <th field="memo" sortable="false">${message(code: 'bdCorp.memo.label', default: '备注')}</th>
        
        <th field="phone1" sortable="false">${message(code: 'bdCorp.phone1.label', default: '电话1')}</th>
        
        <th field="phone2" sortable="false">${message(code: 'bdCorp.phone2.label', default: '电话2')}</th>
        
        <th field="phone3" sortable="false">${message(code: 'bdCorp.phone3.label', default: '电话3')}</th>
        
        <th field="zipCode" sortable="false">${message(code: 'bdCorp.zipCode.label', default: '邮政编码')}</th>
    </tr>
    </thead>
</table>





