$.fn.datebox.defaults.validType='dateValidate';
$.fn.datetimebox.defaults.validType='datetimeValidate';
$.fn.datagrid.defaults.showFooter =true;



//$.fn.panel.defaults.onClose =function(){
//    $(this).dialog('destroy');
//}
$.fn.datagrid.defaults.onLoadSuccess=function(node,data){
    $(this).datagrid('statistics');
}

function defaultFormatter(value,row,index){

    return getObjectAttr(row,this.field);
}

$.fn.disabled=function (){

    $('input',this).attr('disabled',true);
    $('select',this).attr('disabled',true);
    $('textarea',this).attr('disabled',true);
}

function showCard(url,pageId){

    closeCard(pageId);
    $('#list'+pageId).panel('close');
//
    var div=$('<div id="card'+pageId+'" />');
    div.appendTo($('#main'+pageId));
    div.panel({fit:true,href:url,border:false,noheader:true,loadingMessage:'loading......<a href="#"  onclick="$(\'#card'+pageId+'\').panel(\'refresh\');">[刷新]</a><a href="#" onclick="closeCard(\''+pageId+'\')">[返回]</a>'});
   // var row=$('#table'+pageId).datagrid('getSelected');
    //var index= $('#table'+pageId).datagrid('getRowIndex',row);
    //$('#table'+pageId).datagrid('collapseRow',0);

    var rows=$('#table'+pageId).datagrid('getRows');

    $.each(rows,function(i,v){
        $('#table'+pageId).datagrid('collapseRow',i);
    });


}

function closeCard(pageId){
    $('#card'+pageId).panel('destroy');
    $('#list'+pageId).panel('open');

    $('#table'+pageId).datagrid('fixDetailRowHeight',0);

//    var rows= $('#table'+pageId).datagrid('getRows');
//    $.each(rows,function(i,v){
//        $('#table'+pageId).datagrid('fixDetailRowHeight',i);
//    });
}

/**
 * @author 孙宇
 *
 * @requires jQuery,EasyUI
 *
 * panel关闭时回收内存，主要用于layout使用iframe嵌入网页时的内存泄漏问题
 */
//$.fn.panel.defaults.onBeforeDestroy = function() {
//    alert('iframe close....');
//    var frame = $('iframe', this);
//    try {
//        if (frame.length > 0) {
//            for ( var i = 0; i < frame.length; i++) {
//                frame[i].contentWindow.document.write('');
//                frame[i].contentWindow.close();
//            }
//            frame.remove();
//            if ($.browser.msie) {
//                CollectGarbage();
//            }
//        }
//    } catch (e) {
//    }
//};

//$.fn.dialog.defaults.onBeforeDestroy = function() {
//    alert('iframe close....');
//    var frame = $('iframe', this);
//    try {
//        if (frame.length > 0) {
//            for ( var i = 0; i < frame.length; i++) {
//                frame[i].contentWindow.document.write('');
//                frame[i].contentWindow.close();
//            }
//            frame.remove();
//            if ($.browser.msie) {
//                CollectGarbage();
//            }
//        }
//    } catch (e) {
//    }
//};


/**
 * 设置验证信息
 * @param json
 * true:有错误信息
 * false:没有错误信息
 */

function showRemoteMessage(json){
     if(json.remoteErrors!=null && json.remoteErrors!=undefined){//有错误信息
        //$('div #remoteErrors',this).html(json.remoteErrors);
        $.messager.alert('错误',json.remoteErrors);
        return true;
    }else if(json.remoteMessage!=null && json.remoteMessage!=undefined){

        $.messager.show({
            title:'消息',
            msg:json.remoteMessage
        });
        return false;
    }else{
        return false;
    }
}

