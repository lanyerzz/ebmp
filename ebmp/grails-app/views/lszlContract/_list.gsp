
<%@ page import="com.app.ywms.contract.BaseContract" %>
<g:set var="entityName" value="${message(code: 'baseContract.label', default: 'LszlContract')}" />
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
                    $('#card${pageId}').showMessage(json);

                    return;
                }
                onClose${pageId}();

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
                    $('#card${pageId}').showMessage(json);

                    return;
                }
                    onClose${pageId}();

                $("#table${pageId}").datagrid('reload');

                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
               },
            'json'
        );
    }
    var curPanelId=null;
    //增加
    function onAdd${pageId}(){
        var   addurl='${createLink(action: 'create')}';
        $('#list${pageId}').panel('close');

        curPanelId='card${pageId}';

        var div=$('<div id="card${pageId}" />');
        div.appendTo($('#main${pageId}'));
        div.panel({fit:true,href:addurl,border:false,noheader:true});

    }

    //修改
    function  onEdit${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择修改节点

            $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id
        $('#list${pageId}').panel('close');
        curPanelId='card${pageId}';

        var div=$('<div id="card${pageId}" />');
        div.appendTo($('#main${pageId}'));
        div.panel({fit:true,href:editurl,border:false,noheader:true});


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
        $('<div/>').dialog({
            title:'查询',
            iconCls:'icon-search',
            resizable:true,
            modal:true,
            width :600,
            height:500,
            href:'${createLink(action: 'createQuery')}',
            buttons:[{
                text : '查询',
                iconCls : 'icon-search',
                handler : function() {

                    var d = $(this).closest('.window-body');

                    onQuery${pageId}(d);
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }

    function onQuery${pageId}(d){
        $(d).dialog('close');
        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
    }


    function sign${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        //var index = $('#table${pageId}').datagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要签字的数据！'
            });
            return;
        };
        $.messager.confirm('${message(code:'default.check.message')}',
                '${message(code: 'default.button.check.confirm.message', default: 'Are you sure?')}',
                function(r){
                    if(r){


                        $.post('${createLink(action: 'check')}', { id: row.id },
                                function(data){

                                    if($(this).showMessage(data)){//有错误数据

                                        return;
                                    }
                                    row['checker']=data.data.checker
                                    row['checkDate']=data.data.checkDate
                                    $("#table${pageId}").datagrid('updateRow',{
                                        index:$('#table${pageId}').datagrid('getRowIndex',row),
                                        'row':row
                                    });
                                    $('#table${pageId}').datagrid('reload');

                                });
                    }
                }
        );
    }
    function unsign${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        // var index = $('#tb${pageId}').datagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要弃审的数据！'
            });
            return;
        };
        $.messager.confirm('${message(code:'default.uncheck.message')}',
                '${message(code: 'default.button.uncheck.confirm.message', default: 'Are you sure?')}',
                function(r){
                    if(r){


                        $.post('${createLink(action: 'uncheck')}', { id: row.id },
                                function(data){

                                    if($(document).showMessage(data)){//有错误数据

                                        return;
                                    }
                                    row['checker']=null;
                                    row['checkDate']=null
                                    $("#table${pageId}").datagrid('updateRow',{
                                        index:$('#table${pageId}').datagrid('getRowIndex',row),
                                        'row':row
                                    });
                                    $('#table${pageId}').datagrid('reload');

                                });
                    }
                }
        );
    }

    function onDblClickRow${pageId}(rowIndex, rowData){
        onEdit${pageId}();
    }

    function onResize${pageId}(w,h){
        if(curPanelId==null)
            return;
        $('#'+curPanelId).panel('resize',{width:w,height:h});
    }

    function onClose${pageId}(){
        curPanelId==null;
        $('#card${pageId}').panel('destroy');
        $('#list${pageId}').panel('open');

    }


</script>

