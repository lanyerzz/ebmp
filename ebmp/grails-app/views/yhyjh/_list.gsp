
<%@ page import="com.app.ywms.rk.hyjh.Yhyjh" %>
<g:set var="entityName" value="${message(code: 'yhyjh.label', default: 'Yhyjh')}" />
<script>
    $(function(){
        $('#table${pageId}').datagrid({
            url:"${createLink(action: 'query')}?targetBill=${targetBill}&businessType=${businessType}",
            view: detailview,
            onDblClickRow:function(rowIndex, rowData){
                onShow${pageId}();
            },
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table id="table-sub${pageId}-' + index + '" ></table></div>';
            },
            onExpandRow: function(index,row){
                $('#table-sub${pageId}-'+index).datagrid({
                    url:'${createLink(action: 'queryBody')}?headId='+row.id+'&targetBill=${targetBill}',
                    fitColumns:true,
                    singleSelect:true,
                    rownumbers:true,
                    //loadMsg:'',
                    height:'auto',
                    singleSelect:false,
                    columns:[[
                        {field:'bdInvmandoc.pkInvbasdoc.invcode',title:'<g:message code="bdInvmandoc.pkInvbasdoc.invcode.label" />',formatter:function(value,row){
                            if(row.bdInvmandoc==null) return '';
                            return row.bdInvmandoc.pkInvbasdoc.invcode;
                        }},
                        {field:'bdInvmandoc.pkInvbasdoc.invname',title:'<g:message code="bdInvmandoc.pkInvbasdoc.invname.label" />',formatter:function(value,row){
                            if(row.bdInvmandoc==null) return '';
                            return row.bdInvmandoc.pkInvbasdoc.invname;
                        }},
                        {field:'sl',title:'${message(code: 'yhyjhB.sl.label', default: 'Sl')}',align:'right'},

                        {field:'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname',title:'${message(code: 'yhyjhB.jldw.label', default: '单位')}',formatter:function(value,row){

                            if(row.bdInvmandoc==null || row.bdInvmandoc.pkInvbasdoc.bdmeasdoc==null) return value;
                            return row.bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname;
                        }},
                        {field:'sfpc',title:'${message(code: 'yhyjhB.sfpc.label')}',formatter:booleanFormate},
                        {field:'sfyh',title:'${message(code: 'yhyjhB.sfyh.label')}',formatter:booleanFormate},
                        {field:'yjkbbw',title:'${message(code: 'yhyjhB.yjkbbw.label')}',formatter:function(value,row){
                            if(value!=null)
                                return value.name;
                            else
                                return '';
                        }},
                        {field:'yjxhsj',title:'${message(code: 'yhyjhB.yjxhsj.label')}',formatter:dateFormate},
                        {field:'note',title:'${message(code: 'yhyjhB.note.label')}'}
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





    function onOpenQuery${pageId}(){
      //  $('#query${pageId}').dialog('open');

        $('<div/>').dialog({
            title:'查询',
            iconCls:'icon-search',
            resizable:true,
            modal:true,
//            fit:true,
            width :600,
            height:500,
            // inline:true,
            href:'${createLink(action: 'createQuery')}?refQuery=${reQuery?:false}',
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

        var criters= getCriter${pageId}();

        $('#table${pageId}').datagrid('reload',{queryParams:encodeURI(JSON.stringify(criters))});
        d.dialog('destroy');
    }


</script>



%{--表格--}%
<table id="table${pageId}"
       rownumbers="true"
       fit="true" toolbar="#toolbar${pageId}" singleSelect="true"  pagination="true" pageSize="10"

        >

    <thead>

    <tr>

        
        <th field="billno" sortable="true" >${message(code: 'yhyjh.billno.label', default: 'Billno')}</th>
        
        <th field="billdate" sortable="true" data-options="formatter:dateFormate">${message(code: 'yhyjh.billdate.label', default: 'Billdate')}</th>

        <th field="businessType" sortable="true" data-options="formatter:function(value,row){
            if(row.businessType==null) return value;
            return row.businessType.name;
        }">${message(code:'yhyjh.businessType.label')}</th>

        <th field="myfs" sortable="true" data-options="formatter:function(value,row){
            if(row.myfs==0){
                return '内贸';
            }else if(row.myfs==1){
                return '外贸';
            }else if(row.myfs==2){
                return '内外贸';
            }else{
                return value;
            }
        }">${message(code: 'yhyjh.myfs.label', default: 'Myfs')}</th>
        <th field="custname" sortable="false" data-options="formatter:function(value,row){
            if(row.bdCumandoc){
                return row.bdCumandoc.pkCubasdoc.custname;
            }else{
                return value;
            }
        }"><g:message code="yhyjh.bdCumandoc.label"/></th>
        <th field="phone" sortable="false" data-options="formatter:function(value,row){
            if(row.bdCumandoc){
                return row.bdCumandoc.pkCubasdoc.phone;
            }else{
                return value;
            }
        }"><g:message code="bdCubasdoc.phone.label" /></th>
        <th field="linkman" sortable="false" data-options="formatter:function(value,row){
            if(row.bdCumandoc){
                return row.bdCumandoc.pkCubasdoc.linkman;
            }else{
                return value;
            }
        }"><g:message code="bdCubasdoc.linkman.label"/></th>
        <th field="email" sortable="false" data-options="formatter:function(value,row){
            if(row.bdCumandoc){
                return row.bdCumandoc.pkCubasdoc.email;
            }else{
                return value;
            }
        }"><g:message code="bdCubasdoc.email.label"/></th>

        <th field="cddw" sortable="false" data-options="formatter:function(value,row){
            if(row.cddw){
                return row.cddw.pkCubasdoc.custname;
            }else{
                return value;
            }
        }"><g:message code="yhyjh.cddw.label" default="Cddw"/></th>

        <th field="chuanming.shipname" sortable="true" data-options="formatter:function(value,row){
            if(row.chuanming==null) return value;
            return row.chuanming.shipname;
        }">${message(code: 'yhyjh.chuanming.label', default: 'Chuanming')}</th>


        <th field="hangci" sortable="true">${message(code: 'yhyjh.hangci.label', default: 'Hangci')}</th>

        <th field="kbgk" sortable="true">${message(code: 'yhyjh.kbgk.label', default: 'Kbgk')}</th>

        <th field="kjxyzdw" sortable="false" data-options="formatter:function(value,row){
            if(row.kjxyzdw){
                return row.kjxyzdw.pkCubasdoc.custname;
            }else{
                return value;
            }
        }"><g:message code="yhyjh.kjxyzdw.label" default="Kjxyzdw"/></th>



        <th field="qhgk" sortable="true" >${message(code: 'yhyjh.qhgk.label', default: 'Qhgk')}</th>



        <th field="yjdhrq" sortable="true" data-options="{formatter:dateFormate" >${message(code: 'yhyjh.yjdhrq.label', default: 'Yjdhrq')}</th>
        <th field="note" sortable="true">${message(code: 'yhyjh.note.label', default: 'Note')}</th>
        <th field="bdCorp" sortable="false" data-options="formatter:function(value,row){
            if(row.bdCorp){
                return row.bdCorp.unitName;
            }else{
                return value;
            }
        }"><g:message code="yhyjh.bdCorp.label" default="Bd Corp"/></th>
        <th field="maker" sortable="false" data-options="formatter:function(value,row){
            if(row.maker){
                return row.maker.userRealName;
            }else{
                return value;
            }
        }"><g:message code="yhyjh.maker.label" default="Maker"/></th>
        <th field="makeDate" sortable="true" data-options="{formatter:dateFormate">${message(code: 'yhyjh.makeDate.label', default: 'Make Date')}</th>
        <th field="checker" sortable="false" data-options="formatter:function(value,row){
            if(row.checker){
                return row.checker.userRealName;
            }else{
                return value;
            }
        }"><g:message code="yhyjh.checker.label" default="Checker"/></th>
        <th field="checkDate" sortable="true" data-options="formatter:dateFormate">${message(code: 'yhyjh.checkDate.label', default: 'Check Date')}</th>
    </tr>
    </thead>
</table>