$.fn.showMessage = function(json){

    if(json.validateerrors!=null && json.validateerrors!=undefined){//有验证错误信息

        var pp=this;
        pp.hideMessage();

        var msg=""
        $.each(json.validateerrors,function(i,v){

               var p= $("[name='"+ v.field+"']",pp).closest('.fieldcontain');

               p.addClass("myvalidatebox-invalid");
               p.attr('title', v.message);
               p.tooltip({content:v.message});

            msg+=   '<p>'+v.message+'</p>';
            msg+='<br>';


        });
       $.messager.show({title:'校验错误',msg:msg});
        return true;
    }else if(json.body_validateerrors!=null && json.body_validateerrors!=undefined){//有验证错误信息


       var msg="";
//
        $.each(json.validateerrors,function(i,v){
            if(i!='body_validateerrors'){

                msg+=   '<p>'+v.message+'</p>';
                msg+='<br>';
            }

        });
        $.messager.show({title:'子表数据',msg:msg});
        return true;
    }else if(json.remoteErrors!=null && json.remoteErrors!=undefined){//有错误信息
        //$('div #remoteErrors',this).html(json.remoteErrors);
        $.messager.alert('错误',json.remoteErrors);
        return true;
    }else if(json.remoteMessage!=null && json.remoteMessage!=undefined){

        $.messager.show({
            title:'消息',
            msg:json.remoteMessage
        });
        return false;
    }else{
        return false;
    }

}

$.fn.hideMessage = function(){

    var parent=this;

    var items=$(parent).hasClass('myvalidatebox-invalid');

    for(var i=0;i< items.length;i++){

        $(items[i]).removeAttr('title');
       $(items[i]).removeClass("myvalidatebox-invalid");

        $(items[i]).tooltip('destroy');


    }




}

/**
 * 将Form 转化成 json 对象
 * @return {{}}
 */
$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();

    //alert(a.length);
    for(var i=0;i< a.length;i++){



        if(a[i].name.indexOf('.')!=-1){
            if(a[i].value==''){
                o[a[i].name.split('.')[0]]='';
                continue;
            }
        }

        if(a[i].name.indexOf('_')==0){

                continue;

        }

        if($.type( a[i].value)=='object'){

            continue;

        }



        if (o[a[i].name]) {
            if (!o[a[i].name].push) {
                o[a[i].name] = [ o[a[i].name] ];
            }
            o[a[i].name].push(a[i].value || '');
        } else {

            o[a[i].name] = a[i].value || '';
        }
    }




//格式化时间
    var is= $('input[date][comboname]',this);
    $.each(is, function(index,item) {

       var name= $(item).attr('comboname');

        if( o[name]){

            var  utctime=toUTCDate(o[name]);

            o[name]=utctime.toString();
        }



    });


    // 格式化 时间 转换成  utc

    var ds= $('input[datetime][comboname]',this);


    $.each(ds, function(index,item) {

        var name= $(item).attr('comboname');


        if( o[name]){


            o[name]=toUTCDateTime(o[name]);

        }



    });

    var cs= $("input[canSave='false']",this);
    $.each(cs, function(index,item) {
        var name= $(item).attr('name');
        delete  o[name];

    });


    return o;
}

function toUTCDate(value){
    var  utctime=Date.parse(value);

    return utctime.toString();
}

function toUTCDateTime(value){
    var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})/;
    var r= value.match(reg)
    var d = new Date(r[1], r[3]-1,r[4],r[5],r[6],r[7]);
    var  utctime= d.getTime();


   return utctime.toString();
}

/**
 * @author 孙宇
 *
 * @requires jQuery,EasyUI
 *
 * 防止panel/window/dialog组件超出浏览器边界
 * @param left
 * @param top
 */
var easyuiPanelOnMove = function(left, top) {
    var l = left;
    var t = top;
    if (l < 1) {
        l = 1;
    }
    if (t < 1) {
        t = 1;
    }
    var width = parseInt($(this).parent().css('width')) + 14;
    var height = parseInt($(this).parent().css('height')) + 14;
    var right = l + width;
    var buttom = t + height;
    var browserWidth = $(window).width();
    var browserHeight = $(window).height();
    if (right > browserWidth) {
        l = browserWidth - width;
    }
    if (buttom > browserHeight) {
        t = browserHeight - height;
    }
    $(this).parent().css({/* 修正面板位置 */
        left : l,
        top : t
    });
};
$.fn.dialog.defaults.onMove = easyuiPanelOnMove;
$.fn.window.defaults.onMove = easyuiPanelOnMove;
$.fn.panel.defaults.onMove = easyuiPanelOnMove;


/**

 *
 * 改变jQuery的AJAX默认属性和方法
 */
