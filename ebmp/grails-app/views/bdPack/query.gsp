
<%@ page import="com.app.bd.pack.BdPack" %>
<script>
    var fs${pageId}=[
    
        {key:'bdCorp',value:'${message(code:'bdPack.bdCorp.label', default: 'Bd Corp')}',editerType:'text'},
        
        {key:'code',value:'${message(code:'bdPack.code.label', default: 'Code')}',editerType:'text'},
        
        {key:'dateCreated',value:'${message(code:'bdPack.dateCreated.label', default: 'Date Created')}',editerType:'text'},
        
        {key:'invbasdoc',value:'${message(code:'bdPack.invbasdoc.label', default: 'Invbasdoc')}',editerType:'text'},
        
        {key:'invcl',value:'${message(code:'bdPack.invcl.label', default: 'Invcl')}',editerType:'text'},
        
        {key:'invmandoc',value:'${message(code:'bdPack.invmandoc.label', default: 'Invmandoc')}',editerType:'text'},
        
        {key:'lastUpdated',value:'${message(code:'bdPack.lastUpdated.label', default: 'Last Updated')}',editerType:'text'},
        
        {key:'name',value:'${message(code:'bdPack.name.label', default: 'Name')}',editerType:'text'},
        
        {key:'note',value:'${message(code:'bdPack.note.label', default: 'Note')}',editerType:'text'},
        
        {key:'pid',value:'${message(code:'bdPack.pid.label', default: 'Pid')}',editerType:'text'},
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'bdCorp',defaultValue:''},
        
        {operator:'equals',fieldName:'code',defaultValue:''},
        
        {operator:'equals',fieldName:'dateCreated',defaultValue:''},
        
        {operator:'equals',fieldName:'invbasdoc',defaultValue:''},
        
        {operator:'equals',fieldName:'invcl',defaultValue:''},
        
        {operator:'equals',fieldName:'invmandoc',defaultValue:''},
        
        {operator:'equals',fieldName:'lastUpdated',defaultValue:''},
        
        {operator:'equals',fieldName:'name',defaultValue:''},
        
        {operator:'equals',fieldName:'note',defaultValue:''},
        
        {operator:'equals',fieldName:'pid',defaultValue:''},
        

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
