var opt_equals='equals';
var opt_contains='contains';
var opt_notEqual='notEqual';
var opt_greaterThan='greaterThan';
var opt_lessThan='lessThan';
var opt_greaterOrEqual='greaterOrEqual';
var opt_lessOrEqual='lessOrEqual';
var opt_startsWith='startsWith';
var opt_endsWith='endsWith';
var opt_iContains='iContains';
var opt_notContains='notContains';
var opt_isNull='isNull';
var opt_notStartsWith='notStartsWith';
var opt_notEndsWith='notEndsWith';




var opt_type_date='date';
var opt_type_int='int';
var opt_type_number='number';
var opt_type_boolean='boolean';


function getFilterOperator(type){
    if(type==undefined){
        return [{key:'equals',value:'等于'},
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
            {key:'notStartsWith',value:'不以...开始'},
            {key:'notEndsWith',value:'不以...结束'}
        ];
    }
}



/**
 * 用于销毁formidtem
 * @param target
 * @param valueType
 * @param valueId
 * @private
 */
function _destroy(target,valueType,valueId){

    if(valueType=='text'){
        $(target).remove();
    }else if(valueType=='date'){
        $('#'+valueId).datebox('destroy');
    }else if(valueType=='datetime'){
        $('#'+valueId).datetimebox('destroy');

    }else if(valueType=='combobox'){
        $('#'+valueId).combobox('destroy');
    }else if(valueType=='number'){
        $('#'+valueId).numberbox('destroy');
    }else if(valueType=='combogrid'){
        $('#'+valueId).combogrid('destroy');
    }else if(valueType=='combotree'){
        $('#'+valueId).combotree('destroy');
    }else if(valueType=='ref'){
        $('#span'+valueId).remove();
    }

}

/**
 * 改变formItem的编辑方式
 * @param newField
 * @param oldField
 * @param parent
 * @param fieldSource
 */
function changeFormItemEditer(newField,oldField,parent,fieldSource,dfvalue){
    var newType=(fieldSource[newField]).editerType;
    if(oldField!=''){
        var oldType=(fieldSource[oldField]).editerType;

        if(oldType==newType){
            return;
        }
    }

    var target= $(parent).find('[name=value]')[0];
    var valueType=$(parent).find('[name=valueType]')[0];
    var valueId=$(parent).find('[name=valueId]')[0];
    var _value=dfvalue;
    if(dfvalue==undefined){
        _value='';
    }
    _destroy(target,$(valueType).val(),$(valueId).val());
    if(newType=='date'){

        var id= 'id'+guidGenerator();
        var input=$('<input name="value"  id="'+id+'"/>');
        $(parent).append(input);
        if(_value!=''){
            $(input).datebox({value:dateFormate(_value)});
        }else{
            $(input).datebox({});
        }

        $(valueType).val('date');
        $(valueId).val(id);



    }  else if(newType=='datetime'){

        var id= 'id'+guidGenerator();
        var input=$('<input name="value"  id="'+id+'"/>');
        $(parent).append(input);
        if(_value!=''){
            $(input).datetimebox({value:dateTimeFormate(_value)});
        }else{
            $(input).datetimebox({});
        }

        $(valueType).val('datetime');
        $(valueId).val(id);
    }else if(newType=='number'){
        var id= 'id'+guidGenerator();
        var input=$('<input name="value" style="width: 128px;" id="'+id+'"/>');
        $(parent).append(input);
        var options= (fieldSource[newField]).options;
        options.value=_value;
        $(input).numberbox(options);
        $(valueType).val('number');
        $(valueId).val(id);

    }else if(newType=='combobox'){

        var id= 'id'+guidGenerator();
        var input=$('<input name="value"  id="'+id+'"/>');
        $(parent).append(input);
        $(valueType).val('combobox');
        $(valueId).val(id);

        var options= (fieldSource[newField]).options;
        options.value=_value;
        $(input).combobox(options);


    }else if(newType=='combogrid'){

        var id= 'id'+guidGenerator();
        var input=$('<input name="value" style="width: 140px;" id="'+id+'"/>');
        $(parent).append(input);
        var options= (fieldSource[newField]).options;
        options.value=_value;

        $(input).combogrid(options);
        $(valueType).val('combogrid');
        $(valueId).val(id);
    }else if(newType=='ref'){
        var _id=guidGenerator();
        var id= 'id'+_id;
//        var input=$('<input type="hidden" name="value" style="width: 140px; height: 23px" id="'+id+'">' +
//            '<input style="vertical-align:middle;width: 108px; height: 17px;" disabled="" id="'+id+'">' +
//            '<input type="button" onclick=openRefDlg("'+_id+'","'+(fieldSource[newField]).refCode+'","'+(fieldSource[newField]).value+'") style="vertical-align:middle;width: 20px;height: 23px" value="..."> ');
       var input=$('<span style="margin-left: 0px;padding-left: 0px;display: inline-block" id="span'+id+'"></span>');
        if((fieldSource[newField]).billtypecode!= undefined){
            input.load(create_component_url+'?refCode='+(fieldSource[newField]).refCode+'&id='+id+'&billtypecode='+(fieldSource[newField]).billtypecode);
        }else{
            input.load(create_component_url+'?refCode='+(fieldSource[newField]).refCode+'&id='+id);
        }

        $(parent).append(input);
       // createRef(parent,(fieldSource[newField]).refCode,_id);
        var options= (fieldSource[newField]).options;

        $(valueType).val('ref');
        $(valueId).val(id);
    }else if(newType=='ref-tree'){

        var id= 'id'+guidGenerator();
        var input=$('<input name="value" style="width: 140px; height: 23px" id="'+id+'"/>');
        $(parent).append(input);
        var options= (fieldSource[newField]).options;
        createComponent(parent,{name:'value',value:_value,resouceCode:fieldSource[newField].resouceCode});
        $(valueType).val('combotree');
        $(valueId).val(id);
    }else if(newType=='boolean'){
        var id= 'id'+guidGenerator();
        var input=$('<input name="value"  id="'+id+'"/>');
        $(parent).append(input);
        $(valueType).val('combobox');
        $(valueId).val(id);

        $(input).combobox({
            value:_value,
            valueField:'key',
            textField:'value',
            data:[{key:'true',value:_TRUE_LABEL},{key:'false',value:_FALSE_LABEL}],
            panelHeight:'auto',
            editable:false

        });
    }else {
        var id= 'id'+guidGenerator();

        var input=$('<input name="value"  maxlength="100"  value="'+_value+'"/>');
        $(parent).append(input);

        $(valueType).val('text');
        $(valueId).val('');
    }

    // $('#queryTable123').datagrid('endEdit',row_);

}



