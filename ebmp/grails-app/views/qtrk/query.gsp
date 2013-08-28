
<%@ page import="com.app.ic.bill.IcGeneralHead" %>
<script>
    var fs${pageId}=[
    
        {key:'bdCorp',value:'${message(code:'icGeneralHead.bdCorp.label', default: 'Bd Corp')}',editerType:'text'},
        
        {key:'billType',value:'${message(code:'icGeneralHead.billType.label', default: 'Bill Type')}',editerType:'text'},
        
        {key:'billTypeCode',value:'${message(code:'icGeneralHead.billTypeCode.label', default: 'Bill Type Code')}',editerType:'text'},
        
        {key:'billdate',value:'${message(code:'icGeneralHead.billdate.label', default: 'Billdate')}',editerType:'text'},
        
        {key:'billno',value:'${message(code:'icGeneralHead.billno.label', default: 'Billno')}',editerType:'text'},
        
        {key:'billtype',value:'${message(code:'icGeneralHead.billtype.label', default: 'Billtype')}',editerType:'text'},
        
        {key:'boutretFlag',value:'${message(code:'icGeneralHead.boutretFlag.label', default: 'Boutret Flag')}',editerType:'text'},
        
        {key:'businessType',value:'${message(code:'icGeneralHead.businessType.label', default: 'Business Type')}',editerType:'text'},
        
        {key:'cauditor',value:'${message(code:'icGeneralHead.cauditor.label', default: 'Cauditor')}',editerType:'text'},
        
        {key:'cbillTypeCode',value:'${message(code:'icGeneralHead.cbillTypeCode.label', default: 'Cbill Type Code')}',editerType:'text'},
        
        {key:'cbiz',value:'${message(code:'icGeneralHead.cbiz.label', default: 'Cbiz')}',editerType:'text'},
        
        {key:'ccustomer',value:'${message(code:'icGeneralHead.ccustomer.label', default: 'Ccustomer')}',editerType:'text'},
        
        {key:'cdept',value:'${message(code:'icGeneralHead.cdept.label', default: 'Cdept')}',editerType:'text'},
        
        {key:'checkDate',value:'${message(code:'icGeneralHead.checkDate.label', default: 'Check Date')}',editerType:'text'},
        
        {key:'checker',value:'${message(code:'icGeneralHead.checker.label', default: 'Checker')}',editerType:'text'},
        
        {key:'clastmodi',value:'${message(code:'icGeneralHead.clastmodi.label', default: 'Clastmodi')}',editerType:'text'},
        
        {key:'coperator',value:'${message(code:'icGeneralHead.coperator.label', default: 'Coperator')}',editerType:'text'},
        
        {key:'corp',value:'${message(code:'icGeneralHead.corp.label', default: 'Corp')}',editerType:'text'},
        
        {key:'cprovider',value:'${message(code:'icGeneralHead.cprovider.label', default: 'Cprovider')}',editerType:'text'},
        
        {key:'cwarehouse',value:'${message(code:'icGeneralHead.cwarehouse.label', default: 'Cwarehouse')}',editerType:'text'},
        
        {key:'cwastewarehouse',value:'${message(code:'icGeneralHead.cwastewarehouse.label', default: 'Cwastewarehouse')}',editerType:'text'},
        
        {key:'cwhsmanager',value:'${message(code:'icGeneralHead.cwhsmanager.label', default: 'Cwhsmanager')}',editerType:'text'},
        
        {key:'daccountDate',value:'${message(code:'icGeneralHead.daccountDate.label', default: 'Daccount Date')}',editerType:'text'},
        
        {key:'dateCreated',value:'${message(code:'icGeneralHead.dateCreated.label', default: 'Date Created')}',editerType:'text'},
        
        {key:'dauditDate',value:'${message(code:'icGeneralHead.dauditDate.label', default: 'Daudit Date')}',editerType:'text'},
        
        {key:'dbillDate',value:'${message(code:'icGeneralHead.dbillDate.label', default: 'Dbill Date')}',editerType:'text'},
        
        {key:'fbillFlag',value:'${message(code:'icGeneralHead.fbillFlag.label', default: 'Fbill Flag')}',editerType:'text'},
        
        {key:'freplenishFlag',value:'${message(code:'icGeneralHead.freplenishFlag.label', default: 'Freplenish Flag')}',editerType:'text'},
        
        {key:'iprintCount',value:'${message(code:'icGeneralHead.iprintCount.label', default: 'Iprint Count')}',editerType:'text'},
        
        {key:'lastUpdated',value:'${message(code:'icGeneralHead.lastUpdated.label', default: 'Last Updated')}',editerType:'text'},
        
        {key:'makeDate',value:'${message(code:'icGeneralHead.makeDate.label', default: 'Make Date')}',editerType:'text'},
        
        {key:'maker',value:'${message(code:'icGeneralHead.maker.label', default: 'Maker')}',editerType:'text'},
        
        {key:'ndiscountmny',value:'${message(code:'icGeneralHead.ndiscountmny.label', default: 'Ndiscountmny')}',editerType:'text'},
        
        {key:'nnetmny',value:'${message(code:'icGeneralHead.nnetmny.label', default: 'Nnetmny')}',editerType:'text'},
        
        {key:'process_id',value:'${message(code:'icGeneralHead.process_id.label', default: 'Processid')}',editerType:'text'},
        
        {key:'process_type',value:'${message(code:'icGeneralHead.process_type.label', default: 'Processtype')}',editerType:'text'},
        
        {key:'purchaser',value:'${message(code:'icGeneralHead.purchaser.label', default: 'Purchaser')}',editerType:'text'},
        
        {key:'sourceSystem',value:'${message(code:'icGeneralHead.sourceSystem.label', default: 'Source System')}',editerType:'text'},
        
        {key:'taccountTime',value:'${message(code:'icGeneralHead.taccountTime.label', default: 'Taccount Time')}',editerType:'text'},
        
        {key:'vbillCode',value:'${message(code:'icGeneralHead.vbillCode.label', default: 'Vbill Code')}',editerType:'text'},
        
        {key:'vdiliverAddress',value:'${message(code:'icGeneralHead.vdiliverAddress.label', default: 'Vdiliver Address')}',editerType:'text'},
        
        {key:'vnote',value:'${message(code:'icGeneralHead.vnote.label', default: 'Vnote')}',editerType:'text'},
        
        {key:'xdept',value:'${message(code:'icGeneralHead.xdept.label', default: 'Xdept')}',editerType:'text'},
        
        ];
    var dd${pageId}={
        relation:'and',
        criterias:[
            
        {operator:'equals',fieldName:'bdCorp',defaultValue:''},
        
        {operator:'equals',fieldName:'billType',defaultValue:''},
        
        {operator:'equals',fieldName:'billTypeCode',defaultValue:''},
        
        {operator:'equals',fieldName:'billdate',defaultValue:''},
        
        {operator:'equals',fieldName:'billno',defaultValue:''},
        
        {operator:'equals',fieldName:'billtype',defaultValue:''},
        
        {operator:'equals',fieldName:'boutretFlag',defaultValue:''},
        
        {operator:'equals',fieldName:'businessType',defaultValue:''},
        
        {operator:'equals',fieldName:'cauditor',defaultValue:''},
        
        {operator:'equals',fieldName:'cbillTypeCode',defaultValue:''},
        
        {operator:'equals',fieldName:'cbiz',defaultValue:''},
        
        {operator:'equals',fieldName:'ccustomer',defaultValue:''},
        
        {operator:'equals',fieldName:'cdept',defaultValue:''},
        
        {operator:'equals',fieldName:'checkDate',defaultValue:''},
        
        {operator:'equals',fieldName:'checker',defaultValue:''},
        
        {operator:'equals',fieldName:'clastmodi',defaultValue:''},
        
        {operator:'equals',fieldName:'coperator',defaultValue:''},
        
        {operator:'equals',fieldName:'corp',defaultValue:''},
        
        {operator:'equals',fieldName:'cprovider',defaultValue:''},
        
        {operator:'equals',fieldName:'cwarehouse',defaultValue:''},
        
        {operator:'equals',fieldName:'cwastewarehouse',defaultValue:''},
        
        {operator:'equals',fieldName:'cwhsmanager',defaultValue:''},
        
        {operator:'equals',fieldName:'daccountDate',defaultValue:''},
        
        {operator:'equals',fieldName:'dateCreated',defaultValue:''},
        
        {operator:'equals',fieldName:'dauditDate',defaultValue:''},
        
        {operator:'equals',fieldName:'dbillDate',defaultValue:''},
        
        {operator:'equals',fieldName:'fbillFlag',defaultValue:''},
        
        {operator:'equals',fieldName:'freplenishFlag',defaultValue:''},
        
        {operator:'equals',fieldName:'iprintCount',defaultValue:''},
        
        {operator:'equals',fieldName:'lastUpdated',defaultValue:''},
        
        {operator:'equals',fieldName:'makeDate',defaultValue:''},
        
        {operator:'equals',fieldName:'maker',defaultValue:''},
        
        {operator:'equals',fieldName:'ndiscountmny',defaultValue:''},
        
        {operator:'equals',fieldName:'nnetmny',defaultValue:''},
        
        {operator:'equals',fieldName:'process_id',defaultValue:''},
        
        {operator:'equals',fieldName:'process_type',defaultValue:''},
        
        {operator:'equals',fieldName:'purchaser',defaultValue:''},
        
        {operator:'equals',fieldName:'sourceSystem',defaultValue:''},
        
        {operator:'equals',fieldName:'taccountTime',defaultValue:''},
        
        {operator:'equals',fieldName:'vbillCode',defaultValue:''},
        
        {operator:'equals',fieldName:'vdiliverAddress',defaultValue:''},
        
        {operator:'equals',fieldName:'vnote',defaultValue:''},
        
        {operator:'equals',fieldName:'xdept',defaultValue:''},
        

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
