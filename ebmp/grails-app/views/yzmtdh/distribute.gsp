<%@ page import="grails.converters.JSON" %>
<script>

    $(function(){
        $('#distribute${pageId}').edatagrid({
            %{--url:"${createLink(action: 'queryCanDistribute')}?hz=${hz}&hw=${hw}",--}%
            data:${data as JSON},
            checkOnSelect:false,
            selectOnCheck:false,
            remoteSort:false,
            rownumbers:true,
            showFooter : true,
            fit:true,
            singleSelect:true,
            toolbar:'#info${pageId}',
            onCheckAll:function(rows){

               var sl=$('#sl${pageId}').val();
                var sum=getSum${pageId}();
                $.each(rows,function(i,v){
                    var _sl=sl-sum;
                    if(_sl<=0) {

                        sum${pageId}();
                        return;
                    }
                    v.bcsy=(_sl>= v.kysl) ? v.kysl : _sl;
                    sum+=v.bcsy;
                    $('#distribute${pageId}').edatagrid('updateRow',{index:i,row:v});

                });
                sum${pageId}();
            },
            onUncheckAll:function(rows){
                $('#distribute${pageId}').edatagrid('saveRow');
                $.each(rows,function(i,v){

                    v.bcsy=0;

                    $('#distribute${pageId}').edatagrid('updateRow',{index:i,row:v});
                });

                sum${pageId}();
            },
            onCheck:function(rowIndex,rowData){
                var sum=getSum${pageId}();
                var sl=$('#sl${pageId}').val();

                var _sl=sl-sum+rowData.bcsy;

                if(_sl<=0) rowData.bcsy=0;
                else
                    rowData.bcsy=(_sl>= rowData.kysl) ? rowData.kysl : _sl;



                $('#distribute${pageId}').edatagrid('updateRow',{index:rowIndex,row:rowData});
                sum${pageId}();
            },
            onUncheck:function(rowIndex,rowData){

                rowData.bcsy=0;

                $('#distribute${pageId}').edatagrid('updateRow',{index:rowIndex,row:rowData});
                sum${pageId}();
            },
            onAfterEdit:function(rowIndex, rowData, changes){

                if(rowData.bcsy>rowData.kysl){
                    rowData.bcsy=rowData.kysl;
                }
                $('#distribute${pageId}').edatagrid('updateRow',{index:rowIndex,row:rowData});
                sum${pageId}();
            }
        });
        $('#distribute${pageId}').datagrid('statistics');
        $('#sl${pageId}').val($('#szsl${pageId}').numberbox('getValue'));
        $('#bodyTable${pageId}').datagrid('loadData',[]);

    });

    function sum${pageId}(){

        $('#sum${pageId}').val(getSum${pageId}());
        $('#distribute${pageId}').datagrid('statistics');
    }

    function getSum${pageId}(){
        $('#distribute${pageId}').edatagrid('saveRow');
        var rows= $('#distribute${pageId}').edatagrid('getChecked');

        var sum=0;
        for(var i=0;i<rows.length;i++){
           // rows[i]['bcsy']=0;
            rows[i].bcsy = (rows[i].bcsy == undefined || isNaN(rows[i].bcsy)) ? 0 : rows[i].bcsy;

            sum+=parseFloat(rows[i].bcsy);
        }

        return sum;
    }

    function check${pageId}(){
        var sl=$('#sl${pageId}').val();
        var sum=getSum${pageId}();
        if(sl!=sum){
            $.messager.confirm('警告','实出通知与本次使用通知不符，是否修改实出通知?',function(r){
                if (r){
                    $('#szsl${pageId}').numberbox('setValue', sum);

                   return true;
                }else
                    return false;
            });
        }
        return true;

    }


    function  getDistributeData${pageId}(){

       if( check${pageId}()==false){
           return false;
       }
        var rows= $('#distribute${pageId}').edatagrid('getChecked');
        var data=new Array()
        for(var i=0;i<rows.length;i++){
            if(rows[i].bcsy==0) continue;
            var row={}
            row['rk.id']=rows[i].id;
            row['rk']=rows[i];
            row['bcky']=rows[i].kysl;
            row['bcsy']=rows[i].bcsy;
            row['vnote']=rows[i].vnote;
            data.push(row)
        }
        return data;
    }