/**
 * 创建查询条件
 * @param bf
 * @param defaultData
 * @param firstRow
 */
function createQueryRow(pageId,bf,defaultData,firstRow,fieldSource,fieldSource_,operator,onQueryFieldChanged){
    var div_id='div_'+guidGenerator();
    var div=$('<div style="text-overflow:ellipsis; white-space: nowrap;" id="'+div_id+'"/>');



    var a=$('<a  onclick="onRemoveQuery(\''+div_id+'\')"/>');

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

    if(defaultData != undefined  && defaultData.defaultValue!=undefined)
        var input3=$('<input maxlength="100" name="value" style="width: 128px;height: 16px;font-size: 12px;" value="'+defaultData.defaultValue+'"/>');
    else
        var input3=$('<input  name="value" style="width: 128px;height: 16px;font-size: 12px;" />');
    var input4=$('<input  name="valueType" type="hidden"  value="text"/>');
    var input5=$('<input  name="valueId" type="hidden"  value=""/>');
    span3.append(input3);
    span3.append(input4);
    span3.append(input5);
    div.append(span3);


    bf.before(div);
    if(defaultData==undefined){

        input1.combobox({valueField:'key',textField:'value',data:fieldSource,editable:false,panelHeight:'400',value:fieldSource[0].key,onChange:onQueryFieldChanged});
        input2.combobox({valueField:'key',textField:'value',data:operator,editable:false,panelHeight:'auto',value:operator[0].key});
        // input3.validatebox({});
        changeFormItemEditer(fieldSource[0].key,'',span3,fieldSource_);
    }else{
        input1.combobox({valueField:'key',textField:'value',data:fieldSource,editable:false,panelHeight:'400',value:defaultData.fieldName,onChange:onQueryFieldChanged});
        input2.combobox({valueField:'key',textField:'value',data:operator,editable:false,panelHeight:'auto',value:defaultData.operator});
        // input3.validatebox({value:defaultData.defaultValue});
        changeFormItemEditer(defaultData.fieldName,'',span3,fieldSource_,defaultData.defaultValue);
    }

    if(firstRow!= undefined && firstRow){

        a.linkbutton({
            iconCls:"icon-remove",
            plain:"true"
        });
        a.linkbutton('disable');
    }else{
        a.linkbutton({
            iconCls:"icon-remove",
            plain:"true"
        });
    }


}


/**
 * 增加组合大条件
 * @param pageId
 * @param row
 * @param fisrtRow
 * @param defaultData
 * @param relation
 * @param fieldSource
 * @param fieldSource_
 * @param operator
 * @param onQueryFieldChanged
 * @return {*|jQuery|HTMLElement}
 */
