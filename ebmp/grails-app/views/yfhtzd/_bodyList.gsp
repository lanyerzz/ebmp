
<%@ page import="grails.converters.JSON; com.app.ywms.ck.fhtzd.Yfhtzdb" %>

<script>


    $(function(){


        <g:if test="${ac=='create'}">
        $('#bodyTable${pageId}').edatagrid({

            data:${bodys?:[] as JSON}
        });
        </g:if>
        <g:elseif test="${ac=='show'}">
        $('#bodyTable${pageId}').datagrid({
            title:'明细信息',
            url:'${createLink(action: 'queryBody',params: [headId:yfhtzdInstance?.id])}'

        });
        </g:elseif>
        <g:elseif test="${ac=='edit'}">
        $('#bodyTable${pageId}').edatagrid({
            url:'${createLink(action: 'queryBody',params: [headId:yfhtzdInstance?.id])}'

        });
        </g:elseif>


    });




    function fpmx${pageId}(){


       var data= $('#bodyTable${pageId}').datagrid('getRows');



        if(data.length>0){

            $.messager.confirm('警告','单据明细将被清除,确认要重新分配明细?',function(q){
                if(q){

                    openFPDLG${pageId}();
                }else{

                }
            });
        }else{
            openFPDLG${pageId}();
        }



    }

    function openFPDLG${pageId}(){

        var thdw= $('#thdw${pageId}').combogrid('getValue');
        if(!thdw){
            $.messager.alert('警告','请先录入字段:[提货单位]!');
            $('#thdw${pageId}').combogrid('validate')
            return;
        }

        var hw= $('#hw${pageId}').combogrid('getValue');
        if(!hw){
            $.messager.alert('警告','请先录入字段:[货物]!');
            $('#hw${pageId}').combogrid('validate');
            return;
        }

        var tzsl= $('#tzsl${pageId}').numberbox('getValue');
        if(!tzsl){
            $.messager.alert('警告','请先录入字段:[通知数量]!');
            $('#tzsl${pageId}').numberbox('validate');
            return;
        }

        $("<div/>").dialog({
            title: '分配明细',
            resizable: false,
            modal: true,
            width: 800,
            height: 500,
            href:'${createLink(controller:'yfhtzd',action: 'refMX')}?thdw='+thdw+'&hw='+hw+'&headId=${yfhtzdInstance?.id}&businessType=${yfhtzdInstance?.businessType?.id}',

            buttons: [
                {
                    text: '分配',
                    handler: function () {
                        var data= getDistributeData${pageId}();



                        if(data==false) return;
                        $('#bodyTable${pageId}').datagrid('loadData',data);
                        $('#bodyTable${pageId}').datagrid('statistics');
                        var a = $(this).closest('.window-body');

                        a.dialog('destroy');
                    }
                }
            ],
            onClose: function () {
                $(this).dialog('destroy');
            }
        });
    }


</script>
<g:if test="${ac!='show'}">
    <div id="bodytb${pageId}">
        <a class="easyui-linkbutton" plain="true"  iconCls="icon-add" onclick="fpmx${pageId}()">分配明细</a>
    </div>
</g:if>



%{--表格--}%
<table id="bodyTable${pageId}"
       rownumbers="true"
       fit="true"  singleSelect="true" toolbar="#bodytb${pageId}"  remoteSort="false"  showFooter="true">

    <thead>

    <tr>
        <th field="billno" sortable="true" canSave="false" >${message(code: 'td.billno.label', default: '提单号')}</th>
        <th field="khtdh" sortable="true"  >${message(code: 'td.khtdh.label', default: '客户提单号')}</th>
        <th field="hc" sortable="true"  >${message(code: 'td.hc.label', default: '航次')}</th>
        <th field="gh" sortable="gh" >${message(code: 'td.gh.label')}</th>
        <th field="hth" sortable="true"  >${message(code: 'td.hth.label', default: '合同号')}</th>
        <th field="pc" sortable="true"  >${message(code: 'td.pc.label', default: '批次')}</th>
        <th field="max" sortable="true"  >${message(code: 'td.max.label', default: '最大可发量')}</th>
        <th field="bcsy" sortable="true" data-options="sum:true" >${message(code: 'td.bcsy.label', default: '本次发运量')}</th>

        <th field="bz" sortable="false"  width="180">${message(code: 'td.bz.label', default: 'Bz')}</th>


    </tr>
    </thead>
</table>



