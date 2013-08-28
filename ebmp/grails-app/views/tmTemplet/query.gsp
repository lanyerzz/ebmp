
<%@ page import="com.app.tm.templet.TmTemplet" %>
<script>
    var fs${pageId}=[
    
        {key:'templetCode',value:'${message(code:'tmTemplet.templetCode.label', default: 'Templet Code')}',editerType:'text'},
        
        {key:'templetName',value:'${message(code:'tmTemplet.templetName.label', default: 'Templet Name')}',editerType:'text'},
        
        {key:'corp.unitCode',value:'${message(code:'tmTemplet.corp.unitCode.label', default: 'Corp')}',editerType:'text'},

        {key:'corp.unitName',value:'${message(code:'tmTemplet.corp.unitName.label', default: 'Corp')}',editerType:'text'},
        
        {key:'templetPath',value:'${message(code:'tmTemplet.templetPath.label', default: 'Templet Path')}',editerType:'text'},
        
        {key:'templetType',value:'${message(code:'tmTemplet.templetType.label', default: 'Templet Type')}',editerType:'combobox',type:'int',options:{valueField:'id',textField:'text',data:[{id:0,text:'打印模板'},{id:1,text:'查询模板'},{id:2,text:'单据模板'},{id:1,text:'报表模板'}], editable:false,panelHeight:'auto'}},'}
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'templetCode',defaultValue:''},
        
        {operator:'equals',fieldName:'templetName',defaultValue:''},
        
        {operator:'equals',fieldName:'corp.unitCode',defaultValue:''},

        {operator:'equals',fieldName:'corp.unitName',defaultValue:''},
        
        {operator:'equals',fieldName:'templetPath',defaultValue:''},
        
        {operator:'equals',fieldName:'templetType',defaultValue:''},
        

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
