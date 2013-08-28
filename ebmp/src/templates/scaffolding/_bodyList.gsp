<% import grails.persistence.Event %>
<%=packageName%>
<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
<script>


    \$(function(){


        <g:if test="\${ac=='create'}">
        \$('#bodyTable\${pageId}').edatagrid({

            data:\${bodys?:[] as JSON}
        });
        </g:if>
        <g:else>
        \$('#bodyTable\${pageId}').edatagrid({
            url:'\${createLink(action: 'queryBody',params: [headId:${propertyName}?.id])}'

        });
        </g:else>


    });


    function onAddRow\${pageId}(){


        \$('#bodyTable\${pageId}').edatagrid('addRow');
    }

    function onDeleteRow\${pageId}(){
        var row=\$('#bodyTable\${pageId}').datagrid('getSelected');
        var index = \$('#bodyTable\${pageId}').datagrid('getRowIndex',row);
        if(row==null){
            \$.messager.show({
                title:'消息',
                msg:'请选择需要删除的数据！'
            });
            return;
        };
        \$('#bodyTable\${pageId}').datagrid('deleteRow',index);
    }





</script>


<div id="tbb\${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="onAddRow\${pageId}() " data-options="disabled:\${soSaleInstance?.sourceBillTypeCode!=null}" >
        \${message(code: 'default.button.create.label',default: '增加')}
    </a>

    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="onDeleteRow\${pageId}() " data-options="disabled:\${soSaleInstance?.sourceBillTypeCode!=null}">
        \${message(code: 'default.button.delete.label',default: '删除')}
    </a>
</div>


%{--表格--}%
<table id="bodyTable\${pageId}"
       rownumbers="true"
       fit="true" toolbar="#tbb\${pageId}" singleSelect="true" >

    <thead>

    <tr>

        <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
        allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
        props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
        props.eachWithIndex { p, i ->

                if (p.oneToOne) { %>
        <g:refTemplate code="ref${p.type.simpleName}"  inForm="false" model="[required:false,field:'${p.name}',title:g.message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')]"></g:refTemplate>
        <% }else if(p.type==BigDecimal){ %>
        <th field="${p.name}" sortable="false"  editor="{type:'numberbox',options:{precision:2,required:true}}" width="100">\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}</th>
        <% }else if(p.type==Date){ %>
        <th field="${p.name}" sortable="false" width="100" editor="datebox" >\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}</th>

        <% }else if(p.type=='boolean'){ %>
        <th field="${p.name}" sortable="false"  editor="{
                    type:'checkbox',
                    options:{
                        on:true,
                        off:false
                    }
        }  " data-options="formatter:booleanFormate" width="100">\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}</th>


        <% }else { %>
        <th field="${p.name}" sortable="false" editor="text" width="100">\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}</th>
        <% }}%>
    </tr>
    </thead>
</table>



