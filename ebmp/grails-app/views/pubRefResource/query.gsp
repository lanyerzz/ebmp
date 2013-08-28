
<script>
    %{--var car_source=[{key:'carCode',value:'编码',editerType:'text',defalut:'true'},--}%
        %{--{key:'date',value:'日期',editerType:'date',type:'date'},--}%
        %{--{key:'time',value:'时间',editerType:'datetime',type:'date'},--}%
        %{--{key:'number',value:'数量',editerType:'number',options:{precision:2,groupSeparator:','}},--}%
        %{--{key:'state',value:'状态',editerType:'combobox',options:{valueField:'id',textField:'text',data:[{id:'0',text:'自由'},{id:1,text:'审批'}], editable:false,panelHeight:'auto'}},    //url:'xxx.js' 增加url获取服务端的json数据--}%
        %{--{key:'corp',value:'币种',<g:refBdCurrtypeQuery/>}--}%
    %{--];--}%

    var fs${pageId}=[{key:'resourceCode',value:'<g:message code="pubRefResource.resourceCode.label" default="参照编码" />',editerType:'text'},
        {key:'resourceName',value:'<g:message code="pubRefResource.resourceName.label" default="参照名称" />',editerType:'text'}

    ];
    var dd${pageId}={
        relation:'and',
        criterias:[ {operator:'contains',fieldName:'resourceCode',defaultValue:''},
            {operator:'contains',fieldName:'resourceName',defaultValue:''}
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

//        alert(JSON.stringify(criter));
        return criter;
//        $('#view').html(JSON.stringify(criter));

    }

</script>


<div id="c${pageId}">

    <span id="qv${pageId}" />

</div>
