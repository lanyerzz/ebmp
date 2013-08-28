
<%@ page import="com.app.ywms.rk.xhjhd.Yxhjhd" %>
<script>
    var fs${pageId}=[
        {key:'businessType.id',value:'${message(code:'soSale.businessType.label', default: 'Business Type')}',editerType:'ref',refCode:'refPubBusinessType',billtypecode:'S01'},

        {key:'billno',value:'${message(code:'yxhjhd.billno.label', default: 'Billno')}',editerType:'text'},
        
        {key:'shipdoc.id',value:'${message(code:'yxhjhd.shipdoc.label', default: 'Shipdoc')}',editerType:'ref',refCode:'refYshipdoc'},
        
        {key:'yjdgrq',value:'${message(code:'yxhjhd.yjdgrq.label', default: 'Yjdgrq')}',editerType:'date',type:'date'},


        {key:'cddw.id',value:'${message(code:'yxhjhd.cddw.label', default: 'Cddw')}',editerType:'ref',refCode:'refBdCumandoc'},

        
        {key:'ddtzsj',value:'${message(code:'yxhjhd.ddtzsj.label', default: 'Ddtzsj')}',editerType:'text'},
        
        {key:'fsdx',value:'${message(code:'yxhjhd.fsdx.label', default: 'Fsdx')}',editerType:'boolean',type:'boolean'},
        
        {key:'lygk',value:'${message(code:'yxhjhd.lygk.label', default: 'Lygk')}',editerType:'text'},
        
        {key:'makedate',value:'${message(code:'yxhjhd.makedate.label', default: 'Makedate')}',editerType:'date',type:'date'},
        
        {key:'maker.id',value:'${message(code:'yxhjhd.maker.userRealName.label', default: 'Maker')}',editerType:'ref',refCode:'refSmUser'},
        
        {key:'myxz',value:'${message(code:'yxhjhd.myxz.label', default: 'Myxz')}',editerType:'combobox',type:'number',options:{valueField:'index',textField:'value',data:[{index:0,value:'内贸'},{index:1,value:'外贸'}],editable:false,panelHeight:'auto'}},
        

        
        {key:'qtms',value:'${message(code:'yxhjhd.qtms.label', default: 'Qtms')}',editerType:'text'},
        
        {key:'checkDate',value:'${message(code:'yxhjhd.signdate.label', default: 'Signdate')}',editerType:'date',type:'date'},
        
        {key:'checker.id',value:'${message(code:'yxhjhd.signer.label', default: 'Signer')}',editerType:'ref',refCode:'refSmUser'},
        
        {key:'yykhqr',value:'${message(code:'yxhjhd.yykhqr.label', default: 'Yykhqr')}',editerType:'boolean',type:'boolean'}
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
        {operator:'equals',fieldName:'businessType.id',defaultValue:''},
        {operator:'equals',fieldName:'billno',defaultValue:''},
        
        {operator:'equals',fieldName:'shipdoc.id',defaultValue:''},
        
        {operator:'equals',fieldName:'yjdgrq',defaultValue:''},

        {operator:'equals',fieldName:'cddw.id',defaultValue:''},

        {operator:'equals',fieldName:'ddtzsj',defaultValue:''},
        
        {operator:'equals',fieldName:'fsdx',defaultValue:''},
        
        {operator:'equals',fieldName:'lygk',defaultValue:''},
        
        {operator:'equals',fieldName:'makedate',defaultValue:''},
        
        {operator:'equals',fieldName:'maker.id',defaultValue:''},
        
        {operator:'equals',fieldName:'myxz',defaultValue:''},

        
        {operator:'equals',fieldName:'qtms',defaultValue:''},
        

        
        {operator:'equals',fieldName:'yykhqr',defaultValue:''}
        

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
