<%@ page import="grails.converters.JSON" %>
<script>
    $(function(){

        $('#ghtab${pageId}').edatagrid({data:${ghs},showFooter:true});
        $('#ghtab${pageId}').datagrid('statistics');
    });



    function onAddGh${pageId}(){

        $('#ghtab${pageId}').edatagrid('addRow');

    }


    //        删除
    function onDeleteGh${pageId}(){

        var row=$('#ghtab${pageId}').edatagrid('getSelected');
        var index = $('#ghtab${pageId}').edatagrid('getRowIndex',row);
        if(row==null){
            $.messager.show({
                title:'消息',
                msg:'请选择需要删除的数据！'
            });
            return;
        };
        $('#ghtab${pageId}').datagrid('deleteRow',index);
    }


    function jhsl${pageId}(oldValue,newValue){

        $('#ghtab${pageId}').datagrid('statistics');
    }

    function check${pageId}(){
        var max=${yxhjhdb?.tdsl};
        var rows=$('#ghtab${pageId}').edatagrid('getRows');
        var sum=0;
        $.each(rows,function(i,v){
            sum+= Number(v.jhsl);
        })

        if(max<sum){
            $.messager.show({
                title:'错误',
                msg:'计划入罐数量不能超过${yxhjhdb?.tdsl}！'
            });
            return false;
        }

        return true;
    }

</script>

<g:if test="${ac!="show"}">
%{--按钮--}%

    <div id="ghtb${pageId}">
        <div style="display: inline-block">
            最大分配数量:<span style="color: red">${yxhjhdb?.tdsl}</span>
        </div>
        <hr>
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddGh${pageId}() ">
            ${message(code: 'default.button.create.label',default: '增加')}
        </a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDeleteGh${pageId}() ">
            ${message(code: 'default.button.delete.label',default: '删除')}
        </a>

    </div>
</g:if>

%{--表格--}%
<table id="ghtab${pageId}"
       rownumbers="true"

       fit="true" toolbar="#ghtb${pageId}" singleSelect="true"  showFooter="true">

    <thead>

    <tr>


        <g:refTemplate code="refYBdTank" inForm="false" model="[field:'gh',title:'罐号',required:true]"></g:refTemplate>
        <th field='jhsl' width='120' data-options="sum:true" editor="{type:'numberbox',options:{precision:4,required:true,onChange:jhsl${pageId}}}">计划入库数量</th>



    </tr>
    </thead>
</table>


