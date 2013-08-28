
<%@ page import="com.app.ywms.bd.tank.YBdTank" %>
<script>
    var fs${pageId}=[

        {key:'code',value:'${message(code:'YBdTank.code.label', default: 'Code')}',editerType:'text'},

        {key:'gllx',value:'${message(code:'YBdTank.gllx.label', default: 'Gllx')}',editerType:'combobox',type:'number',
            options:{valueField:'key',textField:'value',data:[{key:0,value:"使用中"},{key:1,value:"包罐"},{key:2,value:"清空"},{key:3,value:"停用"}],editable:false,panelHeight:'auto'}},

        {key:'describe',value:'${message(code:'YBdTank.describe.label', default: 'Describe')}',editerType:'text'},

        {key:'bdInvmandoc',value:'${message(code:'YBdTank.bdInvmandoc.label', default: 'Bd Invmandoc')}',editerType:'text'},
        
        {key:'bg',value:'${message(code:'YBdTank.bg.label', default: 'Bg')}',editerType:'combobox',type:'boolean',
            options:{valueField:'key',textField:'value',data:[{key:true,value:"是"},{key:false,value:"否"}],editable:false,panelHeight:'auto'}},

        {key:'zzgq',value:'${message(code:'YBdTank.zzgq.label', default: 'Zzgq')}',editerType:'combobox',type:'boolean',
            options:{valueField:'key',textField:'value',data:[{key:true,value:"是"},{key:false,value:"否"}],editable:false,panelHeight:'auto'}},

        {key:'bonded',value:'${message(code:'YBdTank.bonded.label', default: 'Bonded')}',editerType:'combobox',type:'boolean',
            options:{valueField:'key',textField:'value',data:[{key:true,value:"是"},{key:false,value:"否"}],editable:false,panelHeight:'auto'}},
        
        {key:'bw',value:'${message(code:'YBdTank.bw.label', default: 'Bw')}',editerType:'combobox',type:'boolean',
            options:{valueField:'key',textField:'value',data:[{key:true,value:"是"},{key:false,value:"否"}],editable:false,panelHeight:'auto'}},

        {key:'zgzf',value:'${message(code:'YBdTank.zgzf.label', default: 'Zgzf')}',editerType:'combobox',type:'boolean',
            options:{valueField:'key',textField:'value',data:[{key:true,value:"是"},{key:false,value:"否"}],editable:false,panelHeight:'auto'}},

        {key:'code2',value:'${message(code:'YBdTank.code2.label', default: 'Code2')}',editerType:'text'},
        

        
        {key:'jyzsbh',value:'${message(code:'YBdTank.jyzsbh.label', default: 'Jyzsbh')}',editerType:'text'},
        
        {key:'rxhz',value:'${message(code:'YBdTank.rxhz.label', default: 'Rxhz')}',editerType:'combobox',type:'boolean',
            options:{valueField:'key',textField:'value',data:[{key:true,value:"是"},{key:false,value:"否"}],editable:false,panelHeight:'auto'}},
        
        {key:'xuni',value:'${message(code:'YBdTank.xuni.label', default: 'Xuni')}',editerType:'combobox',type:'boolean',
            options:{valueField:'key',textField:'value',data:[{key:true,value:"是"},{key:false,value:"否"}],editable:false,panelHeight:'auto'}},
        

        ];
    var dd${pageId}={
        relation:'and',
        criterias:[

        {operator:'equals',fieldName:'code',defaultValue:''},

        {operator:'equals',fieldName:'gllx',defaultValue:''},

        {operator:'equals',fieldName:'describe',defaultValue:''},

        {operator:'equals',fieldName:'bdInvmandoc',defaultValue:''},
        
        {operator:'equals',fieldName:'bg',defaultValue:''},

        {operator:'equals',fieldName:'zzgq',defaultValue:''},

        {operator:'equals',fieldName:'bonded',defaultValue:''},

        {operator:'equals',fieldName:'zgzf',defaultValue:''},

        {operator:'equals',fieldName:'rxhz',defaultValue:''},

        {operator:'equals',fieldName:'xuni',defaultValue:''},

        {operator:'equals',fieldName:'bw',defaultValue:''},

        {operator:'equals',fieldName:'jyzsbh',defaultValue:''},

        {operator:'equals',fieldName:'code2',defaultValue:''},


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
