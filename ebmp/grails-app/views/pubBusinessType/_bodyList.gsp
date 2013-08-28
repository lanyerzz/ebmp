
<%@ page import="com.app.pub.businesstype.PubBusinessBill" %>
<g:set var="entityName" value="${message(code: 'pubBusinessBill.label', default: 'PubBusinessBill')}" />
<script>

    $(function(){
        $('#rowTable${pageId}').edatagrid();
        <g:if test="${ac=='create'}" >
            $('#rowTable${pageId}').edatagrid('addRow');
        </g:if>
    });



    //增加
    function onAddRow${pageId}(){
        $('#rowTable${pageId}').edatagrid('addRow');

    }



    //        删除
    function onDeleteRow${pageId}(){

        var row=$('#rowTable${pageId}').edatagrid('getSelected');
        var index = $('#rowTable${pageId}').edatagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要删除的数据！'
            });
            return;
        };
        $('#rowTable${pageId}').edatagrid('deleteRow',index);

    }

    function onSelectsourceType${pageId}(index,data){
        if(data==null){

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'sourceType.billtypecode',value:''});
        }else{

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'sourceType.billtypecode',value:data.billtypecode});
        }
    }

    function onChangesourceType${pageId}(newValue, oldValue){
        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'sourceType.billtypecode',value:''});
    }

    function onSelectbilltype${pageId}(index,data){
        if(data==null){

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'billtype.billtypecode',value:''});
        }else{

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'billtype.billtypecode',value:data.billtypecode});
        }
    }

    function onChangebilltype${pageId}(newValue, oldValue){
        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'billtype.billtypecode',value:''});
    }



</script>



%{--按钮--}%
<div id="rowtb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddRow${pageId}() ">
        ${message(code: 'default.button.create.label',default: '增加')}
    </a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDeleteRow${pageId}() ">
        ${message(code: 'default.button.delete.label',default: '删除')}
    </a>

</div>
%{--表格--}%
<table id="rowTable${pageId}"
       <g:if test="${ac=='edit'}">url="${createLink(action: 'queryBody')}?headId=${pubBusinessTypeInstance?.id}"</g:if>
       rownumbers="true"
       fit="true" toolbar="#rowtb${pageId}" singleSelect="true"  >

    <thead>

    <tr>
        <th field="sourceType.billtypecode" width="80" sortable="false" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row){
                   if(row.sourceType==null||row.sourceType.billtypecode==null) return value;
                   return row.sourceType.billtypecode;
            }">${message(code: 'pubBusinessBill.sourceType.billtypecode.label', default: 'billtypecode')}</th>

        <g:refTemplate code="refPubBilltype" inForm="false" model="[field:'sourceType',title:g.message(code:'pubBusinessBill.sourceType.label'),onSelect:'onSelectsourceType'+pageId,onChange:'onChangesourceType'+pageId]"></g:refTemplate>

        <th field="billtype.billtypecode" width="80" sortable="false" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row){
                   if(row.billtype==null||row.billtype.billtypecode==null) return value;
                   return row.billtype.billtypecode;
            }">${message(code: 'pubBusinessBill.billtype.billtypecode.label', default: 'billtypecode')}</th>
        <g:refTemplate code="refPubBilltype" inForm="false" model="[field:'billtype',title:g.message(code:'pubBusinessBill.billtype.label'),onSelect:'onSelectbilltype'+pageId,onChange:'onChangebilltype'+pageId]"></g:refTemplate>


        <th field="canDefine" sortable="true" width="100" editor="{
                    type:'checkbox',
                    options:{
                        on: true,
                        off: false
                    }
                }">${message(code: 'pubBusinessBill.canDefine.label', default: 'Can Define')}</th>

        <th field="flowType" sortable="true" editor="{type:'combobox',options:{valueField:'id',textField:'text',data:[{id:'0',text:'无'},{id:'1',text:'拉式'},{id:'2',text:'推式'}],panelHeight: 'auto',editable:false}}" data-options="formatter:function(value,row){
            if(value=='0'){
                return '无';
            }else if(value=='1'){
                return '拉式';
            }else if(value=='2'){
                return '推式';
            }
        }">${message(code: 'pubBusinessBill.flowType.label', default: 'Flow Type')}</th>

    </tr>
    </thead>
</table>



