<%@ page import="com.app.bd.cubasdoc.BdCubasdoc" %>
<script>
    var fs${pageId} = [

        {key: 'custcode', value: '${message(code:'bdCubasdoc.custcode.label', default: 'Custcode')}', editerType: 'text'},

        {key: 'custname', value: '${message(code:'bdCubasdoc.custname.label', default: 'Custname')}', editerType: 'text'},

        {key: 'url', value: '${message(code:'bdCubasdoc.url.label', default: 'Url')}', editerType: 'text'},

        {key: 'accountStatementMailingAddress', value: '${message(code:'bdCubasdoc.accountStatementMailingAddress.label', default: 'Account Statement Mailing Address')}', editerType: 'text'},

        {key: 'accountsReceivablePeriod', value: '${message(code:'bdCubasdoc.accountsReceivablePeriod.label', default: 'Accounts Receivable Period')}', editerType: 'text',type:'int'},

        {key: 'agentCorp', value: '${message(code:'bdCubasdoc.agentCorp.label', default: 'Agent Corp')}', editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},

        {key: 'asOwnerNotify', value: '${message(code:'bdCubasdoc.asOwnerNotify.label', default: 'As Owner Notify')}', editerType: 'text'},

        {key: 'blockUp', value: '${message(code:'bdCubasdoc.blockUp.label', default: 'Block Up')}', editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},

        {key: 'commercialInstruments', value: '${message(code:'bdCubasdoc.commercialInstruments.label', default: 'Commercial Instruments')}', editerType: 'text'},

        {key: 'conaddr', value: '${message(code:'bdCubasdoc.conaddr.label', default: 'Conaddr')}', editerType: 'text'},

        {key: 'consignee', value: '${message(code:'bdCubasdoc.consignee.label', default: 'Consignee')}', editerType: 'text'},

        {key: 'contractInvoiceMailingAddress', value: '${message(code:'bdCubasdoc.contractInvoiceMailingAddress.label', default: 'Contract Invoice Mailing Address')}', editerType: 'text'},

        {key: 'contractLinkman', value: '${message(code:'bdCubasdoc.contractLinkman.label', default: 'Contract Linkman')}', editerType: 'text'},

        {key: 'creator.username', value: '${message(code:'bdCubasdoc.creator.username.label', default: 'Creator')}', editerType: 'text'},

        {key: 'creator.userRealName', value: '${message(code:'bdCubasdoc.creator.userRealName.label', default: 'Creator')}', editerType: 'text'},


        {key: 'custprop', value: '${message(code:'bdCubasdoc.custprop.label', default: 'Custprop')}', editerType: 'combobox',type:'int',options:{valueField:'id',textField:'text',data:[{id:'0',text:'外部单位'},{id:'1',text:'内部单位'}], editable:false,panelHeight:'auto'}},

        {key: 'custshortname', value: '${message(code:'bdCubasdoc.custshortname.label', default: 'Custshortname')}', editerType: 'text'},


        {key: 'deliveryCorp', value: '${message(code:'bdCubasdoc.deliveryCorp.label', default: 'Delivery Corp')}', editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},

        {key: 'deliveryNotify', value: '${message(code:'bdCubasdoc.deliveryNotify.label', default: 'Delivery Notify')}', editerType: 'text'},

        {key: 'email', value: '${message(code:'bdCubasdoc.email.label', default: 'Email')}', editerType: 'text'},

        {key: 'emailservice', value: '${message(code:'bdCubasdoc.emailservice.label', default: 'Emailservice')}', editerType: 'text'},

        {key: 'engname', value: '${message(code:'bdCubasdoc.engname.label', default: 'Engname')}', editerType: 'text'},

        {key: 'exchange', value: '${message(code:'bdCubasdoc.exchange.label', default: 'Exchange')}', editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},

        {key: 'fax', value: '${message(code:'bdCubasdoc.fax.label', default: 'Fax')}', editerType: 'text'},

        {key: 'fax1', value: '${message(code:'bdCubasdoc.fax1.label', default: 'Fax1')}', editerType: 'text'},

        {key: 'fax2', value: '${message(code:'bdCubasdoc.fax2.label', default: 'Fax2')}', editerType: 'text'},

        {key: 'fax3', value: '${message(code:'bdCubasdoc.fax3.label', default: 'Fax3')}', editerType: 'text'},

        {key: 'freecustflag', value: '${message(code:'bdCubasdoc.freecustflag.label', default: 'Freecustflag')}', editerType: 'text'},

        {key: 'grade', value: '${message(code:'bdCubasdoc.grade.label', default: 'Grade')}', editerType: 'text'},

        {key: 'invoiceLinkman', value: '${message(code:'bdCubasdoc.invoiceLinkman.label', default: 'Invoice Linkman')}', editerType: 'text'},

        {key: 'isconnflag', value: '${message(code:'bdCubasdoc.isconnflag.label', default: 'Isconnflag')}', editerType: 'text'},


        {key: 'legalbody', value: '${message(code:'bdCubasdoc.legalbody.label', default: 'Legalbody')}', editerType: 'text'},

        {key: 'linkman', value: '${message(code:'bdCubasdoc.linkman.label', default: 'Linkman')}', editerType: 'text'},

        {key: 'linkman2', value: '${message(code:'bdCubasdoc.linkman2.label', default: 'Linkman2')}', editerType: 'text'},

        {key: 'linkman3', value: '${message(code:'bdCubasdoc.linkman3.label', default: 'Linkman3')}', editerType: 'text'},

        {key: 'memo', value: '${message(code:'bdCubasdoc.memo.label', default: 'Memo')}', editerType: 'text'},

        {key: 'mnecode', value: '${message(code:'bdCubasdoc.mnecode.label', default: 'Mnecode')}', editerType: 'text'},

        {key: 'mobilephone1', value: '${message(code:'bdCubasdoc.mobilephone1.label', default: 'Mobilephone1')}', editerType: 'text'},

        {key: 'mobilephone2', value: '${message(code:'bdCubasdoc.mobilephone2.label', default: 'Mobilephone2')}', editerType: 'text'},

        {key: 'mobilephone3', value: '${message(code:'bdCubasdoc.mobilephone3.label', default: 'Mobilephone3')}', editerType: 'text'},

        {key: 'msgservice', value: '${message(code:'bdCubasdoc.msgservice.label', default: 'Msgservice')}', editerType: 'text'},

        {key: 'openingCorp', value: '${message(code:'bdCubasdoc.openingCorp.label', default: 'Opening Corp')}', editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},

        {key: 'organizationalSetupCard', value: '${message(code:'bdCubasdoc.organizationalSetupCard.label', default: 'Organizational Setup Card')}', editerType: 'text'},

        {key: 'phone', value: '${message(code:'bdCubasdoc.phone.label', default: 'Phone')}', editerType: 'text'},

        {key: 'phone1', value: '${message(code:'bdCubasdoc.phone1.label', default: 'Phone1')}', editerType: 'text'},

        {key: 'phone2', value: '${message(code:'bdCubasdoc.phone2.label', default: 'Phone2')}', editerType: 'text'},

        {key: 'phone3', value: '${message(code:'bdCubasdoc.phone3.label', default: 'Phone3')}', editerType: 'text'},

        {key: 'pkAreacl', value: '${message(code:'bdCubasdoc.pkAreacl.label', default: 'Pk Areacl')}', editerType: 'text'},

        {key: 'pkCorp', value: '${message(code:'bdCubasdoc.pkCorp.label', default: 'Pk Corp')}', editerType: 'text'},

        {key: 'pkCorp1', value: '${message(code:'bdCubasdoc.pkCorp1.label', default: 'Pk Corp1')}', editerType: 'text'},

        {key: 'receiveEmail', value: '${message(code:'bdCubasdoc.receiveEmail.label', default: 'Receive Email')}', editerType: 'text'},

        {key: 'receivePhone', value: '${message(code:'bdCubasdoc.receivePhone.label', default: 'Receive Phone')}', editerType: 'text'},

        {key: 'recordInfo', value: '${message(code:'bdCubasdoc.recordInfo.label', default: 'Record Info')}', editerType: 'text'},

        {key: 'registerfund', value: '${message(code:'bdCubasdoc.registerfund.label', default: 'Registerfund')}', editerType: 'text'},

        {key: 'saleaddr', value: '${message(code:'bdCubasdoc.saleaddr.label', default: 'Saleaddr')}', editerType: 'text'},

        {key: 'sampleGuarantee', value: '${message(code:'bdCubasdoc.sampleGuarantee.label', default: 'Sample Guarantee')}', editerType: 'date',type:'date'},

        {key: 'sealflag', value: '${message(code:'bdCubasdoc.sealflag.label', default: 'Sealflag')}', editerType: 'text'},

        {key: 'signClient', value: '${message(code:'bdCubasdoc.signClient.label', default: 'Sign Client')}',editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},

        {key: 'taxRegistryNo', value: '${message(code:'bdCubasdoc.taxRegistryNo.label', default: 'Tax Registry No')}', editerType: 'text'},

        {key: 'taxpayerid', value: '${message(code:'bdCubasdoc.taxpayerid.label', default: 'Taxpayerid')}', editerType: 'text'},

        {key: 'textShort', value: '${message(code:'bdCubasdoc.textShort.label', default: 'Text Short')}', editerType: 'text'},

        {key: 'trade', value: '${message(code:'bdCubasdoc.trade.label', default: 'Trade')}', editerType: 'text'},

        {key: 'trader', value: '${message(code:'bdCubasdoc.trader.label', default: 'Trader')}', editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},

        {key: 'transitwarehouse', value: '${message(code:'bdCubasdoc.transitwarehouse.label', default: 'Transitwarehouse')}', editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},

        {key: 'useWhenStorage', value: '${message(code:'bdCubasdoc.useWhenStorage.label', default: 'Use When Storage')}',editerType: 'combobox',type:'boolean',options:{valueField:'id',textField:'text',data:[{id:true,text:'是'},{id:false,text:'否'}], editable:false,panelHeight:'auto'}},

        {key: 'zipcode', value: '${message(code:'bdCubasdoc.zipcode.label', default: 'Zipcode')}', editerType: 'text'},

        {key: 'zipcode1', value: '${message(code:'bdCubasdoc.zipcode1.label', default: 'Zipcode1')}', editerType: 'text'}

    ];
    var dd${pageId} = {
        relation: 'and',
        criterias: [

            {operator: 'equals', fieldName: 'custcode', defaultValue: ''},

            {operator: 'equals', fieldName: 'custname', defaultValue: ''},

            {operator: 'equals', fieldName: 'url', defaultValue: ''},

            {operator: 'equals', fieldName: 'accountStatementMailingAddress', defaultValue: ''},

            {operator: 'equals', fieldName: 'agentCorp', defaultValue: ''},

            {operator: 'equals', fieldName: 'asOwnerNotify', defaultValue: ''},

            {operator: 'equals', fieldName: 'blockUp', defaultValue: ''},

            {operator: 'equals', fieldName: 'commercialInstruments', defaultValue: ''},

            {operator: 'equals', fieldName: 'conaddr', defaultValue: ''},

            {operator: 'equals', fieldName: 'consignee', defaultValue: ''},

            {operator: 'equals', fieldName: 'contractInvoiceMailingAddress', defaultValue: ''},

            {operator: 'equals', fieldName: 'contractLinkman', defaultValue: ''},

            {operator: 'equals', fieldName: 'creator.username', defaultValue: ''},

            {operator: 'equals', fieldName: 'creator.userRealName', defaultValue: ''},

            {operator: 'equals', fieldName: 'custprop', defaultValue: ''},

            {operator: 'equals', fieldName: 'custshortname', defaultValue: ''},

            {operator: 'equals', fieldName: 'deliveryCorp', defaultValue: ''},

            {operator: 'equals', fieldName: 'deliveryNotify', defaultValue: ''},

            {operator: 'equals', fieldName: 'email', defaultValue: ''},

            {operator: 'equals', fieldName: 'emailservice', defaultValue: ''},

            {operator: 'equals', fieldName: 'engname', defaultValue: ''},

            {operator: 'equals', fieldName: 'exchange', defaultValue: ''},

            {operator: 'equals', fieldName: 'fax', defaultValue: ''},

            {operator: 'equals', fieldName: 'fax1', defaultValue: ''},

            {operator: 'equals', fieldName: 'fax2', defaultValue: ''},

            {operator: 'equals', fieldName: 'fax3', defaultValue: ''},

            {operator: 'equals', fieldName: 'freecustflag', defaultValue: ''},

            {operator: 'equals', fieldName: 'grade', defaultValue: ''},

            {operator: 'equals', fieldName: 'invoiceLinkman', defaultValue: ''},

            {operator: 'equals', fieldName: 'isconnflag', defaultValue: ''},

            {operator: 'equals', fieldName: 'legalbody', defaultValue: ''},

            {operator: 'equals', fieldName: 'linkman', defaultValue: ''},

            {operator: 'equals', fieldName: 'linkman2', defaultValue: ''},

            {operator: 'equals', fieldName: 'linkman3', defaultValue: ''},

            {operator: 'equals', fieldName: 'memo', defaultValue: ''},

            {operator: 'equals', fieldName: 'mnecode', defaultValue: ''},

            {operator: 'equals', fieldName: 'mobilephone1', defaultValue: ''},

            {operator: 'equals', fieldName: 'mobilephone2', defaultValue: ''},

            {operator: 'equals', fieldName: 'mobilephone3', defaultValue: ''},

            {operator: 'equals', fieldName: 'msgservice', defaultValue: ''},

            {operator: 'equals', fieldName: 'openingCorp', defaultValue: ''},

            {operator: 'equals', fieldName: 'organizationalSetupCard', defaultValue: ''},

            {operator: 'equals', fieldName: 'phone', defaultValue: ''},

            {operator: 'equals', fieldName: 'phone1', defaultValue: ''},

            {operator: 'equals', fieldName: 'phone2', defaultValue: ''},

            {operator: 'equals', fieldName: 'phone3', defaultValue: ''},

            {operator: 'equals', fieldName: 'pkAreacl', defaultValue: ''},

            {operator: 'equals', fieldName: 'pkCorp', defaultValue: ''},

            {operator: 'equals', fieldName: 'pkCorp1', defaultValue: ''},

            {operator: 'equals', fieldName: 'receiveEmail', defaultValue: ''},

            {operator: 'equals', fieldName: 'receivePhone', defaultValue: ''},

            {operator: 'equals', fieldName: 'recordInfo', defaultValue: ''},

            {operator: 'equals', fieldName: 'registerfund', defaultValue: ''},

            {operator: 'equals', fieldName: 'saleaddr', defaultValue: ''},

            {operator: 'equals', fieldName: 'sampleGuarantee', defaultValue: ''},

            {operator: 'equals', fieldName: 'sealflag', defaultValue: ''},

            {operator: 'equals', fieldName: 'signClient', defaultValue: ''},

            {operator: 'equals', fieldName: 'taxRegistryNo', defaultValue: ''},

            {operator: 'equals', fieldName: 'taxpayerid', defaultValue: ''},

            {operator: 'equals', fieldName: 'textShort', defaultValue: ''},

            {operator: 'equals', fieldName: 'trade', defaultValue: ''},

            {operator: 'equals', fieldName: 'trader', defaultValue: ''},

            {operator: 'equals', fieldName: 'transitwarehouse', defaultValue: ''},

            {operator: 'equals', fieldName: 'useWhenStorage', defaultValue: ''},

            {operator: 'equals', fieldName: 'zipcode', defaultValue: ''},

            {operator: 'equals', fieldName: 'zipcode1', defaultValue: ''}


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