$.ajaxSetup({

    type : 'POST',
    error : function(XMLHttpRequest, textStatus, errorThrown) {
        $.messager.progress('close');
    //        alert(errorThrown);
    //        alert(textStatus);
    //        alert(JSON.stringify(XMLHttpRequest));
        if(XMLHttpRequest.status==401){
            openLock();
        }else
            $.messager.alert('错误', XMLHttpRequest.responseText);
        $('#loadMsg').html('');
        return 'error'
    },
    beforeSend:function (XMLHttpRequest) {
//        $.messager.progress('close');
//        $.messager.progress({text:'数据加载中,请稍等......'});
        $('#loadMsg').html('正在加载数据，请稍等......');
       // alert(XMLHttpRequest.status);
    },success:function (data, textStatus) {
        // data 可能是 xmlDoc, jsonObj, html, text, 等等...
        //this; // 调用本次AJAX请求时传递的options参数
//        $.messager.progress('close');
        $('#loadMsg').html('');
       // alert(XMLHttpRequest.status);
    },complete:function (XMLHttpRequest, textStatus) {
       // this; // 调用本次AJAX请求时传递的options参数
//           $.messager.progress('close');
        $('#loadMsg').html('');

        if(XMLHttpRequest.status==401){
            openLock();
        }
        return 'error'
    }
});




/**
 * 密码验证
 */
$.extend($.fn.validatebox.defaults.rules, {
    equals: {
        validator: function(value,param){
            return value == $(param[0]).val();
        },
        message: '不匹配！'
    }
});

/**
 *
 */
$.extend($.fn.validatebox.defaults.rules, {
    startWith: {
        validator: function(value,param){
            return value.indexOf(param[0])==0;
        },
        message: '角色编码必须以【ROLE_】开始！'
    }
});

$.extend($.fn.validatebox.defaults.rules, {
    dateValidate: {
        validator: function(value,param){
            if(value==null || value=='') return true;
            var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/; //短日期格式的正则表达式
            var r = value.match(reg);
            if (r == null) return false;

            return true;
        },
        message: '日期格式不正确！格式:0000-00-00'
    }
});

$.extend($.fn.validatebox.defaults.rules, {
    datetimeValidate: {
        validator: function(value,param){
            if(value==null || value=='') return true;
            var reg = reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
            var r = value.match(reg);
            if (r == null) return false;
            return true;
        },
        message: '时间格式不正确！格式:0000-00-00 00:00:00'
    }
});


$.extend($.fn.validatebox.defaults.rules, {
    combogridValidate: {
        validator: function(value,param){
            if(value==null || value=='') return true;
            var id=param[0];

        var grid=   $('#'+id).combogrid('grid');
        var _value=$(grid).datagrid('getSelected');
        if(_value==null)
            return false;


        return true;
        },
        message: '未检索到对应数据！'
    }
});


/**
 * 日期格式化
 * @param value
 * @param row
 * @param index
 * @return {*}
 */
function dateFormate(value,row,index){


    if(isNaN(value)){
        return value;
    }

    if(value=='' || value==null || value == undefined) return value;
    var date= new Date( parseInt(value));
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    var rt=y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d);

    if($.isWindow(this)) return rt;


    row[this.field]=rt;
    return rt;
}

/**
 *
 * @param jsons
 * @param fields
 */
function jsonDateFormate(jsons,fields){
    $.each(jsons,function(i,v){
        $.each(fields,function(fi,fv){

            if(v[fv])
                v[fv]=Date.parse(v[fv]).toString();

        });
    });
}

function enJsonDateFormate(jsons,fields){

    $.each(jsons,function(i,v){
        $.each(fields,function(fi,fv){

            if(v[fv])
                v[fv]=dateFormate(v[fv]);

        });
    });
}


/**
 * 对 form里的date 和datetime类型处理，转成长整形
 */
$.fn.dateFormate=function(){


    var is= $('input[date]',this);
    $.each(is, function(index,item) {
        var v_=$(item).val();

        $(item).val(dateFormate(v_));


    });


    var ds= $('input[datetime]',this);
    $.each(ds, function(index,item) {
        var v_=$(item).val();

        $(item).val(dateTimeFormate(v_));



    });




}


