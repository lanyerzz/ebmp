<script>



//    更新
    function onUpdate${pageId}(d){


        $('#form${pageId}').form('submit', {
            url:'${createLink(controller: 'smFunction',action: 'update')}',
            onSubmit: function(){
                var isValid = $(this).form('validate');
                if (!isValid){
                    $.messager.progress('close');	// hide progress bar while the form is invalid
                }
                return isValid;	// return false will stop the form submission
            },
            success: function(node){

                {
                    var json=  jQuery.parseJSON(node);
                    if(d.showMessage(json)){//有错误数据

                        return true;
                    }
                    d.dialog('destroy');
                    %{--index:$('#table${pageId}').treegrid('getSelected')--}%
                    if(json.parentId!='0')
                     $("#table${pageId}").treegrid('reload',json.parentId);
                    else
                        $("#table${pageId}").treegrid('reload');
                    $.messager.show({
                        title:'消息',
                        msg:'修改完成！'
                    });
                }

            }
        });
    }




//    保存
    function onSave${pageId}(d){

        $.messager.progress();	// display the progress bar
        $('#form${pageId}').form('submit', {
            url:'${createLink(controller: 'smFunction',action: 'save')}',
                onSubmit: function(){
            var isValid = $(this).form('validate');
            if (!isValid){
                $.messager.progress('close');	// hide progress bar while the form is invalid
            }
            return isValid;	// return false will stop the form submission
        },
        success: function(node){
            var row = $("#table${pageId}").treegrid('getSelected');
            var json=jQuery.parseJSON(node);
            $.messager.progress('close');	// hide progress bar while submit successfully

            if(d.showMessage(json)){//有错误数据

                return;
            }
            d.dialog('destroy');
            var nodes=[]
            nodes[0]=json
            if(row != null && row.state == "closed"){
                $("#table${pageId}").treegrid('reload',json.parentId);
            }else{
                $("#table${pageId}").treegrid('append',{
                    parent: json.parentId,  // the node has a 'id' value that defined through 'idField' property
                    data: nodes
                });

            }


            $.messager.show({
                title:'消息',
                msg:'操作完成！'
            });
            }

    });
    }

//增加
    function onAdd${pageId}(){
        var row=$('#table${pageId}').treegrid('getSelected');
        var addurl='${createLink(controller: 'smFunction',action: 'create')}'
        if(row!=null){
            addurl+='/'+row.id;
        }
        $('<div/>').dialog({
            title:'添加节点',
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

//修改
  function  onEdit${pageId}(){
      var row=$('#table${pageId}').treegrid('getSelected');
      if(row == null){//选择父节点

          $.messager.show({title:'警告',msg:'请选择修改的数据'});
          return;
      }

      var editurl='${createLink(controller: 'smFunction',action: 'edit')}/'+row.id

      $('<div/>').dialog({
          title:'编辑节点',
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


                        $.post('${createLink(controller: 'smFunction',action: 'delete')}', { id: row.id },
                                function(data){

                                    $(this).showMessage(data);
                                    $('#table${pageId}').treegrid('remove',data.id);
//
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
<table id="table${pageId}"  class="easyui-treegrid"
       url="${createLink(controller:'smFunction',action: 'query1')}"
       rownumbers="true"
       idField="id" treeField="funName" fit="true" toolbar="#tb${pageId}">

   <thead frozen="true">
    <tr>
        <th field="funCode" width="60" align="right">${message(code: 'smFunction.funCode.label', default: 'Fun Code')}</th>
        <th field="funName" width="160">${message(code: 'smFunction.funName.label', default: '节点名称')}</th>
    </tr>
    </thead>
    <thead>
    <tr>

        <th field="funType_"> <g:message code="smFunction.funType.label" default="节点类型" /></th>
        <th field="smcontroller" width="100"><g:message code="smFunction.smcontroller.label" default="Controller" /></th>
        <th field="smaction" width="100"><g:message code="smFunction.smaction.label" default="Action" /></th>
        <th field="url" width="100"><g:message code="smFunction.url.label" default="URL" /></th>
        <th field="configAttribute" width="100"><g:message code="smFunction.configAttribute.label" default="Config Attribute" /></th>
        <th field="pubBilltype" width="100"><g:message code="smFunction.pubBilltype.label" default="单据类型"></g:message></th>
        <th field="icUrl" width="100"><g:message code="smFunction.icUrl.label" default="图标" /></th>
        <th field="helpLink" width="100"><g:message code="smFunction.helpLink.label" default="帮助文档链接" /></th>
        <th field="resourceCode" width="100"><g:message code="smFunction.resourceCode.label" default="资源编码" /></th>

    </tr>
    </thead>
</table>

