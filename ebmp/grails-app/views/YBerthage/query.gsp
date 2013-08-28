
<%@ page import="com.app.ywms.bd.berthage.YBerthage" %>
<script>
    var fs${pageId}=[
    
        {key:'code',value:'${message(code:'YBerthage.code.label', default: 'Code')}',editerType:'text'},
        
        {key:'name',value:'${message(code:'YBerthage.name.label', default: 'Name')}',editerType:'text'},
        
        {key:'bdCorp',value:'${message(code:'YBerthage.bdCorp.label', default: 'Bd Corp')}',editerType:'text'},
        
        {key:'dateCreated',value:'${message(code:'YBerthage.dateCreated.label', default: 'Date Created')}',editerType:'text'},
        
        {key:'describe',value:'${message(code:'YBerthage.describe.label', default: 'Describe')}',editerType:'text'},
        
        {key:'isuse',value:'${message(code:'YBerthage.isuse.label', default: 'Isuse')}',editerType:'text'},
        
        {key:'jswz',value:'${message(code:'YBerthage.jswz.label', default: 'Jswz')}',editerType:'text'},
        
        {key:'kswz',value:'${message(code:'YBerthage.kswz.label', default: 'Kswz')}',editerType:'text'},
        
        {key:'lastUpdated',value:'${message(code:'YBerthage.lastUpdated.label', default: 'Last Updated')}',editerType:'text'},
        
        {key:'zdss',value:'${message(code:'YBerthage.zdss.label', default: 'Zdss')}',editerType:'text'},
        
        {key:'zdtbdw',value:'${message(code:'YBerthage.zdtbdw.label', default: 'Zdtbdw')}',editerType:'text'},
        
        {key:'zxss',value:'${message(code:'YBerthage.zxss.label', default: 'Zxss')}',editerType:'text'},
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'code',defaultValue:''},
        
        {operator:'equals',fieldName:'name',defaultValue:''},
        
        {operator:'equals',fieldName:'bdCorp',defaultValue:''},
        
        {operator:'equals',fieldName:'dateCreated',defaultValue:''},
        
        {operator:'equals',fieldName:'describe',defaultValue:''},
        
        {operator:'equals',fieldName:'isuse',defaultValue:''},
        
        {operator:'equals',fieldName:'jswz',defaultValue:''},
        
        {operator:'equals',fieldName:'kswz',defaultValue:''},
        
        {operator:'equals',fieldName:'lastUpdated',defaultValue:''},
        
        {operator:'equals',fieldName:'zdss',defaultValue:''},
        
        {operator:'equals',fieldName:'zdtbdw',defaultValue:''},
        
        {operator:'equals',fieldName:'zxss',defaultValue:''},
        

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
