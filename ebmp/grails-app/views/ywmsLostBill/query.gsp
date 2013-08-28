
<%@ page import="com.app.ywms.cm.lossbill.YwmsLostBill" %>
<script>
    var fs${pageId}=[
    

        {key:'billdate',value:'${message(code:'ywmsLostBIll.billdate.label', default: 'Billdate')}',editerType:'date',type:'date'},

        
        {key:'billno',value:'${message(code:'ywmsLostBIll.billno.label', default: 'Billno')}',editerType:'text'},
        

        

        
        {key:'checkDate',value:'${message(code:'ywmsLostBIll.checkDate.label', default: 'Check Date')}',editerType:'date',type:'date'},

        
        {key:'checker.id',value:'${message(code:'ywmsLostBIll.checker.label', default: 'Checker')}',editerType:'ref',refCode:'refSmUser'},

        
        {key:'contract.id',value:'${message(code:'ywmsLostBIll.contract.label', default: 'Contract')}',editerType:'ref',refCode:'refYAllContract'},

        



        
        {key:'lostDate',value:'${message(code:'ywmsLostBIll.lostDate.label', default: 'Lost Date')}',editerType:'date',type:'date'},

        
        {key:'lostType',value:'${message(code:'ywmsLostBIll.lostType.label', default: 'Lost Type')}',editerType:'combobox',type:'int',
            options:{
                valueField:'id',
                textField:'text',
                data:[{id:0,text:'合同损耗'},{id:1,text:'保管损耗'},{id:2,text:'装卸损耗'},{id:3,text:'其他损耗'}],
                editable:false,
                panelHeight:'auto'
            }
        },
        
        {key:'makeDate',value:'${message(code:'ywmsLostBIll.makeDate.label', default: 'Make Date')}',editerType:'date',type:'date'},

        
        {key:'maker.id',value:'${message(code:'ywmsLostBIll.maker.label', default: 'Maker')}',editerType:'ref',refCode:'refSmUser'},

        
        {key:'pch',value:'${message(code:'ywmsLostBIll.pch.label', default: 'Pch')}',editerType:'text'}
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            

            

        
        {operator:'equals',fieldName:'billdate',defaultValue:''},
        
        {operator:'equals',fieldName:'billno',defaultValue:''},
            {operator:'equals',fieldName:'contract.id',defaultValue:''},

            {operator:'equals',fieldName:'pch',defaultValue:''},
            {operator:'equals',fieldName:'lostDate',defaultValue:''},

            {operator:'equals',fieldName:'lostType',defaultValue:''},
            

        
        {operator:'equals',fieldName:'makeDate',defaultValue:''},
        
        {operator:'equals',fieldName:'maker.id',defaultValue:''},


            {operator:'equals',fieldName:'checkDate',defaultValue:''},

            {operator:'equals',fieldName:'checker.id',defaultValue:''}

        

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
