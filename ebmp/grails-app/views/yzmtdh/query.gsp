
<%@ page import="com.app.ywms.ck.zmtd.Yzmtdh" %>
<script>
    var fs${pageId}=[


        {key:'billdate',value:'${message(code:'yzmtdh.billdate.label', default: 'Billdate')}',editerType:'date',type:'date'},
        
        {key:'billno',value:'${message(code:'yzmtdh.billno.label', default: 'Billno')}',editerType:'text'},
        

        {key:'businessType.id',value:'${message(code:'yzmtdh.businessType.label', default: 'Business Type')}',editerType:'ref',refCode:'refPubBusinessType',billtypecode:'YZMTD'},

        {key:'khtdh',value:'${message(code:'yzmtdh.khtdh.label', default: 'Khtdh')}',editerType:'text'},
        

        {key:'dshk',value:'${message(code:'yzmtdh.dshk.label', default: 'Dshk')}',editerType:'text'},
        
        {key:'hw.id',value:'${message(code:'yzmtdh.hw.label', default: 'Hw')}',editerType:'ref',refCode:'refBdInvmandoc'},
        {key:'zcdw.id',value:'${message(code:'yzmtdh.zcdw.label', default: 'Zcdw')}',editerType:'ref',refCode:'refBdCustomer'},


        {key:'zrdw.id',value:'${message(code:'yzmtdh.zrdw.label', default: 'Zrdw')}',editerType:'ref',refCode:'refBdCustomer'},
        
        {key:'hwdj',value:'${message(code:'yzmtdh.hwdj.label', default: 'Hwdj')}',editerType:'text'},
        

        {key:'jsr',value:'${message(code:'yzmtdh.jsr.label', default: 'Jsr')}',editerType:'text'},
        


        {key:'checkDate',value:'${message(code:'yzmtdh.checkDate.label', default: 'Check Date')}',editerType:'date',type:'date'},

        {key:'checker',value:'${message(code:'yzmtdh.checker.label', default: 'Checker')}',editerType:'ref',refCode:'refSmUser'},

        {key:'makeDate',value:'${message(code:'yzmtdh.makeDate.label', default: 'Make Date')}',editerType:'date',type:'date'},
        
        {key:'maker',value:'${message(code:'yzmtdh.maker.label', default: 'Maker')}',editerType:'ref',refCode:'refSmUser'}
        

        

        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[

        {operator:'equals',fieldName:'billdate',defaultValue:new Date()},
        
        {operator:'equals',fieldName:'billno',defaultValue:''},
        

        {operator:'equals',fieldName:'businessType.id',defaultValue:''},
        

        {operator:'equals',fieldName:'hw.id',defaultValue:''},

        {operator:'equals',fieldName:'zcdw.id',defaultValue:''},

        {operator:'equals',fieldName:'zrdw.id',defaultValue:''},
            {operator:'equals',fieldName:'makeDate',defaultValue:''},

            {operator:'equals',fieldName:'maker',defaultValue:''}



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
