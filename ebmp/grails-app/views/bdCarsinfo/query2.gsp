<link rel="stylesheet" type="text/css" href="${resource(dir:'css',file: 'my.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'default/easyui.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'icon.css')}">

<jq:resources/>
<script type="text/javascript" src="${resource(dir:'js',file: 'jquery.easyui.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file: 'locale/easyui-lang-zh_CN.js')}" charset="utf-8"></script>
<script type="text/javascript" src="${resource(dir:'js',file: 'my.js')}" charset="utf-8"></script>


<script>



    function change(fieldName,parent,fieldSource){


       // destory(target);
        if((fieldSource[fieldName]).type=='date'){


            var targets=  $(parent).find('[name=value]');
          

            var has=false;
            $.each(targets,function(i,v){
                alert($(v).attr('eztype'));
                if($(v).attr('eztype')==undefined){

                    $(v).hide();
                }else  if($(v).attr('eztype')=='date'){
                    $(v).show();
                    has=true;
                }else{

                    $(v).hide();
                }
            });
            if(!has){
                var input=$('<input name="value" eztype="date"/>');
                $(parent).append(input);
                $(input).datebox({value:dateFormate(new Date().getTime())});
            }




        }  else if((fieldSource[fieldName]).type=='datetime'){
            var targets=  $(parent).find('[name=value]');
            alert(targets[0]);

            var has=false;
            $.each(targets,function(i,v){
                alert($(v).attr('eztype'));
                if($(v).attr('eztype')==undefined){

                    $(v).hide();
                }else  if($(v).attr('eztype')=='datetime'){
                    $(v).show();
                    has=true;
                }else{

                    $(v).hide();
                }
            });
            if(!has){
                var input=$('<input name="value" eztype="datetime"/>');
                $(parent).append(input);
                $(input).datetimebox({value:dateTimeFormate(new Date().getTime())});
            }



        }else if((fieldSource[fieldName]).type=='number'){
                 $(target).numberbox({value:0,precision:2,groupSeparator:','});
        }else if((fieldSource[fieldName]).type=='combobox'){

            if((fieldSource[fieldName]).url == undefined){
                $(target).combobox({data:(fieldSource[fieldName]).data,
                    valueField:(fieldSource[fieldName]).valueField ,
                    textField:(fieldSource[fieldName]).textField,
                    panelHeight:'auto'});

            }else{
                $(target).combobox({url:(fieldSource[fieldName]).url,
                    valueField:(fieldSource[fieldName]).valueField ,
                    textField:(fieldSource[fieldName]).textField,
                    panelHeight:'auto'});

            }
        }else {

            $(target).validatebox({'value':''});
            $(target).focus();
        }

      // $('#queryTable123').datagrid('endEdit',row_);

    }

    var source=[{key:'code',value:'编码',type:'text',defalut:'true'},
        {key:'date',value:'日期',type:'date'},
        {key:'time',value:'时间',type:'datetime'},
        {key:'number',value:'数量',type:'number'},
        {key:'state',value:'状态',type:'combobox',valueField:'id',textField:'text',data:[{id:'0',text:'自由'},{id:1,text:'审批'}]},    //url:'xxx.js' 增加url获取服务端的json数据
        {key:'corp',value:'公司',type:'ref'}
    ];
    var defaultData={
        relation:'not',
        criterias:[ {operator:'equal',fieldName:'code'},//criteria
                   {operator:'equal',fieldName:'date'}
                 ]
    };
    var source_=arrayToJson('key','value',source);

    var relation =[{key:'and',value:'与'},{key:'or',value:'或'},{key:'not',value:'非'}];
    var relation_ =arrayToJson('key','value',relation);

    var operator=[{key:'equal',value:'等于'},
        {key:'contains',value:'包含'},
        {key:'notEqual',value:'不等于'},
        {key:'greaterThan',value:'大于'},
        {key:'lessThan',value:'小于'},
        {key:'greaterOrEqual',value:'大于等于'},
        {key:'lessOrEqual',value:'小于等于'},
        {key:'startsWith',value:'以...开始'},
        {key:'endsWith',value:'以...结束'},
        {key:'iContains',value:'包含（不区分大小写）'},
        {key:'notContains',value:'大于等于'},
        {key:'isNull',value:'空'},
        {key:'inSet',value:'在...'},
        {key:'notStartsWith',value:'不以...开始'},
        {key:'notEndsWith',value:'不以...结束'}
    ];
    var operator_=arrayToJson('key','value',operator);




    function arrayToJson(keyField,valueField,data){
        var json={};
        $.each(data,function(i,v){
            json[v[keyField]]=v;
           // json[data]=v;
        });
        return json;
    }




</script>





<table id="qt">
    <tr>
        <td>
            <input id="lxx" class="easyui-combobox" name="relation" data-options="valueField:'key',textField:'value',data:relation, width:50,editable:false,value:'and'" panelHeight='auto'>
        </td>
        <td style="border-top: 1px solid black;border-left: 1px solid black;border-bottom: 1px solid black;width: 10px">

        </td>
        <td>
                <div id="add">
                    <a  href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddQuery(this) "></a>
                    <a  href="#" class="easyui-linkbutton" iconCls="icon-sum" plain="true"  onclick="addBigQuery() "></a>
                </div>

        </td>
    </tr>

