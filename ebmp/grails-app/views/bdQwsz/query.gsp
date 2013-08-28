
<%@ page import="com.app.bd.qwsz.BdQwsz" %>
<script>
    var fs${pageId}=[
        {key:'code',value:'${message(code:'bdQwsz.code.label', default: 'Code')}',editerType:'text'},
        {key:'name',value:'${message(code:'bdQwsz.name.label', default: 'Name')}',editerType:'text'},
        {key:'bdInvmandoc.pkInvbasdoc.invcode',value:'${message(code:'bdQwsz.bdInvmandoc.code.label', default: 'InvCode')}',editerType:'text'},
        {key:'bdInvmandoc.pkInvbasdoc.invname',value:'${message(code:'bdQwsz.bdInvmandoc.name.label', default: 'InvName')}',editerType:'text'},
        {key:'canUse',value:'${message(code:'bdQwsz.canUse.label', default: 'Can Use')}',editerType:'combobox',type:'boolean',
            options:{valueField:'key',textField:'value',data:[{key:true,value:"是"},{key:false,value:"否"}],editable:false,panelHeight:'auto'}},
        {key:'state',value:'${message(code:'bdQwsz.state.label', default: 'State')}',editerType:'combobox',
            options:{valueField:"key",textField:"value",data:[{key:"open",value:"打开"},{key:"close",value:"关闭"}],editable:false,panelHeight:'auto'}}
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
        {operator:'equals',fieldName:'code',defaultValue:''},
        {operator:'equals',fieldName:'name',defaultValue:''},
        {operator:'equals',fieldName:'bdInvmandoc.pkInvbasdoc.invcode',defaultValue:''},
        {operator:'equals',fieldName:'bdInvmandoc.pkInvbasdoc.invname',defaultValue:''},
        {operator:'equals',fieldName:'canUse',defaultValue:''},
        {operator:'equals',fieldName:'state',defaultValue:'open'}
        ]
    };
    var _fs${pageId}=arrayToJson('key',fs${pageId});

    var rl${pageId} =[{key:'and',value:'与'},{key:'or',value:'或'},{key:'not',value:'非'}];


    var opt${pageId}=[{key:'equals',value:'等于'},
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
    var _opt${pageId}=arrayToJson('key',opt${pageId});

    /**
     *查询条件的字段发生变化触发事件
     * @param newValue
     * @param oldValue
     */
    function onQueryFieldChanged${pageId}(newValue, oldValue){

        var parent=$(this).closest('div');

        var target=  parent.find('[name=value]')[0];

        changeFormItemEditer(newValue,oldValue,parent,_fs${pageId},'')
    }

    $(function(){

        addBigQuery("${pageId}",$("#qv${pageId}"),true,dd${pageId},rl${pageId},fs${pageId},_fs${pageId},opt${pageId},onQueryFieldChanged${pageId});
    });

    /**
     *增加组合条件
     * @param id
     */
    function onAddBigQuery${pageId}(id){
        addBigQuery("${pageId}",$('#'+id),false,dd${pageId},rl${pageId},fs${pageId},fs${pageId},opt${pageId},onQueryFieldChanged${pageId});
    }

    /**
     *增加条件
     * @param id
     */
    function onAddQuery${pageId}(id){

        createQueryRow( "${pageId}",$('#'+id),dd${pageId}.criterias[0],false,fs${pageId},_fs${pageId},opt${pageId},onQueryFieldChanged${pageId});

    }

    function getCriter${pageId}(){

       var div=$('#c${pageId}').children('div')[0];

        var criter={};
        createCriteria(div,criter,_fs${pageId});
        //alert(JSON.stringify(criter));
        return criter;


    }

</script>

<div id="c${pageId}">
    <span id="qv${pageId}" />
</div>
