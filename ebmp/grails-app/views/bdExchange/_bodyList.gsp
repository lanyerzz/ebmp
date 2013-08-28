<script>
    $(function(){
        <g:if test="${ac=='create'}"  >


            $('#body${pageId}').edatagrid({});
        </g:if>
        <g:if test="${ac=='edit'}">
            $('#body${pageId}').edatagrid({url:'${createLink(action: 'queryBody')}/${bdExchangeInstance?.id}'});
        </g:if>

    });
</script>


%{--按钮--}%
<div id="bodytb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="load${pageId}() " data-options="disabled:${ac=='edit'}">
       加载
    </a>


</div>

%{--表格--}%
<table id="body${pageId}"
       toolbar="#bodytb${pageId}"
       rownumbers="true"
       fit="true"  singleSelect="true" >
    <thead>
    <tr>
        <th field="day" sortable="false" width="80">${message(code: 'bdExchangeB.day.label', default: 'Day')}</th>

        <th field="exchange" sortable="false" width="150" data-optiosns="align:'right'" editor="numberbox">${message(code: 'bdExchangeB.exchange.label', default: 'Exchange')}</th>
    </tr>
    </thead>
</table>
