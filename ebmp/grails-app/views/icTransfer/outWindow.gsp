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
                    v['nowoutastnum']= v.nshldtransastnum- v.outastnum;
                    v['nowoutnum']= v.dshldtransnum- v.outnum
                    $('#distribute${pageId}').edatagrid('updateRow',{index:i,row:v});

                });

            },
            onUncheckAll:function(rows){
                $('#distribute${pageId}').edatagrid('saveRow');
                $.each(rows,function(i,v){

                    v['nowoutastnum']= 0;
                    v['nowoutnum']= 0;

                    $('#distribute${pageId}').edatagrid('updateRow',{index:i,row:v});
                });


            },
            onCheck:function(rowIndex,rowData){

                rowData['nowoutastnum']= rowData.nshldtransastnum- rowData.outastnum;
                rowData['nowoutnum']= rowData.dshldtransnum- rowData.outnum;

                $('#distribute${pageId}').edatagrid('updateRow',{index:rowIndex,row:rowData});

            },
            onUncheck:function(rowIndex,rowData){

                rowData['nowoutastnum']= 0;
                rowData['nowoutnum']= 0;

                $('#distribute${pageId}').edatagrid('updateRow',{index:rowIndex,row:rowData});

            }
        });

    });



    function outastnum${pageId}(newValue, oldValue){

        var hsl=$('#distribute${pageId}').edatagrid('getSelectRowValue','hsl');
        var outnum=Number(newValue)*Number(hsl);
        $('#distribute${pageId}').edatagrid('setLabelValue',{field:'outnum',value:outnum});
    }

    function outnum${pageId}(newValue, oldValue){
        var hsl=$('#distribute${pageId}').edatagrid('getSelectRowValue','hsl');
        var outastnum=Number(newValue)/Number(hsl);
        $('#distribute${pageId}').edatagrid('setLabelValue',{field:'outastnum',value:outastnum});
    }



    function check${pageId}(){
       var data= $('#distribute${pageId}').edatagrid('getChecked');
        var rt=true;
        $.each(data,function(i,v){
            if(v['nowoutastnum']>v.nshldtransastnum- v.outastnum){
                $.messager.alert('错误','本次出库数量超过可出库数量');
                rt= false;
            }

            if(v['nowoutnum']>v.dshldtransnum- v.outnum){
                $.messager.alert('错误','本次出库数量超过可出库数量');
                rt= false;
            }


        });
        return rt;

    }


    function  OutData${pageId}(){

        $('#distribute${pageId}').edatagrid('saveRow');

        $.messager.progress();
        if( check${pageId}()==false){
            $.messager.progress('close');
            return false;
        }


        var rows= $('#distribute${pageId}').edatagrid('getChecked');
        var data=new Array()
        for(var i=0;i<rows.length;i++){
            if(rows[i].nowoutnum==0) continue;
            var row={}
            row['id']=rows[i].id;
            row['nowoutastnum']=rows[i].nowoutastnum;
            row['nowoutnum']=rows[i].nowoutnum;
            data.push(row)
        }

        $.post('${createLink(action: 'outHouse')}',{data:JSON.stringify(data)},function(json){

               $.messager.progress('close');	// hide progress bar while submit successfully
               if($('#card${pageId}').showMessage(json)){//有错误数据


                   return;
               }

               closeCard('${pageId}');

        });

    }

</script>



<div id="tbb${pageId}">
    <a href="#" class="easyui-linkbutton"  plain="true"  onclick="OutData${pageId}() " data-options="disabled:${soSaleInstance?.sourceBillTypeCode!=null}" >
        ${message(code: 'default.button.ck.label')}
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


        <th field="nshldtransastnum" sortable="false"   width="100">${message(code: 'icSpecialB.nshldtransastnum.label', default: 'Nshldtransastnum')}</th>


        <th field="dshldtransnum" sortable="false"   width="100">${message(code: 'icSpecialB.dshldtransnum.label', default: 'Dshldtransnum')}</th>

        <th field="outastnum" sortable="false"   width="100">${message(code: 'icSpecialB.outastnum.label', default: 'Dshldtransnum')}</th>

        <th field="outnum" sortable="false"   width="100">${message(code: 'icSpecialB.outnum.label', default: 'Dshldtransnum')}</th>


        <th field="nowoutastnum" sortable="false"  editor="{type:'numberbox',options:{precision:2,onChange:outastnum${pageId}}}" width="100">${message(code: 'icSpecialB.nowoutastnum.label', default: 'Dshldtransnum')}</th>

        <th field="nowoutnum" sortable="false" editor="{type:'numberbox',options:{precision:2,onChange:outnum${pageId}}}"  width="100">${message(code: 'icSpecialB.nowoutnum.label', default: 'Dshldtransnum')}</th>

        <th field="vnote" sortable="false"  width="100">${message(code: 'icSpecialB.vnote.label', default: 'Vnote')}</th>

    </tr>
    </thead>
</table>