<div id="main${pageId}" style="padding: 3px" class="easyui-panel" data-options="fit:true,border:false,noheader:true,onResize:onResize${pageId}"  >
<div id="list${pageId}" class="easyui-panel" title=""

     data-options="fit:true,border:false,noheader:true"
    >

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
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
        ${message(code: 'default.button.query.label',default: '查询')}
    </a>
    <a href="#" class="easyui-linkbutton"   plain="true" onclick="sign${pageId}()">
        ${message(code: 'default.button.sign.label',default: '签字')}
    </a>
    <a href="#" class="easyui-linkbutton"   plain="true" onclick="unsign${pageId}()">
        ${message(code: 'default.button.unsign.label',default: '取消签字')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid"
       url="${createLink(controller:'lszlContract', action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true"  pagination="true" pageSize="30"
        data-options="onDblClickRow:onDblClickRow${pageId}"
>

    <thead>
    <tr>
        <th colspan="5">基本合同信息</th>
        <th colspan="9">货物情况</th>
        <th colspan="16">超量条款(用于结算)</th>
        <th colspan="5">作业价格条款</th>
        <th colspan="8">货物交付条件</th>
        <th colspan="5">其他信息</th>
    </tr>
    </thead>
    <thead frozen="true">
    <tr >

        <th field="contractNo" sortable="true">${message(code: 'baseContract.contractNo.label', default: 'Contract No')}</th>

        <th field="contractNo2" sortable="true">${message(code: 'baseContract.contractNo2.label', default: 'Contrcnt No2')}</th>
    </tr>
    </thead>
    <thead>
    <tr>


        <th field="signDate" sortable="true" data-options="{formatter:dateFormate">${message(code: 'baseContract.signDate.label', default: 'Sign Date')}</th>

        <th field="endDate" sortable="true" data-options="{formatter:dateFormate">${message(code: 'baseContract.endDate.label', default: 'End Date')}</th>
        <th field="bdCumandoc.pkCubasdoc.custname" sortable="false" data-options="formatter:function(value,row){
            if(row.bdCumandoc){
                return row.bdCumandoc.pkCubasdoc.custname;
            }else{
                return value;
            }
        }"><g:message code="baseContract.bdCumandoc.label" default="Bd Cumandoc"/></th>
        <th field="signAddress" sortable="true">${message(code: 'baseContract.signAddress.label', default: 'Sign Address')}</th>

        <th field="contractescribe" sortable="true">${message(code: 'baseContract.contractescribe.label', default: 'Contractescribe')}</th>



        <th field="bdInvmandoc.pkInvbasdoc.invname" sortable="false" data-options="formatter:function(value,row){
            if(row.bdInvmandoc){
                return row.bdInvmandoc.pkInvbasdoc.invname;
            }else{
                return value;
            }
        }"><g:message code="baseContract.bdInvmandoc.label" default="Bd Invmandoc"/></th>

        <th field="checkType" sortable="true" data-options="formatter:function(value,row){
            if(row.checkType==0){
                return '罐检方式';
            }else if(row.checkType==1){
                return '穿检方式';
            }else{
                return value;
            }
        }">${message(code: 'baseContract.checkType.label', default: 'Check Type')}</th>

        <th field="gh.name" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'gh.name');
        }">${message(code: 'baseContract.gh.label', default: 'gh')}</th>

        <th field="myfs" sortable="true" data-options="formatter:function(value,row){
            if(row.myfs==0){
                return '内贸';
            }else if(row.myfs==1){
                return '外贸';
            }else if(row.myfs==2){
                return '内、外贸';
            }else{
                return value;
            }
        }">${message(code: 'baseContract.myfs.label', default: 'Myfs')}</th>

        <th field="cm.shipname" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'cm.shipname');
        }">${message(code: 'baseContract.cm.label', default: 'Cm')}</th>

        <th field="yjdgrq" sortable="true" data-options="{formatter:dateFormate">${message(code: 'baseContract.yjdgrq.label', default: 'Yjdgrq')}</th>

        <th field="htsl" sortable="true" data-options="align:'right'">${message(code: 'baseContract.htsl.label', default: 'Htsl')}</th>

        <th field="zgtj" sortable="true" data-options="align:'right'">${message(code: 'baseContract.zgtj.label', default: 'Zgtj')}</th>

        <th field="lybzj" sortable="true" data-options="align:'right'">${message(code: 'baseContract.lybzj.label', default: 'Lybzj')}</th>

        <th field="ccdj" sortable="true" data-options="align:'right'">${message(code: 'baseContract.ccdj.label', default: 'Ccdj')}</th>

        <th field="zxdj" sortable="true" data-options="align:'right'">${message(code: 'baseContract.zxdj.label', default: 'Zxdj')}</th>

        <th field="fkr" sortable="true" data-options="align:'right'">${message(code: 'baseContract.fkr.label', default: 'Fkr')}</th>

        <th field="rkszddrjfcs" sortable="true" data-options="formatter:function(value,row){
            if(row.rkszddrjfcs=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'baseContract.rkszddrjfcs.label', default: 'Rkszddrjfcs')}</th>

        <th field="cczq" sortable="true" data-options="align:'right'">${message(code: 'baseContract.cczq.label', default: 'Cczq')}</th>

        <th field="cqdj" sortable="true" data-options="align:'right'">${message(code: 'baseContract.cqdj.label', default: 'Cqdj')}</th>

        <th field="cqhlj" sortable="true" data-options="align:'right'">${message(code: 'baseContract.cqhlj.label', default: 'Cqhlj')}</th>

        <th field="azqlj" sortable="true" data-options="formatter:function(value,row){
            if(row.azqlj=='true'){
                return '是';
            }else{
                return '否';
            }
        }">${message(code: 'baseContract.azqlj.label', default: 'Azqlj')}</th>

        <th field="zxjl" sortable="true" data-options="align:'right'">${message(code: 'baseContract.zxjl.label', default: 'Zxjl')}</th>

        <th field="mcqfsl" sortable="true" data-options="align:'right'">${message(code: 'baseContract.mcqfsl.label', default: 'Mcqfsl')}</th>

        <th field="ccfzq" sortable="true" data-options="align:'right'">${message(code: 'baseContract.ccfzq.label', default: 'Ccfzq')}</th>

        <th field="ccfjsfs" sortable="true" data-options="formatter:function(value,row){
            if(row.ccfjsfs==0){
                return '按天计算';
            }else if(row.ccfjsfs==1){
                return '按周期第一天计费';
            }else{
                return value;
            }
        }">${message(code: 'baseContract.ccfjsfs.label', default: 'Ccfjsfs')}</th>

        <th field="zxsh" sortable="true" data-options="align:'right'">${message(code: 'baseContract.zxsh.label', default: 'Zxsh')}</th>

        <th field="bgsh" sortable="true" data-options="align:'right'">${message(code: 'baseContract.bgsh.label', default: 'Bgsh')}</th>

        <th field="cszq" sortable="true" data-options="align:'right'">${message(code: 'baseContract.cszq.label', default: 'Cszq')}</th>

        <th field="mcsts" sortable="true" data-options="align:'right'">${message(code: 'baseContract.mcsts.label', default: 'Mcsts')}</th>

        <th field="dlgt" sortable="true" data-options="align:'right'">${message(code: 'baseContract.dlgt.label', default: 'Dlgt')}</th>

        <th field="bdlgt" sortable="true" data-options="align:'right'">${message(code: 'baseContract.bdlgt.label', default: 'Bdlgt')}</th>

        <th field="ssbaf" sortable="true" data-options="align:'right'">${message(code: 'baseContract.ssbaf.label', default: 'Ssbaf')}</th>

        <th field="mtsyf" sortable="true" data-options="align:'right'">${message(code: 'baseContract.mtsyf.label', default: 'Mtsyf')}</th>

        <th field="jjtk" sortable="true" >${message(code: 'baseContract.jjtk.label', default: 'Jjtk')}</th>

        <th field="wflxr" sortable="true">${message(code: 'baseContract.wflxr.label', default: 'Wflxr')}</th>

        <th field="dflxr" sortable="true">${message(code: 'baseContract.dflxr.label', default: 'Dflxr')}</th>

        <th field="wflxdh" sortable="true">${message(code: 'baseContract.wflxdh.label', default: 'Wflxdh')}</th>

        <th field="dflxdh" sortable="true">${message(code: 'baseContract.dflxdh.label', default: 'Dflxdh')}</th>

        <th field="wfjsczh" sortable="true">${message(code: 'baseContract.wfjsczh.label', default: 'Wfjsczh')}</th>

        <th field="dffstdcz" sortable="true">${message(code: 'baseContract.dffstdcz.label', default: 'Dffstdcz')}</th>

        <th field="wfjsemail" sortable="true">${message(code: 'baseContract.wfjsemail.label', default: 'Wfjsemail')}</th>

        <th field="dffstdemail" sortable="true">${message(code: 'baseContract.dffstdemail.label', default: 'Dffstdemail')}</th>

        <th field="maker.userRealName" sortable="false" data-options="formatter:function(value,row){
            if(row.maker){
                return row.maker.userRealName;
            }else{
                return value;
            }
        }"><g:message code="baseContract.zdr.label" default="Zdr"/></th>

        <th field="makeDate" sortable="true" data-options="formatter:dateFormate">${message(code: 'baseContract.zdrq.label', default: 'Zdrq')}</th>

        <th field="checker.userRealName" sortable="false" data-options="formatter:function(value,row){
            if(row.checker){
                return row.checker.userRealName;
            }else{
                return value;
            }

        }"><g:message code="baseContract.shr.label" default="Shr"/></th>

        <th field="checkDate" sortable="true" data-options="formatter:dateFormate">${message(code: 'baseContract.shrq.label', default: 'Shrq')}</th>

        <th field="bz" sortable="true">${message(code: 'baseContract.bz.label', default: 'Bz')}</th>


    </tr>
    </thead>
</table>

</div>
</div>

