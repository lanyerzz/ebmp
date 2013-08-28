
<%@ page import="com.app.ywms.bd.cddw.YCddw" %>
<script>
    var fs${pageId}=[
    
        {key:'code',value:'${message(code:'YCddw.code.label', default: 'Code')}',editerType:'text'},
        
        {key:'name',value:'${message(code:'YCddw.name.label', default: 'Name')}',editerType:'text'},
        
        {key:'makedate',value:'${message(code:'YCddw.makedate.label', default: 'Makedate')}',editerType:'text'},
        
        {key:'account',value:'${message(code:'YCddw.account.label', default: 'Account')}',editerType:'text'},
        
        {key:'address',value:'${message(code:'YCddw.address.label', default: 'Address')}',editerType:'text'},
        
        {key:'bdCumandoc',value:'${message(code:'YCddw.bdCumandoc.label', default: 'Bd Cumandoc')}',editerType:'text'},
        
        {key:'blockUp',value:'${message(code:'YCddw.blockUp.label', default: 'Block Up')}',editerType:'text'},
        
        {key:'dateCreated',value:'${message(code:'YCddw.dateCreated.label', default: 'Date Created')}',editerType:'text'},
        
        {key:'email',value:'${message(code:'YCddw.email.label', default: 'Email')}',editerType:'text'},
        
        {key:'fax',value:'${message(code:'YCddw.fax.label', default: 'Fax')}',editerType:'text'},
        
        {key:'frdb',value:'${message(code:'YCddw.frdb.label', default: 'Frdb')}',editerType:'text'},
        
        {key:'khyh',value:'${message(code:'YCddw.khyh.label', default: 'Khyh')}',editerType:'text'},
        
        {key:'lastUpdated',value:'${message(code:'YCddw.lastUpdated.label', default: 'Last Updated')}',editerType:'text'},
        
        {key:'linkman',value:'${message(code:'YCddw.linkman.label', default: 'Linkman')}',editerType:'text'},
        
        {key:'linktel',value:'${message(code:'YCddw.linktel.label', default: 'Linktel')}',editerType:'text'},
        
        {key:'maker',value:'${message(code:'YCddw.maker.label', default: 'Maker')}',editerType:'text'},
        
        {key:'note',value:'${message(code:'YCddw.note.label', default: 'Note')}',editerType:'text'},
        
        {key:'swdjh',value:'${message(code:'YCddw.swdjh.label', default: 'Swdjh')}',editerType:'text'},
        
        {key:'url',value:'${message(code:'YCddw.url.label', default: 'Url')}',editerType:'text'},
        
        {key:'yyzz',value:'${message(code:'YCddw.yyzz.label', default: 'Yyzz')}',editerType:'text'},
        
        {key:'zjf',value:'${message(code:'YCddw.zjf.label', default: 'Zjf')}',editerType:'text'},
        
        {key:'zzjgdmz',value:'${message(code:'YCddw.zzjgdmz.label', default: 'Zzjgdmz')}',editerType:'text'},
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'code',defaultValue:''},
        
        {operator:'equals',fieldName:'name',defaultValue:''},
        
        {operator:'equals',fieldName:'makedate',defaultValue:''},
        
        {operator:'equals',fieldName:'account',defaultValue:''},
        
        {operator:'equals',fieldName:'address',defaultValue:''},
        
        {operator:'equals',fieldName:'bdCumandoc',defaultValue:''},
        
        {operator:'equals',fieldName:'blockUp',defaultValue:''},
        
        {operator:'equals',fieldName:'dateCreated',defaultValue:''},
        
        {operator:'equals',fieldName:'email',defaultValue:''},
        
        {operator:'equals',fieldName:'fax',defaultValue:''},
        
        {operator:'equals',fieldName:'frdb',defaultValue:''},
        
        {operator:'equals',fieldName:'khyh',defaultValue:''},
        
        {operator:'equals',fieldName:'lastUpdated',defaultValue:''},
        
        {operator:'equals',fieldName:'linkman',defaultValue:''},
        
        {operator:'equals',fieldName:'linktel',defaultValue:''},
        
        {operator:'equals',fieldName:'maker',defaultValue:''},
        
        {operator:'equals',fieldName:'note',defaultValue:''},
        
        {operator:'equals',fieldName:'swdjh',defaultValue:''},
        
        {operator:'equals',fieldName:'url',defaultValue:''},
        
        {operator:'equals',fieldName:'yyzz',defaultValue:''},
        
        {operator:'equals',fieldName:'zjf',defaultValue:''},
        
        {operator:'equals',fieldName:'zzjgdmz',defaultValue:''},
        

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