/**
 * 时间格式
 * @param value
 * @param row
 * @param index
 * @return {*}
 */
function dateTimeFormate(value,row,index){
    if(value=='' || value==null || value == undefined) return value;
    var date= new Date( parseInt(value));
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    var h = date.getHours();
    var M = date.getMinutes();
    var s = date.getSeconds();
    return y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d)+' '+(h < 10 ? '0' + h : h)+':'+(M < 10 ? '0' + M : M)+':'+(s < 10 ? '0' + h : h)
}
/**
 * 扩展日期格式
 * @param date
 * @return {string}
 */
$.fn.datebox.defaults.formatter = function(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    return y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d);
}




/**
 * 生成GUID
 * @return {*}
 */
function guidGenerator() {
    var S4 = function() {
        return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
    };
    return (S4()+S4()+S4()+S4()+S4()+S4()+S4()+S4());
}


/**
 * 把array 转成json，根据key 建立索引
 * @param keyField
 * @param data
 * @return {{}}
 */
function arrayToJson(keyField,data){

    var json={};
    $.each(data,function(i,v){
        json[v[keyField]]=v;
    });
    return json;
}
function gridColumenToJson(keyField,data,json){


    $.each(data,function(i,v){
        if($.type(v)=='array'){
            gridColumenToJson(keyField,v,json);
        }else
            json[v[keyField]]=v;
    });

}
//
//
//$.fn.combogrid.defaults.toolbar=
//
//



function openMainTag(node){

    var b=  $('#centerTabs').tabs('exists',node.text);
    if(!b){
        $('#centerTabs').tabs('add',{
            id:'tabs'+node.id,
            title: node.text,
            selected: true,
            closable:true,
            href:node.attributes.url,
            fit:true


        });
    }else{
        $('#centerTabs').tabs('select', node.text);
    }

}

function closeNode(node){

    var b=  $('#centerTabs').tabs('exists',node.text);
    if(!b){

    }else{
        $('#centerTabs').tabs('close', node.text);
    }
}



function openNodeInWindow(node){

    closeNode(node);
    $('<div/>').dialog({
        title:node.text,
        modal:true,
        width:700,
        height:500,
        href:node.attributes.url,
        onClose : function() {
            $(this).dialog('destroy');
        }
    });

}

function clearComboTree(id){

    $('#'+id).combotree("clear");
}

$.extend($.fn.datagrid.defaults.editors, {
    comboxtree: {
        init: function(container, options){

            var input = $('<input type="text" id="'+options.cid+'">').appendTo(container);
           var clear=$('<div  style="background-color: #b7d2ff;text-align: center;"><a href="#" onclick=clearComboTree("'+options.cid+'")>清除</a></div>');
            input.combotree(options);
           clear.appendTo(input.combo('panel'));

            return input;
        },
        destroy:function(target){
           $(target).combotree('destroy');
        },
        getValue: function(target){
            var t = $(target).combotree('tree');	// get the tree object
            var node=  t.tree('getSelected');
            if(node!=null){
                return node.attributes;
            }else{
                var options=    $(target).combotree('options');
                return  options['_value'];
            }

        },
        setValue: function(target, value){
            if(value!=null && value!=undefined){

            var options=    $(target).combotree('options');
            var text=options['textField'];
                options['_value']=value;

                $(target).combotree("setValue",value.name);
            }

        },
        resize: function(target, width){
           $(target).combotree('resize',width);
        }
    }
});


$.extend($.fn.datagrid.defaults.editors, {
    comboxgrid: {
        init: function(container, options){
            var input = $('<input type="text"  id="'+options.cid+'">').appendTo(container);
            options['validType']="combogridValidate['"+options.cid+"']";
            return input.combogrid(options);
        },
        destroy:function(target){
            $(target).combogrid('destroy');
        },
        getValue: function(target){
            // var options= $(target).combogrid("options");
            // var textField=options.textField
            return $(target).combogrid("grid").datagrid('getSelected');

        },
        setValue: function(target, value){

            if(value!=null && value!=undefined){

               var grid= $(target).combogrid("grid");
                $(grid).datagrid('appendRow',value);

                $(target).combogrid("setValue",value.id);
                $(grid).datagrid('selectRow',0);
            }

        },
        resize: function(target, width){
            $(target).combogrid('resize',width);
        }
    }
});

