<link rel="stylesheet" type="text/css" href="${resource(dir:'css',file: 'my.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'default/easyui.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'icon.css')}">

<jq:resources/>
<script type="text/javascript" src="${resource(dir:'js',file: 'jquery.easyui.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file: 'locale/easyui-lang-zh_CN.js')}" charset="utf-8"></script>
<script type="text/javascript" src="${resource(dir:'js',file: 'my.js')}" charset="utf-8"></script>

<script>

    function onChange(newValue,oldValue){

        var ed=getEditor('value');
        var row_=  $('#queryTable123').datagrid('getSelected');
        var index_=$('#queryTable123').datagrid('getRowIndex',row_);


       // $(ed.target).validatebox('destroy');
        if((source_[newValue]).type=='date'){
            if(row_.value==''){
                row_.value=dateFormate(new Date().getTime());
            }
            $("#queryTable123").datagrid('removeEditor',  'value');
            $("#queryTable123").datagrid('addEditor', {
                field : 'value',
                editor : {
                    type : 'datebox'
                }
            });

            $(ed.target).focus();

        }else if((source_[newValue]).type=='datetime'){

            $(ed.target).datetimebox({value:dateTimeFormate(new Date().getTime())});
            $(ed.target).focus();
        }else if((source_[newValue]).type=='number'){
           // var value=   $(ed.target).numberbox('getValue');
           if(row_.value=='')
               $(ed.target).numberbox({value:0,precision:2,groupSeparator:','});
            else
                 $(ed.target).numberbox({value:row_.value,precision:2,groupSeparator:','});
//            $(ed.target).focus();
        }else if((source_[newValue]).type=='combobox'){

            if((source_[newValue]).url == undefined){
                $(ed.target).combobox({data:(source_[newValue]).data,
                    valueField:(source_[newValue]).valueField ,
                    textField:(source_[newValue]).textField,
                    panelHeight:'auto'});
                $(ed.target).focus();
            }else{
                $(ed.target).combobox({url:(source_[newValue]).url,
                    valueField:(source_[newValue]).valueField ,
                    textField:(source_[newValue]).textField,
                    panelHeight:'auto'});
                $(ed.target).focus();
            }

        }else if((source_[newValue]).type=='ref'){
            var input = getEditor();
            $(input).datebox();
        }else {

            $(ed.target).validatebox({'value':''});
            $(ed.target).focus();
        }



    }

    var source=[{key:'code',value:'编码',type:'text',defalut:'true'},
        {key:'date',value:'日期',type:'date'},
        {key:'time',value:'时间',type:'datetime'},
        {key:'number',value:'数量',type:'number'},
        {key:'state',value:'状态',type:'combobox',valueField:'id',textField:'text',data:[{id:'0',text:'自由'},{id:1,text:'审批'}]},    //url:'xxx.js' 增加url获取服务端的json数据
        {key:'corp',value:'公司',type:'ref'}
    ];
    var source_=arrayToJson('key','value',source);

    var relation =[{key:'and',value:'并且'},{key:'or',value:'或者'},{key:'not',value:'否'}];
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
    var defaultData=[{relation:'and',operator:'equal',fieldName:'code'}];



    function arrayToJson(keyField,valueField,data){
        var json={};
        $.each(data,function(i,v){
            json[v[keyField]]=v;
           // json[data]=v;
        });
        return json;
    }

    function fieldFormatter(value,row,index){
        return (source_[value])['value'];
    }

    function operatorFormatter(value,row,index){

        return (operator_[value])['value'];

    }

    function relationFormate(value,row,index){
        return (relation_[value])['value'];

    }


    function getEditor(field){
        var row=  $('#queryTable123').datagrid('getSelected');
        var index=$('#queryTable123').datagrid('getRowIndex',row);

        var ed = $('#queryTable123').datagrid('getEditor', {'index':index,'field':field});

        return ed;
    }



    function onAddRow(){
//        $('#queryTable123').datagrid('appendRow',{relation:'and',operator:'equal',fieldName:'code'});
    }


    function onClickRow(rowIndex, rowData){

        $(this).datagrid('beginEdit', rowIndex);

        var rows= $('#queryTable123').datagrid('getRows').length;
        for(i=0;i<rows;i++){
            $(this).datagrid('endEdit', i);
        }

        onChange(rowData.fieldName,'');


        $(this).datagrid('beginEdit', rowIndex);


    }
    function change(newValue,oldValue){
        var row_=  $('#queryTable123').datagrid('getSelected');
        var index_=$('#queryTable123').datagrid('getRowIndex',row_);
        row_.value=newValue;
       // $('#queryTable123').datagrid('updateRow',{index:index_,row:row_});

    }

    function onAfterEdit(rowIndex, rowData, changes){
//        /alert(changes.value);
//        var row_=  $('#queryTable123').datagrid('getSelected');
//        var index_=$('#queryTable123').datagrid('getRowIndex',row_);
//        $('#queryTable123').datagrid('updateRow',{index:rowIndex,});
    }

    $.extend($.fn.datagrid.methods, {
        addEditor : function(jq, param) {
            if (param instanceof Array) {
                $.each(param, function(index, item) {
                    var e = $(jq).datagrid('getColumnOption', item.field);
                    e.editor = item.editor;
                });
            } else {
                var e = $(jq).datagrid('getColumnOption', param.field);
                e.editor = param.editor;
            }
        },
        removeEditor : function(jq, param) {
            if (param instanceof Array) {
                $.each(param, function(index, item) {
                    var e = $(jq).datagrid('getColumnOption', item);
                    e.editor = {};
                });
            } else {
                var e = $(jq).datagrid('getColumnOption', param);
                e.editor = {};
            }
        }
    });


    $.extend($.fn.datagrid.defaults.editors, {
        numberspinner: {
            init: function(container, options){
                var input = $('<input type="text">').appendTo(container);
                return input.numberspinner(options);
            },
            destroy: function(target){
                $(target).numberspinner('destroy');
            },
            getValue: function(target){
                return $(target).numberspinner('getValue');
            },
            setValue: function(target, value){
                $(target).numberspinner('setValue',value);
            },
            resize: function(target, width){
                $(target).numberspinner('resize',width);
            }
        }
    });
