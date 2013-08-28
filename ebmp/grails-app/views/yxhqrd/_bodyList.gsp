
<%@ page import="grails.converters.JSON; com.app.ywms.rk.xhjhd.YxhjhdB" %>
<g:set var="entityName" value="${message(code: 'yxhjhdB.label', default: 'YxhjhdB')}" />
<script>
    $(function(){

        <g:if test="${ac=='create'}">
        <g:if test="${yxhqrdInstance?.gh!=null}">
        $('#rowTable${pageId}').edatagrid({onAfterEdit1:onAfterEdit1${pageId}});
        $('#rowTable${pageId}').edatagrid('loadData',${yxhqrdInstance?.gh*.part([defaultPart:true]) as JSON});
        </g:if>
        <g:else>
        $('#rowTable${pageId}').edatagrid({});
        $('#rowTable${pageId}').edatagrid('addRow');
        </g:else>

        </g:if>
        <g:elseif test="${ac=='show'}">
        $('#rowTable${pageId}').datagrid({url:"${createLink(action: 'queryGH')}/${yxhqrdInstance?.id}"});
        </g:elseif>
        <g:elseif test="${ac=='edit'}">
        $('#rowTable${pageId}').edatagrid({url:"${createLink(action: 'queryGH')}/${yxhqrdInstance?.id}"});
        </g:elseif>

    });



    function onAddBody${pageId}(){
        $('#rowTable${pageId}').edatagrid('addRow');
    }


    //        删除
    function onDeleteBody${pageId}(){

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

    function onAfterEdit1${pageId}(index, row){

         var gjslSum=$('#rowTable${pageId}').datagrid('sum','gjsl');
        $('#gjsl${pageId}').numberbox('setValue',gjslSum);


        var cjslSum=$('#rowTable${pageId}').datagrid('sum','cjsl');
        $('#cjsl${pageId}').numberbox('setValue',cjslSum);


        var sjslSum=$('#rowTable${pageId}').datagrid('sum','sjsl');
        $('#sjsl${pageId}').numberbox('setValue',sjslSum);
    }


    function gjsl${pageId}(newValue,oldValue){
        //$('#gjsl${pageId}').numberbox('setValue',newValue);
    }

    function sjsl${pageId}(newValue,oldValue){
       // $('#sjsl${pageId}').numberbox('setValue',newValue);
    }

    function cjsl${pageId}(newValue,oldValue){
       // $('#cjsl${pageId}').numberbox('setValue',newValue);
    }



</script>


<g:if test="${ac!="show"}">
%{--按钮--}%
    <div id="bodytb${pageId}">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddBody${pageId}() ">
            ${message(code: 'default.button.create.label',default: '增加')}
        </a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDeleteBody${pageId}() ">
            ${message(code: 'default.button.delete.label',default: '删除')}
        </a>


    </div>
</g:if>

%{--表格--}%
<table id="rowTable${pageId}"
       rownumbers="true"
       title="罐号分配"
       fit="true" toolbar="#bodytb${pageId}" singleSelect="true" >

    <thead>

    <tr>
        <th field="bdTank.name" width="120" data-options="formatter:defaultFormatter">罐号</th>
        <th field="gjsl" width="120" data-options="sum:true" editor="{type:'numberbox',options:{precision:4,required:true,onChange:gjsl${pageId}}}">罐检数量</th>
        <th field="cjsl" width="120" data-options="sum:true" editor="{type:'numberbox',options:{precision:4,required:true,onChange:cjsl${pageId}}}">船检数量</th>
        <th field="sjsl" width="120" data-options="sum:true" editor="{type:'numberbox',options:{precision:4,required:true,onChange:sjsl${pageId}}}">商检数量</th>
        <th field="vnote" width="220" editor="text">备注</th>
    </tr>
    </thead>
</table>



