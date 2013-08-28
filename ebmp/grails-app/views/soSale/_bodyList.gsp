<%@ page import="grails.converters.JSON" %>
<script>




    $(function(){


        <g:if test="${ac=='create'}">
            $('#bodyTable${pageId}').edatagrid({

                data:${bodys?:[] as JSON}
            });
        </g:if>
        <g:elseif test="${ac=='show'}">
        $('#bodyTable${pageId}').datagrid({
            url:'${createLink(action: 'queryBody',params: [headId:soSaleInstance?.id])}'

        });
        </g:elseif>
        <g:else>
            $('#bodyTable${pageId}').edatagrid({
                url:'${createLink(action: 'queryBody',params: [headId:soSaleInstance?.id])}'

            });
        </g:else>


    });


    function onAddRow${pageId}(){


        $('#bodyTable${pageId}').edatagrid('addRow');
    }

    function onDeleteRow${pageId}(){
        var row=$('#bodyTable${pageId}').datagrid('getSelected');
        var index = $('#bodyTable${pageId}').datagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要删除的数据！'
            });
            return;
        };
        $('#bodyTable${pageId}').datagrid('deleteRow',index);
    }





    function onSelectinv${pageId}(index,data){


        if(data==null){

            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'invmandoc.pkInvbasdoc.invcode',value:''});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'invmandoc.pkInvbasdoc.invspec',value:''});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'invmandoc.pkInvbasdoc.invtype',value:''});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'invmandoc.pkInvbasdoc.bdmeasdoc.measname',value:''});

        }else{

            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'invmandoc.pkInvbasdoc.invcode',value:getObjectAttr(data,'pkInvbasdoc.invcode')});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'invmandoc.pkInvbasdoc.invspec',value:getObjectAttr(data,'pkInvbasdoc.invspec')});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'invmandoc.pkInvbasdoc.invtype',value:getObjectAttr(data,'pkInvbasdoc.invtype')});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'invmandoc.pkInvbasdoc.bdmeasdoc.measname',value:getObjectAttr(data,'pkInvbasdoc.bdmeasdoc.measname')});
           }

    }


    function onChangeinv${pageId}(newValue, oldValue){

       if(oldValue==null || oldValue=='' ) return;
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'invmandoc.pkInvbasdoc.invcode',value:''});
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'invmandoc.pkInvbasdoc.invspec',value:''});
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'invmandoc.pkInvbasdoc.invtype',value:''});
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'invmandoc.pkInvbasdoc.bdmeasdoc.measname',value:''});

    }

    function noriginalcurtaxprice${pageId}(newValue,oldValue){
        var tb=  $('#bodyTable${pageId}');
        tb.edatagrid('setSelectRowValue',{field:'noriginalcurtaxprice',value:newValue});
        var nnumber=tb.edatagrid('getSelectRowValue','nnumber');
        var noriginalcurtaxprice=parseFloat(newValue);
        tb.edatagrid('setColValue',{field:'@noriginalcursummny',value:noriginalcurtaxprice*nnumber});//原币价税合计

    }

    function nnumber${pageId}(newValue,oldValue){
        var tb=  $('#bodyTable${pageId}');
        tb.edatagrid('setSelectRowValue',{field:'nnumber',value:newValue});
        //原币
        var nnumber=parseFloat(newValue);


        var noriginalcurtaxprice=tb.edatagrid('getSelectRowValue','noriginalcurtaxprice');
        var hsl=tb.edatagrid('getColValue','hsl');
        var nos= nnumber*noriginalcurtaxprice;
        tb.edatagrid('setColValue',{field:'@noriginalcursummny',value:nos});//原币价税合计
        tb.edatagrid('setColValue',{field:'fsl',value:nnumber/hsl});//
    }






//    计算表头金额
    function computHeadMonney(){
        var tb=  $('#bodyTable${pageId}');
//        $(tb).datagrid('Save')
        var bodys = $(tb).edatagrid('getJSON');
        var sum=0;
        if(bodys==null) return;

        for(i=0;i<bodys.length;i++){

            sum+=parseFloat( bodys[i].noriginalcursummny);
        }

        $('#nheadsummny${pageId}').numberbox('setValue',sum);
    }


    function noriginalcursummny${pageId}(newValue,oldValue){
        var tb=  $('#bodyTable${pageId}');
        tb.edatagrid('setSelectRowValue',{field:'noriginalcursummny',value:newValue});

        var nnumber=tb.edatagrid('getSelectRowValue','nnumber');
        if(nnumber==0) return;

        var nprice= parseFloat(newValue)/ nnumber;

        tb.edatagrid('setColValue',{field:'noriginalcurtaxprice',value:nprice})

        tb.edatagrid('setSelectRowValue',{field:'noriginalcursummny',value:newValue});
        computHeadMonney();
    }

    function bzm${pageId}(node){

        if(node){
            var tb=  $('#bodyTable${pageId}');
            var value=getObjectAttr(node.attributes,'measdoc.id');
            tb.edatagrid('setColValue',{field:'fjl',value:value});//
            var hsl=getObjectAttr(node.attributes,'hsl');
            tb.edatagrid('setColValue',{field:'hsl',value:hsl});//
        }
    }

    function fsl${pageId}(newValue,oldValue){
        var tb=  $('#bodyTable${pageId}');
        tb.edatagrid('setSelectRowValue',{field:'fsl',value:newValue});

        if(newValue=='') {
            newValue=0;
            tb.edatagrid('setColValue',{field:'fsl',value:0});//
            return;
        }
        var hsl=tb.edatagrid('getColValue','hsl');//
        var fsl=parseFloat(newValue);//
        var nnumber=hsl*fsl;

       tb.edatagrid('setColValue',{field:'nnumber',value:nnumber});//
    }

    function hsl${pageId}(newValue,oldValue){
        var tb=  $('#bodyTable${pageId}');
        tb.edatagrid('setSelectRowValue',{field:'hsl',value:newValue});

        if(newValue=='') {
            newValue=0;
            tb.edatagrid('setColValue',{field:'hsl',value:0});//
            return;
        }
        var hsl=parseFloat(newValue);//
        var fsl=tb.edatagrid('getColValue','fsl');//

       tb.edatagrid('setColValue',{field:'nnumber',value:fsl*hsl});//原币价税合计
    }

