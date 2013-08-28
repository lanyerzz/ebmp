
<%@ page import="grails.converters.JSON; com.app.ywms.ck.fhtzd.Yfhtzdb" %>

<script>

    $(function(){

        $('#distribute${pageId}').edatagrid({
            data:${data as JSON},
            checkOnSelect:false,
            selectOnCheck:false,
            rownumbers:true,
            showFooter : true,
            remoteSort:false,
            fit:true,
            singleSelect:true,
            fitColumns:true,
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
                    v['bcsy']=(_sl>= v.max) ? v.max : _sl;
                    sum+=v['bcsy'];

                    $('#distribute${pageId}').edatagrid('updateRow',{index:i,row:v});

                });
                sum${pageId}();
            },
            onUncheckAll:function(rows){
                $('#distribute${pageId}').edatagrid('saveRow');
                $.each(rows,function(i,v){

                    v['bcsy']=0;

                    $('#distribute${pageId}').edatagrid('updateRow',{index:i,row:v});
                });

                sum${pageId}();
            },
            onCheck:function(rowIndex,rowData){
                var sum=getSum${pageId}();
                var sl=$('#sl${pageId}').val();

                var _sl=sl-sum+rowData['bcsy'];

                if(_sl<=0) rowData['bcsy']=0;
                else
                    rowData['bcsy']=(_sl>= rowData.max) ? rowData.max : _sl;



                $('#distribute${pageId}').edatagrid('updateRow',{index:rowIndex,row:rowData});
                sum${pageId}();
            },
            onUncheck:function(rowIndex,rowData){

                rowData['bcsy']=0;

                $('#distribute${pageId}').edatagrid('updateRow',{index:rowIndex,row:rowData});
                sum${pageId}();
            },
            onAfterEdit:function(rowIndex, rowData, changes){

                if(rowData['bcsy']>rowData.kysl){
                    rowData['bcsy']=rowData.kysl;
                }
                $('#distribute${pageId}').edatagrid('updateRow',{index:rowIndex,row:rowData});
                sum${pageId}();
            }
        });


        $('#sl${pageId}').val($('#tzsl${pageId}').numberbox('getValue'));
        $('#bodyTable${pageId}').datagrid('loadData',[]);

    });

    function onBCSY${pageId}(newValue,oldValue){
       // $('#distribute${pageId}').edatagrid('setSelectRowValue',{field:'td.bcsy',value:newValue});
        %{--sum${pageId}();--}%
    }

    function sum${pageId}(){
        $('#distribute${pageId}').datagrid('statistics');
        $('#sum${pageId}').val(getSum${pageId}());

    }

    function getSum${pageId}(){
        $('#distribute${pageId}').edatagrid('saveRow');
        var rows= $('#distribute${pageId}').edatagrid('getChecked');

        var sum=0;
        for(var i=0;i<rows.length;i++){
            // rows[i]['bcsy']=0;
            rows[i]['bcsy'] = (rows[i]['bcsy'] == undefined || isNaN(rows[i]['bcsy'])) ? 0 : rows[i]['bcsy'];

            sum+=parseFloat(rows[i]['bcsy']);
        }

        return sum;
    }

    function check${pageId}(){
        var sl=$('#sl${pageId}').val();
        var sum=getSum${pageId}();
        if(sl!=sum){
            $.messager.confirm('警告','通知数量与本次使用数量不符，是否修改通知数量?',function(r){
                if (r){
                    $('#tzsl${pageId}').numberbox('setValue', sum);

                    return true;
                }else
                    return false;
            });
        }
        return true;

    }


    function  getDistributeData${pageId}(){

        check${pageId}();
        var rows= $('#distribute${pageId}').edatagrid('getChecked');
        var data=new Array()
        for(var i=0;i<rows.length;i++){

            if(rows[i]['bcsy']==0) continue;

            data.push(rows[i]);
        }
        return data;
    }

</script>

<div id="info${pageId}" style="height: 40px;vertical-align: middle">
    <label style="margin-left: 30px">通知数量:</label><input id="sl${pageId}" style="color: red;margin-left: 10px" disabled="" >
    <label style="margin-left: 30px">合计:</label><input id="sum${pageId}" style="color: red;margin-left: 10px" disabled="" >
</div>



%{--表格--}%
<table id="distribute${pageId}">
    <thead>

    <tr>
        <th checkbox="true"></th>
        <th field="billno" sortable="true">${message(code: 'td.billno.label', default: '提单号')}</th>
        <th field="khtdh" sortable="true" >${message(code: 'td.khtdh.label', default: '客户提单号')}</th>
        <th field="hc" sortable="true"  >${message(code: 'td.hc.label', default: '航次')}</th>
        <th field="hth" sortable="true" >${message(code: 'td.hth.label', default: '合同号')}</th>
        <th field="gh" sortable="gh" >${message(code: 'td.gh.label')}</th>
        <th field="pc" sortable="true"  >${message(code: 'td.pc.label', default: '批次')}</th>
        <th field="max" sortable="true" data-options="sum:true">${message(code: 'td.max.label', default: '最大可发量')}</th>
        <th field="bcsy" sortable="true"  editor="{type:'numberbox',options:{precision:2,onChange:onBCSY${pageId}}}" data-options="sum:true">${message(code: 'td.bcsy.label', default: '本次发运量')}</th>

        <th field="bz" sortable="false" editor="text" width="180">${message(code: 'td.bz.label', default: 'Bz')}</th>


    </tr>
    </thead>
</table>



