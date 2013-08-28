
<%@ page import="com.app.ywms.rk.cbdgd.Ycbdgd" %>
<script>
    var fs${pageId}=[
    
        {key:'billno',value:'${message(code:'ycbdgd.billno.label', default: 'Billno')}',editerType:'text'},
        
        %{--{key:'billdate',value:'${message(code:'ycbdgd.billdate.label', default: 'Billdate')}',editerType:'text'},--}%
        
        %{--{key:'yjdgrq',value:'${message(code:'ycbdgd.yjdgrq.label', default: 'Yjdgrq')}',editerType:'text'},--}%
        
        %{--{key:'bdCorp',value:'${message(code:'ycbdgd.bdCorp.label', default: 'Bd Corp')}',editerType:'text'},--}%

        {key:'ccqyhth',value:'${message(code:'ycbdgd.ccqyhth.label', default: 'Ccqyhth')}',editerType:'text'},
        
        {key:'chuanming',value:'${message(code:'ycbdgd.chuanming.label', default: 'Chuanming')}',editerType:'text'},
        
        {key:'contractType',value:'${message(code:'ycbdgd.contractType.label', default: 'Contract Type')}',editerType:'text'},
        
        %{--{key:'htqdrq',value:'${message(code:'ycbdgd.htqdrq.label', default: 'Htqdrq')}',editerType:'text'},--}%
        
        %{--{key:'hzdw',value:'${message(code:'ycbdgd.hzdw.label', default: 'Hzdw')}',editerType:'text'},--}%
        
        {key:'note',value:'${message(code:'ycbdgd.note.label', default: 'Note')}',editerType:'text'},

        %{--{key:'pubBilltype',value:'${message(code:'ycbdgd.pubBilltype.label', default: 'Pub Billtype')}',editerType:'text'},--}%
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'billno',defaultValue:''},
        
//        {operator:'equals',fieldName:'billdate',defaultValue:''},
        
//        {operator:'equals',fieldName:'yjdgrq',defaultValue:''},
        
//        {operator:'equals',fieldName:'bdCorp',defaultValue:''},
        
//        {operator:'equals',fieldName:'ccqyhth',defaultValue:''},
        
        {operator:'equals',fieldName:'chuanming',defaultValue:''},
        
        {operator:'equals',fieldName:'contractType',defaultValue:''},
        
//        {operator:'equals',fieldName:'htqdrq',defaultValue:''},
        
//        {operator:'equals',fieldName:'hzdw',defaultValue:''},
        
        {operator:'equals',fieldName:'note',defaultValue:''},
        
//        {operator:'equals',fieldName:'pubBilltype',defaultValue:''},
        

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