$.extend($.fn.datagrid.defaults.editors, {
    label: {
        init: function(container, options){
            var input = $('<input type="text" class="datagrid-editable-input" readonly>').appendTo(container);
            return input;
        },
        getValue: function(target){
            return $(target).val();
        },
        setValue: function(target, value){

            $(target).val(value);

        },
        resize: function(target, width){
            var input = $(target);
            if ($.boxModel == true){
                input.width(width - (input.outerWidth() - input.width())-6);
            } else {
                input.width(width-6);
            }
        }
    }
});
$.extend($.fn.datagrid.defaults.editors, {
    datelabel: {
        init: function(container, options){
            var input = $('<input type="text" class="datagrid-editable-input" readonly>').appendTo(container);
            return input;
        },
        getValue: function(target){
            return Date.parse($(target).val());
        },
        setValue: function(target, value){

            $(target).val(dateFormate(value));
        },
        resize: function(target, width){
            var input = $(target);
            if ($.boxModel == true){
                input.width(width - (input.outerWidth() - input.width())-6);
            } else {
                input.width(width-6);
            }
        }
    }
});

$.extend($.fn.datagrid.defaults.editors, {
    numberlabel: {
        init: function(container, options){
            var input = $('<input type="text"  readonly>').appendTo(container);
            input.numberbox(options);
//            input.numberbox('disable');
            return input;
        },
        getValue: function(target){
            return $(target).numberbox('getValue');
        },
        setValue: function(target, value){

            $(target).numberbox('setValue',value);
        },
        resize: function(target, width){
            var input = $(target);
            if ($.boxModel == true){
                input.width(width - (input.outerWidth() - input.width())-10);
            } else {
                input.width(width-10);
            }

        }
    }
});


//给数据赋值  json 结构
function setObjectAttr(obj,path,value){
    if(path.indexOf('.')<0){//无 .
         obj[path]=value;
        return;
    }
    var fields=path.split('.');

    var valueP=obj;//上一层数据对象
    var valueN;//指向下一层数据对象
    for(var i=0;i<fields.length-1;i++){

         valueN =  getObjectAttr_(valueP,fields[i]);
        if(valueN==null){
            valueP[fields[i]]={};
            valueN=valueP[fields[i]];
        }
        valueP=valueN;//上层数据重新指向下层数据
    }
    valueN[fields[fields.length-1]]=value;
//    alert(JSON.stringify(obj[fields[0]]) );
}

/**
 * 获取json 中的数据
 * @param obj
 * @param path
 * @returns {*}
 */
function getObjectAttr(obj,path){
    if(path.indexOf('.')<0){//无 .
        var _value=getObjectAttr_(obj,path);
      if($.type(_value)=='object'){

        return JSON.stringify(_value);
    }
      return _value;
    }
    var fields=path.split('.');

    var value=obj;
    for(var i=0;i<fields.length;i++){

        value =  getObjectAttr_(value,fields[i]);

//        alert(fields[i]+':'+value);
    }



    obj[path]=value;
    return value;


}

function getObjectAttr_(obj,field){
    if(obj==null) return null;
    if(obj[field]==undefined) return null;
    return obj[field];
}


function isEmpty(obj){
    if(obj==undefined)
        return true;
    if(obj==null)
        return true;
    if(obj=='') return true;
    if(obj==NaN) return true;

    return false;
}
function addCriterias(fn,obj){
    if(fn.criterias){
        fn.criterias.push(obj)

    }else{

        fn['criterias']=[obj];
    }
}
function addCriteria(fn,obj){

    var c ;

    if(obj.length==4){
        c={operator:obj[0],fieldName:obj[1],value:obj[2],type:obj[3]};
    }else if (obj.length==3){
        c={operator:obj[0],fieldName:obj[1],value:obj[2]};
    }else{
        c={operator:obj[0],fieldName:obj[1]};
    }
    if(fn.criterias){
        fn.criterias.push(c)

    }else{

        fn['criterias']=[c];
    }
}

function createCriterias(operator){
    return {operator:operator,criterias:[]};
}


