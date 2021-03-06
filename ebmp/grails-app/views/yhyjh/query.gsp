
<%@ page import="com.app.ywms.rk.hyjh.Yhyjh" %>
<script>
    var fs${pageId}=[
    
        {key:'billno',value:'${message(code:'yhyjh.billno.label', default: 'Billno')}',editerType:'text'},
        
        {key:'billdate',value:'${message(code:'yhyjh.billdate.label', default: 'Billdate')}',editerType:'date',type:'date'},
        

        {key:'bdCumandoc.id',value:'${message(code:'yhyjh.bdCumandoc.label')}',editerType:'ref',refCode:'refBdCustomer'},
        {key:'cddw.id',value:'${message(code:'yhyjh.cddw.label')}',editerType:'ref',refCode:'refBdCumandoc'},

        

        {key:'checkDate',value:'${message(code:'yhyjh.checkDate.label', default: 'Check Date')}',editerType:'date',type:'date'},
        
        {key:'checker',value:'${message(code:'yhyjh.checker.label', default: 'Checker')}',editerType:'text'},
        
        {key:'chuanming',value:'${message(code:'yhyjh.chuanming.label', default: 'Chuanming')}',editerType:'text'},

        
        {key:'hangci',value:'${message(code:'yhyjh.hangci.label', default: 'Hangci')}',editerType:'text'},
        
        {key:'kbgk',value:'${message(code:'yhyjh.kbgk.label', default: 'Kbgk')}',editerType:'text'},
        

        {key:'kjxyzdw.id',value:'${message(code:'yhyjh.kjxyzdw.label', )}',editerType:'ref',refCode:'refBdCumandoc'},


        {key:'makeDate',value:'${message(code:'yhyjh.makeDate.label', default: 'Make Date')}',editerType:'date',type:'date'},
        

        {key:'maker.id',value:'${message(code:'yhyjh.maker.label', )}',editerType:'ref',refCode:'refSmUser'},


        
        {key:'qhgk',value:'${message(code:'yhyjh.qhgk.label', default: 'Qhgk')}',editerType:'text'},
        
        {key:'wyfs',value:'${message(code:'yhyjh.wyfs.label', default: 'Wyfs')}',type:'number',editerType:'combobox',options:{valueField:'index',textField:'value',data:[{index:0,value:'内贸'},{index:1,value:'外贸'},{index:2,value:'内外贸'}],editable:false,panelHeight:'auto'}},
        
        {key:'yjdhrq',value:'${message(code:'yhyjh.yjdhrq.label', default: 'Yjdhrq')}',editerType:'date',type:'date'}
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'billno',defaultValue:''},
        
        {operator:'equals',fieldName:'billdate',defaultValue:''},
        
        {operator:'equals',fieldName:'bdCumandoc.id',defaultValue:''},

        
        {operator:'equals',fieldName:'cddw.id',defaultValue:''},

        {operator:'equals',fieldName:'chuanming',defaultValue:''},
        {operator:'equals',fieldName:'hangci',defaultValue:''},
        
        {operator:'equals',fieldName:'kbgk',defaultValue:''},
        
        {operator:'equals',fieldName:'kjxyzdw.id',defaultValue:''},

        
        {operator:'equals',fieldName:'maker.id',defaultValue:''},


        
        {operator:'equals',fieldName:'qhgk',defaultValue:''}
        

        

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
