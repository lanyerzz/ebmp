
<%@ page import="com.app.bd.exchange.BdExchange" %>
<script>
    var fs${pageId}=[
    
        {key:'currtypeOne.currtypecode',value:'${message(code:'bdCurrtype.currtypecode.label', default: 'Currtype One')}',editerType:'text'},
        {key:'currtypeOne.currtypename',value:'${message(code:'bdCurrtype.currtypename.label', default: 'Currtype One')}',editerType:'text'},
        {key:'currtypeTwo.currtypecode',value:'${message(code:'bdCurrtype.currtypecode.label', default: 'Currtype Two')}',editerType:'text'},
        {key:'currtypeTwo.currtypename',value:'${message(code:'bdCurrtype.currtypename.label', default: 'Currtype Two')}',editerType:'text'},
        {key:'year',value:'${message(code:'bdExchange.year.label', default: 'Year')}',editerType:'number',options:{min:2000,max:2999,precision:0},type:'int'},
        
        {key:'month',value:'${message(code:'bdExchange.month.label', default: 'Month')}',editerType:'combobox',type:'int',options:{editable:false,valueField:'id',textField:'text',data:[{id:'1',text:1},{id:'2',text:2},{id:'3',text:3},{id:'4',text:4},{id:'5',text:5},{id:'6',text:6},{id:'7',text:7},{id:'8',text:8},{id:'9',text:9},{id:'10',text:10},{id:'11',text:11},{id:'12',text:12}]}}
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'currtypeOne.currtypecode',defaultValue:''},
        {operator:'equals',fieldName:'currtypeOne.currtypename',defaultValue:''},
        {operator:'equals',fieldName:'currtypeTwo.currtypecode',defaultValue:''},
        {operator:'equals',fieldName:'currtypeTwo.currtypename',defaultValue:''},
        {operator:'equals',fieldName:'year',defaultValue:''},
        {operator:'equals',fieldName:'month',defaultValue:''}
        

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