function onQuery(field,pageId,p_pageId){

    var grid=$('#'+field+pageId).combogrid('grid');

    if($('#fieldkey'+p_pageId).val()!='' && $('#where'+p_pageId).searchbox('getValue')!=''){
        var sjson='{operator:and,criterias:[{operator:contains,fieldName:'+$('#fieldkey'+p_pageId).val()+',value:'+$('#where'+p_pageId).searchbox('getValue')+'}]}';
        $(grid[0]).datagrid('reload',{queryParams:sjson});
    }else{

        $(grid[0]).datagrid('reload',{queryParams:'{}'});

    }
}

$.fn.combogridClear=function(){
  var options=  $(this).combobox('options');
  options.loaded=false;
  var grid=$(this).combogrid('grid');
    grid.datagrid('')

}
function _onShowPanelInForm(id,pageId,url){



    var tgt=$('#'+id+pageId);
    var options= $(tgt).combogrid('options');


    if(options.loaded==true)
        return;
    options['loaded']=true;

    var grid=$(tgt).combogrid('grid');


   var options= $(grid).datagrid('options');


    options.url=url;

    $(grid).datagrid('reload');


}

    function _onShowPanel(id,pageId,url){



    var tgt=$('#'+id+pageId);
    var options= $(tgt).combogrid('options');
    if(options.loaded==true)
        return;

    var value=  $(tgt).combogrid('getValue')
    var grid=$(tgt).combogrid('grid');
    if(value!=null && value!=''){

        $(grid).datagrid('options').url=url+'/'+value;
    }else{
        $(grid).datagrid('options').url=url;
    }


    $(grid).datagrid('reload');
    options.loaded=true;




}


function _onHeaderContextMenu(e, field,id,pageId,p_pageId){

    e.preventDefault();

    $('#fieldkey'+p_pageId).val(field);

    var options=$('#'+id+pageId).combogrid('options');
    var json={};

    gridColumenToJson('field',options.columns,json);

    $('#fieldname'+p_pageId).val(json[field].title);
}






//获得coolie 的值









function addCookie(objName,objValue,objHours){      //添加cookie

    var str = objName + "=" + escape(objValue);

    if(objHours > 0){                               //为时不设定过期时间，浏览器关闭时cookie自动消失

    var date = new Date();

    var ms = objHours*3600*1000;

    date.setTime(date.getTime() + ms);

    str += "; expires=" + date.toGMTString();

    }

document.cookie = str;

}



function setCookie(name,value)//两个参数，一个是cookie的名子，一个是值

{

    var Days = 300; //此 cookie 将被保存 300 天

    var exp = new Date();    //new Date("December 31, 9998");

    exp.setTime(exp.getTime() + Days*24*60*60*1000);

    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();

    }

function getCookie(name)//取cookies函数

{

    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));

    if(arr != null) return unescape(arr[2]); return null;



    }

function delCookie(name)//删除cookie

{

    var exp = new Date();

    exp.setTime(exp.getTime() - 1);

    var cval=getCookie(name);

    if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();

    }


$.extend($.fn.numberbox.options,{
   precision:2
});

$.extend($.fn.datagrid.methods, {
    sum:function(jq,field){
        var rows=$(jq).datagrid('getRows');

        var sumNum = 0;
        var value=0;
        for(var i=0;i<rows.length;i++){
            value= Number(rows[i][field])
            if(isNaN(value)){
                value=0;
            }
            sumNum += value;
        }
        return sumNum;
    }
});



