
<%@ page import="com.app.ywms.ck.gbd.YoutGbd" %>
<script>
    var fs${pageId}=[
    
        {key:'billdate',value:'${message(code:'youtGbd.billdate.label', default: 'Billdate')}',editerType:'date',type:'date'},

        
        {key:'bdCorp.id',value:'${message(code:'youtGbd.bdCorp.label', default: 'Bd Corp')}',editerType:'ref',refCode:'refBdCorp'},

        
        {key:'billTypeCode',value:'${message(code:'youtGbd.billTypeCode.label', default: 'Bill Type Code')}',editerType:'text'},
        
        {key:'billno',value:'${message(code:'youtGbd.billno.label', default: 'Billno')}',editerType:'text'},
        
        {key:'billtype.id',value:'${message(code:'youtGbd.billtype.label', default: 'Billtype')}',editerType:'ref',refCode:'refPubBilltype'},

        
        {key:'businessType.id',value:'${message(code:'youtGbd.businessType.label', default: 'Business Type')}',editerType:'ref',refCode:'refPubBusinessType'},

        
        {key:'checkDate',value:'${message(code:'youtGbd.checkDate.label', default: 'Check Date')}',editerType:'date',type:'date'},

        
        {key:'checker.id',value:'${message(code:'youtGbd.checker.label', default: 'Checker')}',editerType:'ref',refCode:'refSmUser'},

        
        {key:'dateCreated',value:'${message(code:'youtGbd.dateCreated.label', default: 'Date Created')}',editerType:'date',type:'date'},

        
        {key:'fhzt',value:'${message(code:'youtGbd.fhzt.label', default: 'Fhzt')}',editerType:'text'},
        
        {key:'fsr.id',value:'${message(code:'youtGbd.fsr.label', default: 'Fsr')}',editerType:'ref',refCode:'refBdPsndoc'},

        
        {key:'fysl',value:'${message(code:'youtGbd.fysl.label', default: 'Fysl')}',editerType:'text'},
        
        {key:'lastUpdated',value:'${message(code:'youtGbd.lastUpdated.label', default: 'Last Updated')}',editerType:'date',type:'date'},

        
        {key:'makeDate',value:'${message(code:'youtGbd.makeDate.label', default: 'Make Date')}',editerType:'date',type:'date'},

        
        {key:'maker.id',value:'${message(code:'youtGbd.maker.label', default: 'Maker')}',editerType:'ref',refCode:'refSmUser'},

        
        {key:'mz',value:'${message(code:'youtGbd.mz.label', default: 'Mz')}',editerType:'text'},
        
        {key:'pz',value:'${message(code:'youtGbd.pz.label', default: 'Pz')}',editerType:'text'},
        
        {key:'sourceBid',value:'${message(code:'youtGbd.sourceBid.label', default: 'Source Bid')}',editerType:'text'},
        
        {key:'sourceBillCode',value:'${message(code:'youtGbd.sourceBillCode.label', default: 'Source Bill Code')}',editerType:'text'},
        
        {key:'sourceBillType.id',value:'${message(code:'youtGbd.sourceBillType.label', default: 'Source Bill Type')}',editerType:'ref',refCode:'refPubBilltype'},

        
        {key:'sourceHid',value:'${message(code:'youtGbd.sourceHid.label', default: 'Source Hid')}',editerType:'text'},
        
        {key:'tzsl',value:'${message(code:'youtGbd.tzsl.label', default: 'Tzsl')}',editerType:'text'},
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'billdate',defaultValue:''},
        
        {operator:'equals',fieldName:'bdCorp.id',defaultValue:''},
            
        {operator:'equals',fieldName:'billTypeCode',defaultValue:''},
        
        {operator:'equals',fieldName:'billno',defaultValue:''},
        
        {operator:'equals',fieldName:'billtype.id',defaultValue:''},
            
        {operator:'equals',fieldName:'businessType.id',defaultValue:''},
            
        {operator:'equals',fieldName:'checkDate',defaultValue:''},
        
        {operator:'equals',fieldName:'checker.id',defaultValue:''},
            
        {operator:'equals',fieldName:'dateCreated',defaultValue:''},
        
        {operator:'equals',fieldName:'fhzt',defaultValue:''},
        
        {operator:'equals',fieldName:'fsr.id',defaultValue:''},
            
        {operator:'equals',fieldName:'fysl',defaultValue:''},
        
        {operator:'equals',fieldName:'lastUpdated',defaultValue:''},
        
        {operator:'equals',fieldName:'makeDate',defaultValue:''},
        
        {operator:'equals',fieldName:'maker.id',defaultValue:''},
            
        {operator:'equals',fieldName:'mz',defaultValue:''},
        
        {operator:'equals',fieldName:'pz',defaultValue:''},
        
        {operator:'equals',fieldName:'sourceBid',defaultValue:''},
        
        {operator:'equals',fieldName:'sourceBillCode',defaultValue:''},
        
        {operator:'equals',fieldName:'sourceBillType.id',defaultValue:''},
            
        {operator:'equals',fieldName:'sourceHid',defaultValue:''},
        
        {operator:'equals',fieldName:'tzsl',defaultValue:''},
        

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
