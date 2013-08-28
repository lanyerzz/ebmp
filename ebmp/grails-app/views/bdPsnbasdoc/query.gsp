
<%@ page import="com.app.bd.psnbasdoc.BdPsnbasdoc" %>
<script>
    var fs${pageId}=[
    
        {key:'name',value:'${message(code:'bdPsnbasdoc.name.label', default: 'Name')}',editerType:'text'},
        
        {key:'birthdate',value:'${message(code:'bdPsnbasdoc.birthdate.label', default: 'Birthdate')}',editerType:'date',type:'date'},
        
        {key:'shenfenzhenghao',value:'${message(code:'bdPsnbasdoc.shenfenzhenghao.label', default: 'Shenfenzhenghao')}',editerType:'text'},
        
        {key:'addr',value:'${message(code:'bdPsnbasdoc.addr.label', default: 'Addr')}',editerType:'text'},
        
        {key:'email',value:'${message(code:'bdPsnbasdoc.email.label', default: 'Email')}',editerType:'text'},
        
        {key:'homephone',value:'${message(code:'bdPsnbasdoc.homephone.label', default: 'Homephone')}',editerType:'text'},
        
        {key:'joinworkdate',value:'${message(code:'bdPsnbasdoc.joinworkdate.label', default: 'Joinworkdate')}',editerType:'date',type:'date'},
        
        {key:'mobile',value:'${message(code:'bdPsnbasdoc.mobile.label', default: 'Mobile')}',editerType:'text'},
        
        {key:'officephone',value:'${message(code:'bdPsnbasdoc.officephone.label', default: 'Officephone')}',editerType:'text'},
        
        {key:'postalcode',value:'${message(code:'bdPsnbasdoc.postalcode.label', default: 'Postalcode')}',editerType:'text'},
        
        {key:'ssnum',value:'${message(code:'bdPsnbasdoc.ssnum.label', default: 'Ssnum')}',editerType:'text'},
        
        {key:'usedname',value:'${message(code:'bdPsnbasdoc.usedname.label', default: 'Usedname')}',editerType:'text'},
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'name',defaultValue:''},
        
        {operator:'equals',fieldName:'birthdate',defaultValue:''},
        
        {operator:'equals',fieldName:'shenfenzhenghao',defaultValue:''},
        
        {operator:'equals',fieldName:'addr',defaultValue:''},
        
        {operator:'equals',fieldName:'email',defaultValue:''},
        
        {operator:'equals',fieldName:'homephone',defaultValue:''},
        
        {operator:'equals',fieldName:'joinworkdate',defaultValue:''},
        
        {operator:'equals',fieldName:'mobile',defaultValue:''},
        
        {operator:'equals',fieldName:'officephone',defaultValue:''},
        
        {operator:'equals',fieldName:'postalcode',defaultValue:''},
        
        {operator:'equals',fieldName:'ssnum',defaultValue:''},
        
        {operator:'equals',fieldName:'usedname',defaultValue:''},
        

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