function addBigQuery(pageId,row,fisrtRow,defaultData,relation,fieldSource,fieldSource_,operator,onQueryFieldChanged){

    var div_id='div_'+guidGenerator();
    var div=$('<div id="'+div_id+'"/>');
    var r_table=$('<table/>');
    div.append(r_table);
    var r_table_row=$('<tr/>');
    r_table.append(r_table_row);
    var r_table_row_col1=$('<td/>');
    r_table_row.append(r_table_row_col1);
    if(fisrtRow==undefined || fisrtRow==false){

        var query_delete=$('<a onclick="onRemoveQuery(\''+div_id+'\')"></a>');
        r_table_row_col1.append(query_delete);
    }


    var r_table_row_col2=$('<td />');
    r_table_row.append(r_table_row_col2);
    var relation_=$('<input name="relation"/>');
    r_table_row_col2.append(relation_);

    var r_table_row_col3=$('<td style="border-top: 1px solid black;border-left: 1px solid black;border-bottom: 1px solid black;width: 10px"/>');
    r_table_row.append(r_table_row_col3);


    var r_table_row_col4=$('<td/>');
    r_table_row.append(r_table_row_col4);
    var row_div_id='rid_'+guidGenerator();
    var row_div=$('<div id="'+row_div_id+'"/>');


    r_table_row_col4.append(row_div);


    var bt_add=$('<a  onclick="onAddQuery'+pageId+'(\''+row_div_id+'\')"/>');

    row_div.append(bt_add);


    var bt_addMore=$('<a onclick="onAddBigQuery'+pageId+'(\''+row_div_id+'\')"/>');

    row_div.append(bt_addMore);


    $(row).before(div);




    if(fisrtRow==undefined || fisrtRow==false){
        query_delete.linkbutton({
            iconCls:"icon-remove",
            plain:"true"
        });
    }

    bt_add.linkbutton({
        iconCls:"icon-add",
        plain:"true"
    });
    bt_addMore.linkbutton({
        iconCls:"icon-sum",
        plain:"true"
    });

    if(defaultData!= undefined && fisrtRow!= undefined && fisrtRow){
        relation_.combobox({valueField:'key',textField:'value',data:relation, width:50,editable:false,value:defaultData.relation,panelHeight:'auto'});
        $.each(defaultData.criterias,function(i,v){
            if(i==0)
                createQueryRow(pageId, row_div,v,true,fieldSource,fieldSource_,operator,onQueryFieldChanged);
            else
                createQueryRow( pageId,row_div,v,false,fieldSource,fieldSource_,operator,onQueryFieldChanged);
        });
    }else{
        createQueryRow(pageId,row_div,null,true,fieldSource,fieldSource_,operator,onQueryFieldChanged);
        relation_.combobox({valueField:'key',textField:'value',data:relation, width:50,editable:false,value:'and',panelHeight:'auto'});
    }

    return div;
    //colspan="2"
}



/**
 *删除条件
 * @param id
 */
function onRemoveQuery(id){
    $('#'+id).remove();
}


/**
 * 组织criteria
 * @param fn
 * @param json
 */
function createCriteria(fn,json,fieldSourceMap){

    var divs= $(fn).children('div');
    var tables= $(fn).children('table');

    if(divs.length>0){


        $.each(divs,function(i,v){
            createCriteria(v, json,fieldSourceMap);
        });
    }else if(tables.length>0){
        var trs=$(tables[0]).find('tr:first');

        var tds= $(trs[0]).children('td');

        var relation= $(tds[1]).find('[name=relation]:first')[0];

        if(json.operator==undefined){

            json.operator=$(relation).val();
            // json.operator='xxx';
            json.criterias=[]
            createCriteria(tds[3],json,fieldSourceMap);
        }else{
            var newJson={};
            newJson.operator=$(relation).val();
            // json.operator='xxx';
            newJson.criterias=[];
            json.criterias.push(newJson);
            createCriteria(tds[3],newJson,fieldSourceMap);
        }


    }else{
        var ops=$(fn).find('[name=operator]');
        if(ops.length==0) return;
        var operator=  ops[0];
        var fieldName=   $(fn).find('[name=fieldName]')[0];
        var value=  $(fn).find('[name="value"]')[0];
         var fname=   $(fieldName).val();

        var valueType=  fieldSourceMap[fname].type;
         if(valueType==undefined)
             valueType='';
        if( $(value).val()==null || $(value).val().trim()==''){

        }else{
            if(valueType=='date') {
                var c_={'operator':$(operator).val(),'fieldName':fname,type:'date','value':toUTCDate($(value).val())};
                json.criterias.push(c_);
            }else  if(valueType=='datetime') {
                var c_={'operator':$(operator).val(),'fieldName':fname,type:'date','value':toUTCDateTime($(value).val())};
                json.criterias.push(c_);
            } else{
                //alert($(value).val());
                var c_={'operator':$(operator).val(),'fieldName':fname,type:valueType,'value':$(value).val()};
                json.criterias.push(c_);
            }

        }


    }

}

function createRef(parent,refCode,id){
    $.post(create_component_url,{refCode:refCode},function(html){
        $(parent).append(html);
    },'html');

}


function openRefDlg(id,refCode,title){
    $('<div/>').dialog({
        title:title,
        iconCls:'icon-edit',
        resizable:false,
        modal:true,
        width:300,
        height:150,

        href:create_component_url+'?refCode='+refCode+'&title='+title,
        buttons:[{
            text : '确定',
            iconCls : 'icon-ok',
            handler : function() {
                var d = $(this).closest('.window-body');
                onRefOK(id,d);
            }
        }],
        onClose : function() {
            $(this).dialog('destroy');
        }
    });
}


