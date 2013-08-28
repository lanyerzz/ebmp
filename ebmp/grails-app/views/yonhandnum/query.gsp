
<%@ page import="com.app.ywms.kc.Yonhandnum" %>
<script>
    var fs${pageId}=[
    
        {key:'invmandoc.id',value:'${message(code:'yonhandnum.invmandoc.label', default: 'Invmandoc')}',editerType:'ref',refCode:'refBdInvmandoc'},

        
        {key:'gh.id',value:'${message(code:'yonhandnum.gh.label', default: 'Gh')}',editerType:'ref',refCode:'refYBdTank'},

        
        {key:'fxsl',value:'${message(code:'yonhandnum.fxsl.label', default: 'Fxsl')}',editerType:'text'},
        
        {key:'kcl',value:'${message(code:'yonhandnum.kcl.label', default: 'Kcl')}',editerType:'text'},
        
        {key:'bdCorp.id',value:'${message(code:'yonhandnum.bdCorp.label', default: 'Bd Corp')}',editerType:'ref',refCode:'refBdCorp'},

        
        {key:'dateCreated',value:'${message(code:'yonhandnum.dateCreated.label', default: 'Date Created')}',editerType:'date',type:'date'},

        
        {key:'lastUpdated',value:'${message(code:'yonhandnum.lastUpdated.label', default: 'Last Updated')}',editerType:'date',type:'date'},

        
        {key:'lockNum',value:'${message(code:'yonhandnum.lockNum.label', default: 'Lock Num')}',editerType:'text'},
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'invmandoc.id',defaultValue:''},
            
        {operator:'equals',fieldName:'gh.id',defaultValue:''},
            
        {operator:'equals',fieldName:'fxsl',defaultValue:''},
        
        {operator:'equals',fieldName:'kcl',defaultValue:''},
        
        {operator:'equals',fieldName:'bdCorp.id',defaultValue:''},
            
        {operator:'equals',fieldName:'dateCreated',defaultValue:''},
        
        {operator:'equals',fieldName:'lastUpdated',defaultValue:''},
        
        {operator:'equals',fieldName:'lockNum',defaultValue:''},
        

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