</script>


%{--<div id="xx">--}%
%{--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddRow() ">--}%
%{--${message(code: 'default.button.create.label',default: '增加')}--}%
%{--</a>--}%
%{--<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="onEdit${pageId}()">--}%
    %{--${message(code: 'default.button.insert.label',default: '插入')}</a>--}%
%{--<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">--}%
%{--${message(code: 'default.button.delete.label',default: '删除')}--}%
%{--</a>--}%
%{--</div>--}%

%{--<table id="queryTable123"  class="easyui-datagrid" fit="true"  toolbar="#xx" singleSelect="true" rownumbers="true"--}%
       %{--data-options="onClickRow:onClickRow,data:defaultData,onAfterEdit:onAfterEdit">--}%
    %{--<thead>--}%
        %{--<tr>--}%
            %{--<th field="relation" formatter="relationFormate"  editor="{type:'combobox',--}%
            %{--options:{editable:false,--}%
                    %{--valueField:'key',--}%
                    %{--textField:'value',--}%
                    %{--multiple:false,--}%
                    %{--panelHeight:'auto',--}%
                    %{--data:relation--}%
                    %{--}--}%
                    %{--}" width="50">关系</th>--}%
            %{--<th field="leftBrackets"  editor="{type:'combobox',--}%
            %{--options:{editable:false,--}%
                    %{--valueField:'key',--}%
                    %{--textField:'value',--}%
                    %{--multiple:false,--}%
                    %{--panelHeight:'auto',--}%
                    %{--data:[{key:'(',value:'('},{key:'none',value:'清除'}],--}%
                    %{--onChange:function(newValue,oldValue){--}%
                        %{--if(newValue=='none'){--}%
                            %{--$(this).combobox('clear');--}%
                            %{--$(this).combobox('textbox').value('');--}%

                           %{--}--}%

                    %{--}--}%
                    %{--}--}%

                    %{--}" width="40">(</th>--}%
            %{--<th field="fieldName" formatter="fieldFormatter"--}%
            %{--editor="{--}%
            %{--type:'combobox',--}%
            %{--options:{--}%
                %{--panelHeight:'auto',--}%
                %{--valueField:'key',--}%
                %{--textField:'value',--}%
                %{--data:source   ,--}%
                %{--onChange:onChange,--}%
                  %{--multiple:false,--}%
                  %{--editable:false--}%
            %{--}--}%
        %{--}"--}%
                %{--width="120">字段</th>--}%
            %{--<th field="operator"  formatter="operatorFormatter" editor="{--}%
            %{--type:'combobox',--}%
            %{--options:{--}%
             %{--panelHeight:'auto',--}%
                %{--valueField:'key',--}%
                %{--textField:'value',--}%
                %{--data:operator,--}%
                %{--multiple:false,--}%
                %{--editable:false,--}%

            %{--}--}%
        %{--}"--}%
                %{--width="120">操作符</th>--}%
            %{--<th field="value" editor="{type:'text',options:{onChange:function(newValue,oldValue){}}}" width="120">值</th>--}%

            %{--<th field="rightBrackets" editor="{type:'combobox',--}%
            %{--options:{editable:false,--}%
                    %{--valueField:'key',--}%
                    %{--textField:'value',--}%
                    %{--multiple:false,--}%
                    %{--panelHeight:'auto',--}%
                    %{--data:[{key:')',value:')'},{key:'none',value:'清除'}],--}%
                    %{--onChange:function(newValue,oldValue){--}%
                        %{--if(newValue=='none'){--}%
                            %{--$(this).combobox('clear');--}%
                            %{--$(this).combobox('textbox').value('');--}%

                           %{--}--}%

                    %{--}--}%
                    %{--}--}%

                    %{--}" width="40">)</th>--}%
        %{--</tr>--}%
    %{--</thead>--}%
    %{--<tbody>--}%

    %{--</tbody>--}%

    %{--</table>--}%



<table >
    <tr>
        <td>
            <input class="easyui-combobox" name="relation" data-options="valueField:'key',textField:'value',data:relation">
        </td>
        <td></td>
    </tr>
</table>



<link rel="stylesheet" type="text/css" href="${resource(dir:'css',file: 'my.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'default/easyui.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'icon.css')}">

<jq:resources/>
<script type="text/javascript" src="${resource(dir:'js',file: 'jquery.easyui.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file: 'locale/easyui-lang-zh_CN.js')}" charset="utf-8"></script>
<script type="text/javascript" src="${resource(dir:'js',file: 'my.js')}" charset="utf-8"></script>


<script>

    function onChange(newValue,oldValue){

        var ed=getEditor('value');
        var row_=  $('#queryTable123').datagrid('getSelected');
        var index_=$('#queryTable123').datagrid('getRowIndex',row_);



        // $(ed.target).validatebox('destroy');
        if((source_[newValue]).type=='date'){
            if(row_.value==''){
                row_.value=dateFormate(new Date().getTime());
            }
            //alert($(ed.target));
            //$(ed.target).datebox({'value':row_.value});
            ed={type:'datebox',value:row_.value};

        }else if((source_[newValue]).type=='datetime'){

            $(ed.target).datetimebox({value:dateTimeFormate(new Date().getTime())});
            $(ed.target).focus();
        }else if((source_[newValue]).type=='number'){
            // var value=   $(ed.target).numberbox('getValue');
            if(row_.value=='')
                $(ed.target).numberbox({value:0,precision:2,groupSeparator:','});
            else
                $(ed.target).numberbox({value:row_.value,precision:2,groupSeparator:','});
//            $(ed.target).focus();
        }else if((source_[newValue]).type=='combobox'){

            if((source_[newValue]).url == undefined){
                $(ed.target).combobox({data:(source_[newValue]).data,
                    valueField:(source_[newValue]).valueField ,
                    textField:(source_[newValue]).textField,
                    panelHeight:'auto'});
                $(ed.target).focus();
            }else{
                $(ed.target).combobox({url:(source_[newValue]).url,
                    valueField:(source_[newValue]).valueField ,
                    textField:(source_[newValue]).textField,
                    panelHeight:'auto'});
                $(ed.target).focus();
            }

        }else if((source_[newValue]).type=='ref'){
            var input = getEditor();
            $(input).datebox();
        }else {

            $(ed.target).validatebox({'value':''});
            $(ed.target).focus();
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
    var defaultData=[{relation:'and',operator:'equal',fieldName:'code'}];



    function arrayToJson(keyField,valueField,data){
        var json={};
        $.each(data,function(i,v){
            json[v[keyField]]=v;
            // json[data]=v;
        });
        return json;
    }

    function fieldFormatter(value,row,index){
        return (source_[value])['value'];
    }

    function operatorFormatter(value,row,index){

        return (operator_[value])['value'];

    }

    function relationFormate(value,row,index){
        return (relation_[value])['value'];

    }


    function getEditor(field){
        var row=  $('#queryTable123').datagrid('getSelected');
        var index=$('#queryTable123').datagrid('getRowIndex',row);

        var ed = $('#queryTable123').datagrid('getEditor', {'index':index,'field':field});

        return ed;
    }



    function onAddRow(){
        $('#queryTable123').datagrid('appendRow',{relation:'and',operator:'equal',fieldName:'code'});
    }


    function onClickRow(rowIndex, rowData){



        var rows= $('#queryTable123').datagrid('getRows').length;
        for(i=0;i<rows;i++){
            $(this).datagrid('endEdit', i);
        }
        $(this).datagrid('beginEdit', rowIndex);


    }
    function change(newValue,oldValue){
        var row_=  $('#queryTable123').datagrid('getSelected');
        var index_=$('#queryTable123').datagrid('getRowIndex',row_);
        row_.value=newValue;
        // $('#queryTable123').datagrid('updateRow',{index:index_,row:row_});

    }

    function onAfterEdit(rowIndex, rowData, changes){
//        /alert(changes.value);
//        var row_=  $('#queryTable123').datagrid('getSelected');
//        var index_=$('#queryTable123').datagrid('getRowIndex',row_);
//        $('#queryTable123').datagrid('updateRow',{index:rowIndex,});
    }

    $.extend($.fn.datagrid.methods, {
        addEditor : function(jq, param) {
            if (param instanceof Array) {
                $.each(param, function(index, item) {
                    var e = $(jq).datagrid('getColumnOption', item.field);
                    e.editor = item.editor;
                });
            } else {
                var e = $(jq).datagrid('getColumnOption', param.field);
                e.editor = param.editor;
            }
        },
        removeEditor : function(jq, param) {
            if (param instanceof Array) {
                $.each(param, function(index, item) {
                    var e = $(jq).datagrid('getColumnOption', item);
                    e.editor = {};
                });
            } else {
                var e = $(jq).datagrid('getColumnOption', param);
                e.editor = {};
            }
        }
    });


    $.extend($.fn.datagrid.defaults.editors, {
        numberspinner: {
            init: function(container, options){
                var input = $('<input type="text">').appendTo(container);
                return input.numberspinner(options);
            },
            destroy: function(target){
                $(target).numberspinner('destroy');
            },
            getValue: function(target){
                return $(target).numberspinner('getValue');
            },
            setValue: function(target, value){
                $(target).numberspinner('setValue',value);
            },
            resize: function(target, width){
                $(target).numberspinner('resize',width);
            }
        }
    });
</script>


%{--<div id="xx">--}%
%{--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddRow() ">--}%
%{--${message(code: 'default.button.create.label',default: '增加')}--}%
%{--</a>--}%
%{--<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="onEdit${pageId}()">--}%
%{--${message(code: 'default.button.insert.label',default: '插入')}</a>--}%
%{--<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDelete${pageId}() ">--}%
%{--${message(code: 'default.button.delete.label',default: '删除')}--}%
%{--</a>--}%
%{--</div>--}%
%{--<table id="queryTable123"  class="easyui-datagrid" fit="true"  toolbar="#xx" singleSelect="true" rownumbers="true"--}%
%{--data-options="onClickRow:onClickRow,data:defaultData,onAfterEdit:onAfterEdit">--}%
%{--<thead>--}%
%{--<tr>--}%
%{--<th field="relation" formatter="relationFormate"  editor="{type:'combobox',--}%
%{--options:{editable:false,--}%
%{--valueField:'key',--}%
%{--textField:'value',--}%
%{--multiple:false,--}%
%{--panelHeight:'auto',--}%
%{--data:relation--}%
%{--}--}%
%{--}" width="50">关系</th>--}%
%{--<th field="leftBrackets"  editor="{type:'combobox',--}%
%{--options:{editable:false,--}%
%{--valueField:'key',--}%
%{--textField:'value',--}%
%{--multiple:false,--}%
%{--panelHeight:'auto',--}%
%{--data:[{key:'(',value:'('},{key:'none',value:'清除'}],--}%
%{--onChange:function(newValue,oldValue){--}%
%{--if(newValue=='none'){--}%
%{--$(this).combobox('clear');--}%
%{--$(this).combobox('textbox').value('');--}%

%{--}--}%

%{--}--}%
%{--}--}%

%{--}" width="40">(</th>--}%
%{--<th field="fieldName" formatter="fieldFormatter"--}%
%{--editor="{--}%
%{--type:'combobox',--}%
%{--options:{--}%
%{--panelHeight:'auto',--}%
%{--valueField:'key',--}%
%{--textField:'value',--}%
%{--data:source   ,--}%
%{--onChange:onChange,--}%
%{--multiple:false,--}%
%{--editable:false--}%
%{--}--}%
%{--}"--}%
%{--width="120">字段</th>--}%
%{--<th field="operator"  formatter="operatorFormatter" editor="{--}%
%{--type:'combobox',--}%
%{--options:{--}%
%{--panelHeight:'auto',--}%
%{--valueField:'key',--}%
%{--textField:'value',--}%
%{--data:operator,--}%
%{--multiple:false,--}%
%{--editable:false,--}%

%{--}--}%
%{--}"--}%
%{--width="120">操作符</th>--}%
%{--<th field="value" editor="{type:'combobox',options:{onChange:function(newValue,oldValue){}}}" width="120">值</th>--}%

%{--<th field="rightBrackets" editor="{type:'combobox',--}%
%{--options:{editable:false,--}%
%{--valueField:'key',--}%
%{--textField:'value',--}%
%{--multiple:false,--}%
%{--panelHeight:'auto',--}%
%{--data:[{key:')',value:')'},{key:'none',value:'清除'}],--}%
%{--onChange:function(newValue,oldValue){--}%
%{--if(newValue=='none'){--}%
%{--$(this).combobox('clear');--}%
%{--$(this).combobox('textbox').value('');--}%

%{--}--}%

%{--}--}%
%{--}--}%

%{--}" width="40">)</th>--}%
%{--</tr>--}%
%{--</thead>--}%
%{--</table>--}%

%{--<div>--}%
%{--<form id="queryForm" class="datagrid-header datagrid-header-inner datagrid-header-row ">--}%
%{--<table >--}%
%{--<thead>--}%
%{--<tr>--}%
%{--<th  width="50">关系</th>--}%
%{--<th  width= "40">(</th>--}%
%{--<th width="120">字段</th>--}%
%{--<th width="120">操作符</th>--}%
%{--<th width="120">值</th>--}%
%{--<th width="40">)</th>--}%

%{--</tr>--}%
%{--</thead>--}%
%{--<tbody>--}%
%{--<tr>--}%
%{--<td>--}%
%{--<select class="easyui-combobox" name="relation"  panelHeight='auto' style="width: 50px">--}%
%{--<option value="and">并且</option>--}%
%{--<option value="or">或者</option>--}%
%{--<option value="not">否</option>--}%
%{--</select>--}%
%{--</td>--}%
%{--<td>--}%
%{--<select name="leftBrackets" style="width: 40px" class="easyui-combobox">--}%
%{--<option value="(">(</option>--}%
%{--<option value="none">清除</option>--}%
%{--</select>--}%
%{--</td>--}%
%{--<td>--}%
%{--<input style="width: 120px" class="easyui-combobox" panelHeight='auto' name="fieldName" data-options="valueField:'key',textField:'value',data:source" >--}%
%{--</td>--}%
%{--<td>--}%
%{--<input style="width: 120px" class="easyui-combobox" panelHeight='auto' name="operator" data-options="valueField:'key',textField:'value',data:operator" >--}%
%{--</td>--}%
%{--<td><input style="width: 120px" name="value" class="easyui-validatebox" /></td>--}%
%{--<td> <select name="rightBrackets" style="width: 40px" class="easyui-combobox ">--}%
%{--<option value=")">)</option>--}%
%{--<option value="none">清除</option>--}%
%{--</select></td>--}%
%{--</tr>--}%
%{--</tbody>--}%


%{--</table>--}%
%{--</form>--}%
%{--</div>--}%


<table >
    <tr>
        <td>
            <input class="easyui-combobox" name="relation" data-options="valueField:'key',textField:'value',data:relation, width:50,editable:false,value:'and'" panelHeight='auto'>

        </td>
        <td style="border-top: 1px solid black;border-left: 1px solid black;border-bottom: 1px solid black;width: 10px">
        </td>
        <td>
            <table >
                <tr>
                    <td style="height: 23px">
                        <div>
                            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"  ></a>
                            <input style="width: 120px" name="fieldName" class="easyui-combobox" panelHeight='auto' name="fieldName" data-options="valueField:'key',textField:'value',data:source,editable:false,onChange:onChange" panelHeight='auto'>
                            <input style="width: 120px" name="operator" class="easyui-combobox" panelHeight='auto' name="operator" data-options="valueField:'key',textField:'value',data:operator,editable:false" panelHeight='auto'>
                            <input   name="value" style="width: 140px;height: 23px"  class="easyui-validatebox" >
                        </div>


                        <div id="add">
                            <a  href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddQuery(this) "></a>
                            <a  href="#" class="easyui-linkbutton" iconCls="icon-sum" plain="true"  onclick="addBigQuery() "></a>
                        </div>
                    </td>

                </tr>
            </table>
        </td>
    </tr>
</table>

<script>
    function onDeleteQuery(){

    }

    function addBigQuery(){
        var query_tr=$('<tr />');
        var query_td1=$('<td/>')
        var query_td2=$('<td colspan="3"/>')

        var query_delete=$('<a/>');
        query_td1.append(query_delete);

        query_tr.append(query_td1);
        query_tr.append(query_td2);




        var table=$('<table/>');
        query_td2.append(table);
        var tr=$('<tr/>');
        table.append(tr);

        var td=$('<td/>');
        var relation_=$('<input/>');
        td.append(relation_);
        tr.append(td);
        var td1=$('<td style="border-top: 1px solid black;border-left: 1px solid black;border-bottom: 1px solid black;width: 10px"/>');
        tr.append(td1);

        var td2=$('<td/>');
        var td2_talbe=$('<table/>');
        td2.append(td2_talbe);
        tr.append(td2);


        var tr_bt=$('<tr/>');
        td2_talbe.append(tr_bt);
        var bt_td1=$('<td/>');
        var bt_a1=$('<a/>');
        var bt_td2=$('<td/>');
        var bt_a2=$('<a/>');
        var bt_a2=$('<a/>');
        var bt_td3=$('<td/>');
        var bt_td4=$('<td/>');
//

        tr_bt.append(bt_td1);
        bt_td1.append(bt_a1);
        tr_bt.append(bt_td2);
        bt_td2.append(bt_a2);
        tr_bt.append(bt_td3);
        tr_bt.append(bt_td4);

        $('#add1').before(query_tr);
        relation_.combobox({valueField:'key',textField:'value',data:relation, width:50,editable:false,value:'and',panelHeight:'auto'});
        query_delete.linkbutton({
            iconCls:"icon-remove",
            plain:"true"
        });
        bt_a1.linkbutton({
            iconCls:"icon-add",
            plain:"true"
        });
        bt_a2.linkbutton({
            iconCls:"icon-sum",
            plain:"true"
        });


        createQueryRow(tr_bt);

        //colspan="2"
    }

    function createBigQuery(container){
        var table=$('<table/>');
        container.append(table);
        var tr=$('<tr/>');
        table.append(tr);

        var td=$('<td/>');
        var relation_=$('<input/>');
        td.append(relation);
        tr.append(td);
        var td1=$('<td style="border-top: 1px solid black;border-left: 1px solid black;border-bottom: 1px solid black;width: 10px"/>');
        tr.append(td1);

        var td2=$('<td/>');
        var td2_talbe=$('<table/>');
        td2.append(td2_talbe);
        tr.append(td2);


        var tr_bt=$('<tr/>');
        td2_talbe.append(tr_bt);
        var bt_td1=$('<td/>');
        var bt_a1=$('<a/>');
        var bt_td2=$('<td/>');
        var bt_a2=$('<a/>');
        var bt_a2=$('<a/>');
        var bt_td3=$('<td/>');
        var bt_td4=$('<td/>');

        tr_bt.append(bt_td1);
        bt_td1.append(bt_a1);
        tr_bt.append(bt_td2);
        bt_td2.append(bt_a2);
        tr_bt.append(bt_td3);
        tr_bt.append(bt_td4);


        relation_.combobox({valueField:'key',textField:'value',data:relation, width:50,editable:false,value:'and',panelHeight:'auto'});
        bt_a1.linkbutton({
            iconCls:"icon-add",
            plain:"true"
        });
        bt_a2.linkbutton({
            iconCls:"icon-sum",
            plain:"true"
        });


        //<input class="easyui-combobox" name="relation" data-options="valueField:'key',textField:'value',data:relation, width:50,editable:false,value:'and'" panelHeight='auto'>
    }

    function createQueryRow(bf){
        var tr=$('<tr/>');



        var a=$('<a  />');
        var td=$('<td/>');
        td.append(a);
        tr.append(td);

        var input1=$('<input style="width: 120px;margin-left: 20px" name="fieldName" />');
        var td1=$('<td/>');
        td1.append(input1);
        tr.append(td1);


        var input2=$('<input style="width: 120px" name="operator"/>');
        var td2=$('<td/>');
        td2.append(input2);
        tr.append(td2);


        var input3=$('<input  name="value" style="width: 140px;height: 23px"/>');
        var td3=$('<td/>');
        td3.append(input3);
        tr.append(td3);


        // td.append($('<input/>').combobox({valueField:'key',textField:'value',data:operator,editable:false,panelHeight:'auto'}));
        // td.append($('<input/>').validatebox());

        bf.before(tr);
        input1.combobox({valueField:'key',textField:'value',data:source,editable:false,panelHeight:'auto',onChange:onChange});
        input2.combobox({valueField:'key',textField:'value',data:operator,editable:false,panelHeight:'auto'});
        a.linkbutton({
            iconCls:"icon-remove",
            plain:"true"
        });

    }

    function onAddQuery(e){
//        var tr=$('<tr/>');
//
//        //td.append('<input style="width: 120px" name="fieldName" class="easyui-combobox" panelHeight=\'auto\' name="fieldName" data-options="valueField:\'key\',textField:\'value\',data:source,editable:false" panelHeight=\'auto\'>');
//
//        var a=$('<a  />');
//        var td=$('<td/>');
//        td.append(a);
//        tr.append(td);
//
//        var input1=$('<input style="width: 120px;margin-left: 20px" name="fieldName" />');
//        var td1=$('<td/>');
//        td1.append(input1);
//        tr.append(td1);
//
//
//        var input2=$('<input style="width: 120px" name="operator"/>');
//        var td2=$('<td/>');
//        td2.append(input2);
//        tr.append(td2);
//
//
//        var input3=$('<input  name="value" style="width: 140px;height: 23px"/>');
//        var td3=$('<td/>');
//        td3.append(input3);
//        tr.append(td3);


        // td.append($('<input/>').combobox({valueField:'key',textField:'value',data:operator,editable:false,panelHeight:'auto'}));
        // td.append($('<input/>').validatebox());

        createQueryRow( $('#add'));
//        input1.combobox({valueField:'key',textField:'value',data:source,editable:false,panelHeight:'auto',onChange:onChange});
//        input2.combobox({valueField:'key',textField:'value',data:operator,editable:false,panelHeight:'auto'});
//        a.linkbutton({
//           iconCls:"icon-remove",
//            plain:"true"
//    });
    }
</script>