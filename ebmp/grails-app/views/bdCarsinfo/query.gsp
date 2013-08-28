
<script>

    var car_source=[{key:'carCode',value:'编码',editerType:'text'},
        {key:'carNo',value:'车号',editerType:'text'},
        {key:'carType',value:'挂车种类',editerType:'combobox',type:'int',options:{valueField:'id',textField:'text',data:[{id:'0',text:'普通半挂'},{id:'1',text:'罐式全挂'},{id:'2',text:'集装箱全挂'}], editable:false,panelHeight:'auto'}
        },
        {key:'carOwner',value:'车主姓名',editerType:'text'},
        {key:'linkPhone',value:'联系电话',editerType:'text'},
        {key:'linkMan',value:'联系人',editerType:'text'},
        {key:'clqsdw',value:'车辆权属单位',editerType:'text'},
        {key:'carrier',value:'承运商',editerType:'text'},
        {key:'yszjCode',value:'运输证件编号',editerType:'text'},
        {key:'currtype',value:'',editerType:'ref',resouceCode:'refBdCurrtype'}
    ];
    var car_defaultData={
        relation:'and',
        criterias:[ {operator:'equals',fieldName:'carCode',defaultValue:''},//criteria
            {operator:'equals',fieldName:'carNo',defaultValue:''},
            {operator:'equals',fieldName:'carType',defaultValue:'0'}
        ]
    };
    var car_source_=arrayToJson('key',car_source);

    var car_relation =[{key:'and',value:'与'},{key:'or',value:'或'},{key:'not',value:'非'}];


    var car_operator=[{key:'equals',value:'等于'},
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
    var car_operator_=arrayToJson('key',car_operator);

    /**
     *查询条件的字段发生变化触发事件
     * @param newValue
     * @param oldValue
     */
    function onQueryFieldChanged${pageId}(newValue, oldValue){

        var parent=$(this).closest('div');

        var target=  parent.find('[name=value]')[0];

        changeFormItemEditer(newValue,oldValue,parent,car_source_)
    }

    $(function(){

     addBigQuery("${pageId}",$("#qv${pageId}"),true,car_defaultData,car_relation,car_source,car_source_,car_operator,onQueryFieldChanged${pageId});
    });

    /**
     *增加组合条件
     * @param id
     */
    function onAddBigQuery${pageId}(id){
        addBigQuery("${pageId}",$('#'+id),false,car_defaultData,car_relation,car_source,car_source_,car_operator,onQueryFieldChanged${pageId});
    }

    /**
     *增加条件
     * @param id
     */
    function onAddQuery${pageId}(id){
        createQueryRow( "${pageId}",$('#'+id),car_defaultData.criterias[0],false,car_source,car_source_,car_operator,onQueryFieldChanged${pageId});

    }

    function getCriter${pageId}(){

       var div=$('#c${pageId}').children('div')[0];

        var criter={};
        createCriteria(div,criter,car_source_);
//        alert(JSON.stringify(criter));
        return criter;
//        $('#view').html(JSON.stringify(criter));

    }

</script>


<div id="c${pageId}">

    <span id="qv${pageId}" />

</div>
