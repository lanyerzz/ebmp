
<%@ page import="com.app.ywms.rk.xhqrd.Yxhqrd" %>
<script>
    var fs${pageId}=[
        {key:'billdate',value:'${message(code:'yxhqrd.billdate.label', default: 'billdate')}',editerType:'date'},

        {key:'billNo',value:'${message(code:'yxhqrd.billNo.label', default: 'billNo')}',editerType:'text'},


        {key:'bdCumandoc.id',value:'${message(code:'yxhqrd.bdCumandoc.label', default: 'Bd Cumandoc')}',editerType:'ref',refCode:'refBdCustomer'},
        
        {key:'bdInvmandoc.id',value:'${message(code:'yxhqrd.bdInvmandoc.label', default: 'Bd Invmandoc')}',editerType:'ref',refCode:'refBdInvmandoc'},
        

        {key:'cddw.id',value:'${message(code:'yxhqrd.cddw.label', default: 'Cddw')}',editerType:'ref',refCode:'refBdCustomer'},
        
        {key:'contract',value:'${message(code:'yxhqrd.contract.label', default: 'Contract')}',editerType:'ref',refCode:'refYContract'},
        

        
        {key:'gh.id',value:'${message(code:'yxhqrd.gh.label', default: 'Gh')}',editerType:'ref',refCode:'refYBdTank'},
        

        
        {key:'hc',value:'${message(code:'yxhqrd.hc.label', default: 'Hc')}',editerType:'text'},
        


        
        {key:'myxz',value:'${message(code:'yxhqrd.myxz.label', default: 'Myxz')}',editerType:'text'},
        

        
        {key:'qrrq',value:'${message(code:'yxhqrd.qrrq.label', default: 'Qrrq')}',editerType:'text'},
        
        {key:'sdsl',value:'${message(code:'yxhqrd.sdsl.label', default: 'Sdsl')}',editerType:'text'},
        
        {key:'sdyy',value:'${message(code:'yxhqrd.sdyy.label', default: 'Sdyy')}',editerType:'text'},
        
        {key:'ship.id',value:'${message(code:'yxhqrd.ship.label', default: 'Ship')}',editerType:'ref',refCode:'refYshipdoc'},
        
        {key:'sjdw.id',value:'${message(code:'yxhqrd.sjdw.label', default: 'Sjdw')}',editerType:'ref',refCode:'refBdCustomer'}
        

        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[

            {operator:'equals',fieldName:'billdate',defaultValue:''},
            {operator:'equals',fieldName:'billNo',defaultValue:''},
            
        {operator:'equals',fieldName:'bdCumandoc.id',defaultValue:''},
        
        {operator:'equals',fieldName:'bdInvmandoc.id',defaultValue:''},

        
        {operator:'equals',fieldName:'cddw.id',defaultValue:''}
        

        

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
