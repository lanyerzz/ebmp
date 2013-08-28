<% import grails.persistence.Event %>
<%=packageName%>
<script>
    var fs\${pageId}=[
    <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
        allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
        props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
        props.eachWithIndex { p, i ->
         if (p.oneToOne) { %>
        {key:'${p.name}.id',value:'\${message(code:'${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}',editerType:'ref',refCode:'ref${p.type.simpleName}'},

        <%}else if(p.type==Date){%>
        {key:'${p.name}',value:'\${message(code:'${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}',editerType:'date',type:'date'},

        <%}else{%>
        {key:'${p.name}',value:'\${message(code:'${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}',editerType:'text'},
        <%}}%>
        ];
    var dd\${pageId}={
        relation:'and',
        criterias:[
            <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
        allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
        props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
        props.eachWithIndex { p, i ->
        if (p.oneToOne) { %>
        {operator:'equals',fieldName:'${p.name}.id',defaultValue:''},
            <%}else{%>
        {operator:'equals',fieldName:'${p.name}',defaultValue:''},
        <%}}%>

        ]
    };
    var _fs\${pageId}=arrayToJson('key',fs\${pageId});

    var rl\${pageId} =[{key:'and',value:'与'},{key:'or',value:'或'},{key:'not',value:'非'}];


    var opt\${pageId}=[{key:'equals',value:'等于'},
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
    var _opt\${pageId}=arrayToJson('key',opt\${pageId});

    /**
     *查询条件的字段发生变化触发事件
     * @param newValue
     * @param oldValue
     */
    function onQueryFieldChanged\${pageId}(newValue, oldValue){

        var parent=\$(this).closest('div');

        var target=  parent.find('[name=value]')[0];

        changeFormItemEditer(newValue,oldValue,parent,_fs\${pageId})
    }

    \$(function(){

     addBigQuery("\${pageId}",\$("#qv\${pageId}"),true,dd\${pageId},rl\${pageId},fs\${pageId},_fs\${pageId},opt\${pageId},onQueryFieldChanged\${pageId});
    });

    /**
     *增加组合条件
     * @param id
     */
    function onAddBigQuery\${pageId}(id){
        addBigQuery("\${pageId}",\$('#'+id),false,dd\${pageId},rl\${pageId},fs\${pageId},_fs\${pageId},opt\${pageId},onQueryFieldChanged\${pageId});
    }

    /**
     *增加条件
     * @param id
     */
    function onAddQuery\${pageId}(id){
        createQueryRow( "\${pageId}",\$('#'+id),dd\${pageId}.criterias[0],false,fs\${pageId},_fs\${pageId},opt\${pageId},onQueryFieldChanged\${pageId});

    }

    function getCriter\${pageId}(){

       var div=\$('#c\${pageId}').children('div')[0];

        var criter={};
        createCriteria(div,criter,_fs\${pageId});

        return criter;


    }

</script>


<div id="c\${pageId}">

    <span id="qv\${pageId}" />

</div>
