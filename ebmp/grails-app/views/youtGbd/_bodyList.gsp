
<%@ page import="grails.converters.JSON; com.app.ywms.ck.fhtzd.Yfhtzdb" %>

<script>


    $(function(){



        <g:if test="${ac=='create'}">
        <g:if test="${bodys!=null}">

        $('#bodyTable${pageId}').edatagrid({});
        $('#bodyTable${pageId}').edatagrid('loadData',${bodys as JSON});
        </g:if>
        <g:else>
        $('#bodyTable${pageId}').edatagrid({});
        $('#bodyTable${pageId}').edatagrid('addRow');
        </g:else>

        </g:if>
        <g:elseif test="${ac=='show'}">

        $('#bodyTable${pageId}').datagrid({url:'${createLink(action: 'queryBody',params: [headId:youtGbdInstance.id])}'});
        </g:elseif>
        <g:elseif test="${ac=='edit'}">


        $('#bodyTable${pageId}').edatagrid({url:'${createLink(action: 'queryBody',params: [headId:youtGbdInstance.id])}'});
        </g:elseif>

    });





</script>


%{--表格--}%
<table id="bodyTable${pageId}"
       title="明细"
       rownumbers="true"
       fit="true"  singleSelect="true"   remoteSort="false"  showFooter="true">

    <thead>

    <tr>
        <th field="gh.name" sortable="gh" data-options="formatter:defaultFormatter">${message(code: 'td.gh.label')}</th>
        <th field="max" sortable="true"  >${message(code: 'td.max.label', default: '最大可发量')}</th>
        <th field="bcsy" sortable="true" data-options="sum:true" >${message(code: 'td.fysl.label', default: '通知数量')}</th>
        <th field="outnum" sortable="true" data-options="sum:true" editor="{type:'numberbox',options:{precision:2}}">${message(code: 'td.outnum.label', default: '发运数量')}</th>

        <th field="bz" sortable="false"  width="180">${message(code: 'td.bz.label', default: 'Bz')}</th>


    </tr>
    </thead>
</table>