$.extend($.fn.datagrid.methods, {
    statistics: function (jq) {
        var opt=$(jq).datagrid('options').columns;
        var rows = $(jq).datagrid("getRows");

        var footer = new Array();
        footer['sum'] = "";
        footer['avg'] = "";
        footer['max'] = "";
        footer['min'] = "";

        for(var i=0; i<opt[0].length; i++){
            if(opt[0][i].sum){
                footer['sum'] = footer['sum'] + sum(opt[0][i].field)+ ',';
            }
            if(opt[0][i].avg){
                footer['avg'] = footer['avg'] + avg(opt[0][i].field)+ ',';
            }
            if(opt[0][i].max){
                footer['max'] = footer['max'] + max(opt[0][i].field)+ ',';
            }
            if(opt[0][i].min){
                footer['min'] = footer['min'] + min(opt[0][i].field)+ ',';
            }
        }

        var footerObj = new Array();

        if(footer['sum'] != ""){
            var tmp = '{' + footer['sum'].substring(0,footer['sum'].length - 1) + "}";
            var obj = eval('(' + tmp + ')');
            if(obj[opt[0][0].field] == undefined){
                footer['sum'] += '"' + opt[0][0].field + '":"<b>当页合计:</b>"';
                obj = eval('({' + footer['sum'] + '})');
            }else{
                obj[opt[0][0].field] = "<b>当页合计:</b>" + obj[opt[0][0].field];
            }
            footerObj.push(obj);
        }

        if(footer['avg'] != ""){
            var tmp = '{' + footer['avg'].substring(0,footer['avg'].length - 1) + "}";
            var obj = eval('(' + tmp + ')');
            if(obj[opt[0][0].field] == undefined){
                footer['avg'] += '"' + opt[0][0].field + '":"<b>当页均值:</b>"';
                obj = eval('({' + footer['avg'] + '})');
            }else{
                obj[opt[0][0].field] = "<b>当页均值:</b>" + obj[opt[0][0].field];
            }
            footerObj.push(obj);
        }

        if(footer['max'] != ""){
            var tmp = '{' + footer['max'].substring(0,footer['max'].length - 1) + "}";
            var obj = eval('(' + tmp + ')');

            if(obj[opt[0][0].field] == undefined){
                footer['max'] += '"' + opt[0][0].field + '":"<b>当页最大值:</b>"';
                obj = eval('({' + footer['max'] + '})');
            }else{
                obj[opt[0][0].field] = "<b>当页最大值:</b>" + obj[opt[0][0].field];
            }
            footerObj.push(obj);
        }

        if(footer['min'] != ""){
            var tmp = '{' + footer['min'].substring(0,footer['min'].length - 1) + "}";
            var obj = eval('(' + tmp + ')');

            if(obj[opt[0][0].field] == undefined){
                footer['min'] += '"' + opt[0][0].field + '":"<b>当页最小值:</b>"';
                obj = eval('({' + footer['min'] + '})');
            }else{
                obj[opt[0][0].field] = "<b>当页最小值:</b>" + obj[opt[0][0].field];
            }
            footerObj.push(obj);
        }



        if(footerObj.length > 0){
            $(jq).datagrid('reloadFooter',footerObj);
        }


        function sum(filed){
            var sumNum = 0;
            var value=0;
            for(var i=0;i<rows.length;i++){
                value= Number(rows[i][filed])
                if(isNaN(value)){
                    value=0;
                }
                sumNum += value;
            }
            if(isNaN(sumNum)){
                sumNum=0;
                return '"' + filed + '":"' + sumNum.toFixed(2) +'"';
            }
            return '"' + filed + '":"' + sumNum.toFixed(2) +'"';
        };

        function avg(filed){
            var sumNum = 0;
            for(var i=0;i<rows.length;i++){
                sumNum += Number(rows[i][filed]);
            }
            return '"' + filed + '":"'+ (sumNum/rows.length).toFixed(2) +'"';
        }

        function max(filed){
            var max = 0;
            for(var i=0;i<rows.length;i++){
                if(i==0){
                    max = Number(rows[i][filed]);
                }else{
                    max = Math.max(max,Number(rows[i][filed]));
                }
            }
            return '"' + filed + '":"'+ max +'"';
        }

        function min(filed){
            var min = 0;
            for(var i=0;i<rows.length;i++){
                if(i==0){
                    min = Number(rows[i][filed]);
                }else{
                    min = Math.min(min,Number(rows[i][filed]));
                }
            }
            return '"' + filed + '":"'+ min +'"';
        }
    }
});



$.extend($.fn.numberbox.methods,{
    setValue1:function (jq,value){
        var precision=$(jq).numberbox('options').precision;
        var _value=value.toFixed(precision);
        $(jq).val(_value);

        $(jq).parent().find('input[type=hidden]').val(_value);
        $(jq).numberbox("fix");
    },
    getValue1:function(jq){
       var rt= $(jq).numberbox('getValue');
        if(!isNaN(rt)){
            return Number(rt);
        }else{
            return 0;
        }
    }
})