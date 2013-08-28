
<%@ page import="com.app.bd.cumandoc.BdCumandoc" %>
<script>
    var fs${pageId}=[
    
        {key:'cmneCode',value:'${message(code:'bdCumandoc.cmneCode.label', default: 'Cmne Code')}',editerType:'text'},
        
        {key:'iscustomer',value:'${message(code:'bdCumandoc.iscustomer.label', default: 'Iscustomer')}',editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},

        {key:'isvender',value:'${message(code:'bdCumandoc.isvender.label', default: 'Isvender')}',editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},
        
        {key:'linkMan',value:'${message(code:'bdCumandoc.linkMan.label', default: 'Link Man')}',editerType:'text'},
        
        {key:'memo',value:'${message(code:'bdCumandoc.memo.label', default: 'Memo')}',editerType:'text'},
        
        {key:'mobilePhone',value:'${message(code:'bdCumandoc.mobilePhone.label', default: 'Mobile Phone')}',editerType:'text'},
        
        {key:'pkCorp.unitCode',value:'${message(code:'bdCumandoc.pkCorp.unitCode.label', default: 'Pk Corp')}',editerType:'text'},

        {key:'pkCorp.unitName',value:'${message(code:'bdCumandoc.pkCorp.unitName.label', default: 'Pk Corp')}',editerType:'text'},

        {key:'pkCubasdoc.custname',value:'${message(code:'bdCumandoc.pkCubasdoc.custname.label', default: 'Pk Cubasdoc')}',editerType:'text'},

        {key:'pkCubasdoc.custcode',value:'${message(code:'bdCumandoc.pkCubasdoc.custcode.label', default: 'Pk Cubasdoc')}',editerType:'text'}
        

        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'cmneCode',defaultValue:''},
        
        {operator:'equals',fieldName:'iscustomer',defaultValue:''},

        {operator:'equals',fieldName:'isvender',defaultValue:''},
        
        {operator:'equals',fieldName:'linkMan',defaultValue:''},
        
        {operator:'equals',fieldName:'memo',defaultValue:''},
        
        {operator:'equals',fieldName:'mobilePhone',defaultValue:''},

        {operator:'equals',fieldName:'pkCorp.unitCode',defaultValue:''},

        {operator:'equals',fieldName:'pkCorp.unitName',defaultValue:''},

        {operator:'equals',fieldName:'pkCubasdoc.custcode',defaultValue:''},

        {operator:'equals',fieldName:'pkCubasdoc.custname',defaultValue:''}
        


        ]
    };
    var _fs${pageId} = arrayToJson('key', fs${pageId});

    var rl${pageId} = [
        {key: 'and', value: '与'},
        {key: 'or', value: '或'},
        {key: 'not', value: '非'}
    ];


    var opt${pageId} = [
        {key: 'equals', value: '等于'},
        {key: 'contains', value: '包含'},
        {key: 'notEqual', value: '不等于'},
        {key: 'greaterThan', value: '大于'},
        {key: 'lessThan', value: '小于'},
        {key: 'greaterOrEqual', value: '大于等于'},
        {key: 'lessOrEqual', value: '小于等于'},
        {key: 'startsWith', value: '以...开始'},
        {key: 'endsWith', value: '以...结束'},
        {key: 'iContains', value: '包含（不区分大小写）'},
        {key: 'notContains', value: '大于等于'},
        {key: 'isNull', value: '空'},
        {key: 'inSet', value: '在...'},
        {key: 'notStartsWith', value: '不以...开始'},
        {key: 'notEndsWith', value: '不以...结束'}
    ];
    var _opt${pageId} = arrayToJson('key', opt${pageId});

    /**
     *查询条件的字段发生变化触发事件
     * @param newValue
     * @param oldValue
     */
    function onQueryFieldChanged${pageId}(newValue, oldValue) {

        var parent = $(this).closest('div');

        var target = parent.find('[name=value]')[0];

        changeFormItemEditer(newValue, oldValue, parent, fs${pageId})
    }

    $(function () {

        addBigQuery("${pageId}", $("#qv${pageId}"), true, dd${pageId}, rl${pageId}, fs${pageId}, _fs${pageId}, opt${pageId}, onQueryFieldChanged${pageId});
    });

    /**
     *增加组合条件
     * @param id
     */
    function onAddBigQuery${pageId}(id) {
        //addBigQuery("${pageId}",$('#'+id),false,car_defaultData,car_relation,car_source,car_source_,car_operator,onQueryFieldChanged${pageId})
        addBigQuery("${pageId}",$('#'+id),false,dd${pageId}, rl${pageId}, fs${pageId}, _fs${pageId}, opt${pageId}, onQueryFieldChanged${pageId});
    }

    /**
     *增加条件
     * @param id
     */
        //createQueryRow(pageId,bf,defaultData,firstRow,fieldSource,fieldSource_,operator,onQueryFieldChanged){
    function onAddQuery${pageId}(id) {
        createQueryRow("${pageId}",$('#'+id),dd${pageId}.criterias[0], false, fs${pageId}, _fs${pageId}, opt${pageId}, onQueryFieldChanged${pageId});

    }

    function getCriter${pageId}() {

        var div = $('#c${pageId}').children('div')[0];

        var criter = {};
        createCriteria(div, criter, fs${pageId});

        return criter;


    }

</script>


<div id="c${pageId}">

    <span id="qv${pageId}"/>

</div>

