
<%@ page import="com.app.ywms.kc.Ycrkmx" %>
<script>
    var fs${pageId}=[
    
        {key:'ht.id',value:'${message(code:'ycrkmx.ht.label', default: 'Ht')}',editerType:'ref',refCode:'refYAllContract'},

        
        {key:'invmandoc.id',value:'${message(code:'ycrkmx.invmandoc.label', default: 'Invmandoc')}',editerType:'ref',refCode:'refBdInvmandoc'},

        
        {key:'hz.id',value:'${message(code:'ycrkmx.hz.label', default: 'Hz')}',editerType:'ref',refCode:'refBdCumandoc'},

        
        {key:'gh.id',value:'${message(code:'ycrkmx.gh.label', default: 'Gh')}',editerType:'ref',refCode:'refYBdTank'},

        {key:'crklx',value:'${message(code:'ycrkmx.crklx.label', default: 'Crklx')}',editerType:'text'},

        
        {key:'billdate',value:'${message(code:'ycrkmx.billdate.label', default: 'Billdate')}',editerType:'date',type:'date'},


        

        {key:'pc',value:'${message(code:'ycrkmx.pc.label', default: 'Pc')}',editerType:'text'},
        
        {key:'shl',value:'${message(code:'ycrkmx.shl.label', default: 'Shl')}',editerType:'text'},
        


        {key:'zgzf',value:'${message(code:'ycrkmx.zgzf.label', default: 'Zgzf')}',editerType:'boolean',type:'boolean'}
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'ht.id',defaultValue:''},
            
        {operator:'equals',fieldName:'invmandoc.id',defaultValue:''},
            
        {operator:'equals',fieldName:'hz.id',defaultValue:''},
            
        {operator:'equals',fieldName:'gh.id',defaultValue:''},
            

        {operator:'equals',fieldName:'billdate',defaultValue:''},

        {operator:'equals',fieldName:'pc',defaultValue:''},
        

        {operator:'equals',fieldName:'zgzf',defaultValue:''}
        

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
