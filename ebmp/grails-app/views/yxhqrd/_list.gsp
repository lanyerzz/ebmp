
<%@ page import="com.app.ywms.rk.xhqrd.Yxhqrd" %>
<g:set var="entityName" value="${message(code: 'yxhqrd.label', default: 'Yxhqrd')}" />
<script>


    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?targetBill=${targetBill}&billTypeCode=${billTypeCode}",
            view: detailview,
            onDblClickRow:function(rowIndex, rowData){
                onShow${pageId}();
            },
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table id="tb-sub${pageId}-' + index + '" ></table></div>';
            },
            onExpandRow: function(index,row){
                $('#tb-sub${pageId}-'+index).datagrid({
                    url:'${createLink(action: 'queryGH')}?id='+row.id+'&targetBill=${targetBill}',
                    fitColumns:true,
                    singleSelect:true,
                    rownumbers:true,
                    //loadMsg:'',
                    height:'auto',
                    singleSelect:false,
                    columns:[[
                        {field:'bdTank.code',title:'<g:message code="baseContract.gh.label" />',formatter:function(value,row){
                            return getObjectAttr(row,'bdTank.code');
                        }},
                        {field:'sjsl',title:'商检数量'},

                        {field:'gjsl',title:'罐检数量'},
                        {field:'cjsl',title:'船检数量'},
                        {field:'cjsl',title:'备注'}
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
    });



    function onShow${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');

        var url='${createLink(action:'show')}/'+row.id;

        showCard(url,'${pageId}');
    }




    //    保存
    function onSave${pageId}(d){

        $.messager.progress();	// display the progress bar

       if(! $('#rowTable${pageId}').edatagrid('validateRows')){

           $.messager.progress('close');
        return;

       }

        var isValid = $('#form${pageId}').form('validate');
        if (!isValid){
        $.messager.progress('close');	// hide progress bar while the form is invalid
            return;
        }

        var head= $('#form${pageId}').serializeObject();


        var bodys = $('#rowTable${pageId}').edatagrid('getJSON');



            $.post( '${createLink(action: 'save')}',{'head':JSON.stringify(head),'gh':JSON.stringify(bodys)},function(json){

                var row = $("#table${pageId}").datagrid('getSelected');
                    $.messager.progress('close');	// hide progress bar while submit successfully

                if($('#card${pageId}').showMessage(json)){//有错误数据


                    return;
                }
                    onClose${pageId}();


                $('#table${pageId}').datagrid('reload');
                $.messager.show({
                    title:'消息',
                    msg:'操作完成！'
                });
               },
            'json'
        );
    }
    function onRefPage${pageId}(businessKey,billTypeKey,title){
        var xhjhdurl='${createLink(controller: 'pubBusinessType', action:'refPage')}?handler=getSelected${pageId}&businessKey='+businessKey+'&billTypeKey='+billTypeKey;
        $("<div/>").dialog({
            title:title,
            resizable:false,
            modal:true,
            width:1000,
            height:500,

            href:xhjhdurl,
            buttons:[{
                text : '增加',
                iconCls : 'icon-add',
                handler : function() {
                    var data=   getSelected${pageId}();


                    if(data.length==0){
                        $.messager.show({
                            title:'警告',
                            msg:'请选择卸货计划单!'
                        });
                        return;
                    }

                    var a = $(this).closest('.window-body');
                    onAdd${pageId}(data);
                    a.dialog('destroy');
                }
            }],
            onClose : function() {
                $(this).dialog('destroy');
            }
        });

    }

    //增加
    function onAdd${pageId}(data){
        var addurl
        if($.type(data)=='object'){
            addurl='${createLink(action: 'create')}?keys='+data.data+'&businessKey='+data.businessKey+'&sourceBillTypeCode='+data.sourceBillTypeCode;

        }else{
            addurl='${createLink(action: 'create')}?businessKey='+data;
        }
        showCard(addurl,'${pageId}');
    }

    //修改
    function  onEdit${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        if(row == null){//选择修改节点

            $.messager.show({title:'警告',msg:'请选择修改的数据'});
            return;
        }
        var editurl='${createLink(action:'edit')}/'+row.id
        showCard(editurl,'${pageId}');

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
                                    %{--$('#table${pageId}').datagrid('deleteRow',index);--}%
                                    $.messager.show({
                                        title:'消息',
                                        msg:'数据已经删除！'
                                    });
                                    $('#table${pageId}').datagrid('reload');
                                });
                    }
                }
    );
    }

    function onOpenQuery${pageId}(){
//        $('#query${pageId}').dialog('open');
        $('<div/>').dialog({
            title:'查询',
            iconCls:'icon-search',
            resizable:true,
            modal:true,
//            fit:true,
            width :600,
            height:500,
            // inline:true,
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

    function onQuery${pageId}(){

        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
    }

    //审核
    function onCheck${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        //var index = $('#table${pageId}').datagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要审核的数据！'
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


                                    $('#table${pageId}').datagrid('reload');
                                });
                    }
                }
        );
    }



    //弃审
    function onUnCheck${pageId}(){
        var row=$('#table${pageId}').datagrid('getSelected');
        //var index = $('#table${pageId}').datagrid('getRowIndex',row);
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

                                    if($(this).showMessage(data)){//有错误数据

                                        return;
                                    }


                                    $('#table${pageId}').datagrid('reload');

                                });
                    }
                }
        );
    }

    function onResize${pageId}(w,h){

        $('#card${pageId}').panel('resize',{width:w,height:h});
    }

    function onClose${pageId}(){
        $('#card${pageId}').panel('destroy');
        $('#list${pageId}').panel('open');

    }