</table>

<script>

    //{relation:'and',operator:'equal',fieldName:'code'}
   $(function(){
       if(defaultData!= undefined){
           $('#lxx').combobox('setValue',defaultData.relation);
          // $('#qt').find('[name=relation]').combobox('setValue',defaultData.relation);
           $.each(defaultData.criterias,function(i,v){
               var div=createQueryRow( $('#add'),v);
           });
       }
   });

    function addBigQuery(){

        var r_table=$('<table/>');
        var r_table_row=$('<tr/>');
        r_table.append(r_table_row);
        var r_table_row_col1=$('<td/>');
        r_table_row.append(r_table_row_col1);
        var query_delete=$('<a></a>');
        r_table_row_col1.append(query_delete);

        var r_table_row_col2=$('<td />');
        r_table_row.append(r_table_row_col2);
        var relation_=$('<input name="relation"/>');
        r_table_row_col2.append(relation_);

        var r_table_row_col3=$('<td style="border-top: 1px solid black;border-left: 1px solid black;border-bottom: 1px solid black;width: 10px"/>');
        r_table_row.append(r_table_row_col3);


        var r_table_row_col4=$('<td/>');
        r_table_row.append(r_table_row_col4);
        var row_div=$('<div/>');


        r_table_row_col4.append(row_div);

       // var add_span=$('<span/>');
        var bt_add=$('<a/>');
        //add_span.append(bt_add);
///
        row_div.append(bt_add);

       // var addMore_span=$('<span/>');
        var bt_addMore=$('<a/>');
       // addMore_span.append(bt_addMore);
        row_div.append(bt_addMore);


        $('#add').before(r_table);


        relation_.combobox({valueField:'key',textField:'value',data:relation, width:50,editable:false,value:'and',panelHeight:'auto'});
        query_delete.linkbutton({
            iconCls:"icon-remove",
            plain:"true"
        });
        bt_add.linkbutton({
            iconCls:"icon-add",
            plain:"true"
        });
        bt_addMore.linkbutton({
            iconCls:"icon-sum",
            plain:"true"
        });


        createQueryRow(row_div);
        return r_table;
        //colspan="2"
    }



    function createQueryRow(bf,defaultData){
        var div=$('<div style="text-overflow:ellipsis; white-space: nowrap;"/>');



        var a=$('<a  />');

        div.append(a);

        var span1=$('<span style="margin-left: 8px"/>');
        var input1=$('<input style="width: 120px;" name="fieldName" />');
        span1.append(input1);
        div.append(span1);


        var span2=$('<span style="margin-left: 8px"/>');
        var input2=$('<input style="width: 120px" name="operator"/>');
        span2.append(input2);
        div.append(span2);


        var span3=$('<span style="margin-left: 8px;"/>');
        var input3=$('<input  name="value" style="width: 140px;height: 23px" />');
        span3.append(input3);
        div.append(span3);


        bf.before(div);
        if(defaultData==undefined){
            input1.combobox({valueField:'key',textField:'value',data:source,editable:false,panelHeight:'auto',onChange:onChange});
            input2.combobox({valueField:'key',textField:'value',data:operator,editable:false,panelHeight:'auto'});
        }else{
            input1.combobox({valueField:'key',textField:'value',data:source,editable:false,panelHeight:'auto',value:defaultData.fieldName,onChange:onChange});
            input2.combobox({valueField:'key',textField:'value',data:operator,editable:false,panelHeight:'auto',value:defaultData.operator});
        }

        a.linkbutton({
            iconCls:"icon-remove",
            plain:"true"
        });
        return div;
    }

    function onAddQuery(e){

       createQueryRow( $('#add'));

    }

    function onChange(newValue, oldValue){

       var parent=$(this).closest('div');

      var target=  parent.find('[name=value]')[0];

        change(newValue,parent,source_)
    }
</script>


%{--<table>--}%
%{--<tr>--}%
%{--<td>--}%
%{--<input id="rel${pageId}" class="easyui-combobox" name="relation" data-options="valueField:'key',textField:'value',data:relation, width:50,editable:false,value:'and'" panelHeight='auto'>--}%
%{--</td>--}%
%{--<td style="border-top: 1px solid black;border-left: 1px solid black;border-bottom: 1px solid black;width: 10px">--}%

%{--</td>--}%
%{--<td>--}%
%{--<div id="queryButton${pageId}">--}%
%{--<a  href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddQuery('queryButton${pageId}') "></a>--}%
%{--<a  href="#" class="easyui-linkbutton" iconCls="icon-sum" plain="true"  onclick="onAddBigQuery('queryButton${pageId}') "></a>--}%
%{--</div>--}%

%{--</td>--}%
%{--</tr>--}%

%{--</table>--}%