</script>


<g:if test="${ac!='show'}">
%{--按钮--}%
    <div id="bodytb${pageId}">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddRow${pageId}() " data-options="disabled:${soSaleInstance?.sourceBillTypeCode!=null}" >
            ${message(code: 'default.button.create.label',default: '增加')}
        </a>

        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDeleteRow${pageId}() " data-options="disabled:${soSaleInstance?.sourceBillTypeCode!=null}">
            ${message(code: 'default.button.delete.label',default: '删除')}
        </a>

    </div>
</g:if>


%{--表格--}%
<table id="bodyTable${pageId}"
       fit="true"
       rownumbers="true"
        toolbar="#bodytb${pageId}" singleSelect="true"  >

    <thead>

    <tr>


        <th field="invmandoc.pkInvbasdoc.invcode" editor="label" width="80" data-options="canSave:false,
            formatter:function(value,row){

               return getObjectAttr(row,'invmandoc.pkInvbasdoc.invcode');
            }
        "><g:message code="bdInvbasdoc.invcode.label" /></th>

        <g:refTemplate code="refBdInvmandoc"  inForm="false" model="[required:true,field:'invmandoc',title:g.message(code: 'soSaleOrder.invmandoc.label'),onChange:'onChangeinv'+pageId,onSelect:'onSelectinv'+pageId]"></g:refTemplate>

        <th field="invmandoc.pkInvbasdoc.invspec" sortable="false" editor="label" data-options="canSave:false,
            formatter:function(value,row){
                return getObjectAttr(row,'invmandoc.pkInvbasdoc.invspec');
            }
        "><g:message code="bdInvbasdoc.invspec.label" default="Currencytype"/></th>

        <th field="invmandoc.pkInvbasdoc.invtype" sortable="false" editor="label" data-options="canSave:false,
            formatter:function(value,row){
                return getObjectAttr(row,'invmandoc.pkInvbasdoc.invtype');
            }
        "><g:message code="bdInvbasdoc.invtype.label" default="Currencytype"/></th>

        <th field="invmandoc.pkInvbasdoc.bdmeasdoc.measname" sortable="false" data-options="canSave:false,
            formatter:function(value,row){
                return getObjectAttr(row,'invmandoc.pkInvbasdoc.bdmeasdoc.measname');
            }
        " editor="label"><g:message code="soSaleOrder.measdoc.label" default="主计量单位"/></th>
        <th field="batch" sortable="false" width="80" editor="text">${message(code: 'soSaleOrder.batch.label', default: 'Batch')}</th>

        <g:refTemplate inForm="false" code="refBdPack" model="[field:'bzm',required:true,title:message(code:'soSaleOrder.bzm.label'),onSelect: 'bzm'+pageId]"></g:refTemplate>
        <g:refTemplate inForm="false" code="refBdMeasdoc" model="[field:'fjl',required:true,title: message(code: 'soSaleOrder.fjl.label')]"></g:refTemplate>

        <th field="hsl" sortable="false" width="80"  editor="{type:'numberbox',options:{required:true,precision:2,required:true,onChange:hsl${pageId}}}">${message(code: 'soSaleOrder.hsl.label', default: 'Batch')}</th>
        <th field="fsl" sortable="false" editor="{type:'numberbox',options:{precision:2,required:true,onChange:fsl${pageId}}}" width="80">${message(code: 'soSaleOrder.fsl.label', default: '辅数量')}</th>

        <th field="nnumber" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true,onChange:nnumber${pageId}}}" width="80">${message(code: 'soSaleOrder.nnumber.label', default: '数量')}</th>



        <th field="noriginalcurtaxprice" sortable="false" width="80" editor="{type:'numberbox',options:{precision:6,required:true,onChange:noriginalcurtaxprice${pageId}}}">${message(code: 'soSaleOrder.noriginalcurtaxprice.label', default: '含税单价')}</th>
        <th field="noriginalcursummny" sortable="false" editor="{type:'numberbox',options:{precision:2,required:true,onChange:noriginalcursummny${pageId}}}" width="80">${message(code: 'soSaleOrder.noriginalcursummny.label', default: '原币价税合计')}</th>

        <g:refTemplate code="refBdStordoc" inForm="false"  model="[field: 'stordoc',title: message(code: 'soSaleOrder.stordoc.label'),required: true]"></g:refTemplate>

        <th field="frownote" sortable="false" editor="text" width="150">${message(code: 'soSaleOrder.frownote.label', default: 'Frownote')}</th>
    </tr>
    </thead>
</table>