</script>


<div id="main${pageId}" style="padding: 3px" class="easyui-panel" data-options="fit:true,border:false,noheader:true,onResize:onResize${pageId}"  >
<div id="list${pageId}" class="easyui-panel" title=""

     data-options="fit:true,border:false,noheader:true">
%{--按钮--}%
<div id="tb${pageId}">
    <g:addButton pageId="${pageId}" refHandler="onRefPage" handler="onAdd" billTypeCode="${billTypeCode}"></g:addButton>
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
    <a href="#" class="easyui-linkbutton"  plain="true" iconCls="icon-check" onclick="onCheck${pageId}()">
        ${message(code: 'default.button.check.label',default: '审核')}
    </a>
    <a href="#" class="easyui-linkbutton"  plain="true" iconCls="icon-uncheck" onclick="onUnCheck${pageId}()">
        ${message(code: 'default.button.uncheck.label',default: '弃审')}
    </a>
</div>
%{--表格--}%
<table id="table${pageId}"  class="easyui-datagrid"
       url="${createLink(action: 'query')}"
       rownumbers="true"
       fit="true" toolbar="#tb${pageId}" singleSelect="true"  pagination="true" pageSize="30"
        data-options="onDblClickRow:function(rowIndex, rowData){
               onShow${pageId}();
            }">

    <thead>

    <tr>
        <th colspan="16">客户航次基本信息</th>
        <th colspan="22">客户数量确认</th>
        <th colspan="12">结算信息</th>
        <th colspan="4">其他</th>
    </tr>
    </thead>
    <thead frozen="true">
    <tr >



        <th field="billno" sortable="true">${message(code: 'yxhqrd.billNo.label', default: 'Billno')}</th>
        <th field="billdate" sortable="true" data-options="formatter:dateFormate">${message(code: 'yxhqrd.billdate.label', default: 'billdate')}</th>

        <th field="businessType.name" sortable="true" data-options="formatter:function(value,row){

            return getObjectAttr(row,'businessType.name');
        }">${message(code: 'yxhjhd.businessType.label')}</th>

        </tr>
    </thead>
    <thead>
        <tr>
            <th field="tsjc" sortable="true" data-options="formatter:booleanFormate">${message(code: 'yxhqrd.tsjc.label', default: 'Tsjc')}</th>

            <th field="zgzf" sortable="true" data-options="formatter:booleanFormate">${message(code: 'yxhqrd.zgzf.label', default: 'Zgzf')}</th>
            <th field="bs" sortable="true" data-options="formatter:booleanFormate">${message(code: 'yxhqrd.bs.label', default: 'Bs')}</th>

        <th field="ship.shipname" sortable="false" data-options="formatter:function(value,row){
            if(row.ship==null) return value;
            return row.ship.shipname;
        }"><g:message code="yxhqrd.ship.label" default="Ship"/></th>

        <th field="hc" sortable="true">${message(code: 'yxhqrd.hc.label', default: 'Hc')}</th>

        <th field="dgsj" sortable="true" data-options="formatter:dateFormate">${message(code: 'yxhqrd.dgsj.label', default: 'Dgsj')}</th>

        <th field="bdCumandoc.pkCubasdoc.custname" sortable="false" data-options="formatter:function(value,row){
            if(row.bdCumandoc==null) return value;
            return row.bdCumandoc.pkCubasdoc.custname;
        }"><g:message code="yxhqrd.bdCumandoc.label" default="Bd Cumandoc"/></th>

        <th field="jgrq" sortable="true" data-options="formatter:dateFormate">${message(code: 'yxhqrd.jgrq.label', default: 'Jgrq')}</th>

        <th field="bdInvmandoc.pkInvbasdoc.invname" sortable="false" data-options="formatter:function(value,row){
            if(row.bdInvmandoc==null) return value;
            return row.bdInvmandoc.pkInvbasdoc.invname;
        }"><g:message code="yxhqrd.bdInvmandoc.label" default="Bd Invmandoc"/></th>

        <th field="myxz" sortable="true" data-options="formatter:function(value,row){
            if(value==0){
                return '内贸';
            }else if(value==1){
                return '外贸';
            }
        }">${message(code: 'yxhqrd.myxz.label', default: 'Myxz')}</th>

        <th field="contract" sortable="false" data-options="formatter:function(value,row){
            if(row.contract==null) return value;
            return row.contract.contractNo;
        }"><g:message code="yxhqrd.contract.label" default="Contract"/></th>

        <th field="htpch" sortable="true">${message(code: 'yxhqrd.htpch.label', default: 'Htpch')}</th>

        <th field="cgsl" sortable="true">${message(code: 'yxhqrd.cgsl.label', default: 'Cgsl')}</th>

        <th field="cddw" sortable="false" data-options="formatter:function(value,row){

            return getObjectAttr(row,'cddw.pkCubasdoc.custname');
        }"><g:message code="yxhqrd.cddw.label" default="Cddw"/></th>

        <th field="hgfx" sortable="true" data-options="formatter:function(value,row){
            if(row.hgfx==0){
                return '未放行';
            }else if(row.hgfx){
                return '已放行';
            }
        }">${message(code: 'yxhqrd.hgfx.label', default: 'Hgfx')}</th>

        <th field="fxsl" sortable="true">${message(code: 'yxhqrd.fxsl.label', default: 'Fxsl')}</th>

        <th field="kzdw" sortable="false" data-options="formatter:function(value,row){
            if(row.kzdw==null) return value;
            return row.kzdw.pkCubasdoc.custname;
        }"><g:message code="yxhqrd.kzdw.label" default="Kzdw"/></th>

        <th field="kzfx" sortable="true" data-options="formatter:function(value,row){
            if(row.hgfx==0){
                return '未放行';
            }else if(row.hgfx){
                return '已放行';
            }
        }">${message(code: 'yxhqrd.kzfx.label', default: 'Kzfx')}</th>

        <th field="kzfxsl" sortable="true">${message(code: 'yxhqrd.kzfxsl.label', default: 'Kzfxsl')}</th>

        <th field="xdtsl" sortable="true">${message(code: 'yxhqrd.xdtsl.label', default: 'Xdtsl')}</th>

        <th field="gjsl" sortable="true">${message(code: 'yxhqrd.gjsl.label', default: 'Gjsl')}</th>

        <th field="cjsl" sortable="true">${message(code: 'yxhqrd.cjsl.label', default: 'Cjsl')}</th>

        <th field="sjsl" sortable="true">${message(code: 'yxhqrd.sjsl.label', default: 'Sjsl')}</th>

        <th field="htsh" sortable="true">${message(code: 'yxhqrd.htsh.label', default: 'Htsh')}</th>

        <th field="zcfhl" sortable="true">${message(code: 'yxhqrd.zcfhl.label', default: 'Zcfhl')}</th>

        <th field="bgsh" sortable="true">${message(code: 'yxhqrd.bgsh.label', default: 'Bgsh')}</th>

        <th field="zdfhl" sortable="true">${message(code: 'yxhqrd.zdfhl.label', default: 'Zdfhl')}</th>

        <th field="sjdw.pkCubasdoc.custname" sortable="false" data-options="formatter:function(value,row){
            return getObjectAttr(row,'sjdw.pkCubasdoc.custname');
        }"><g:message code="yxhqrd.sjdw.label" default="Sjdw"/>
        </th>

        <th field="sjzsh" sortable="true">${message(code: 'yxhqrd.sjzsh.label', default: 'Sjzsh')}</th>

        <th field="qrrq" sortable="true" data-options="formatter:dateFormate" >${message(code: 'yxhqrd.qrrq.label', default: 'Qrrq')}</th>

        <th field="hytdh" sortable="true">${message(code: 'yxhqrd.hytdh.label', default: 'Hytdh')}</th>

        <th field="xghth" sortable="true">${message(code: 'yxhqrd.xghth.label', default: 'Xghth')}</th>

        <th field="xtdh" sortable="true">${message(code: 'yxhqrd.xtdh.label', default: 'Xtdh')}</th>
        <th field="gh" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'gh.code');
        }">${message(code: 'yxhqrd.gh.label', default: 'Gh')}</th>

         <th field="khtdh" sortable="true">${message(code: 'yxhqrd.khtdh.label', default: 'Khtdh')}</th>

         <th field="tdsl" sortable="true">${message(code: 'yxhqrd.tdsl.label', default: 'Tdsl')}</th>
         <th field="gj" sortable="true">${message(code: 'yxhqrd.gj.label', default: 'Gj')}</th>
         <th field="gz" sortable="true">${message(code: 'yxhqrd.gz.label', default: 'Gz')}</th>

            <th field="sdyy" sortable="true">${message(code: 'yxhqrd.sdyy.label', default: 'Sdyy')}</th>
            <th field="sdsl" sortable="true">${message(code: 'yxhqrd.sdsl.label', default: 'Sdsl')}</th>
            <th field="note" sortable="true">${message(code: 'yxhqrd.note.label', default: 'Note')}</th>




            <th field="jsfy" sortable="true" data-options="formatter:booleanFormate">${message(code: 'yxhqrd.jsfy.label', default: 'Jsfy')}</th>

            <th field="ccfdj" sortable="true">${message(code: 'yxhqrd.ccfdj.label', default: 'Ccfdj')}</th>
            <th field="zxfdj" sortable="true">${message(code: 'yxhqrd.zxfdj.label', default: 'Zxfdj')}</th>
            <th field="sqts" sortable="true">${message(code: 'yxhqrd.sqts.label', default: 'Sqts')}</th>
            <th field="ccfzq" sortable="true">${message(code: 'yxhqrd.ccfzq.label', default: 'Ccfzq')}</th>
            <th field="cqksrq" sortable="true" data-options="formatter:dateFormate">${message(code: 'yxhqrd.cqksrq.label', default: 'Cqksrq')}</th>
            <th field="cqdj" sortable="true">${message(code: 'yxhqrd.cqdj.label', default: 'Cqdj')}</th>
            <th field="csksr" sortable="true" data-options="formatter:dateFormate">${message(code: 'yxhqrd.csksr.label', default: 'Csksr')}</th>
            <th field="cszq" sortable="true" >${message(code: 'yxhqrd.cszq.label', default: 'Cszq')}</th>

            %{--其他--}%
            <th field="maker.userRealName" sortable="true" data-options="formatter:function(value,row){
                return getObjectAttr(row,'maker.userRealName');
            }">${message(code: 'yxhqrd.maker.label', default: 'maker')}</th>
            <th field="makeDate" sortable="true" data-options="formatter:dateFormate">${message(code: 'yxhqrd.makeDate.label', default: 'makeDate')}</th>
            <th field="checker.userRealName" sortable="true" data-options="formatter:function(value,row){
                return getObjectAttr(row,'checker.userRealName');
            }" >${message(code: 'yxhqrd.checker.label', default: 'checker')}</th>
            <th field="checkDate" sortable="true" data-options="formatter:dateFormate">${message(code: 'yxhqrd.checkDate.label', default: 'checkDate')}</th>





    </tr>
    </thead>
</table>



</div>
</div>