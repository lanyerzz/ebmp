
<%@ page import="com.app.tm.templetallot.TmTempletallot" %>
<script>
    var fs${pageId}=[
    
        {key:'function.funCode',value:'${message(code:'tmTempletallot.function.funCode.label', default: 'Function')}',editerType:'text'},

        {key:'function.funName',value:'${message(code:'tmTempletallot.function.funName.label', default: 'Function')}',editerType:'text'},
        
        {key:'templetType',value:'${message(code:'tmTempletallot.templetType.label', default: 'Templet Type')}',editerType:'combobox',type:'int',options:{valueField:'id',textField:'text',data:[{id:'0',text:'打印模板'},{id:'1',text:'查询模板'},{id:'2',text:'单据模板'},{id:'3',text:'报表模板'}], editable:false,panelHeight:'auto'}},
        
        {key:'tmTemplet.templetCode',value:'${message(code:'tmTempletallot.tmTemplet.templetCode.label', default: 'Tm Templet')}',editerType:'text'},

        {key:'tmTemplet.templetName',value:'${message(code:'tmTempletallot.tmTemplet.templetName.label', default: 'Tm Templet')}',editerType:'text'},
        
        {key:'code',value:'${message(code:'tmTempletallot.code.label', default: 'Code')}',editerType:'text'},
        
        {key:'corp.unitCode',value:'${message(code:'tmTempletallot.corp.unitCode.label', default: 'Corp')}',editerType:'text'},

        {key:'corp.unitName',value:'${message(code:'tmTempletallot.corp.unitName.label', default: 'Corp')}',editerType:'text'},
        
        {key:'role.roleCode',value:'${message(code:'tmTempletallot.role.roleCode.label', default: 'Role')}',editerType:'text'},

        {key:'role.roleName',value:'${message(code:'tmTempletallot.role.roleName.label', default: 'Role')}',editerType:'text'},
        
        {key:'user.username',value:'${message(code:'tmTempletallot.user.username.label', default: 'User')}',editerType:'text'},

        {key:'user.userRealName',value:'${message(code:'tmTempletallot.user.userRealName.label', default: 'User')}',editerType:'text'},
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'function.funCode',defaultValue:''},

        {operator:'equals',fieldName:'function.funName',defaultValue:''},
        
        {operator:'equals',fieldName:'templetType',defaultValue:''},
        
        {operator:'equals',fieldName:'tmTemplet.templetCode',defaultValue:''},

        {operator:'equals',fieldName:'tmTemplet.templetName',defaultValue:''},

        {operator:'equals',fieldName:'code',defaultValue:''},
        
        {operator:'equals',fieldName:'corp.unitCode',defaultValue:''},

        {operator:'equals',fieldName:'corp.unitName',defaultValue:''},
        
        {operator:'equals',fieldName:'role.roleCode',defaultValue:''},

        {operator:'equals',fieldName:'role.roleName',defaultValue:''},
        
        {operator:'equals',fieldName:'user.username',defaultValue:''},

        {operator:'equals',fieldName:'user.userRealName',defaultValue:''},
        

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
