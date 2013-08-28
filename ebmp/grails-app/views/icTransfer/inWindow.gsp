<%@ page import="grails.converters.JSON" %>
<script>

    $(function(){
        $('#distribute${pageId}').edatagrid({
            data:${data as JSON},
            checkOnSelect:false,
            selectOnCheck:false,
            remoteSort:false,
            rownumbers:true,
            title:'出库操作',
            fit:true,
            singleSelect:true,
            fitColumns:true,
            toolbar:'#tbb${pageId}',
            onCheckAll:function(rows){


                $.each(rows,function(i,v){
                    v['nowinastnum']= v.outastnum- v.inastnum;
                    v['nowinnum']= v.outnum- v.innum
                    $('#distribute${pageId}').edatagrid('updateRow',{index:i,row:v});

                });

            },
            onUncheckAll:function(rows){
                $('#distribute${pageId}').edatagrid('saveRow');
                $.each(rows,function(i,v){

                    v['nowinastnum']= 0;
                    v['nowinnum']= 0;

                    $('#distribute${pageId}').edatagrid('updateRow',{index:i,row:v});
                });


            },
            onCheck:function(rowIndex,rowData){

                rowData['nowinastnum']= rowData.outastnum- rowData.inastnum;
                rowData['nowinnum']= rowData.outnum- rowData.innum;

                $('#distribute${pageId}').edatagrid('updateRow',{index:rowIndex,row:rowData});

            },
            onUncheck:function(rowIndex,rowData){

                rowData['nowinastnum']= 0;
                rowData['nowinnum']= 0;

                $('#distribute${pageId}').edatagrid('updateRow',{index:rowIndex,row:rowData});

            }
        });

    });



    function nowinastnum${pageId}(newValue, oldValue){

        var hsl=$('#distribute${pageId}').edatagrid('getSelectRowValue','hsl');
        var nowinnum=Number(newValue)*Number(hsl);
        $('#distribute${pageId}').edatagrid('setLabelValue',{field:'nowinnum',value:nowinnum});
    }

    function nowinnum${pageId}(newValue, oldValue){
        var hsl=$('#distribute${pageId}').edatagrid('getSelectRowValue','hsl');
        var nowinastnum=Number(newValue)/Number(hsl);
        $('#distribute${pageId}').edatagrid('setLabelValue',{field:'nowinastnum',value:nowinastnum});
    }



    function check${pageId}(){
        var data= $('#distribute${pageId}').edatagrid('getChecked');
        var rt=true;
        $.each(data,function(i,v){

            if(v['nowinastnum']>v.outastnum- v.inastnum){
                $.messager.alert('错误','本次入库数量超过可入库数量');

                rt= false;
            }

            if(v['nowinnum']>v.ounum- v.innum){
                $.messager.alert('错误','本次入库数量超过可入库数量');
                rt= false;
            }


        });
        return rt;

    }


    function  inData${pageId}(){


        $('#distribute${pageId}').edatagrid('saveRow');
        $.messager.progress();
        if( check${pageId}()==false){
            $.messager.progress('close');
            return false;
        }


        var rows= $('#distribute${pageId}').edatagrid('getChecked');
        var data=new Array()
        for(var i=0;i<rows.length;i++){
            if(rows[i].nowinnum==0) continue;
            var row={}
            row['id']=rows[i].id;
            row['nowinastnum']=rows[i].nowinastnum;
            row['nowinnum']=rows[i].nowinnum;
            data.push(row)
        }

        $.post('${createLink(action: 'inHouse')}',{data:JSON.stringify(data)},function(json){

                $.messager.progress('close');	// hide progress bar while submit successfully
                if($('#card${pageId}').showMessage(json)){//有错误数据


                    return;
                }

                closeCard('${pageId}');

        });

    }

</script>



<div id="tbb${pageId}">
    <a href="#" class="easyui-linkbutton"  plain="true"  onclick="inData${pageId}() " data-options="disabled:${soSaleInstance?.sourceBillTypeCode!=null}" >
        ${message(code: 'default.button.rk.label')}
    </a>


    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeCard('${pageId}') " data-options="disabled:${soSaleInstance?.sourceBillTypeCode!=null}">
        ${message(code: 'default.button.close.label')}
    </a>

</div>



%{--表格--}%
<table id="distribute${pageId}" >

    <thead>

    <tr>
        <th checkbox="true" ></th>
        <th field="bdInvmandoc.pkInvbasdoc.invcode"  width="80" data-options="
            formatter:defaultFormatter
        "><g:message code="bdInvbasdoc.invcode.label" /></th>


        <th field="bdInvmandoc.pkInvbasdoc.invname"  width="80" data-options="formatter:defaultFormatter
        "><g:message code="bdInvbasdoc.invname.label" /></th>



        <th field="bdInvmandoc.pkInvbasdoc.invspec" sortable="true"  data-options="formatter:defaultFormatter
        "><g:message code="bdInvbasdoc.invspec.label" /></th>

        <th field="invmandoc.pkInvbasdoc.invtype" sortable="true"  data-options="formatter:defaultFormatter
        "><g:message code="bdInvbasdoc.invtype.label" /></th>

        <th field="bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname" sortable="true" data-options="formatter:defaultFormatter
        " ><g:message code="icGeneralBody.measdoc.label" default="主计量单位"/></th>

        <th field="vbatchcode" sortable="true"  width="100">${message(code: 'icSpecialB.vbatchcode.label', default: 'Vbatchcode')}</th>


        <th field="castunit.name" data-options="formatter:defaultFormatter" width="100">${g.message(code: 'icSpecialB.castunit.label', default: 'Castunit')}</th>

        <th field="pack.name" data-options="formatter:defaultFormatter">${g.message(code: 'icSpecialB.pack.label', default: 'Castunit')}</th>

        <th field="hsl" sortable="true"   width="100">${message(code: 'icSpecialB.hsl.label', default: 'Hsl')}</th>


        <th field="outastnum" sortable="false"   width="100">${message(code: 'icSpecialB.outastnum.label')}</th>


        <th field="outnum" sortable="false"   width="100">${message(code: 'icSpecialB.outnum.label')}</th>

        <th field="inastnum" sortable="false"   width="100">${message(code: 'icSpecialB.inastnum.label')}</th>

        <th field="innum" sortable="false"   width="100">${message(code: 'icSpecialB.innum.label')}</th>


        <th field="nowinastnum" sortable="false"  editor="{type:'numberbox',options:{precision:2,onChange:nowinastnum${pageId}}}" width="100">${message(code: 'icSpecialB.nowinastnum.label')}</th>

        <th field="nowinnum" sortable="false" editor="{type:'numberbox',options:{precision:2,onChange:nowinnum${pageId}}}"  width="100">${message(code: 'icSpecialB.nowinnum.label')}</th>

        <th field="vnote" sortable="false"  width="100">${message(code: 'icSpecialB.vnote.label', default: 'Vnote')}</th>

    </tr>
    </thead>
</table>
