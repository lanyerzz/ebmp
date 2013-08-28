<%@ page import="com.app.ywms.ck.fhtzd.Yfhtzd" %>
<script>
    var fs${pageId} = [



        {key: 'billdate', value: '${message(code:'yfhtzd.billdate.label', default: 'Billdate')}', editerType: 'date',type:'date'},

        {key: 'billno', value: '${message(code:'yfhtzd.billno.label', default: 'Billno')}', editerType: 'text'},

        {key: 'businessType.id', value: '${message(code:'yfhtzd.businessType.label', default: 'Business Type')}', editerType: 'ref', refCode: 'refPubBusinessType',billtypecode:'${billtypecode}'},


        {key: 'closed', value: '${message(code:'yfhtzd.closed.label', default: 'closed')}', editerType: 'boolean'},
        {key: 'ccm', value: '${message(code:'yfhtzd.ccm.label', default: 'Ccm')}', editerType: 'text'},


        {key: 'checkDate', value: '${message(code:'yfhtzd.checkDate.label', default: 'Check Date')}', editerType: 'date',type:'date'},

        {key: 'checker.id', value: '${message(code:'yfhtzd.checker.label', default: 'Checker')}', editerType: 'ref', refCode: 'refSmUser'},

        {key: 'hw.id', value: '${message(code:'yfhtzd.hw.label', default: 'Checker')}', editerType: 'ref', refCode: 'refBdInvmandoc'},



        {key: 'khtdh', value: '${message(code:'yfhtzd.khtdh.label', default: 'Khtdh')}', editerType: 'text'},


        {key: 'makeDate', value: '${message(code:'yfhtzd.makeDate.label', default: 'Make Date')}', editerType: 'date',type:'date'},

        {key: 'maker.id', value: '${message(code:'yfhtzd.maker.label', default: 'Maker')}', editerType: 'ref', refCode: 'refSmUser'},


        {key: 'shdw.id', value: '${message(code:'yfhtzd.shdw.label', default: 'Shdw')}', editerType: 'ref', refCode: 'refBdCumandoc'},



        {key: 'thdw.id', value: '${message(code:'yfhtzd.thdw.label', default: 'Thdw')}', editerType: 'ref', refCode: 'refBdCumandoc'},



        {key: 'yxrq', value: '${message(code:'yfhtzd.yxrq.label', default: 'Yxrq')}', editerType: 'datetime',type:'datetime'}


    ];
    var dd${pageId} = {
        relation: 'and',
        criterias: [



            {operator: 'equals', fieldName: 'billdate', defaultValue: new Date().getTime()},

            {operator: 'equals', fieldName: 'billno', defaultValue: ''},


//
            {operator: 'equals', fieldName: 'businessType.id', defaultValue: ''},
            {operator: 'equals', fieldName: 'khtdh', defaultValue: ''},
            {operator: 'equals', fieldName: 'thdw.id', defaultValue: ''},
            {operator: 'equals', fieldName: 'hw.id', defaultValue: ''},
            {operator: 'equals', fieldName: 'shdw.id', defaultValue: ''},



            {operator: 'equals', fieldName: 'ccm', defaultValue: ''},
            {operator: 'equals', fieldName: 'closed',defaultValue:''},

            {operator: 'equals', fieldName: 'makeDate', defaultValue: ''},

            {operator: 'equals', fieldName: 'maker.id', defaultValue: ''},

            {operator: 'equals', fieldName: 'checkDate', defaultValue: ''},
//
            {operator: 'equals', fieldName: 'checker.id', defaultValue: ''},



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

        changeFormItemEditer(newValue, oldValue, parent, _fs${pageId})
    }

    $(function () {

        addBigQuery("${pageId}", $("#qv${pageId}"), true, dd${pageId}, rl${pageId}, fs${pageId}, _fs${pageId}, opt${pageId}, onQueryFieldChanged${pageId});
    });

    /**
     *增加组合条件
     * @param id
     */
    function onAddBigQuery${pageId}(id) {
        addBigQuery("${pageId}", $('#' + id), false, dd${pageId}, rl${pageId}, fs${pageId}, _fs${pageId}, opt${pageId}, onQueryFieldChanged${pageId});
    }

    /**
     *增加条件
     * @param id
     */
    function onAddQuery${pageId}(id) {
        createQueryRow("${pageId}", $('#' + id), dd${pageId}.criterias[0], false, fs${pageId}, _fs${pageId}, opt${pageId}, onQueryFieldChanged${pageId});

    }

    function getCriter${pageId}() {

        var div = $('#c${pageId}').children('div')[0];

        var criter = {};
        createCriteria(div, criter, _fs${pageId});

        return criter;


    }

</script>


<div id="c${pageId}">

    <span id="qv${pageId}"/>

</div>
