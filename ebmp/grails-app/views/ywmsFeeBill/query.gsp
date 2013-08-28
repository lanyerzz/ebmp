
<%@ page import="com.app.ywms.settle.fee.YwmsFeeBill" %>
<script>
    var fs${pageId}=[
    
        {key:'billdate',value:'${message(code:'ywmsFeeBill.billdate.label', default: 'Billdate')}',editerType:'date',type:'date'},

        
        {key:'feeType.id',value:'${message(code:'ywmsFeeBill.feeType.label', default: 'Fee Type')}',editerType:'ref',refCode:'refYwmsFeeType'},

        
        {key:'jsrq',value:'${message(code:'ywmsFeeBill.jsrq.label', default: 'Jsrq')}',editerType:'date',type:'date'},

        
        {key:'dj',value:'${message(code:'ywmsFeeBill.dj.label', default: 'Dj')}',editerType:'text'},
        
        {key:'yfsl',value:'${message(code:'ywmsFeeBill.yfsl.label', default: 'Yfsl')}',editerType:'text'},
        
        {key:'yfje',value:'${message(code:'ywmsFeeBill.yfje.label', default: 'Yfje')}',editerType:'text'},
        
        {key:'fkdw.id',value:'${message(code:'ywmsFeeBill.fkdw.label', default: 'Fkdw')}',editerType:'ref',refCode:'refBdCumandoc'},

        
        {key:'bdCorp.id',value:'${message(code:'ywmsFeeBill.bdCorp.label', default: 'Bd Corp')}',editerType:'ref',refCode:'refBdCorp'},

        
        {key:'bg',value:'${message(code:'ywmsFeeBill.bg.label', default: 'Bg')}',editerType:'text'},
        
        {key:'bght.id',value:'${message(code:'ywmsFeeBill.bght.label', default: 'Bght')}',editerType:'ref',refCode:'refBaseContract'},

        
        {key:'billTypeCode',value:'${message(code:'ywmsFeeBill.billTypeCode.label', default: 'Bill Type Code')}',editerType:'text'},
        
        {key:'billno',value:'${message(code:'ywmsFeeBill.billno.label', default: 'Billno')}',editerType:'text'},
        
        {key:'billtype.id',value:'${message(code:'ywmsFeeBill.billtype.label', default: 'Billtype')}',editerType:'ref',refCode:'refPubBilltype'},

        
        {key:'businessType.id',value:'${message(code:'ywmsFeeBill.businessType.label', default: 'Business Type')}',editerType:'ref',refCode:'refPubBusinessType'},

        
        {key:'checkDate',value:'${message(code:'ywmsFeeBill.checkDate.label', default: 'Check Date')}',editerType:'date',type:'date'},

        
        {key:'checker.id',value:'${message(code:'ywmsFeeBill.checker.label', default: 'Checker')}',editerType:'ref',refCode:'refSmUser'},

        
        {key:'dateCreated',value:'${message(code:'ywmsFeeBill.dateCreated.label', default: 'Date Created')}',editerType:'date',type:'date'},

        
        {key:'djlj',value:'${message(code:'ywmsFeeBill.djlj.label', default: 'Djlj')}',editerType:'text'},
        
        {key:'hw.id',value:'${message(code:'ywmsFeeBill.hw.label', default: 'Hw')}',editerType:'ref',refCode:'refBdInvmandoc'},

        
        {key:'hz.id',value:'${message(code:'ywmsFeeBill.hz.label', default: 'Hz')}',editerType:'ref',refCode:'refBdCumandoc'},

        
        {key:'je',value:'${message(code:'ywmsFeeBill.je.label', default: 'Je')}',editerType:'text'},
        
        {key:'jssl',value:'${message(code:'ywmsFeeBill.jssl.label', default: 'Jssl')}',editerType:'text'},
        
        {key:'lastUpdated',value:'${message(code:'ywmsFeeBill.lastUpdated.label', default: 'Last Updated')}',editerType:'date',type:'date'},

        
        {key:'makeDate',value:'${message(code:'ywmsFeeBill.makeDate.label', default: 'Make Date')}',editerType:'date',type:'date'},

        
        {key:'maker.id',value:'${message(code:'ywmsFeeBill.maker.label', default: 'Maker')}',editerType:'ref',refCode:'refSmUser'},

        
        {key:'vnote',value:'${message(code:'ywmsFeeBill.vnote.label', default: 'Vnote')}',editerType:'text'},
        
        {key:'xgywdh',value:'${message(code:'ywmsFeeBill.xgywdh.label', default: 'Xgywdh')}',editerType:'text'},
        
        {key:'ywsl',value:'${message(code:'ywmsFeeBill.ywsl.label', default: 'Ywsl')}',editerType:'text'},
        
        {key:'yxhqrd.id',value:'${message(code:'ywmsFeeBill.yxhqrd.label', default: 'Yxhqrd')}',editerType:'ref',refCode:'refYxhqrd'},

        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'billdate',defaultValue:''},
        
        {operator:'equals',fieldName:'feeType.id',defaultValue:''},
            
        {operator:'equals',fieldName:'jsrq',defaultValue:''},
        
        {operator:'equals',fieldName:'dj',defaultValue:''},
        
        {operator:'equals',fieldName:'yfsl',defaultValue:''},
        
        {operator:'equals',fieldName:'yfje',defaultValue:''},
        
        {operator:'equals',fieldName:'fkdw.id',defaultValue:''},
            
        {operator:'equals',fieldName:'bdCorp.id',defaultValue:''},
            
        {operator:'equals',fieldName:'bg',defaultValue:''},
        
        {operator:'equals',fieldName:'bght.id',defaultValue:''},
            
        {operator:'equals',fieldName:'billTypeCode',defaultValue:''},
        
        {operator:'equals',fieldName:'billno',defaultValue:''},
        
        {operator:'equals',fieldName:'billtype.id',defaultValue:''},
            
        {operator:'equals',fieldName:'businessType.id',defaultValue:''},
            
        {operator:'equals',fieldName:'checkDate',defaultValue:''},
        
        {operator:'equals',fieldName:'checker.id',defaultValue:''},
            
        {operator:'equals',fieldName:'dateCreated',defaultValue:''},
        
        {operator:'equals',fieldName:'djlj',defaultValue:''},
        
        {operator:'equals',fieldName:'hw.id',defaultValue:''},
            
        {operator:'equals',fieldName:'hz.id',defaultValue:''},
            
        {operator:'equals',fieldName:'je',defaultValue:''},
        
        {operator:'equals',fieldName:'jssl',defaultValue:''},
        
        {operator:'equals',fieldName:'lastUpdated',defaultValue:''},
        
        {operator:'equals',fieldName:'makeDate',defaultValue:''},
        
        {operator:'equals',fieldName:'maker.id',defaultValue:''},
            
        {operator:'equals',fieldName:'vnote',defaultValue:''},
        
        {operator:'equals',fieldName:'xgywdh',defaultValue:''},
        
        {operator:'equals',fieldName:'ywsl',defaultValue:''},
        
        {operator:'equals',fieldName:'yxhqrd.id',defaultValue:''},
            

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
