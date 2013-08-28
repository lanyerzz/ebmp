
<%@ page import="com.app.ywms.bd.shipdoc.Yshipdoc" %>
<script>
    var fs${pageId}=[
    
        {key:'buildYear',value:'${message(code:'yshipdoc.buildYear.label', default: 'Build Year')}',editerType:'text'},
        
        {key:'makedate',value:'${message(code:'yshipdoc.makedate.label', default: 'Makedate')}',editerType:'text'},
        
        {key:'shipname',value:'${message(code:'yshipdoc.shipname.label', default: 'Shipname')}',editerType:'text'},
        
        {key:'badj',value:'${message(code:'yshipdoc.badj.label', default: 'Badj')}',editerType:'text'},
        
        {key:'basm',value:'${message(code:'yshipdoc.basm.label', default: 'Basm')}',editerType:'text'},
        
        {key:'bazsh',value:'${message(code:'yshipdoc.bazsh.label', default: 'Bazsh')}',editerType:'text'},
        
        {key:'dateCreated',value:'${message(code:'yshipdoc.dateCreated.label', default: 'Date Created')}',editerType:'text'},
        
        {key:'dl',value:'${message(code:'yshipdoc.dl.label', default: 'Dl')}',editerType:'text'},
        
        {key:'draft',value:'${message(code:'yshipdoc.draft.label', default: 'Draft')}',editerType:'text'},
        
        {key:'grossweight',value:'${message(code:'yshipdoc.grossweight.label', default: 'Grossweight')}',editerType:'text'},
        
        {key:'head',value:'${message(code:'yshipdoc.head.label', default: 'Head')}',editerType:'text'},
        
        {key:'lastUpdated',value:'${message(code:'yshipdoc.lastUpdated.label', default: 'Last Updated')}',editerType:'text'},
        
        {key:'linkman',value:'${message(code:'yshipdoc.linkman.label', default: 'Linkman')}',editerType:'text'},
        
        {key:'linktel',value:'${message(code:'yshipdoc.linktel.label', default: 'Linktel')}',editerType:'text'},
        
        {key:'load',value:'${message(code:'yshipdoc.load.label', default: 'Load')}',editerType:'text'},
        
        {key:'maker',value:'${message(code:'yshipdoc.maker.label', default: 'Maker')}',editerType:'text'},
        
        {key:'netweight',value:'${message(code:'yshipdoc.netweight.label', default: 'Netweight')}',editerType:'text'},
        
        {key:'note',value:'${message(code:'yshipdoc.note.label', default: 'Note')}',editerType:'text'},
        
        {key:'owner',value:'${message(code:'yshipdoc.owner.label', default: 'Owner')}',editerType:'text'},
        
        {key:'shipcountry',value:'${message(code:'yshipdoc.shipcountry.label', default: 'Shipcountry')}',editerType:'text'},
        
        {key:'shipforeignname',value:'${message(code:'yshipdoc.shipforeignname.label', default: 'Shipforeignname')}',editerType:'text'},
        
        {key:'shiplength',value:'${message(code:'yshipdoc.shiplength.label', default: 'Shiplength')}',editerType:'text'},
        
        {key:'shiptype',value:'${message(code:'yshipdoc.shiptype.label', default: 'Shiptype')}',editerType:'text'},
        
        {key:'shipwidth',value:'${message(code:'yshipdoc.shipwidth.label', default: 'Shipwidth')}',editerType:'text'},
        
        {key:'using',value:'${message(code:'yshipdoc.using.label', default: 'Using')}',editerType:'text'},
        
        {key:'yrk',value:'${message(code:'yshipdoc.yrk.label', default: 'Yrk')}',editerType:'text'},
        
        {key:'zjm',value:'${message(code:'yshipdoc.zjm.label', default: 'Zjm')}',editerType:'text'},
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'buildYear',defaultValue:''},
        
        {operator:'equals',fieldName:'makedate',defaultValue:''},
        
        {operator:'equals',fieldName:'shipname',defaultValue:''},
        
        {operator:'equals',fieldName:'badj',defaultValue:''},
        
        {operator:'equals',fieldName:'basm',defaultValue:''},
        
        {operator:'equals',fieldName:'bazsh',defaultValue:''},
        
        {operator:'equals',fieldName:'dateCreated',defaultValue:''},
        
        {operator:'equals',fieldName:'dl',defaultValue:''},
        
        {operator:'equals',fieldName:'draft',defaultValue:''},
        
        {operator:'equals',fieldName:'grossweight',defaultValue:''},
        
        {operator:'equals',fieldName:'head',defaultValue:''},
        
        {operator:'equals',fieldName:'lastUpdated',defaultValue:''},
        
        {operator:'equals',fieldName:'linkman',defaultValue:''},
        
        {operator:'equals',fieldName:'linktel',defaultValue:''},
        
        {operator:'equals',fieldName:'load',defaultValue:''},
        
        {operator:'equals',fieldName:'maker',defaultValue:''},
        
        {operator:'equals',fieldName:'netweight',defaultValue:''},
        
        {operator:'equals',fieldName:'note',defaultValue:''},
        
        {operator:'equals',fieldName:'owner',defaultValue:''},
        
        {operator:'equals',fieldName:'shipcountry',defaultValue:''},
        
        {operator:'equals',fieldName:'shipforeignname',defaultValue:''},
        
        {operator:'equals',fieldName:'shiplength',defaultValue:''},
        
        {operator:'equals',fieldName:'shiptype',defaultValue:''},
        
        {operator:'equals',fieldName:'shipwidth',defaultValue:''},
        
        {operator:'equals',fieldName:'using',defaultValue:''},
        
        {operator:'equals',fieldName:'yrk',defaultValue:''},
        
        {operator:'equals',fieldName:'zjm',defaultValue:''},
        

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