</script>

<div id="info${pageId}" style="height: 40px;vertical-align: middle">
    <label style="margin-top: 12px">转出单位:</label><input  style="color: red;margin-left: 10px" readonly="" value="${custname}">
    <label style="margin-left: 30px">实出数量:</label><input id="sl${pageId}" style="color: red;margin-left: 10px" readonly="" >
    <label style="margin-left: 30px">合计:</label><input id="sum${pageId}" style="color: red;margin-left: 10px" readonly="" >
</div>

<table id="distribute${pageId}" >

    <thead frozen="true">
    <tr>
        <th checkbox="true" ></th>
        %{--入库日期--}%
        <th field="billdate" sortable="true" data-options="
            formatter:dateFormate
        "><g:message code="ycrkmx.billdate.label"/></th>
        %{--合同号--}%
        <th field="ht.contractNo" sortable="true" data-options="
            formatter:function(value,row){

               return getObjectAttr(row,'ht.contractNo');
            }
        "><g:message code="baseContract.contractNo.label"/></th>
        %{--相关合同号--}%
        <th field="ht.contractNo2" sortable="true" data-options="
            formatter:function(value,row){
               return getObjectAttr(row,'ht.contractNo2');
            }
        "><g:message code="baseContract.contractNo2.label"/></th>
    </tr>
    </thead>

    <thead>

    <tr>



        %{--货物编码--}%
        <th field="invmandoc.pkInvbasdoc.invcode" sortable="true" data-options="
            formatter:function(value,row){
              return  getObjectAttr(row,'invmandoc.pkInvbasdoc.invcode');
            }
        "><g:message code="bdInvbasdoc.invcode.label"/></th>
        %{--货物名称--}%
        <th field="invmandoc.pkInvbasdoc.invname" sortable="true" data-options="
            formatter:function(value,row){
               return getObjectAttr(row,'invmandoc.pkInvbasdoc.invname');
            }
        "><g:message code="bdInvbasdoc.invname.label"/></th>
        %{--批次--}%
        <th field="pc" sortable="true"><g:message code="yzmtdb.pc.label"/></th>

        %{--入库类型--}%
        %{--上游单据类型--}%
        <th field="sourceBillType.billtypename" sortable="true" data-options="
        formatter:function(value,row){

            return getObjectAttr(row,'sourceBillType.billtypename');
        }
    "><g:message code="yzmtdb.sourceBillType.billtypename.label"/></th>
        %{--上游单据号--}%
        <th field="sourceBillCode" sortable="true"><g:message code="yzmtdb.sourceBillCode.label"/></th>
        <th field="invmandoc.pkInvbasdoc.bdmeasdoc.measname" sortable="true" data-options="
            formatter:function(value,row){
                return getObjectAttr(row,'invmandoc.pkInvbasdoc.bdmeasdoc.measname');
            }
        "><g:message code="bdInvbasdoc.bdmeasdoc.label"/></th>
        <th field="insl" sortable="true" data-options="sum:true">${message(code: 'yzmtdb.rksl.label', default: 'Bcky')}</th>
        <th field="kysl" sortable="true" data-options="sum:true">${message(code: 'yzmtdb.kysl.label', default: 'kysl')}</th>
        <th field="bcsy" sortable="true" editor="{type:'numberbox',options:{precision:2}}" data-options="sum:true" >${message(code: 'yzmtdb.bcsy.label', default: 'Bcsy')}</th>

        <th field="vnote" sortable="false">${message(code: 'yzmtdb.vnote.label', default: 'Vnote')}</th>

    </tr>
    </thead>
</table>

