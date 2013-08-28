<%@ page import="grails.converters.JSON; com.app.so.rec.SoRecBody" %>

<script>


    $(function(){


        <g:if test="${ac=='create'}">
        $('#bodyTable${pageId}').edatagrid({

            data:${bodys?:[] as JSON}

        });

        onAddRow${pageId}();
        </g:if>
        <g:elseif test="${ac=='show'}">
        $('#bodyTable${pageId}').datagrid({
            url:'${createLink(action: 'queryBody',params: [headId:soRecInstance?.id])}'

        });
        </g:elseif>
        <g:else>
        $('#bodyTable${pageId}').edatagrid({
            url:'${createLink(action: 'queryBody',params: [headId:soRecInstance?.id])}'

        });
        </g:else>


    });


    function onAddRow${pageId}(){


        $('#bodyTable${pageId}').edatagrid('addRow1',{hl:1});
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


function onCurrChange${pageId}(){

}


    function onSelectCur${pageId}(index,data){
        if(data==null){

            $('#nexchangeotobrate${pageId}').numberbox('setValue',1);
            %{--$('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'ntaxrate',value:''});--}%

        }else{

            //获取汇率

            $.post('${createLink(controller: 'bdExchange',action: 'getExchage2')}',{from:data.id,to:$('#currencytype${pageId}').val(),date:$('#form${pageId}').serializeObject().billdate},function(json){
                %{--$('#nexchangeotobrate${pageId}').numberbox('setValue',json);--}%
                $('#bodyTable${pageId}').edatagrid('setColValue',{field:'hl',value:json});
            });


        }
    }

    function ssje${pageId}(newValue,oldValue){
      var hl=  $('#bodyTable${pageId}').edatagrid('getColValue',"hl");
        $('#bodyTable${pageId}').edatagrid('setSelectRowValue',{field:'ssje',value:newValue});
        $('#bodyTable${pageId}').edatagrid('setColValue',{field:'hxje',value:parseFloat(hl)*parseFloat(newValue)});
    }

    function hxje${pageId}(newValue,oldValue){
        var ssje=  $('#bodyTable${pageId}').edatagrid('getSelectRowValue',"ssje");
        $('#bodyTable${pageId}').edatagrid('setSelectRowValue',{field:'hxje',value:newValue});
        $('#bodyTable${pageId}').edatagrid('setColValue',{field:'hl',value:parseFloat(newValue)/parseFloat(ssje)});
        computHeadHxje${pageId}();
    }

    function computHeadHxje${pageId}(){
        var tb=  $('#bodyTable${pageId}');
//        $(tb).datagrid('Save')
        var bodys = $(tb).edatagrid('getJSON');
        var sum=0;
        if(bodys==null) return;

        for(i=0;i<bodys.length;i++){

            sum+=parseFloat( bodys[i].hxje);
        }

        $('#hxje${pageId}').numberbox('setValue',sum);

        var ddwhx=$('#ddwhx${pageId}').numberbox('getValue');

        $('#zk${pageId}').numberbox('setValue',parseFloat(ddwhx)-sum);
    }

</script>


<g:if test="ac!='show'">
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

       title="收款明细"
       rownumbers="true"
       fit="true" toolbar="#tbb${pageId}" singleSelect="true"  >

    <thead>

    <tr>
        <g:refTemplate code="refBdCurrtype" model="[field:'currtype',title:message(code: 'soRecBody.currtype.label'),onChange:'onCurrChange'+pageId,onSelect:'onSelectCur'+pageId]" inForm="false"></g:refTemplate>


        <th field="hl" sortable="false" width="100" editor="{type:'numberbox',options:{required:true,precision:2,required:true}}">${message(code: "soRecBody.hl.label")}</th>
        <th field="ssje" sortable="false" width="100" editor="{type:'numberbox',options:{required:true,precision:2,required:true,onChange:ssje${pageId}}}">${message(code: 'soRecBody.ssje.label')}</th>

        <th field="hxje" sortable="false" width="100" data-options="sum:true" editor="{type:'numberbox',options:{required:true,precision:2,required:true,onChange:hxje${pageId}}}">${message(code: 'soRecBody.hxje.label')}</th>

    </tr>
    </thead>
</table>