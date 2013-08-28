<%@ page import="com.app.ywms.contract.BaseContract" %>
<script>
    var fs${pageId}=[

        {key:'contractNo',value:'${message(code:'baseContract.contractNo.label', default: 'Contract No')}',editerType:'text'},

        {key:'contrantNo2',value:'${message(code:'baseContract.contrantNo2.label', default: 'Contrant No2')}',editerType:'text'},

        {key:'signAddress',value:'${message(code:'baseContract.signAddress.label', default: 'Sign Address')}',editerType:'text'},

        {key:'contractescribe',value:'${message(code:'baseContract.contractescribe.label', default: 'Contractescribe')}',editerType:'text'},

        {key:'checkType',value:'${message(code:'baseContract.checkType.label', default: 'Check Type')}',editerType:'combobox',type:'int',
            options:{valueField:'key',textField:'value',data:[{key:'0',value:'罐检方式'},{key:'1',value:'穿检方式'}],editable:false,panelHeight:'auto'}},

        {key:'gh.id',value:'${message(code:'baseContract.gh.label', default: 'gh')}',editerType:'ref',refCode:'refYBdTank'},

        {key:'myfs',value:'${message(code:'baseContract.myfs.label', default: 'myfs')}',editerType:'combobox',type:'int',
            options:{valueField:'key',textField:'value',data:[{key:'0',value:'内贸'},{key:'1',value:'外贸'},{key:'2',value:'内、外贸'}],editable:false,panelHeight:'auto'}},

        {key:'cm.id',value:'${message(code:'baseContract.cm.label')}',editerType:'ref',refCode:'refYshipdoc'},

        {key:'ccfjsfs',value:'${message(code:'baseContract.ccfjsfs.label', default: 'ccfjsfs')}',editerType:'combobox',type:'int',
            options:{valueField:'key',textField:'value',data:[{key:'0',value:'按天计算'},{key:'1',value:'按周期第一天计费'}],editable:false,panelHeight:'auto'}},

        {key:'rkszddrjfcs',value:'${message(code:'baseContract.rkszddrjfcs.label', default: 'rkszddrjfcs')}',editerType:'boolean',type:'boolean'},

        {key:'azqlj',value:'${message(code:'baseContract.azqlj.label', default: 'azqlj')}',editerType:'boolean',type:'boolean'},

        {key:'wflxr',value:'${message(code:'baseContract.wflxr.label', default: 'Wflxr')}',editerType:'text'},

        {key:'dflxr',value:'${message(code:'baseContract.dflxr.label', default: 'Dflxr')}',editerType:'text'},
    

        {key:'bdCumandoc.id',value:'${message(code:'baseContract.bdCumandoc.label', default: 'Bd Cumandoc')}',editerType:'ref',refCode:'refBdCustomer'},

        {key:'bdInvmandoc.id',value:'${message(code:'baseContract.bdInvmandoc.label', default: 'Bd Invmandoc')}',editerType:'ref',refCode:'refBdInvmandoc'}

        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[

            {operator:'equals',fieldName:'contractNo',defaultValue:''},

            {operator:'equals',fieldName:'contrantNo2',defaultValue:''},
            {operator:'equals',fieldName:'bdCumandoc.id',defaultValue:''},

            {operator:'equals',fieldName:'bdInvmandoc.id',defaultValue:''},

            {operator:'equals',fieldName:'signAddress',defaultValue:''},

            {operator:'equals',fieldName:'contractescribe',defaultValue:''},

            {operator:'equals',fieldName:'checkType',defaultValue:''},

            {operator:'equals',fieldName:'gh.id',defaultValue:''},

            {operator:'equals',fieldName:'myfs',defaultValue:''},

            {operator:'equals',fieldName:'cm.id',defaultValue:''},

            {operator:'equals',fieldName:'ccfjsfs',defaultValue:''},

            {operator:'equals',fieldName:'rkszddrjfcs',defaultValue:''},

            {operator:'equals',fieldName:'azqlj',defaultValue:''},

            {operator:'equals',fieldName:'wflxr',defaultValue:''},

            {operator:'equals',fieldName:'dflxr',defaultValue:''}

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

        changeFormItemEditer(newValue,oldValue,parent,_fs${pageId})
    }

    $(function(){

     addBigQuery("${pageId}",$("#qv${pageId}"),true,dd${pageId},rl${pageId},fs${pageId},_fs${pageId},opt${pageId},onQueryFieldChanged${pageId});
    });

    /**
     *增加组合条件
     * @param id
     */
    function onAddBigQuery${pageId}(id){
        addBigQuery("${pageId}",$('#'+id),false,dd${pageId},rl${pageId},fs${pageId},_fs${pageId},opt${pageId},onQueryFieldChanged${pageId});
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

        return criter;


    }

</script>


<div id="c${pageId}">

    <span id="qv${pageId}" />

</div>
