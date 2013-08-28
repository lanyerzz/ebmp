
<%@ page import="grails.converters.JSON; com.app.ywms.rk.cbdgd.YcbdgdB" %>
<g:set var="entityName" value="${message(code: 'ycbdgdB.label', default: 'YcbdgdB')}" />
<script>




    $(function(){



        <g:if test="${ac=='create'}">
            $('#rowTable${pageId}').edatagrid({data:${bodys as JSON}});
             $('#rowTable${pageId}').edatagrid('addRow')
        </g:if>
        <g:elseif test="${ac=='show'}">
         $('#rowTable${pageId}').datagrid({url:"${createLink(action: 'queryBody')}?headId=${ycbdgdInstance?.id}"});
        </g:elseif>
        <g:else>
           $('#rowTable${pageId}').edatagrid({url:"${createLink(action: 'queryBody')}?headId=${ycbdgdInstance?.id}"});
        </g:else>


    });


    function onAddRow${pageId}(){
        $('#rowTable${pageId}').edatagrid('addRow')
    }




    //        删除
    function onDeleteRow${pageId}(){

        var row=$('#rowTable${pageId}').datagrid('getSelected');
        var index = $('#rowTable${pageId}').datagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要删除的数据！'
            });
            return;
        };

        $('#rowTable${pageId}').datagrid('deleteRow',index);

    }
    function onSelectinv${pageId}(index,data){

        if(data==null){

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:''});
        }else{

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:data.pkInvbasdoc.invcode});
        }

    }


    function onChangeinv${pageId}(newValue, oldValue){
        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'bdInvmandoc.pkInvbasdoc.invcode',value:''});

    }
    function onSelectht${pageId}(index,data){

        if(data==null){

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'ccqyhth.signDate',value:''});
            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'ccqyhth.contractNo2',value:''});
        }else{

            $('#rowTable${pageId}').edatagrid('setColValue',{field:'ccqyhth.signDate',value:dateFormate(data.signDate)});

            $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'ccqyhth.contractNo2',value:data.contractNo2});
        }

    }


    function onChangeht${pageId}(newValue, oldValue){
        if(oldValue=='') return;
        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'ccqyhth.signDate',value:''});
        $('#rowTable${pageId}').edatagrid('setLabelValue',{field:'ccqyhth.contractNo2',value:''});
    }


</script>

<g:if test="${ac!='show'}">
%{--按钮--}%
    <div id="bodytb${pageId}">
        <g:if test="${ycbdgdInstance?.sourceBillTypeCode}">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" disabled="true" onclick="onAddRow${pageId}() ">
                ${message(code: 'default.button.create.label',default: '增加')}
            </a>
        </g:if>
        <g:else>
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddRow${pageId}() ">
                ${message(code: 'default.button.create.label',default: '增加')}
            </a>
        </g:else>

        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDeleteRow${pageId}() ">
            ${message(code: 'default.button.delete.label',default: '删除')}
        </a>

    </div>
</g:if>


%{--表格--}%
<table id="rowTable${pageId}"

        title="明细"
       rownumbers="true"
       fit="true" toolbar="#bodytb${pageId}" singleSelect="true" fitColumns="true">

    <thead>

    <tr>


        <th field="bdInvmandoc.pkInvbasdoc.invcode" sortable="false" width="100" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row,index){

                return  getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invcode');

            }">
            <g:message code="bdInvmandoc.pkInvbasdoc.invcode.label" />
        </th>

        <g:if test="${ycbdgdInstance?.sourceBillTypeCode}">
            <th field="bdInvmandoc.pkInvbasdoc.invname" sortable="false" width="100" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row,index){

                return  getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.invname');

            }">
                <g:message code="yhyjhB.bdInvmandoc.label" />
            </th>

        </g:if>
        <g:else>
            <g:refTemplate code="refBdInvmandoc" inForm="false" model="[title:g.message(code: 'yhyjhB.bdInvmandoc.label'),field:'bdInvmandoc',onSelect:'onSelectinv'+pageId,onChange:'onChangeinv'+pageId,required:true]" ></g:refTemplate>

        </g:else>

        <th field="tdsl" sortable="true" editor="{type:'numberbox',options:{precision:2,required:true}}">${message(code: 'ycbdgdB.tdsl.label', default: 'Tdsl')}</th>
        <th field="bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname" sortable="false" width="80" editor="{type:'label'}" data-options="canSave:false,formatter:function(value,row){

                 return getObjectAttr(row,'bdInvmandoc.pkInvbasdoc.bdmeasdoc.measname');
            }">${message(code: 'ycbdgdB.jldw.label')}</th>
        <th field="pch" sortable="true" editor="{type:'text'}">${message(code: 'ycbdgdB.pch.label', default: 'Pch')}</th>

        <th field="yjxhgh" editor="text">${g.message(code:'ycbdgdB.yjxhgh.label')}</th>
        <g:refTemplate code="refBdCustomer" inForm="false" model="[title:g.message(code: 'ycbdgdB.hzdw.label'),field: 'hzdw']" ></g:refTemplate>

        <g:refTemplate code="refBdCustomer" inForm="false" model="[title:g.message(code: 'ycbdgdB.cddw.label'),field: 'cddw']" ></g:refTemplate>

        <g:refTemplate code="refBdCustomer" inForm="false" model="[title:g.message(code: 'ycbdgdB.kzdw.label'),field: 'kzdw']" ></g:refTemplate>



        <g:refTemplate code="refYContract" inForm="false"  model="[title:g.message(code:'ycbdgd.ccqyhth.label'),field:'ccqyhth',onChange:'onChangeht'+pageId ,onSelect:'onSelectht'+pageId ]"></g:refTemplate>
        <th field="ccqyhth.signDate" sortable="true" editor="{type:'label'}"
            data-options="canSave:false,formatter:function(value,row,index){
            var value_=getObjectAttr(row,'ccqyhth.signDate');


            return  dateFormate(value_);
        }">${message(code: 'ycbdgd.htqdrq.label', default: 'Htqdrq')}</th>

        <th field="ccqyhth.contractNo2" sortable="true" editor="{type:'label'}"  data-options="canSave:false,formatter:function(value,row,index){
       var value_=getObjectAttr(row,'ccqyhth.contractNo2');

        row['ccqyhth.contractNo2']=value_;
        return value_;
        }">${message(code: 'baseContract.contractNo2.label')}</th>



        <th field="note" sortable="true" editor="{type:'text'}">${message(code: 'ycbdgdB.note.label', default: 'Note')}</th>



    </tr>
    </thead>
</table>



