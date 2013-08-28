
<%@ page import="grails.converters.JSON; com.app.ic.special.IcSpecialB" %>
<script>


    $(function(){


        <g:if test="${ac=='create'}">
        $('#bodyTable${pageId}').edatagrid({
            remoteSort:false,
            data:${bodys?:[] as JSON}
        });
        $('#bodyTable${pageId}').edatagrid('addRow');
        </g:if>
        <g:elseif test="${ac=='show'}">
        $('#bodyTable${pageId}').datagrid({
            url:'${createLink(action: 'queryBody',params: [headId:icSpecialInstance?.id])}'

        });
        </g:elseif>
        <g:elseif test="${ac=='edit'}">
        $('#bodyTable${pageId}').edatagrid({
            url:'${createLink(action: 'queryBody',params: [headId:icSpecialInstance?.id])}'

        });
        </g:elseif>


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


    function pack${pageId}(node){

        if(node){

            var tb=  $('#bodyTable${pageId}');
            var value=getObjectAttr(node.attributes,'measdoc.id');
            tb.edatagrid('setColValue',{field:'castunit',value:value});//
            var hsl=getObjectAttr(node.attributes,'hsl');
            tb.edatagrid('setColValue',{field:'hsl',value:hsl});//
        }
    }


    function onSelectinv${pageId}(index,data){


        if(data==null){

            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:''});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'bdInvmandoc.pkInvbasdoc.invspec',value:''});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'bdInvmandoc.pkInvbasdoc.invtype',value:''});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname',value:''});

        }else{



            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:getObjectAttr(data,'pkInvbasdoc.invcode')});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'bdInvmandoc.pkInvbasdoc.invspec',value:getObjectAttr(data,'pkInvbasdoc.invspec')});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'bdInvmandoc.pkInvbasdoc.invtype',value:getObjectAttr(data,'pkInvbasdoc.invtype')});
            $('#bodyTable${pageId}').edatagrid('setColValue',{field:'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname',value:getObjectAttr(data,'pkInvbasdoc.bdmeasdoc.measname')});
        }

    }


    function onChangeinv${pageId}(newValue, oldValue){

        if(oldValue==null || oldValue=='' ) return;
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:''});
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invspec',value:''});
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invtype',value:''});
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname',value:''});

    }



    function nshldtransastnum${pageId}(newValue, oldValue){

        var hsl=$('#bodyTable${pageId}').edatagrid('getColValue','hsl');
        var dshldtransnum=Number(newValue)*Number(hsl);
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'dshldtransnum',value:dshldtransnum});
    }

    function dshldtransnum${pageId}(newValue, oldValue){
        var hsl=$('#bodyTable${pageId}').edatagrid('getColValue','hsl');
        var nshldtransastnum=Number(newValue)/Number(hsl);
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'nshldtransastnum',value:nshldtransastnum});
    }

    function hsl${pageId}(newValue, oldValue){
        var hsl=Number(newValue);
        var nshldtransastnum=$('#bodyTable${pageId}').edatagrid('getColValue','nshldtransastnum');
        var dshldtransnum=Number(nshldtransastnum)*hsl;
        $('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'dshldtransnum',value:dshldtransnum});


    }


</script>

<g:if test="${ac!='show'}">
    <div id="tbb${pageId}">
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
       rownumbers="true"
       fit="true" toolbar="#tbb${pageId}" singleSelect="true" >

    <thead>

    <tr>
        <th field="bdInvmandoc.pkInvbasdoc.invcode" editor="label" width="80" data-options="canSave:false,
            formatter:function(value,row){

               return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invcode');
            }
        "><g:message code="bdInvbasdoc.invcode.label" /></th>


        <g:refTemplate code="refBdInvmandoc"  inForm="false" model="[required:false,field:'bdInvmandoc',title:g.message(code: 'bdInvbasdoc.invname.label', default: 'Bd Invmandoc'),onChange:'onChangeinv'+pageId,onSelect:'onSelectinv'+pageId]"></g:refTemplate>


        <th field="bdInvmandoc.pkInvbasdoc.invspec" sortable="true" editor="label" data-options="canSave:false,
            formatter:function(value,row){
                return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invspec');
            }
        "><g:message code="bdInvbasdoc.invspec.label" /></th>

        <th field="invmandoc.pkInvbasdoc.invtype" sortable="true" editor="label" data-options="canSave:false,
            formatter:function(value,row){
                return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invtype');
            }
        "><g:message code="bdInvbasdoc.invtype.label" /></th>

        <th field="bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname" sortable="true" data-options="canSave:false,
            formatter:function(value,row){
                return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname');
            }
        " editor="label"><g:message code="icGeneralBody.measdoc.label" default="主计量单位"/></th>

        <th field="vbatchcode" sortable="false" editor="text" width="100">${message(code: 'icSpecialB.vbatchcode.label', default: 'Vbatchcode')}</th>


        <g:refTemplate code="refBdMeasdoc"  inForm="false" model="[required:false,field:'castunit',title:g.message(code: 'icSpecialB.castunit.label', default: 'Castunit')]"></g:refTemplate>

        <g:refTemplate code="refBdPack"  inForm="false" model="[required:false,field:'pack',title:g.message(code: 'icSpecialB.pack.label', default: 'Pack'),onSelect: 'pack'+pageId]"></g:refTemplate>

        <th field="hsl" sortable="true"  editor="{type:'numberbox',options:{precision:2,required:true,onChange:hsl${pageId}}}" width="100">${message(code: 'icSpecialB.hsl.label', default: 'Hsl')}</th>



        %{--<th field="nadjustnum" sortable="false"  editor="{type:'numberbox',options:{precision:2,required:true}}" width="100">${message(code: 'icSpecialB.nadjustnum.label', default: 'Nadjustnum')}</th>--}%


        <th field="nshldtransastnum" sortable="false"  editor="{type:'numberbox',options:{precision:2,required:true,onChange:nshldtransastnum${pageId}}}" width="100">${message(code: 'icSpecialB.nshldtransastnum.label', default: 'Nshldtransastnum')}</th>


        <th field="dshldtransnum" sortable="false"  editor="{type:'numberbox',options:{precision:2,required:true,onChange:dshldtransnum${pageId}}}" width="100">${message(code: 'icSpecialB.dshldtransnum.label', default: 'Dshldtransnum')}</th>






        %{--<th field="nadjustastnum" sortable="false"  editor="{type:'numberbox',options:{precision:2,required:true}}" width="100">${message(code: 'icSpecialB.nadjustastnum.label', default: 'Nadjustastnum')}</th>--}%


        %{--<th field="nshldtransgrsnum" sortable="false"  editor="{type:'numberbox',options:{precision:2,required:true}}" width="100">${message(code: 'icSpecialB.nshldtransgrsnum.label', default: 'Nshldtransgrsnum')}</th>--}%




        %{--<g:refTemplate code="refBdCumandoc"  inForm="false" model="[required:false,field:'vendor',title:g.message(code: 'icSpecialB.vendor.label', default: 'Vendor')]"></g:refTemplate>--}%
        
        <th field="vnote" sortable="false" editor="text" width="100">${message(code: 'icSpecialB.vnote.label', default: 'Vnote')}</th>
        
    </tr>
    </thead>
</table>



