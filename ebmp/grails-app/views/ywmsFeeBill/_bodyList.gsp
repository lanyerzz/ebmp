
<%@ page import="com.app.ywms.settle.fee.YwmsFeeBill" %>
<g:set var="entityName" value="${message(code: 'ywmsFeeBill.label', default: 'YwmsFeeBill')}" />
<script>


    $(function(){


        <g:if test="${ac=='create'}">
        $('#bodyTable${pageId}').edatagrid({

            data:bodys?:[] as JSON}
        });
        </g:if>
        <g:else>
        $('#bodyTable${pageId}').edatagrid({
            url:'${createLink(action: 'queryBody',params: [headId:ywmsFeeBillInstance?.id])}'

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





</script>


<div id="tbb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddRow${pageId}() " data-options="disabled:${soSaleInstance?.sourceBillTypeCode!=null}" >
        ${message(code: 'default.button.create.label',default: '增加')}
    </a>

    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDeleteRow${pageId}() " data-options="disabled:${soSaleInstance?.sourceBillTypeCode!=null}">
        ${message(code: 'default.button.delete.label',default: '删除')}
    </a>
</div>


%{--表格--}%
<table id="bodyTable${pageId}"
       rownumbers="true"
       fit="true" toolbar="#tbb${pageId}" singleSelect="true" >

    <thead>

    <tr>

        
        <th field="billdate" sortable="false" editor="datebox" width="80">${message(code: 'ywmsFeeBill.billdate.label', default: 'Billdate')}</th>

        
        <g:refTemplate code="refYwmsFeeType"  inForm="false" model="[required:false,field:'feeType',title:g.message(code: 'ywmsFeeBill.feeType.label', default: 'Fee Type')]"></g:refTemplate>
        
        <th field="jsrq" sortable="false" editor="datebox" width="80">${message(code: 'ywmsFeeBill.jsrq.label', default: 'Jsrq')}</th>

        
        <th field="dj" sortable="false" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'ywmsFeeBill.dj.label', default: 'Dj')}</th>
        
        <th field="yfsl" sortable="false" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'ywmsFeeBill.yfsl.label', default: 'Yfsl')}</th>
        
        <th field="yfje" sortable="false" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'ywmsFeeBill.yfje.label', default: 'Yfje')}</th>
        
        <g:refTemplate code="refBdCumandoc"  inForm="false" model="[required:false,field:'fkdw',title:g.message(code: 'ywmsFeeBill.fkdw.label', default: 'Fkdw')]"></g:refTemplate>
        
        <g:refTemplate code="refBdCorp"  inForm="false" model="[required:false,field:'bdCorp',title:g.message(code: 'ywmsFeeBill.bdCorp.label', default: 'Bd Corp')]"></g:refTemplate>
        
        <th field="bg" sortable="false" editor="text" width="80">${message(code: 'ywmsFeeBill.bg.label', default: 'Bg')}</th>
        
        <g:refTemplate code="refBaseContract"  inForm="false" model="[required:false,field:'bght',title:g.message(code: 'ywmsFeeBill.bght.label', default: 'Bght')]"></g:refTemplate>
        
        <th field="billTypeCode" sortable="false" editor="text" width="80">${message(code: 'ywmsFeeBill.billTypeCode.label', default: 'Bill Type Code')}</th>
        
        <th field="billno" sortable="false" editor="text" width="80">${message(code: 'ywmsFeeBill.billno.label', default: 'Billno')}</th>
        
        <g:refTemplate code="refPubBilltype"  inForm="false" model="[required:false,field:'billtype',title:g.message(code: 'ywmsFeeBill.billtype.label', default: 'Billtype')]"></g:refTemplate>
        
        <g:refTemplate code="refPubBusinessType"  inForm="false" model="[required:false,field:'businessType',title:g.message(code: 'ywmsFeeBill.businessType.label', default: 'Business Type')]"></g:refTemplate>
        
        <th field="checkDate" sortable="false" editor="datebox" width="80">${message(code: 'ywmsFeeBill.checkDate.label', default: 'Check Date')}</th>

        
        <g:refTemplate code="refSmUser"  inForm="false" model="[required:false,field:'checker',title:g.message(code: 'ywmsFeeBill.checker.label', default: 'Checker')]"></g:refTemplate>
        
        <th field="dateCreated" sortable="false" editor="datebox" width="80">${message(code: 'ywmsFeeBill.dateCreated.label', default: 'Date Created')}</th>

        
        <th field="djlj" sortable="false" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'ywmsFeeBill.djlj.label', default: 'Djlj')}</th>
        
        <g:refTemplate code="refBdInvmandoc"  inForm="false" model="[required:false,field:'hw',title:g.message(code: 'ywmsFeeBill.hw.label', default: 'Hw')]"></g:refTemplate>
        
        <g:refTemplate code="refBdCumandoc"  inForm="false" model="[required:false,field:'hz',title:g.message(code: 'ywmsFeeBill.hz.label', default: 'Hz')]"></g:refTemplate>
        
        <th field="je" sortable="false" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'ywmsFeeBill.je.label', default: 'Je')}</th>
        
        <th field="jssl" sortable="false" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'ywmsFeeBill.jssl.label', default: 'Jssl')}</th>
        
        <th field="lastUpdated" sortable="false" editor="datebox" width="80">${message(code: 'ywmsFeeBill.lastUpdated.label', default: 'Last Updated')}</th>

        
        <th field="makeDate" sortable="false" editor="datebox" width="80">${message(code: 'ywmsFeeBill.makeDate.label', default: 'Make Date')}</th>

        
        <g:refTemplate code="refSmUser"  inForm="false" model="[required:false,field:'maker',title:g.message(code: 'ywmsFeeBill.maker.label', default: 'Maker')]"></g:refTemplate>
        
        <th field="vnote" sortable="false" editor="text" width="80">${message(code: 'ywmsFeeBill.vnote.label', default: 'Vnote')}</th>
        
        <th field="xgywdh" sortable="false" editor="text" width="80">${message(code: 'ywmsFeeBill.xgywdh.label', default: 'Xgywdh')}</th>
        
        <th field="ywsl" sortable="false" editor="{type:'numberbox',options:{precision:2,required:true}}" width="80">${message(code: 'ywmsFeeBill.ywsl.label', default: 'Ywsl')}</th>
        
        <g:refTemplate code="refYxhqrd"  inForm="false" model="[required:false,field:'yxhqrd',title:g.message(code: 'ywmsFeeBill.yxhqrd.label', default: 'Yxhqrd')]"></g:refTemplate>
        
    </tr>
    </thead>
</table>



