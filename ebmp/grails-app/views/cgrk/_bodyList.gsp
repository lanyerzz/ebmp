

<%@ page import="grails.converters.JSON; com.app.ic.bill.IcGeneralBody" %>
<g:set var="entityName" value="${message(code: 'icGeneralBody.label', default: 'IcGeneralBody')}" />
<script>


    $(function(){


        <g:if test="${ac=='create'}">
            $('#bodyTable${pageId}').edatagrid({
                remoteSort:false,
                data:${bodys as JSON}

            });
        </g:if>

        <g:elseif test="${ac=='show'}">
            $('#bodyTable${pageId}').datagrid({
                url:'${createLink(action: 'queryBody',params: [headId:icGeneralHeadInstance?.id])}'

            });
        </g:elseif>

        <g:elseif test="${ac=='edit'}">
            $('#bodyTable${pageId}').edatagrid({
                url:'${createLink(action: 'queryBody',params: [headId:icGeneralHeadInstance?.id])}'

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
            tb.edatagrid('setColValue',{field:'astunit',value:value});//
            var hsl=getObjectAttr(node.attributes,'hsl');
            tb.edatagrid('setColValue',{field:'hsl',value:hsl});//
        }
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





</script>


<g:if test="${ac=='create'}">

</g:if>

<g:elseif test="${ac=='show'}">

</g:elseif>

<g:elseif test="${ac=='edit'}">

</g:elseif>


<g:if test="${ac=='create' || ac=='edit'}">
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

        <g:refTemplate code="refBdInvmandoc"  inForm="false" model="[required:false,field:'bdInvmandoc',title:g.message(code: 'icGeneralBody.bdInvmandoc.label', default: '存货')]"></g:refTemplate>

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


        <th field="vbatchcode" sortable="true" width="80" editor="text">${message(code: 'icGeneralBody.vbatchcode.label', default: 'Batch')}</th>


         <g:refTemplate code="refBdMeasdoc"  inForm="false" model="[required:false,field:'astunit',title:g.message(code: 'icGeneralBody.astunit.label', default: '辅计量单位')]"></g:refTemplate>


        %{--<th field="dbizDate" sortable="true" editor="datebox" width="80">${message(code: 'icGeneralBody.dbizDate.label', default: 'Dbiz Date')}</th>--}%


        %{--<th field="dstandbyDate" sortable="true" editor="datebox" width="80">${message(code: 'icGeneralBody.dstandbyDate.label', default: 'Dstandby Date')}</th>--}%


        %{--<th field="dvaliDate" sortable="true" editor="datebox" width="80">${message(code: 'icGeneralBody.dvaliDate.label', default: 'Dvali Date')}</th>--}%


        %{--<th field="fchecked" sortable="true" editor="text" width="80">${message(code: 'icGeneralBody.fchecked.label', default: 'Fchecked')}</th>--}%
        <g:refTemplate inForm="false" code="refBdPack" model="[field:'pack',required:true,title:message(code:'icgeneralbody.pack.label'),onSelect: 'pack'+pageId]"></g:refTemplate>


        <th field="hsl" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80"><g:message code="icgeneralbody.hsl.label" /></th>

        %{--<th field="inDate" sortable="true" editor="datebox" width="80">${message(code: 'icGeneralBody.inDate.label', default: 'In Date')}</th>--}%

        %{--<th field="nbarcodenum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.nbarcodenum.label', default: 'Nbarcodenum')}</th>--}%

        %{--<th field="ncountNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.ncountNum.label', default: 'Ncount Num')}</th>--}%

        %{--<th field="ninNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.ninNum.label', default: 'Nin Num')}</th>--}%

        %{--<th field="ninassistNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.ninassistNum.label', default: 'Ninassist Num')}</th>--}%

        %{--<th field="ningrossNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.ningrossNum.label', default: 'Ningross Num')}</th>--}%

        %{--<th field="nkdNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.nkdNum.label', default: 'Nkd Num')}</th>--}%

        %{--<th field="nmny" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.nmny.label', default: 'Nmny')}</th>--}%

        %{--<th field="nneedinassistNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.nneedinassistNum.label', default: 'Nneedinassist Num')}</th>--}%

        <th field="nshouldoutNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80"><g:message code='icGeneralBody.nshouldoutNum.label'></g:message></th>


        <th field="noutNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80"><g:message code='icGeneralBody.noutNum.label'></g:message></th>

        <th field="noutassistNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80"><g:message code='icGeneralBody.noutassistNum.label'></g:message></th>

        %{--<th field="noutgrossNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.noutgrossNum.label', default: 'Noutgross Num')}</th>--}%

        %{--<th field="nprice" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.nprice.label', default: 'Nprice')}</th>--}%

        %{--<th field="nreplenishedNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.nreplenishedNum.label', default: 'Nreplenished Num')}</th>--}%

        %{--<th field="nreplenishedastNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.nreplenishedastNum.label', default: 'Nreplenishedast Num')}</th>--}%

        %{--<th field="nshouldinNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.nshouldinNum.label', default: 'Nshouldin Num')}</th>--}%


        %{--<th field="nshouldoutassistNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.nshouldoutassistNum.label', default: 'Nshouldoutassist Num')}</th>--}%

        %{--<th field="ntareNum" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'icGeneralBody.ntareNum.label', default: 'Ntare Num')}</th>--}%

        <th field="outDate" sortable="true" editor="datebox" width="80" data-options="formatter:dateFormate"><g:message code='icGeneralBody.outDate.label'></g:message></th>


        %{--<th field="pkReturnreason" sortable="true" editor="text" width="80">${message(code: 'icGeneralBody.pkReturnreason.label', default: 'Pk Returnreason')}</th>--}%

        <th field="vreceiveaddress" sortable="true" editor="text" width="80"> <g:message code="icgeneralbody.vreceiveaddress.label" ></g:message></th>


        %{--<th field="vbatchcode" sortable="true" editor="text" width="80">${message(code: 'icGeneralBody.vbatchcode.label', default: 'Vbatchcode')}</th>--}%

        <th field="vnotebody" sortable="true" editor="text" width="180"><g:message code="icgeneralbody.vnotebody.label" /></th>


        %{--<th field="vtransfercode" sortable="true" editor="text" width="80">${message(code: 'icGeneralBody.vtransfercode.label', default: 'Vtransfercode')}</th>--}%

        %{--<th field="vvehiclecode" sortable="true" editor="text" width="80">${message(code: 'icGeneralBody.vvehiclecode.label', default: 'Vvehiclecode')}</th>--}%

    </tr>
    </thead>
</table>



